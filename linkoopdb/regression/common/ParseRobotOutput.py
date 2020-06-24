# -*- coding: UTF-8 -*-
from robot.api import ExecutionResult
import mysql.connector
import datetime
import os
import sys


if __name__ == '__main__':
    if len(sys.argv) < 2:
        print("Missed parameter:  ParseRobotOutput [output.xml]")
        sys.exit(0)

    # 解析XML文件
    suite = ExecutionResult(sys.argv[1]).suite

    # 连接mysql数据库
    mydb = mysql.connector.connect(
        host="node10",
        user="report",
        passwd="123456",
        database="report"
    )
    for test in suite.tests:  # 遍历所有测试
        Features = None
        for tag in test.tags:
            if tag.startswith("feature:"):
                if Features is None:
                    Features = tag[len("feature:"):]
                else:
                    Features = Features + "," + tag[len("feature:"):]

        data = {
            "Build_ID": os.environ["Build_ID"],
            "Build_URL": os.environ["Build_URL"],
            "Label_ID": os.environ["Label_ID"],
            "Creator":  os.environ["Creator"],
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
        sql = "INSERT INTO TestJobs(JOB_ID, {keys}) VALUES (nextval('seq_testjobs'), {values})"\
            .format(keys=columns, values=values)
        mycursor = mydb.cursor()
        mycursor.execute(sql, tuple(data.values()))
        print('Successful')
        mydb.commit()
        mycursor.close()
