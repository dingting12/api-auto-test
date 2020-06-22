-- Description：bit,binary,varbinary data type
-- Date：2020-06-12
-- Author：李爱敏

set echo on
set timing on

-- BIT(n)数据类型验证
--如果表已存在，则先删除
drop table T_TYPE_BIT1 if exists;
drop table T_TYPE_BIT2 if exists;
drop table T_TYPE_BIT3 if exists;
drop table T_TYPE_BIT4 if exists;
drop table T_TYPE_BIT5 if exists;
drop table T_TYPE_BIT6 if exists;

--创建表T_TYPE_BIT1，设置位数为默认值，默认为1
create table T_TYPE_BIT1(a1 bit);

--验证插入数据的位数等于1
insert into T_TYPE_BIT1 values(b'1');
select * from T_TYPE_BIT1;

--验证插入数据的位数大于1，是否报错
insert into T_TYPE_BIT1 values(b'11');
select * from T_TYPE_BIT1;

--创建表T_TYPE_BIT2，设置位数n为0，是否报错
create table T_TYPE_BIT2(a1 bit(0));

--创建表T_TYPE_BIT3，设置位数n为1
create table T_TYPE_BIT2(a1 bit(1));
insert into T_TYPE_BIT3 values(b'1');
select * from T_TYPE_BIT3;

--创建表T_TYPE_BIT4，设置位数n为65，是否报错
create table T_TYPE_BIT4(a1 bit(65));
insert into T_TYPE_BIT4 values(b'10101010101010101010101010101010101010101010101010101010101011111');
select * from T_TYPE_BIT4;

--创建表T_TYPE_BIT5，设置位数n为64
create table T_TYPE_BIT5(a1 bit(64));
insert into T_TYPE_BIT5 values(b'1010101010101010101010101010101010101010101010101010101010101111');
select * from T_TYPE_BIT5;

--创建表T_TYPE_BIT6，设置位数n为10
create table T_TYPE_BIT6(a1 bit(10));

--验证插入数据的位数大于10，是否报错
insert into T_TYPE_BIT6 values(b'10101010101');
select * from T_TYPE_BIT6;

--验证插入数据的位数等于10
insert into T_TYPE_BIT6 values(b'1010101010');
select * from T_TYPE_BIT6;

--验证插入数据的位数小于10，左边补0
insert into T_TYPE_BIT6 values(b'10101010');
select * from T_TYPE_BIT6;

--验证插入非0,1的数字，是否报错
insert into T_TYPE_BIT6 values(b'22334455');
select * from T_TYPE_BIT6;

--验证插入0000000000
insert into T_TYPE_BIT6 values(b'0000000000');
select * from T_TYPE_BIT6;

--验证插入1111111111
insert into T_TYPE_BIT6 values(b'1111111111');
select * from T_TYPE_BIT6;

--验证插入BINARY类型
insert into T_TYPE_BIT6 values('1111111000');
select * from T_TYPE_BIT6;

-- 验证插入其他数据类型
--验证插入int类型，是否报错
insert into T_TYPE_BIT6 values(12345);
select * from T_TYPE_BIT6;

--验证插入decimal类型，是否报错
insert into T_TYPE_BIT6 values(1234.56);
select * from T_TYPE_BIT6;

--验证插入varchar类型，插入英文字母'xxxyyyZZZ'，是否报错
insert into T_TYPE_BIT6 values('xxxyyyZZZ');
select * from T_TYPE_BIT6;

--验证插入date类型，格式yyyy-mm-dd，是否报错
insert into T_TYPE_BIT6 values(to_date('2020-05-08','yyyy-mm-dd'));
select * from T_TYPE_BIT6;

--验证插入timestamp类型，格式yyyy-mm-dd hh24:mi:ss，是否报错
insert into T_TYPE_BIT6 values(TO_TIMESTAMP('2020-05-08 12:19:01', 'yyyy-mm-dd hh24:mi:ss'));
select * from T_TYPE_BIT6;

--验证插入boolean类型，插入true，是否报错
insert into T_TYPE_BIT6 values(true);
select * from T_TYPE_BIT6;

