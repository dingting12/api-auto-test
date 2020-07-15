__internal__ create kafka server node10:9092;
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
) rows 1000000;
