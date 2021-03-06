drop stream if exists s_kafka_source;
drop stream if exists S_PARQUET_SINK;
drop table if exists t_parquet;

__internal__ create kafka server node10:9092;
__internal__ drop kafka topic shenzhen;
sleep 10
__internal__ create kafka topic shenzhen Partitions 20 replication_factor 1;
sleep 10

CREATE stream s_kafka_source(
TS_15M VARCHAR(17),
MSISDN BIGINT,
IMEI BIGINT,
IMSI BIGINT,
MCC INTEGER,
MNC INTEGER,
LAC INTEGER,
CELL BIGINT,
HOST VARCHAR(128),
URI VARCHAR(10240),
L7REQ VARCHAR(1024),
L7REP VARCHAR(1024),
LATITUDE VARCHAR(16),
LONGITUDE VARCHAR(16),
CILENTBYTE BIGINT,
SERVERBYTE BIGINT,
CLIENTFIRSTSEC BIGINT,
SERVERFIRSTSEC BIGINT,
CLIENTLASTSEC BIGINT,
SERVERLASTSEC BIGINT,
CLIENTIPTO VARCHAR(128),
SERVERIPTO VARCHAR(128),
CLIENTIP VARCHAR(128),
SERVERIP VARCHAR(128),
ctime timestamp
)properties(
 'type': 'source',
 'connector': 'kafka',
 'version': 'universal',
 'topic': 'shenzhen',
 'group.id': 'random_str',
 'proctime':'atime',
 'bootstrap.servers': 'node10:9092',
 'format':'csv',
 'separator':','
);

CREATE STREAM S_PARQUET_SINK(
TS_15M VARCHAR(17),
MSISDN BIGINT,
IMEI BIGINT,
IMSI BIGINT,
MCC INTEGER,
MNC INTEGER,
LAC INTEGER,
CELL BIGINT,
HOST VARCHAR(128),
URI VARCHAR(10240),
L7REQ VARCHAR(1024),
L7REP VARCHAR(1024),
LATITUDE VARCHAR(16),
LONGITUDE VARCHAR(16),
CILENTBYTE BIGINT,
SERVERBYTE BIGINT,
CLIENTFIRSTSEC BIGINT,
SERVERFIRSTSEC BIGINT,
CLIENTLASTSEC BIGINT,
SERVERLASTSEC BIGINT,
CLIENTIPTO VARCHAR(128),
SERVERIPTO VARCHAR(128),
CLIENTIP VARCHAR(128),
SERVERIP VARCHAR(128),
ctime timestamp,
atime timestamp
) PROPERTIES(
   'type': 'sink',
   'connector':'filesystem',
   'format':'parquet',
   'path':'HDFSRPC_URL/shenzhen',
   'write-mode':'time',
   'batch-rollover-interval':'1D',
   'time-format':'yyyy-mm-dd',
   'separator': '-',
   'time-path-prefix': 'test_',
   'time-path-suffix': '_table',
   'inactive-bucket-threshold':'10',
   'inactive-bucket-check-interval':'30'
);

set session STREAM_EXECUTE_PARALLELISM 20;

insert into S_PARQUET_SINK select * from s_kafka_source;

set session work 'ldb.source.files.ignoreCorruptFiles' true;

CREATE EXTERNAL TABLE t_parquet(
TS_15M VARCHAR(17),
MSISDN BIGINT,
IMEI BIGINT,
IMSI BIGINT,
MCC INTEGER,
MNC INTEGER,
LAC INTEGER,
CELL BIGINT,
HOST VARCHAR(128),
URI VARCHAR(10240),
L7REQ VARCHAR(1024),
L7REP VARCHAR(1024),
LATITUDE VARCHAR(16),
LONGITUDE VARCHAR(16),
CILENTBYTE BIGINT,
SERVERBYTE BIGINT,
CLIENTFIRSTSEC BIGINT,
SERVERFIRSTSEC BIGINT,
CLIENTLASTSEC BIGINT,
SERVERLASTSEC BIGINT,
CLIENTIPTO VARCHAR(128),
SERVERIPTO VARCHAR(128),
CLIENTIP VARCHAR(128),
SERVERIP VARCHAR(128),
ctime timestamp,
atime timestamp
)LOCATION ('HDFSRPC_URL/shenzhen') FORMAT 'parquet' properties('recursiveFileLookup':'true');

sleep 600

select * from t_parquet;

submitjob datasend.sql 32
showjob all
startjob all
waitjob all 
