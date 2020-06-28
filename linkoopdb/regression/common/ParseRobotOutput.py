# -*- coding: UTF-8 -*-
from robot.api import ExecutionResult
import mysql.connector
import datetime
import os
import sys


def load_testresults(p_dbHandler, p_szSuite):
    for test in p_szSuite.tests:  # 遍历所有测试
        Features = None
        for tag in test.tags:
            if tag.startswith("feature:"):
                if Features is None:
                    Features = tag[len("feature:"):]
                else:
                    Features = Features + "," + tag[len("feature:"):]
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
        data = {
            "Build_ID": m_Build_ID,
            "Build_URL": m_Build_URL,
            "Label_ID": m_Label_ID,
            "Creator": m_Creator,
            "Test_Name": test.name,
            "Test_Status": test.status,
            "Feature_ID": str(Features),
            "Suite_Path": str(test.source),
            "Test_Doc": str(test.doc),
            "Start_Date": datetime.datetime.strptime(test.starttime[0:17], '%Y%m%d %H:%M:%S'),
            "End_Date": datetime.datetime.strptime(test.endtime[0:17], '%Y%m%d %H:%M:%S')
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
    if len(sys.argv) < 2:
        print("Missed parameter:  ParseRobotOutput [output.xml]")
        sys.exit(0)

    # 解析XML文件
    Results = ExecutionResult(sys.argv[1]).suite
    # Results = ExecutionResult("C:\\Work\\linkoop\\linkoop-auto-test\\linkoopdb\\regression\\work\\output.xml").suite
    # 连接mysql数据库
    mydb = mysql.connector.connect(
        host="node10",
        user="report",
        passwd="123456",
        database="report"
    )

    if len(Results.suites) == 0:
        load_testresults(mydb, Results)
    else:
        for suite in Results.suites:
            load_testresults(mydb, suite)
    mydb.close()
    print('Successful')
