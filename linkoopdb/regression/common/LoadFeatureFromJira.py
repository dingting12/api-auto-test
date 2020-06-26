from jira import JIRA
import mysql.connector
import datetime


jira = JIRA(server='http://node9:8900', basic_auth=('shi.zhao', '123456'))

projects = jira.projects()

Features = []
jql = 'project = "LinkoopDB"'
issues = jira.search_issues(jql, fields='', maxResults=3000)
for issue in issues:
    m_IssueSummary = str(issue.fields.summary)
    if m_IssueSummary.startswith('E') or m_IssueSummary.startswith('F'):
        m_FeatureID = m_IssueSummary.split()[0]
        m_FeatureSummary = m_IssueSummary[len(m_FeatureID):].lstrip()
        if m_FeatureID.find('-') != -1:
            m_UpLevel_FeatureID = m_FeatureID[:m_FeatureID.rfind('-')]
        else:
            m_UpLevel_FeatureID = "0"
        m_FeatureDesc = issue.fields.description
        Features.append({'Feature_ID': m_FeatureID, 'Feature_Summary': m_FeatureSummary,
                         'UpLevel_FeatureID': m_UpLevel_FeatureID,
                         'Feature_Desc': m_FeatureDesc})

# 连接mysql数据库
mydb = mysql.connector.connect(
    host="node10",
    user="report",
    passwd="123456",
    database="report"
)
for feature in Features:
    data = {
        "Feature_ID": feature["Feature_ID"],
        "Component_ID": '0000',
        "Feature_Summary": feature["Feature_Summary"],
        "Owner_ID": 'Jira',
        "Feature_Desc": feature["Feature_Desc"],
        "Support_Status": 'Supported',
        "Created_Date": datetime.datetime.now(),
        'First_Label': "Unknown"
    }
    columns = ",".join(data.keys())
    values = ', '.join(['%s'] * len(data))
    sql = "INSERT INTO Features({keys}) VALUES ({values})" \
        .format(keys=columns, values=values)
    mycursor = mydb.cursor()
    mycursor.execute(sql, tuple(data.values()))
    mydb.commit()
    mycursor.close()

mydb.close()
