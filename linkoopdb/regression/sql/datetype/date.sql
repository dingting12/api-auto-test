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

--验证date的最小值1000-01-01
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

--验证date格式：YYYY-MM-DD
insert into T_TYPE_DATE values(to_date('1994-02-08','yyyy-mm-dd'));
--查询表T_TYPE_DATE
select * from T_TYPE_DATE;

--验证date格式：YYYYMMDD
insert into T_TYPE_DATE values(to_date('19940208','yyyymmdd'));
--查询表T_TYPE_DATE
select * from T_TYPE_DATE;

--验证date格式：YYYY/MM/DD
insert into T_TYPE_DATE values(to_date('1994/02/18','yyyy/mm/dd'));
--查询表T_TYPE_DATE
select * from T_TYPE_DATE;

--验证无效年份的date
insert into T_TYPE_DATE values(to_date('-50-01-01','yyyy-mm-dd'));
--查询表T_TYPE_DATE
select * from T_TYPE_DATE;

--验证无效月份的date
insert into T_TYPE_DATE values(to_date('1967-13-01','yyyy-mm-dd'));
--查询表T_TYPE_DATE
select * from T_TYPE_DATE;

--验证无效日期的date
insert into T_TYPE_DATE values(to_date('1967-12-35','yyyy-mm-dd'));
--查询表T_TYPE_DATE
select * from T_TYPE_DATE;


--验证插入int类型
insert into T_TYPE_DATE values(2147483);
--查询表T_TYPE_DATE
select * from T_TYPE_DATE;

--验证插入double类型
insert into T_TYPE_DATE values(138.92);
--查询表T_TYPE_DATE
select * from T_TYPE_DATE;

--验证插入varchar类型，插入数字'12345'
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