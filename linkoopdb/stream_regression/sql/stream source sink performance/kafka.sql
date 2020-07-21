--Description: stream jdbc(mysql) source performance
--Date：2020-07-20
--Author：丁婷

drop stream if exists S_KAFKA_SINK_PER_001;
drop stream if exists S_KAFKA_TO_KAFKA_PER_001;

CREATE stream S_KAFKA_TO_KAFKA_PER_001(
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

--__internal__ create kafka server node10:9092;

--sleep 10;

--__internal__ drop kafka topic kafka_per_001;

--sleep 10;

--__internal__ create kafka topic kafka_per_001 Partitions 20 replication_factor 1;
--
--sleep 10;

create stream S_KAFKA_SINK_PER_001 (
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
) PROPERTIES (
'type': 'sink',
'connector': 'kafka',
'version': 'universal',
'topic': 'kafka_per_003',
'group.id': '103001',
'bootstrap.servers': 'node10:9092',
'format': 'csv' ,
'separator':','
);

set session STREAM_EXECUTE_PARALLELISM 20;

INSERT INTO S_KAFKA_SINK_PER_001 SELECT * FROM S_KAFKA_TO_KAFKA_PER_001;