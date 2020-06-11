# -*- coding: utf-8 -*-
import os


class SetupRobot(object):

    # 初始化文件，文件加载后会自动执行这个文件，用来放置文件的目录
    def __init__(self):
        m_Regress_Home = os.path.abspath(os.path.join(os.path.split(os.path.realpath(__file__))[0], ".."))
        if "T_WORK" not in os.environ:            # 不覆盖已经有的T_WORK设置
            os.environ["T_WORK"] = os.path.join(m_Regress_Home, "work")

    def SetupRoot_CD_CurrentDirectory(self, p_szDirectory):
        os.chdir(os.path.dirname(p_szDirectory))

if __name__ == '__main__':
    m_Regress_Home = os.path.abspath(os.path.join(os.path.split(os.path.realpath(__file__))[0], ".."))
    dirs = os.listdir(m_Regress_Home)
    for file in dirs:
        if os.path.isdir(os.path.join(m_Regress_Home, file)):
            print(os.path.join(m_Regress_Home, file))

