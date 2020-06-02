--Description：date data type
--Date：2020-05-22
--Author：李爱敏

-- date数据类型验证
--删除表
drop table T_TYPE_DATE if exists;

--创建T_TYPE_DATE表
create table T_TYPE_DATE(
a1 date
);

--验证date的最小值0001-01-01
insert into T_TYPE_DATE values(to_date('0001-01-01','yyyy-mm-dd'));
--查询表T_TYPE_DATE
select * from T_TYPE_DATE;

--验证date的最小值-1，是否报错
insert into T_TYPE_DATE values(to_date('-0001-12-31','yyyy-mm-dd'));
--查询表T_TYPE_DATE
select * from T_TYPE_DATE;

--验证date的最大值9999-12-31
insert into T_TYPE_DATE values(to_date('9999-12-31','yyyy-mm-dd');
--查询表T_TYPE_DATE
select * from T_TYPE_DATE;

--验证date的最大值+1，是否报错
insert into T_TYPE_DATE values(to_date('10000-01-01','yyyy-mm-dd');
--查询表T_TYPE_DATE
select * from T_TYPE_DATE;

--验证闰年2月份最后一天日期
insert into T_TYPE_DATE values(to_date('2000-02-29','yyyy-mm-dd'));
--查询表T_TYPE_DATE
select * from T_TYPE_DATE;

--验证平年2月份最后一天日期
insert into T_TYPE_DATE values(to_date('2001-02-28','yyyy-mm-dd'));
--查询表T_TYPE_DATE
select * from T_TYPE_DATE;

--大于28号时是否报错
insert into T_TYPE_DATE values(to_date('2001-02-29','yyyy-mm-dd'));
--查询表T_TYPE_DATE
select * from T_TYPE_DATE;

--年，月，日超出范围
--验证月份超出范围
insert into T_TYPE_DATE values(to_date('1988-13-01','yyyy-mm-dd'));
--查询表T_TYPE_DATE
select * from T_TYPE_DATE;

--验证日期超出范围
insert into T_TYPE_DATE values(to_date('1988-12-35','yyyy-mm-dd'));
--查询表T_TYPE_DATE
select * from T_TYPE_DATE;

--验证date的格式
--验证date格式：yyyy-mm-dd
insert into T_TYPE_DATE values(to_date('1994-02-08','yyyy-mm-dd'));
--查询表T_TYPE_DATE
select * from T_TYPE_DATE;

insert into T_TYPE_DATE values(to_date('1994-2-8','yyyy-mm-dd'));
--查询表T_TYPE_DATE
select * from T_TYPE_DATE;

--验证date格式：yy-mm-dd
insert into T_TYPE_DATE values(to_timestamp('94-01-01','yy-mm-dd')); --年份用yy表示时，自动补齐为1994
--查询表T_TYPE_DATE
select * from T_TYPE_DATE;

--验证date格式：yyyymmdd
insert into T_TYPE_DATE values(to_date('19940208','yyyymmdd'));
--查询表T_TYPE_DATE
select * from T_TYPE_DATE;

--验证date格式：yyyy/mm/dd
insert into T_TYPE_DATE values(to_date('1994/02/18','yyyy/mm/dd'));
--查询表T_TYPE_DATE
select * from T_TYPE_DATE;

--年，月，日缺失
--缺失年份
insert into T_TYPE_DATE values(to_timestamp('11-26','mm-dd')); --缺失年份时默认为1970
--查询表T_TYPE_DATE
select * from T_TYPE_DATE;

--缺失月份
insert into T_TYPE_DATE values(to_timestamp('1994-18','yyyy-dd')); --缺失月份时默认是1月
--查询表T_TYPE_DATE
select * from T_TYPE_DATE;

--缺失日期
insert into T_TYPE_DATE values(to_timestamp('1994-02','yyyy-mm')); --缺失日时默认是1日
--查询表T_TYPE_DATE
select * from T_TYPE_DATE;

--验证插入int类型
insert into T_TYPE_DATE values(20200208);
--查询表T_TYPE_DATE
select * from T_TYPE_DATE;

--验证插入double类型
insert into T_TYPE_DATE values(138.92);
--查询表T_TYPE_DATE
select * from T_TYPE_DATE;

--验证插入varchar类型，插入数字'20100111'
insert into T_TYPE_DATE values('20100111');
--查询表T_TYPE_DATE
select * from T_TYPE_DATE;

--验证插入varchar类型，插入英文字母'AAAbcd'
insert into T_TYPE_DATE values('AAAbcd');
--查询表T_TYPE_DATE
select * from T_TYPE_DATE;

--验证插入varchar类型，插入汉字'北京'
insert into T_TYPE_DATE values('北京');
--查询表T_TYPE_DATE
select * from T_TYPE_DATE;

--验证插入timestamp类型，格式yyyy-mm-dd hh24:mi:ss
insert into T_TYPE_DATE values(TO_TIMESTAMP('2020-05-08 12:19:01', 'yyyy-mm-dd hh24:mi:ss'));
--查询表T_TYPE_DATE
select * from T_TYPE_DATE;

--验证插入boolean类型，插入true
insert into T_TYPE_DATE values(true);
--查询表T_TYPE_DATE
select * from T_TYPE_DATE;

--验证插入boolean类型，插入false
insert into T_TYPE_DATE values(false);
--查询表T_TYPE_DATE
select * from T_TYPE_DATE;

--验证插入空值''                                                   
insert into T_TYPE_DATE values('');     
--查询表T_TYPE_DATE
select * from T_TYPE_DATE;

--验证插入空格' '                                                   
insert into T_TYPE_DATE values(' ');     
--查询表T_TYPE_DATE
select * from T_TYPE_DATE;

--验证插入null                                                    
insert into T_TYPE_DATE values(null);  
--查询表T_TYPE_DATE
select * from T_TYPE_DATE;  

--验证插入NULL                                                   
insert into T_TYPE_DATE values(NULL);  
--查询表T_TYPE_DATE
select * from T_TYPE_DATE;

--验证插入0000-00-00
insert into T_TYPE_TIMESTAMP values(to_date('0000-00-00','yyyy-mm-dd'));
--查询表T_TYPE_DATE
select * from T_TYPE_DATE;

--会话变量：ALLOW_INVALID_DATES
--开启，无效日期直接报invalid date/time error
insert into T_TYPE_DATE values(to_date('1967-13-01','yyyy-mm-dd'));
--查询表T_TYPE_DATE
select * from T_TYPE_DATE;

--禁用，无效日期转换为0000-00-00，并报warning
insert into T_TYPE_DATE values(to_date('1967-13-01','yyyy-mm-dd'));
--查询表T_TYPE_DATE
select * from T_TYPE_DATE;