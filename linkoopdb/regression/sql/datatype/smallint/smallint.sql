--Description：smallint data type
--Date：2020-05-22
--Author：李爱敏

set echo on
set timing on

-- smallint数据类型验证
--如果表已存在，则先删除
drop table T_TYPE_SMALLINT if exists;

--创建表T_TYPE_SMALLINT
create table T_TYPE_SMALLINT(
a1 smallint  
);
 
--验证samllint类型最小值-32768
insert into T_TYPE_SMALLINT values(-32768);  
--查询表T_TYPE_SMALLINT
select * from T_TYPE_SMALLINT;

--验证samllint类型最小值-1,是否报错
insert into T_TYPE_SMALLINT values(-32769);   
--查询表T_TYPE_SMALLINT
select * from T_TYPE_SMALLINT;

--验证samllint类型最大值32767
insert into T_TYPE_SMALLINT values(32767);    
--查询表T_TYPE_SMALLINT
select * from T_TYPE_SMALLINT;

--验证samllint类型最大值32767+1，是否报错
insert into T_TYPE_SMALLINT values(32768);    
--查询表T_TYPE_SMALLINT
select * from T_TYPE_SMALLINT;

--验证精度超出范围，四舍五入
insert into T_TYPE_SMALLINT values(123.456);
--查询表T_TYPE_SMALLINT
select * from T_TYPE_SMALLINT;

--验证插入double类型，数据在smallint范围内
insert into T_TYPE_SMALLINT values(3276.123);
--查询表T_TYPE_SMALLINT
select * from T_TYPE_SMALLINT;

--验证插入double类型的数据，值已超出smallint最大范围，是否报错                                              
insert into T_TYPE_SMALLINT values(327690.123);  
--查询表T_TYPE_SMALLINT
select * from T_TYPE_SMALLINT;

--验证插入double类型的数据，值已超出smallint最小范围，是否报错                                             
insert into T_TYPE_SMALLINT values(-32767.1234);  
--查询表T_TYPE_SMALLINT
select * from T_TYPE_SMALLINT;

--验证插入varchar类型，插入数字'12345'
insert into T_TYPE_SMALLINT values('12345');  
--查询表T_TYPE_SMALLINT
select * from T_TYPE_SMALLINT;

--验证插入varchar类型，插入英文字母'adcd'  
insert into T_TYPE_SMALLINT values('adcd');  
--查询表T_TYPE_SMALLINT
select * from T_TYPE_SMALLINT;

--验证插入varchar类型，插入汉字'中国'  
insert into T_TYPE_SMALLINT values('中国');  
--查询表T_TYPE_SMALLINT
select * from T_TYPE_SMALLINT;

--验证插入date类型的数据，格式yyyy-mm-dd
insert into T_TYPE_SMALLINT values(to_date('2020-05-08','yyyy-mm-dd')); 
--查询表T_TYPE_SMALLINT
select * from T_TYPE_SMALLINT;

--验证插入timestamp类型的数据，格式yyyy-mm-dd hh24:mi:ss
insert into T_TYPE_SMALLINT values(TO_TIMESTAMP('2020-05-08 12:19:01', 'yyyy-mm-dd hh24:mi:ss'));
--查询表T_TYPE_SMALLINT
select * from T_TYPE_SMALLINT;

--验证插入boolean类型，插入true                                                       
insert into T_TYPE_SMALLINT values(true);
--查询表T_TYPE_SMALLINT
select * from T_TYPE_SMALLINT;

--验证插入boolean类型，插入false
insert into T_TYPE_SMALLINT values(false); 
--查询表T_TYPE_SMALLINT
select * from T_TYPE_SMALLINT; 

--验证插入空值''                                                   
insert into T_TYPE_SMALLINT values('');     
--查询表T_TYPE_SMALLINT
select * from T_TYPE_SMALLINT;

--验证插入空格' '                                                   
insert into T_TYPE_SMALLINT values(' ');     
--查询表T_TYPE_SMALLINT
select * from T_TYPE_SMALLINT;

--验证插入null                                                    
insert into T_TYPE_SMALLINT values(null);  
--查询表T_TYPE_SMALLINT
select * from T_TYPE_SMALLINT;  

--验证插入NULL                                                   
insert into T_TYPE_SMALLINT values(NULL);  
--查询表T_TYPE_SMALLINT
select * from T_TYPE_SMALLINT;


--最后删除创建的表
drop table T_TYPE_SMALLINT if exists;