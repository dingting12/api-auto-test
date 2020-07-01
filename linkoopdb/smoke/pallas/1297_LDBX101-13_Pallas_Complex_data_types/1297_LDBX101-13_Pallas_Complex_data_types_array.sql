--    Description: 测试pallas complex data type array
--    Date:         2020-07-01
--    Author:       丁婷

set echo on
drop table T_PALLAS_COMPLEXTYPE_ARRAY_001 if exists cascade;

CREATE TABLE T_PALLAS_COMPLEXTYPE_ARRAY_001 (
id INT,
tINTEGER INTEGER ARRAY,
tSMALLINT SMALLINT ARRAY,
tbigint bigint ARRAY,
treal real ARRAY,
tdouble double ARRAY,
tfloat float ARRAY,
tDECIMAL DECIMAL(10,2) ARRAY,
tNUMERIC NUMERIC(10,2) ARRAY,
tdate date ARRAY,
ttimestamp timestamp ARRAY,
tchar CHAR(20) ARRAY,
tVARCHAR VARCHAR(20) ARRAY
) engine pallas;


INSERT INTO T_PALLAS_COMPLEXTYPE_ARRAY_001 VALUES 
(1, ARRAY[2147483647,2147483647], ARRAY[32767,32767],ARRAY[9223372036854775807,9223372036854775807],ARRAY[1.7976931348623157E308,1.7976931348623157E308],ARRAY[1.7E308,1.7E308],ARRAY[3.4028235E38,3.4028235E38],ARRAY[1000.333,1000.4444],ARRAY[2000.333,2000.4444],ARRAY[to_date('9999-12-31','yyyy-mm-dd'),to_date('9999-12-31','yyyy-mm-dd')],ARRAY[to_TIMESTAMP('9999-12-31 23:59:59','yyyy-mm-dd hh24:mi:ss'),to_TIMESTAMP('9999-12-31 23:59:59','yyyy-mm-dd hh24:mi:ss')],ARRAY['verygood','verygood'],ARRAY['long char','long char']),
(2, ARRAY[-2147483648,-2147483648], ARRAY[-32768,-32768],ARRAY[-9223372036854775808,-9223372036854775808],ARRAY[4.9E-324,4.9E-324],ARRAY[-1.7E308,-1.7E308],ARRAY[1.4E-45,1.4E-45],ARRAY[1000.333,1000.4444],ARRAY[2000.333,2000.4444],ARRAY[to_date('0000-00-00','yyyy-mm-dd'),to_date('0000-00-00','yyyy-mm-dd')],ARRAY[to_TIMESTAMP('0000-00-00 00:00:00','yyyy-mm-dd hh24:mi:ss'),to_TIMESTAMP('0000-00-00 00:00:00','yyyy-mm-dd hh24:mi:ss')],ARRAY['verygood','verygood'],ARRAY['long char','long char']),
(3, ARRAY[2147483647], ARRAY[32767],ARRAY[9223372036854775807],ARRAY[1.7976931348623157E308],ARRAY[1.7E308],ARRAY[3.4028235E38],ARRAY[1000.4444],ARRAY[2000.333],ARRAY[to_date('2018-05-07','yyyy-mm-dd')],ARRAY[to_TIMESTAMP('2018-05-07 14:14:14','yyyy-mm-dd hh24:mi:ss')],ARRAY['verygood'],ARRAY['long char']),
(4, ARRAY[1], ARRAY[2],ARRAY[3],ARRAY[1.4],ARRAY[1.7],ARRAY[3.4],ARRAY[1001.4444],ARRAY[2001.333],ARRAY[date '2019-05-07'],ARRAY[TIMESTAMP '2019-05-07 14:14:14'],ARRAY['verygood'],ARRAY['long char']),
(5, ARRAY[1], ARRAY[7],ARRAY[8],ARRAY[1.9],ARRAY[1.01],ARRAY[3.02],ARRAY[1002.4444],ARRAY[2002.333],ARRAY[to_date('2020-05-07','yyyy-mm-dd')],ARRAY[to_TIMESTAMP( '2020-05-07 14:14:14','yyyy-mm-dd hh24:mi:ss')],ARRAY['verygood'],ARRAY['long char']);

select tinteger from T_PALLAS_COMPLEXTYPE_ARRAY_001 where id = 1;

select tbigint from T_PALLAS_COMPLEXTYPE_ARRAY_001 where id = 2;

SELECT tINTEGER[0],tINTEGER[1] FROM T_PALLAS_COMPLEXTYPE_ARRAY_001 order by tINTEGER[1], tINTEGER[0],id DESC;

SELECT tSMALLINT[0],tSMALLINT[1] FROM T_PALLAS_COMPLEXTYPE_ARRAY_001 order by id asc;