--验证插入空值''
insert into T_TYPE_BIT6 values('');
select * from T_TYPE_BIT6;

--验证插入空格' '
insert into T_TYPE_BIT6 values(' ');
select * from T_TYPE_BIT6;

--验证插入null
insert into T_TYPE_BIT6 values(null);
select * from T_TYPE_BIT6;

--验证插入NULL
insert into T_TYPE_BIT6 values(NULL);
select * from T_TYPE_BIT6;


--最后删除创建的表
drop table T_TYPE_BIT1 if exists;
drop table T_TYPE_BIT2 if exists;
drop table T_TYPE_BIT3 if exists;
drop table T_TYPE_BIT4 if exists;
drop table T_TYPE_BIT5 if exists;
drop table T_TYPE_BIT6 if exists;


--BINARY(n)数据类型，字节长度为n，n的最大值为64000
--如果表已存在，则先删除
drop table T_TYPE_BINARY1 if exists;
drop table T_TYPE_BINARY2 if exists;
drop table T_TYPE_BINARY3 if exists;

--创建表T_TYPE_BINARY1，设置长度大于64000，是否报错
create table T_TYPE_BINARY1 (a1 binary(64001));
insert into T_TYPE_BINARY1 values('AaBbFfEeDd0099');
select * from T_TYPE_BINARY1;

--创建表T_TYPE_BINARY2，设置长度为64000
create table T_TYPE_BINARY2 (a1 binary(64000));
insert into T_TYPE_BINARY2 values('AaBbFfEeDd0099');
select * from T_TYPE_BINARY2;

--创建表T_TYPE_BINARY3，设置长度为10
create table T_TYPE_BINARY3 (a1 binary(10));

--验证插入数据的字节数大于10，是否报错
insert into T_TYPE_BINARY3 values('AaFfEe00991');
select * from T_TYPE_BINARY3;

--验证插入数据的字节数等于10
insert into T_TYPE_BINARY3 values('AaFfEe0099');
select * from T_TYPE_BINARY3;

--验证插入数据的字节数小于10，右边用0补齐
insert into T_TYPE_BINARY3 values('AaFfEe009');
select * from T_TYPE_BINARY3;

--验证插入的字符不在a-f，A-F之间，是否报错
insert into T_TYPE_BINARY3 values('GgHhZzQQ');
select * from T_TYPE_BINARY3;

--验证插入数据的字节数为0，右边用0补齐
insert into T_TYPE_BINARY3 values('');
select * from T_TYPE_BINARY3;

--验证插入BIT类型
insert into T_TYPE_BINARY3 values(b'1010111101');
select * from T_TYPE_BINARY3;


-- 验证插入其他数据类型
--验证插入int类型，是否报错
insert into T_TYPE_BINARY3 values(12345);
select * from T_TYPE_BINARY3;

--验证插入decimal类型，是否报错
insert into T_TYPE_BINARY3 values(1234.56);
select * from T_TYPE_BINARY3;

--验证插入varchar类型，插入英文字母'xxxyyyZZZW'，是否报错
insert into T_TYPE_BINARY3 values('xxxyyyZZZW');
select * from T_TYPE_BINARY3;

--验证插入date类型，格式yyyy-mm-dd，是否报错
insert into T_TYPE_BINARY3 values(to_date('2020-05-08','yyyy-mm-dd'));
select * from T_TYPE_BINARY3;

--验证插入timestamp类型，格式yyyy-mm-dd hh24:mi:ss，是否报错
insert into T_TYPE_BINARY3 values(TO_TIMESTAMP('2020-05-08 12:19:01', 'yyyy-mm-dd hh24:mi:ss'));
select * from T_TYPE_BINARY3;

--验证插入boolean类型，插入true，是否报错
insert into T_TYPE_BINARY3 values(true);
select * from T_TYPE_BINARY3;

--验证插入空值''
insert into T_TYPE_BINARY3 values('');
select * from T_TYPE_BINARY3;

