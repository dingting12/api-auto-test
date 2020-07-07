# -*- coding: UTF-8 -*-
import paramiko
from glob import glob
from robot.api import logger
import os
import shlex
import sys


class SSHException(Exception):
    def __init__(self, message):
        Exception.__init__(self)
        self.message = message


class SSHConnection(object):
    __transport__ = None

    def __init__(self):
        self.host = None
        self.port = None
        self.username = None
        self.pwd = None
        self.sftp = None

    def connect(self, host, port, username, pwd):
        self.host = host
        self.port = port
        self.username = username
        self.pwd = pwd
        func = getattr(paramiko, 'Transport')
        transport = func((self.host, self.port))
        transport.connect(username=self.username, password=self.pwd)
        self.__transport__ = transport
        self.sftp = paramiko.SFTPClient.from_transport(self.__transport__)

    def close(self):
        self.__transport__.close()
        self.sftp = None

    def upload(self, local_path, target_path):
        self.sftp.put(local_path, target_path)

    def download(self, remote_path, local_path):
        self.sftp.get(remote_path, local_path)

    def dir_exists(self, directory):
        try:
            self.sftp.stat(directory)
            return True
        except IOError:
            return False

    def mkdir(self, directory):
        m_Paths = directory.split("/")
        if directory.startswith("/"):
            m_TemporaryPath = "/"
        else:
            m_TemporaryPath = ""
        try:
            for m_Path in m_Paths:
                m_TemporaryPath = os.path.join(m_TemporaryPath, m_Path).replace("\\", "/")
                if not self.dir_exists(m_TemporaryPath):
                    self.sftp.mkdir(m_TemporaryPath)
        except IOError as ie:
            raise repr(ie)

    def cmd(self, command):
        sshclient = paramiko.SSHClient()
        sshclient._transport = self.__transport__
        # 执行命令
        (stdin, stdout, stderr) = sshclient.exec_command(command)
        # 获取命令结果
        result = stdout.read()
        print(str(result, encoding='utf-8'))
        return result


class RunSSHCommand(object):
    # TEST SUITE 在suite中引用，只会实例化一次
    # 也就是说多test case都引用了这个类的方法，但是只有第一个test case调用的时候实例化
    # 如果一个Suite多个Case引用设置类的方法，要注意先后的影响
    ROBOT_LIBRARY_SCOPE = 'TEST SUITE'

    def  __init__(self):
        self.__m_SSHConnection__ = SSHConnection()
        self.__RootDir__ = None

    def SSH_Connect(self, p_szURL):
        m_connect_parameterlist = shlex.shlex(p_szURL)
        m_connect_parameterlist.whitespace = '@'
        m_connect_parameterlist.quotes = '"'
        m_connect_parameterlist.whitespace_split = True
        connect_parameters = list(m_connect_parameterlist)

        if len(connect_parameters) < 2:
            raise SSHException("URL error, please check it and try again.")
        # 两个部分，第一个部分为用户名密码，第二个部分是机器地址
        m_UserNameAndPassword = str(connect_parameters[0])
        m_HostAndPort = str(connect_parameters[1])

        # 处理用户名和密码，用/分割的用户名和密码
        m_UserName = ""; m_Password = ""
        m_connect_parameterlist = shlex.shlex(m_UserNameAndPassword)
        m_connect_parameterlist.whitespace = '/'
        m_connect_parameterlist.quotes = '"'
        m_connect_parameterlist.whitespace_split = True
        connect_parameters = list(m_connect_parameterlist)
        if len(connect_parameters) == 2:
            m_UserName = str(connect_parameters[0])
            m_Password = str(connect_parameters[1])
        if len(connect_parameters) == 1:
            m_UserName = str(connect_parameters[0])

        # 处理主机信息，包括主机名称：端口号：/路径
        m_HostName = ""; m_Port=""; m_RootDir= ""
        m_connect_parameterlist = shlex.shlex(m_HostAndPort)
        m_connect_parameterlist.whitespace = ':'
        m_connect_parameterlist.quotes = '"'
        m_connect_parameterlist.whitespace_split = True
        connect_parameters = list(m_connect_parameterlist)

        if len(connect_parameters) == 3:
            m_HostName = str(connect_parameters[0])
            m_Port = int(str(connect_parameters[1]))
            self.__RootDir__ = str(connect_parameters[2])
        if len(connect_parameters) == 2:
            m_HostName = str(connect_parameters[0])
            m_Port = 22
            self.__RootDir__ = str(connect_parameters[1])

        self.__m_SSHConnection__.connect(username=m_UserName, pwd=m_Password,
                                         host=m_HostName, port=m_Port)

    def SSH_Upload(self, p_LocalFile, p_RemoteFile=None,):
        bUpload = False
        for file in glob(p_LocalFile):
            bUpload = True
            if p_RemoteFile is None:
                m_RemoteFile = os.path.basename(file)
            else:
                m_RemoteFile = p_RemoteFile
            if m_RemoteFile.endswith("/"):
                m_ssh_filepath = p_RemoteFile
                m_ssh_filename = os.path.basename(file)
            else:
                m_ssh_filepath = os.path.dirname(m_RemoteFile)
                m_ssh_filename = os.path.basename(m_RemoteFile)
            m_RemoteFile = os.path.join(self.__RootDir__,
                                        m_ssh_filepath, m_ssh_filename).replace('\\', '/')
            logger.info("Will upload file [" + str(file) + "] to [" + str(m_RemoteFile) + "] .... ")
            if not self.__m_SSHConnection__.dir_exists(os.path.dirname(m_RemoteFile)):
                self.__m_SSHConnection__.mkdir(os.path.dirname(m_RemoteFile))

            self.__m_SSHConnection__.upload(file, m_RemoteFile)

        if not bUpload:
            raise SSHException("Nothing upload. Please check you local file [" + p_LocalFile + "]")

    def SSH_Close(self):
        self.__m_SSHConnection__.close()


if __name__ == '__main__':
    myCommand = RunSSHCommand()
    myCommand.SSH_Connect("stream74/123456@node74:22:/home/stream74/linkoopdb/others/dist")
    myCommand.SSH_Upload("tag.txt")
