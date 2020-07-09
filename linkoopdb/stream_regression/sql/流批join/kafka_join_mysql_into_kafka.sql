__internal__ create kafka server node10:9092;
__internal__ drop kafka topic KAFKA_JOIN_SINK;
__internal__ create kafka topic KAFKA_JOIN_SINK Partitions 16 replication_factor 1;
sleep 3

--删除表结构
drop stream if exists S_KAFKA_WEB_RETURNS_NEW;
drop stream if exists S_FILE_customer_new;
drop stream if exists RESULT_KAFKA;
drop stream if exists RESULT_KAFKA_source;
drop table if exists t_join_result;

--创建kafka source
CREATE stream S_KAFKA_WEB_RETURNS_NEW(
    wr_returned_date_sk       integer                       ,
    wr_returned_time_sk       integer                       ,
    wr_item_sk                integer    primary key,
    wr_refunded_customer_sk   integer                       ,
    wr_refunded_cdemo_sk      integer                       ,
    wr_refunded_hdemo_sk      integer                       ,
    wr_refunded_addr_sk       integer                       ,
    wr_returning_customer_sk  integer                       ,
    wr_returning_cdemo_sk     integer                       ,
    wr_returning_hdemo_sk     integer                       ,
    wr_returning_addr_sk      integer                       ,
    wr_web_page_sk            integer                       ,
    wr_reason_sk              integer                       ,
    wr_order_number           bigint    not null,
    wr_return_quantity        integer                       ,
    wr_return_amt             decimal(7,2)                  ,
    wr_return_tax             decimal(7,2)                  ,
    wr_return_amt_inc_tax     decimal(7,2)                  ,
    wr_fee                    decimal(7,2)                  ,
    wr_return_ship_cost       decimal(7,2)                  ,
    wr_refunded_cash          decimal(7,2)                  ,
    wr_reversed_charge        decimal(7,2)                  ,
    wr_account_credit         decimal(7,2)                  ,
    wr_net_loss               decimal(7,2)                ,
    wr_test                   decimal(7,2)
)properties(
 'type': 'source',
 'connector': 'kafka',
 'version': 'universal',
 'topic': 'WEB_RETURN',
 'group.id': 'random_str',
 'bootstrap.servers': 'node10:9092',
 'format':'csv',
 'separator':'|'
);

--创建jdbc静态表
CREATE STREAM S_mysql_customer_new(
    c_customer_sk             integer               primary key ,
    c_customer_id             char(16)              not null,
    c_current_cdemo_sk        integer                       ,
    c_current_hdemo_sk        integer                       ,
    c_current_addr_sk         integer                       ,
    c_first_shipto_date_sk    integer                       ,
    c_first_sales_date_sk     integer                       ,
    c_salutation              char(10)                      ,
    c_first_name              char(20)                      ,
    c_last_name               char(30)                      ,
    c_preferred_cust_flag     char(1)                       ,
    c_birth_day               integer                       ,
    c_birth_month             integer                       ,
    c_birth_year              integer                       ,
    c_birth_country           varchar(20)                   ,
    c_login                   char(13)                      ,
    c_email_address           char(50)                      ,
    c_last_review_date_sk       int        
)properties(
  'type': 'source',
  'connector': 'jdbc',
  'tableName': 'customer',
  'driver': 'com.mysql.jdbc.Driver',
  'dbUrl': 'jdbc:mysql://node72:3306/poc',
  'username': 'test',
  'password': '123456',
  'fetchSize': '10000',
  'dataType':'static',
  'cacheStrategy':'all'
);

--创建结果表
CREATE STREAM PUBLIC.RESULT_KAFKA(WR_RETURNED_DATE_SK INTEGER,WR_ITEM_SK INTEGER,WR_REFUNDED_CDEMO_SK INTEGER,C_CUSTOMER_SK INTEGER,C_CUSTOMER_ID CHAR(16),C_CURRENT_CDEMO_SK INTEGER)properties(
 'type': 'sink',
 'connector': 'kafka',
 'version': 'universal',
 'topic': 'KAFKA_JOIN_SINK',
 'group.id': 'random_str',
 'bootstrap.servers': 'node10:9092',
 'format':'csv',
 'separator':'|'
);

--创建kafka source
CREATE STREAM PUBLIC.RESULT_KAFKA_source(WR_RETURNED_DATE_SK INTEGER,WR_ITEM_SK INTEGER,WR_REFUNDED_CDEMO_SK INTEGER,C_CUSTOMER_SK INTEGER,C_CUSTOMER_ID CHAR(16),C_CURRENT_CDEMO_SK INTEGER)properties(
 'type': 'source',
 'connector': 'kafka',
 'version': 'universal',
 'topic': 'KAFKA_JOIN_SINK',
 'group.id': 'random_str',
 'bootstrap.servers': 'node10:9092',
 'format':'csv',
 'separator':'|'
);


--创建table存放结果数据
CREATE table t_join_result(WR_RETURNED_DATE_SK INTEGER,WR_ITEM_SK INTEGER,WR_REFUNDED_CDEMO_SK INTEGER,C_CUSTOMER_SK INTEGER,C_CUSTOMER_ID CHAR(16),C_CURRENT_CDEMO_SK INTEGER);

--设置并行度
set session STREAM_EXECUTE_PARALLELISM 16;

--将join的结果插入到kafka sink中
insert into RESULT_KAFKA select
wr_returned_date_sk,
wr_item_sk,
wr_refunded_cdemo_sk,
c_customer_sk,
c_customer_id,
c_current_cdemo_sk
from S_KAFKA_WEB_RETURNS_NEW  LEFT JOIN  S_mysql_customer_new 
on 
  c_current_cdemo_sk = wr_refunded_cdemo_sk WHERE 
   c_birth_month =1 AND c_current_cdemo_sk IS NOT null;

sleep 600

SELECT JOBID FROM INFORMATION_SCHEMA.SYSTEM_STREAM_JOBSTATUS 
WHERE	JOBSTATE = 'RUNNING'
AND     SESSIONID IN 
(
	SELECT	VALUE 
	FROM	INFORMATION_SCHEMA.SYSTEM_SESSIONINFO 
	WHERE	KEY = 'SESSION ID'
);

cancel job "%lastsqlresult.LastSQLResult[0][0]%"

--将结果数据插入到ldb table中
insert into t_join_result select * from RESULT_KAFKA_source;

sleep 30

--查询数据条数
select count(*) from RESULT_KAFKA_source;