--验证插入空格' '
insert into T_TYPE_BINARY3 values(' ');
select * from T_TYPE_BINARY3;

--验证插入null
insert into T_TYPE_BINARY3 values(null);
select * from T_TYPE_BINARY3;

--验证插入NULL
insert into T_TYPE_BINARY3 values(NULL);
select * from T_TYPE_BINARY3;


--最后删除创建的表
drop table T_TYPE_BINARY1 if exists;
drop table T_TYPE_BINARY2 if exists;
drop table T_TYPE_BINARY3 if exists;





--验证VARBINARY(n)数据类型，字节长度为n+1，n的最大值为64000
--如果表已存在，则先删除
drop table T_TYPE_VARBINARY1 if exists;
drop table T_TYPE_VARBINARY2 if exists;
drop table T_TYPE_VARBINARY3 if exists;

--创建表T_TYPE_VARBINARY1，设置长度大于64000，是否报错
create table T_TYPE_VARBINARY1 (a1 varbinary(64001));
insert into T_TYPE_VARBINARY1 values('AaFf0099bb');
select * from T_TYPE_VARBINARY1;

--创建表T_TYPE_VARBINARY1，设置长度为64000
create table T_TYPE_VARBINARY2 (a1 varbinary(64000));
insert into T_TYPE_VARBINARY2 values('AaFf0099bb');
select * from T_TYPE_VARBINARY2;

--创建表T_TYPE_VARBINARY3，设置长度为10
create table T_TYPE_VARBINARY3 (a1 varbinary(10));

--验证插入数据的字节数大于10，是否报错
insert into T_TYPE_VARBINARY3 values('AaFf0099bbC');
select * from T_TYPE_VARBINARY3;

--验证插入数据的字节数等于10
insert into T_TYPE_VARBINARY3 values('AaFf0099bb');
select * from T_TYPE_VARBINARY3;
select bit_length(a1)  from T_TYPE_VARBINARY3;

--验证插入数据的字节数小于10
insert into T_TYPE_VARBINARY3 values('AaFf0099b');
select * from T_TYPE_VARBINARY3;

--验证插入的字符不在a-f，A-F之间，是否报错
insert into T_TYPE_VARBINARY3 values('GgHhZzQQ');
select * from T_TYPE_VARBINARY3;

--验证插入数据的字节数为0
insert into T_TYPE_VARBINARY3 values('');
select * from T_TYPE_VARBINARY3;

--验证插入BIT类型
insert into T_TYPE_VARBINARY3 values(b'1010101110');
select * from T_TYPE_VARBINARY3;

-- 验证插入其他数据类型
--验证插入int类型，是否报错
insert into T_TYPE_VARBINARY3 values(12345);
select * from T_TYPE_VARBINARY3;

--验证插入decimal类型，是否报错
insert into T_TYPE_VARBINARY3 values(1234.56);
select * from T_TYPE_VARBINARY3;

--验证插入varchar类型，插入英文字母'xxxyyyZZZww'，是否报错
insert into T_TYPE_VARBINARY3 values('xxxyyyZZww');
select * from T_TYPE_VARBINARY3;

--验证插入date类型，格式yyyy-mm-dd，是否报错
insert into T_TYPE_VARBINARY3 values(to_date('2020-05-08','yyyy-mm-dd'));
select * from T_TYPE_VARBINARY3;

--验证插入timestamp类型，格式yyyy-mm-dd hh24:mi:ss，是否报错
insert into T_TYPE_VARBINARY3 values(TO_TIMESTAMP('2020-05-08 12:19:01', 'yyyy-mm-dd hh24:mi:ss'));
select * from T_TYPE_VARBINARY3;

--验证插入boolean类型，插入true，是否报错
insert into T_TYPE_VARBINARY3 values(true);
select * from T_TYPE_VARBINARY3;

--验证插入空值''
insert into T_TYPE_VARBINARY3 values('');
select * from T_TYPE_VARBINARY3;

--验证插入空格' '
insert into T_TYPE_VARBINARY3 values(' ');
select * from T_TYPE_VARBINARY3;

