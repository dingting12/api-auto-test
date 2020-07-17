__internal__ create kafka server node10:9092;
sleep 5
__internal__ create kafka message topic shenzhen
(
{random_ascii_letters_and_digits(10)},
{random_digits(10)},
{random_digits(10)},
{random_digits(10)},
{random_digits(6)},
{random_digits(6)},
{random_digits(6)},
{random_digits(10)},
{random_ascii_letters_and_digits(10)},
{random_ascii_letters_and_digits(10)},
{L7REQ:random_ascii_letters_and_digits(10)},
{value(:L7REQ)},
{LATITUDE:random_ascii_letters_and_digits(10)},
{value(:LATITUDE)},
{random_digits(10)},
{random_digits(10)},
{random_digits(10)},
{random_digits(10)},
{random_digits(10)},
{random_digits(10)},
{CLIENTIPTO:random_ascii_letters_and_digits(10)},
{value(:CLIENTIPTO)},
{value(:CLIENTIPTO)},
{value(:CLIENTIPTO)},
{current_timestamp(%Y-%m-%d %H:%M:%S.%f)}
) rows 3125000;
