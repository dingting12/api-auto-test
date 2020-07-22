--Description:流表入库 kafka source到hdfs sink（按照块大小写入）
--Date：2020-07-21
--Author：贾路遥

DROP stream s_kafka_source_per IF EXISTS;
DROP stream s_hdfssize_sink_per IF EXISTS;

CREATE stream s_kafka_source_per(
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
 'topic': 'pertest_1Y',
 'group.id': 'random_str',
 'bootstrap.servers': 'node10:9092',
 'format':'csv',
 'separator':','
);

create stream s_hdfssize_sink_per(
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
   'type': 'sink',
   'connector':'filesystem',
   'format':'parquet',
   'path':'hdfs:///node62/stream_per/size',
   'write-mode':'size',
   'batch-size':'104857600'
);

set session STREAM_EXECUTE_PARALLELISM 20;

insert into s_hdfssize_sink_per select * from s_kafka_source_per;