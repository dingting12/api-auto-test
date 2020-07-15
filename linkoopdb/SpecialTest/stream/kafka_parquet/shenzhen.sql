drop stream if exists s_kafka_source;
drop stream if exists S_PARQUET_SINK;
drop table if exists t_parquet;

__internal__ create kafka server node10:9092;
__internal__ drop kafka topic shenzhen;
sleep 5
__internal__ create kafka topic shenzhen Partitions 20 replication_factor 1;
sleep 5
__internal__ create kafka message topic shenzhen
(
{TS_15M:random_ascii_letters_and_digits(17)},
{MSISDN:random_digits(10)},
{IMEI:random_digits(10)},
{IMSI:random_digits(10)},
{MCC:random_digits(6)},
{MNC:random_digits(6)},
{LAC:random_digits(6)},
{CELL:random_digits(10)},
{HOST:random_ascii_letters_and_digits(50)},
{URI:random_ascii_letters_and_digits(100)},
{L7REQ:random_ascii_letters_and_digits(100)},
{L7REP:random_ascii_letters_and_digits(100)},
{LATITUDE:random_ascii_letters_and_digits(16)},
{LONGITUDE:random_ascii_letters_and_digits(16)},
{CILENTBYTE:random_digits(10)},
{SERVERBYTE:random_digits(10)},
{CLIENTFIRSTSEC:random_digits(10)},
{SERVERFIRSTSEC:random_digits(10)},
{CLIENTLASTSEC:random_digits(10)},
{SERVERLASTSEC:random_digits(10)},
{CLIENTIPTO:random_ascii_letters_and_digits(50)},
{SERVERIPTO:random_ascii_letters_and_digits(50)},
{CLIENTIP:random_ascii_letters_and_digits(50)},
{SERVERIP:random_ascii_letters_and_digits(50)},
{ctime:current_timestamp(%Y-%m-%d %H:%M:%S.%f)}
) rows 100000;


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
   'path':'hdfs:///node62/shenzhen',
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
)LOCATION ('hdfs:///node62/shenzhen') FORMAT 'parquet' properties('recursiveFileLookup':'true');

select * from t_parquet;
