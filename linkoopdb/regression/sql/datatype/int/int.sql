--Description：int data type
--Date：2020-05-22
--Author：李爱敏

set echo on
set timing on

-- int数据类型验证
--如果表已存在，则先删除
drop table T_TYPE_INT if exists;

--创建表T_TYPE_INT
create table T_TYPE_INT(
a1 int  
);

--验证int类型最小值-2147483648
insert into T_TYPE_INT values(-2147483648);
--查询表T_TYPE_INT
select * from T_TYPE_INT;

--验证int类型最小值-1，是否报错
insert into T_TYPE_INT values(-2147483649);
--查询表T_TYPE_INT
select * from T_TYPE_INT;

--验证int类型最大值2147483647
insert into T_TYPE_INT values(2147483647);
--查询表T_TYPE_INT
select * from T_TYPE_INT;

--验证int类型最大值+1，是否报错
insert into T_TYPE_INT values(2147483648);
--查询表T_TYPE_INT
select * from T_TYPE_INT;

--验证精度超出范围，四舍五入
insert into T_TYPE_INT values(2147483648.89);
--查询表T_TYPE_INT
select * from T_TYPE_INT;

--验证插入double类型,数据在int范围内
insert into T_TYPE_INT values(172.23);
--查询表T_TYPE_INT
select * from T_TYPE_INT;

--验证插入double类型，值已超出int最大范围，是否报错
insert into T_TYPE_INT values(2147483690.12);
--查询表T_TYPE_INT
select * from T_TYPE_INT;

--验证插入double类型，值已超出int最小范围，是否报错
insert into T_TYPE_INT values(-2147483690.12);
--查询表T_TYPE_INT
select * from T_TYPE_INT;

--验证插入varchar类型，插入数字'12345'
insert into T_TYPE_INT values('1234');
--查询表T_TYPE_INT
select * from T_TYPE_INT;

--验证插入varchar类型，插入英文字母'AAbcd'
insert into T_TYPE_INT values('AAbcd');
--查询表T_TYPE_INT
select * from T_TYPE_INT;

--验证插入varchar类型，插入汉字'北京'
insert into T_TYPE_INT values('北京');
--查询表T_TYPE_INT
select * from T_TYPE_INT;

--验证插入date类型，格式yyyy-mm-dd
insert into T_TYPE_INT values(to_date('2020-05-08','yyyy-mm-dd'));
--查询表T_TYPE_INT
select * from T_TYPE_INT;

--验证插入timestamp类型，格式yyyy-mm-dd hh24:mi:ss
insert into T_TYPE_INT values(TO_TIMESTAMP('2020-05-08 12:19:01', 'yyyy-mm-dd hh24:mi:ss'));
--查询表T_TYPE_INT
select * from T_TYPE_INT;

--验证插入boolean类型，插入true                                                       
insert into T_TYPE_INT values(true);
--查询表T_TYPE_INT
select * from T_TYPE_INT;

--验证插入boolean类型，插入false
insert into T_TYPE_INT values(false); 
--查询表T_TYPE_INT
select * from T_TYPE_INT; 

--验证插入空值''                                                   
insert into T_TYPE_INT values('');     
--查询表T_TYPE_INT
select * from T_TYPE_INT;

--验证插入空格' '                                                   
insert into T_TYPE_INT values(' ');     
--查询表T_TYPE_INT
select * from T_TYPE_INT;

--验证插入null                                                    
insert into T_TYPE_INT values(null);  
--查询表T_TYPE_INT
select * from T_TYPE_INT;  

--验证插入NULL                                                   
insert into T_TYPE_INT values(NULL);  
--查询表T_TYPE_INT
select * from T_TYPE_INT;


--最后删除创建的表
drop table T_TYPE_INT if exists;