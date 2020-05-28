--Description：bigint data type
--Date：2020-05-22
--Author：李爱敏s

-- bigint数据类型验证
--删除表T_TYPE_BIGINT
drop table T_TYPE_BIGINT if exists;

--创建表T_TYPE_BIGINT
create table T_TYPE_BIGINT(
a1 bigint  
);

--验证bigint类型最小值-9223372036854775808
insert into T_TYPE_BIGINT values(-9223372036854775808);
--查询表T_TYPE_BIGINT
select * from T_TYPE_BIGINT;

--验证bigint类型最小值-1，是否报错
insert into T_TYPE_BIGINT values(-9223372036854775809);
--查询表T_TYPE_BIGINT
select * from T_TYPE_BIGINT;

--验证bigint类型最大值9223372036854775807
insert into T_TYPE_BIGINT values(9223372036854775807);
--查询表T_TYPE_BIGINT
select * from T_TYPE_BIGINT;

--验证bigint类型最大值+1，是否报错              
insert into T_TYPE_BIGINT values(9223372036854775808);
--查询表T_TYPE_BIGINT
select * from T_TYPE_BIGINT;

--验证精度超出范围，四舍五入
insert into T_TYPE_BIGINT values(172.23);
--查询表T_TYPE_BIGINT
select * from T_TYPE_BIGINT;

--验证插入double类型，数据在bigint范围内
insert into T_TYPE_BIGINT values(172.23);
--查询表T_TYPE_BIGINT
select * from T_TYPE_BIGINT;

--验证插入double类型，值已经超出bigint最大范围，是否报错
insert into T_TYPE_BIGINT values(9223372036854775890.231);
--查询表T_TYPE_BIGINT
select * from T_TYPE_BIGINT;

--验证插入double类型，值已经超出bigint最小范围，是否报错
insert into T_TYPE_BIGINT values(-9223372036854775890.231);
--查询表T_TYPE_BIGINT
select * from T_TYPE_BIGINT;

--验证插入varchar类型，插入数字'12345'
insert into T_TYPE_BIGINT values('1234');
--查询表T_TYPE_BIGINT
select * from T_TYPE_BIGINT;

--验证插入varchar类型，插入英文字母'AAbcd'
insert into T_TYPE_BIGINT values('AAbcd');
--查询表T_TYPE_BIGINT
select * from T_TYPE_BIGINT;

--验证插入varchar类型，插入汉字'北京'
insert into T_TYPE_BIGINT values('北京');
--查询表T_TYPE_BIGINT
select * from T_TYPE_BIGINT;

--验证插入date类型，格式yyyy-mm-dd
insert into T_TYPE_BIGINT values(to_date('2020-05-08','yyyy-mm-dd'));
--查询表T_TYPE_BIGINT
select * from T_TYPE_BIGINT;

--验证插入timestamp类型，格式yyyy-mm-dd hh24:mi:ss
insert into T_TYPE_BIGINT values(TO_TIMESTAMP('2020-05-08 12:19:01', 'yyyy-mm-dd hh24:mi:ss'));
--查询表T_TYPE_BIGINT
select * from T_TYPE_BIGINT;

--验证插入boolean类型，插入true                                                       
insert into T_TYPE_BIGINT values(true);
--查询表T_TYPE_BIGINT
select * from T_TYPE_BIGINT;

--验证插入boolean类型，插入false
insert into T_TYPE_BIGINT values(false); 
--查询表T_TYPE_BIGINT
select * from T_TYPE_BIGINT; 

--验证插入空值''                                                   
insert into T_TYPE_BIGINT values('');     
--查询表T_TYPE_BIGINT
select * from T_TYPE_BIGINT;

--验证插入空格' '                                                   
insert into T_TYPE_BIGINT values(' ');     
--查询表T_TYPE_BIGINT
select * from T_TYPE_BIGINT;

--验证插入null                                                    
insert into T_TYPE_BIGINT values(null);  
--查询表T_TYPE_BIGINT
select * from T_TYPE_BIGINT;  

--验证插入NULL                                                   
insert into T_TYPE_BIGINT values(NULL);  
--查询表T_TYPE_BIGINT
select * from T_TYPE_BIGINT; 