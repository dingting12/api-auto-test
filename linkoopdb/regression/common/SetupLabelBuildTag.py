import mysql.connector
import sys
import json

# 连接mysql数据库
mydb = mysql.connector.connect(
    host="node10",
    user="report",
    passwd="123456",
    database="report"
)
m_LabelID = sys.argv[1]
m_strSQL = "Select * From Labels " + \
           "Where Label_ID='" + m_LabelID + "' And Build_Status = 'COMPLETED'"

cursor = mydb.cursor()
cursor.execute(m_strSQL)
rawData = cursor.fetchall()
col_names = [desc[0] for desc in cursor.description]
result = []
for row in rawData:
    objDict = {}
    for index, value in enumerate(row):
        objDict[col_names[index]] = value
    result.append(objDict)
cursor.close()
mydb.close()

m_Build_Tags = json.loads(result[0]["Build_Tag"])
for key, value in m_Build_Tags.items():
    print("export " + str(key) + '=' + str(value))
print("Successful!")
