__internal__ create fs file temp.csv
(
{random_ascii_letters_and_digits(17)},
{random_digits(10)},
{random_digits(10)},
{random_digits(10)},
{random_digits(6)},
{random_digits(6)},
{random_digits(6)},
{random_digits(10)},
{random_ascii_letters_and_digits(50)},
{random_ascii_letters_and_digits(100)},
{random_ascii_letters_and_digits(100)},
{random_ascii_letters_and_digits(100)},
{random_ascii_letters_and_digits(16)},
{random_ascii_letters_and_digits(16)},
{random_digits(10)},
{random_digits(10)},
{random_digits(10)},
{random_digits(10)},
{random_digits(10)},
{random_digits(10)},
{random_ascii_letters_and_digits(50)},
{random_ascii_letters_and_digits(50)},
{random_ascii_letters_and_digits(50)},
{random_ascii_letters_and_digits(50)},
{current_timestamp(%Y-%m-%d %H:%M:%S.%f)}
) rows 100000;
__internal__ create kafka server node10:9092;
sleep 3
__internal__ create kafka message from file temp.csv to topic shenzhen;
