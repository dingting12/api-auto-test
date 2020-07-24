# -*- coding: UTF-8 -*-
import os
from pathlib import Path
from hdfs.client import Client
from hdfs import InsecureClient
from hdfs.util import HdfsError
import traceback
from glob import glob
from robot.api import logger
import sys
import time


class HDFSException(Exception):
    def __init__(self, message):
        Exception.__init__(self)
        self.message = message


class RunHDFSCommand(object):
    # TEST SUITE 在suite中引用，只会实例化一次
    # 也就是说多test case都引用了这个类的方法，但是只有第一个test case调用的时候实例化
    ROBOT_LIBRARY_SCOPE = 'TEST SUITE'

    def __init__(self):
        self.__m_HDFS_Handler__ = None
        self.__m_HDFS_Protocal__ = None
        self.__m_HDFS_NodePort__ = None
        self.__m_HDFS_WebFSURL__ = None
        self.__m_HDFS_WebFSDir__ = None
        self.__m_HDFS_ConnectUser = None

    def HDFS_mkdirs(self, hdfs_path):
        """ 创建目录 """
        if self.__m_HDFS_Handler__ is None:
            raise HDFSException("Please Connect HDFS first.")
        self.__m_HDFS_Handler__.makedirs(os.path.join(self.__m_HDFS_WebFSDir__, hdfs_path).replace('\\', '/'))

    def HDFS_setPermission(self, hdfs_path, permission):
        """ 修改指定文件的权限信息 """
        if self.__m_HDFS_Handler__ is None:
            raise HDFSException("Please Connect HDFS first.")
        m_hdfs_filepath = os.path.dirname(hdfs_path)
        m_hdfs_filename = os.path.basename(hdfs_path)
        self.__m_HDFS_Handler__.set_permission(
            os.path.join(self.__m_HDFS_WebFSDir__, m_hdfs_filepath, m_hdfs_filename).replace('\\', '/'),
            permission=permission)

    def HDFS_Delete(self, hdfs_path):
        """ 删除指定的HDFS文件 """
        if self.__m_HDFS_Handler__ is None:
            raise HDFSException("Please Connect HDFS first.")
        self.__m_HDFS_Handler__.delete(hdfs_path, recursive=True)

    def HDFS_Upload(self, local_path, hdfs_path=None):
        """ 上传文件到hdfs """
        if self.__m_HDFS_Handler__ is None:
            raise HDFSException("Please Connect HDFS first.")

        for file in glob(local_path):
            try:
                logger.info("Will upload file [" + str(file) + "] to [" + str(hdfs_path) + "] .... ")
                if hdfs_path is None:
                    m_hdfs_filepath = ""
                    m_hdfs_filename = os.path.basename(file)
                else:
                    if hdfs_path.endswith("/"):
                        m_hdfs_filepath = hdfs_path
                        m_hdfs_filename = os.path.basename(file)
                    else:
                        m_hdfs_filepath = os.path.dirname(hdfs_path)
                        m_hdfs_filename = os.path.basename(hdfs_path)
                self.__m_HDFS_Handler__.upload(
                    os.path.join(self.__m_HDFS_WebFSDir__, m_hdfs_filepath, m_hdfs_filename).replace('\\', '/'),
                    file,
                    overwrite=True,
                    cleanup=True)
            except HdfsError as he:
                print('traceback.print_exc():\n%s' % traceback.print_exc())
                print('traceback.format_exc():\n%s' % traceback.format_exc())
                raise HDFSException(repr(he))

    def HDFS_Download(self, hdfs_path="", local_path=""):
        """ 从hdfs获取文件到本地 """
        if self.__m_HDFS_Handler__ is None:
            raise HDFSException("Please Connect HDFS first.")
        self.__m_HDFS_Handler__.download(hdfs_path, local_path, overwrite=True)

    # 返回目录下的文件
    def HDFS_list(self, hdfs_path=""):
        # status
        #    True    同时返回状态信息
        #    False   不返回状态信息
        if self.__m_HDFS_Handler__ is None:
            raise HDFSException("Please Connect HDFS first.")
        return self.__m_HDFS_Handler__.list(hdfs_path, status=True)

    # 切换当前目录
    # 其实就是重新连接了
    def HDFS_cd(self, hdfs_path):
        m_NewDirectory = Path(os.path.join(self.__m_HDFS_WebFSDir__, hdfs_path)).as_posix()
        self.__m_HDFS_WebFSDir__ = m_NewDirectory
        self.__m_HDFS_Handler__ = Client(self.__m_HDFS_WebFSURL__, self.__m_HDFS_WebFSDir__, session=None)

    def HDFS_SetConnectedUser(self, p_ConnectUser):
        self.__m_HDFS_ConnectUser = p_ConnectUser

    def HDFS_Connnect(self, p_szURL):
        """ 连接HDFS, URL使用WEBFS协议 """
        self.__m_HDFS_Protocal__ = p_szURL.split("://")[0]
        self.__m_HDFS_NodePort__ = p_szURL[len(self.__m_HDFS_Protocal__) + 3:].split("/")[0]
        self.__m_HDFS_WebFSURL__ = self.__m_HDFS_Protocal__ + "://" + self.__m_HDFS_NodePort__
        self.__m_HDFS_WebFSDir__ = p_szURL[len(self.__m_HDFS_WebFSURL__):]
        logger.info("Will connect to [" + str(self.__m_HDFS_WebFSURL__) + "]," +
                    "Rootdir is [" + str(self.__m_HDFS_WebFSDir__) + "] .... ")
        self.__m_HDFS_Handler__ = InsecureClient(url=self.__m_HDFS_WebFSURL__,
                                         user=self.__m_HDFS_ConnectUser,
                                         root=self.__m_HDFS_WebFSDir__)


if __name__ == '__main__':
    myCompare = RunHDFSCommand()

    myCompare.HDFS_Connnect("http://node73:50070/user/testdb73/jenkins/work/shitest")
    mylist = myCompare.HDFS_list()
    for row in mylist:
        print("Row = " + str(row))
    myCompare.HDFS_Delete("label.txt")
    # myCompare.HDFS_Upload("label.txt")
    # myCompare.HDFS_Delete("666")

