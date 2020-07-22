from jira import JIRA
import mysql.connector
import datetime

m_Features = []
m_Issues = []
jira = JIRA(server='http://node9:8900', basic_auth=('shi.zhao', '123456'))
block_size = 100
block_num = 0
while True:
    start_idx = block_num*block_size
    # issues = jira.search_issues('project = "LinkoopDB" AND summary ~ "use cppjieba CutForSearch, old is Cut"', start_idx, block_size)
    issues = jira.search_issues('project = "LinkoopDB"', start_idx, block_size)
    if len(issues) == 0:
        # Retrieve issues until there are no more to come
        break
    block_num += 1
    for issue in issues:
        if len(issue.fields.versions) == 0:
            m_Issue_Affacted = "UNKNOWN"
        else:
            m_Issue_Affacted = str(issue.fields.versions[0])
        if len(issue.fields.components) == 0:
            m_Issue_Module = "UNKNOWN"
        else:
            m_Issue_Module = str(issue.fields.components[0])
        m_Issues.append({
            "Issue_ID": str(issue.id),
            "Issue_Title": str(issue.fields.summary),
            "Issue_Status": str(issue.fields.status),
            "Issue_Type": str(issue.fields.issuetype),
            "Issue_Priority": str(issue.fields.priority),
            "Issue_Module": m_Issue_Module,
            "Issue_Reporter": str(issue.fields.reporter),
            "Issue_Assigned": str(issue.fields.assignee),
            "Issue_Affected": m_Issue_Affacted,
            "Issue_Created": datetime.datetime.strptime(issue.fields.created[:23], '%Y-%m-%dT%H:%M:%S.%f'),
            "Issue_Updated": datetime.datetime.strptime(issue.fields.updated[:23], '%Y-%m-%dT%H:%M:%S.%f')
        })
        if str(issue.fields.issuetype).strip() == "新功能":
            m_FeatureID = str(issue.fields.summary).split()[0]
            m_FeatureSummary = str(issue.fields.summary)[len(m_FeatureID):].lstrip()
            if m_FeatureID.find('-') != -1:
                m_UpLevel_FeatureID = m_FeatureID[:m_FeatureID.rfind('-')]
            else:
                m_UpLevel_FeatureID = "0"
            m_FeatureDesc = issue.fields.description
            if len(issue.fields.fixVersions) == 0:
                m_Fixed_Version = "UNKNOWN"
            else:
                m_Fixed_Version = str(issue.fields.fixVersions[0]).strip()
            if m_Fixed_Version in ("UNKNOWN", "1.0", "1.1", "1.2", "2.0", "2.1"):
                m_Fixed_Version = "2.1"
            if m_Fixed_Version in ("2.2", "2.2.2"):
                m_Fixed_Version = "2.2"
            if m_Fixed_Version in ("2.3"):
                m_Fixed_Version = "2.3"
            if m_Fixed_Version in ("3.0"):
                m_Fixed_Version = "3.0"

            m_Features.append({
                'Feature_ID': m_FeatureID.strip(),
                'Feature_Summary': m_FeatureSummary,
                'UpLevel_Feature_ID': m_UpLevel_FeatureID.strip(),
                'Feature_Desc': m_FeatureDesc,
                "Owner_ID": 'Jira',
                "Support_Status": 'Supported',
                "Component_ID": '0000',
                "First_Version": m_Fixed_Version,
                "Created_Date": datetime.datetime.now()
            })

# 连接mysql数据库
mydb = mysql.connector.connect(
    host="node10",
    user="report",
    passwd="123456",
    database="report",
    autocommit=False
)
mycursor = mydb.cursor()
mycursor.execute("Delete From Features")
mycursor.close()
m_nCount = 0
for feature in m_Features:
    columns = ",".join(feature.keys())
    values = ', '.join(['%s'] * len(feature))
    sql = "INSERT INTO Features({keys}) VALUES ({values})" \
        .format(keys=columns, values=values)
    mycursor = mydb.cursor()
    mycursor.execute(sql, tuple(feature.values()))
    m_nCount = m_nCount + 1
    mycursor.close()
print("Total {" + str(m_nCount) + "} rows inserted to Features.")

mycursor = mydb.cursor()
mycursor.execute("Delete From Issues")
mycursor.close()

m_nCount = 0
for issue in m_Issues:
    columns = ",".join(issue.keys())
    values = ', '.join(['%s'] * len(issue))
    sql = "INSERT INTO Issues({keys}) VALUES ({values})" \
        .format(keys=columns, values=values)
    mycursor = mydb.cursor()
    mycursor.execute(sql, tuple(issue.values()))
    m_nCount = m_nCount + 1
    mycursor.close()
print("Total {" + str(m_nCount) + "} rows inserted to Issues.")

# 提交事务
mydb.commit()

# 关闭数据库连接
mydb.close()
