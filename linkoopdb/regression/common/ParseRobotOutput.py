# -*- coding: UTF-8 -*-
from robot.api import ExecutionResult
import mysql.connector
import datetime
import os
import sys


def load_testresults(p_dbHandler, p_SuiteResults, p_PerfResults):
    for test in p_SuiteResults.tests:  # 遍历所有测试
        Features = None
        m_Owner = "Unknown"
        for tag in test.tags:
            if tag.startswith("feature:"):
                if Features is None:
                    Features = tag[len("feature:"):]
                else:
                    Features = Features + "," + tag[len("feature:"):]
            if tag.startswith("owner:"):
                m_Owner = tag[len("owner:"):]
        if Features is None:
            Features = "Unknown"

        if "Build_ID" in os.environ:
            m_Build_ID = os.environ["Build_ID"]
        else:
            m_Build_ID = None
        if "BUILD_URL" in os.environ:
            m_Build_URL = os.environ["BUILD_URL"]
        else:
            m_Build_URL = None
        if "Label_ID" in os.environ:
            m_Label_ID = os.environ["Label_ID"]
        else:
            m_Label_ID = None
        if "Creator" in os.environ:
            m_Creator = os.environ["Creator"]
        else:
            m_Creator = None
        m_SuiteAndTestName = os.path.basename(test.source) + ":" + test.name

        if m_SuiteAndTestName in p_PerfResults.keys():
            m_SQLCount = p_PerfResults[m_SuiteAndTestName]
        else:
            m_SQLCount = 0
        if "DATABASE_VERSION" in os.environ:
            m_DATABASE_VERSION = os.environ["DATABASE_VERSION"]
        else:
            m_DATABASE_VERSION = "Unknown"
        # Suite_Path 基于TestRoot的相对目录
        if "TEST_ROOT" in os.environ:
            m_Suite_Path = test.source.replace(os.environ["TEST_ROOT"], "")
        else:
            m_Suite_Path = test.source
        m_Suite_Path = m_Suite_Path.replace("\\", "/")
        if m_Suite_Path.startswith("/"):
            m_Suite_Path = m_Suite_Path[1:]

        data = {
            "Build_ID": m_Build_ID,
            "Build_URL": m_Build_URL,
            "Label_ID": m_Label_ID,
            "Creator": m_Creator,
            "Test_Name": test.name,
            "Test_Status": test.status,
            "Feature_ID": str(Features),
            "Suite_Path": m_Suite_Path,
            "Test_Doc": str(test.doc),
            "Start_Date": datetime.datetime.strptime(test.starttime[0:17], '%Y%m%d %H:%M:%S'),
            "End_Date": datetime.datetime.strptime(test.endtime[0:17], '%Y%m%d %H:%M:%S'),
            "Database_Version": m_DATABASE_VERSION,
            "SQL_Count": m_SQLCount,
            "Owner": m_Owner,
        }
        columns = ",".join(data.keys())
        values = ', '.join(['%s'] * len(data))
        sql = "INSERT INTO TestJobs(JOB_ID, {keys}) VALUES (nextval('seq_testjobs'), {values})" \
            .format(keys=columns, values=values)
        mycursor = p_dbHandler.cursor()
        mycursor.execute(sql, tuple(data.values()))
        p_dbHandler.commit()
        mycursor.close()


if __name__ == '__main__':
    if len(sys.argv) < 3:
        print("Missed parameter:  ParseRobotOutput [output.xml] [output.perf]")
        sys.exit(0)

    # RobotResults =
    #     ExecutionResult("C:\\Work\\linkoop\\linkoop-auto-test\\linkoopdb\\regression\\work\\output.xml").suite
    # with open("C:\\Work\\linkoop\\linkoop-auto-test\\linkoopdb\\regression\\work\\output.perf", 'r') as f:

    # 解析XML文件
    RobotResults = ExecutionResult(sys.argv[1]).suite
    with open(sys.argv[2], 'r') as f:
        PerfLines = f.readlines()
    PerfResults = {}
    for row in PerfLines:
        m_rowCotents = row.split('\t')
        if len(m_rowCotents) > 6:
            m_SuiteAndTest = row.split('\t')[6]
            if len(m_SuiteAndTest.split(":")) == 2:
                m_SuiteAndTest = m_SuiteAndTest.replace("'", "")      # 去掉字符串的单引号
                if m_SuiteAndTest in PerfResults.keys():
                    PerfResults[m_SuiteAndTest] = PerfResults[m_SuiteAndTest] + 1
                else:
                    PerfResults[m_SuiteAndTest] = 1

    # 连接mysql数据库
    mydb = mysql.connector.connect(
        host="node10",
        user="report",
        passwd="123456",
        database="report"
    )

    if len(RobotResults.suites) == 0:
        load_testresults(mydb, RobotResults, PerfResults)
    else:
        for suite in RobotResults.suites:
            load_testresults(mydb, suite, PerfResults)
    mydb.close()
    print('Successful')