--验证插入null
insert into T_TYPE_VARBINARY3 values(null);
select * from T_TYPE_VARBINARY3;

--验证插入NULL
insert into T_TYPE_VARBINARY3 values(NULL);
select * from T_TYPE_VARBINARY3;


--最后删除创建的表
drop table T_TYPE_VARBINARY1 if exists;
drop table T_TYPE_VARBINARY2 if exists;
drop table T_TYPE_VARBINARY3 if exists;




--验证BLOB数据类型
--如果表已存在，则先删除
drop table T_TYPE_BLOB1 if exists;
drop table T_TYPE_BLOB2 if exists;
drop table T_TYPE_BLOB3 if exists;

create table T_TYPE_BLOB1 (a1 blob(100),a2 blob(5K),a3 blob(5M),a4 blob(5G));
insert into T_TYPE_BLOB1 values ('abcdef','aaaaaaaa','bbbbbbbbbb','ccccccccccccccc');
select * from T_TYPE_BLOB1;

--验证32个lob列
create table T_TYPE_BLOB2 (a1 blob(100),a2 blob(5K),a3 blob(5M),a4 blob(1G),a5 clob(100),a6 clob(5K),a7 clob(5M),a8 clob(1G),a9 blob(100),a10 blob(100),a11 blob(100),a12 blob(100),a13 blob(100),a14 blob(100),a15 blob(100),a16 blob(100),a17 blob(100),a18 blob(100),a19 blob(100),a20 clob(100),a21 clob(5K),a22 clob(5K),a23 clob(5K),a24 clob(5K),a25 clob(5K),a26 clob(5K),a27 clob(5K),a28 clob(5K),a29 clob(5K),a30 blob(5M),a31 blob(5M),a32 blob(5M));
insert into T_TYPE_BLOB2 values ('aaaaaaaa','bbbbbbbbbb','ccccccccccccccc','ddddddddd','eeeeee','ffffff','ggggggggg','hhhhhhhh','iiiiiii','jjjjjjjj','kkkkkkkkk','lllllllll','mmmmmmmmmm','nnnnnnnn','oooooooo','ppppppp','qqqqqqq','rrrrr','ssssss','tttttt','uuuuuuu','vvvvvv','wwwwwww','xxxxx','yyyyyy','zzzzzz','aaaaa','bbbbbb','cccccc','ddddddd','eeeeeee','fffffff');
select * from T_TYPE_BLOB2;

--验证lob列超过32个，是否报错
create table T_TYPE_BLOB3 (a1 blob(100),a2 blob(5K),a3 blob(5M),a4 blob(1G),a5 clob(100),a6 clob(5K),a7 clob(5M),a8 clob(1G),a9 blob(100),a10 blob(100),a11 blob(100),a12 blob(100),a13 blob(100),a14 blob(100),a15 blob(100),a16 blob(100),a17 blob(100),a18 blob(100),a19 blob(100),a20 clob(100),a21 clob(5K),a22 clob(5K),a23 clob(5K),a24 clob(5K),a25 clob(5K),a26 clob(5K),a27 clob(5K),a28 clob(5K),a29 clob(5K),a30 blob(5M),a31 blob(5M),a32 blob(5M),a33 blob(5M));
insert into T_TYPE_BLOB3 values ('aaaaaaaa','bbbbbbbbbb','ccccccccccccccc','ddddddddd','eeeeee','ffffff','ggggggggg','hhhhhhhh','iiiiiii','jjjjjjjj','kkkkkkkkk','lllllllll','mmmmmmmmmm','nnnnnnnn','oooooooo','ppppppp','qqqqqqq','rrrrr','ssssss','tttttt','uuuuuuu','vvvvvv','wwwwwww','xxxxx','yyyyyy','zzzzzz','aaaaa','bbbbbb','cccccc','ddddddd','eeeeeee','fffffff','gggg');
select * from T_TYPE_BLOB3;


--最后删除创建的表
drop table T_TYPE_BLOB1 if exists;
drop table T_TYPE_BLOB2 if exists;
drop table T_TYPE_BLOB3 if exists;





