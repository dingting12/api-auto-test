--Description：char data type
--Date：2020-05-22
--Author：李爱敏

-- char数据类型验证
--删除表
drop table T_TYPE_CHAR1 if exists;
drop table T_TYPE_CHAR2 if exists;
drop table T_TYPE_CHAR3 if exists;
drop table T_TYPE_CHAR4 if exists;

--创建表T_TYPE_CHAR1，字符长度为64000
create table T_TYPE_CHAR1 (
name char(64000)
);

--通过脚本往表T_TYPE_CHAR1中插入64000个随机字符
--查询表T_TYPE_CHAR1
select length(name) from T_TYPE_CHAR1;

--创建表T_TYPE_CHAR2，默认长度为1
create table T_TYPE_CHAR2 (
name char
);

--插入字符长度为1
insert into T_TYPE_CHAR2 values('a');
--查询表T_TYPE_CHAR2
select * from T_TYPE_CHAR2;

--插入字符长度>1，是否报错
insert into T_TYPE_CHAR2 values('ab');
--查询表T_TYPE_CHAR2
select * from T_TYPE_CHAR2;

--创建表T_TYPE_CHAR3
create table T_TYPE_CHAR3(
a1 char(5)
);

--插入数据格式为双引号，报错
insert into T_TYPE_CHAR3 values("asdfg");
--查询表T_TYPE_CHAR3
select * from T_TYPE_CHAR3;

--插入数据格式为单引号
insert into T_TYPE_CHAR3 values('asdfg');
--查询表T_TYPE_CHAR3
select * from T_TYPE_CHAR3;

--插入的数据无引号
insert into T_TYPE_CHAR3 values(asdfg);
--查询表T_TYPE_CHAR3
select * from T_TYPE_CHAR3;

--创建表T_TYPE_CHAR4
create table T_TYPE_CHAR4(
a1 char(30)        
);

--验证插入30个英文字母
insert into T_TYPE_CHAR4 values('abcdefghijklmnopqrstuvwxyzabcd');
--查询表T_TYPE_CHAR4
select * from T_TYPE_CHAR4;

--验证插入31个英文字母，插入是否成功
insert into T_TYPE_CHAR4 values('abcdefghijklmnopqrstuvwxyzabcde');
--查询表T_TYPE_CHAR4
select * from T_TYPE_CHAR4;

--验证插入30个汉字
insert into T_TYPE_CHAR4 values('一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十');
--查询表T_TYPE_CHAR4
select * from T_TYPE_CHAR4;

--验证插入31个汉字，插入是否成功
insert into T_TYPE_CHAR4 values('一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十一');
--查询表T_TYPE_CHAR4
select * from T_TYPE_CHAR4;

--验证插入15个汉字
insert into T_TYPE_CHAR4 values('一二三四五六七八九十一二三四五');
--查询表T_TYPE_CHAR4
select * from T_TYPE_CHAR4;

--验证插入16个汉字，插入是否成功
insert into T_TYPE_CHAR4 values('一二三四五六七八九十一二三四五六');
--查询表T_TYPE_CHAR4
select * from T_TYPE_CHAR4;

--验证插入30个数字
insert into T_TYPE_CHAR4 values('123456789012345678901234567890');
--查询表T_TYPE_CHAR4
select * from T_TYPE_CHAR4;

--验证插入31个数字，插入是否成功
insert into T_TYPE_CHAR4 values('1234567890123456789012345678901');
--查询表T_TYPE_CHAR4
select * from T_TYPE_CHAR4;

--验证插入int类型
insert into T_TYPE_CHAR4 values(129);
--查询表T_TYPE_CHAR4
select * from T_TYPE_CHAR4;

--验证插入double类型
insert into T_TYPE_CHAR4 values(129.77);
--查询表T_TYPE_CHAR4
select * from T_TYPE_CHAR4;

--验证插入date类型
insert into T_TYPE_CHAR4 values(to_date('2020-05-08','yyyy-mm-dd'));
--查询表T_TYPE_CHAR4
select * from T_TYPE_CHAR4;

--验证插入timestamp类型
insert into T_TYPE_CHAR4 values(TO_TIMESTAMP('2020-05-08 12:19:01', 'yyyy-mm-dd hh24:mi:ss'));
--查询表T_TYPE_CHAR4
select * from T_TYPE_CHAR4;

--验证插入boolean类型
insert into T_TYPE_CHAR4 values(true);
--查询表T_TYPE_CHAR4
select * from T_TYPE_CHAR4;

--验证插入boolean类型
insert into T_TYPE_CHAR4 values(false);
--查询表T_TYPE_CHAR4
select * from T_TYPE_CHAR4;

--验证插入空值''                                                   
insert into T_TYPE_CHAR4 values('');
--查询表T_TYPE_CHAR4
select * from T_TYPE_CHAR4;

--验证插入空格' '                                                   
insert into T_TYPE_CHAR4 values(' ');
--查询表T_TYPE_CHAR4
select * from T_TYPE_CHAR4;

--验证插入null                                                    
insert into T_TYPE_CHAR4 values(null);
--查询表T_TYPE_CHAR4
select * from T_TYPE_CHAR4;

--验证插入NULL                                                   
insert into T_TYPE_CHAR4 values(NULL);
--查询表T_TYPE_CHAR4
select * from T_TYPE_CHAR4;