--Description：double data type
--Date：2020-05-22
--Author：李爱敏

set echo on
set timing on

-- double数据类型验证
--删除表T_TYPE_DOUBLE
drop table T_TYPE_DOUBLE if exists;

--创建表T_TYPE_DOUBLE
create table T_TYPE_DOUBLE(
a1 double
);          

--验证double类型负数最小值-1.79769313486231E+308
insert into T_TYPE_DOUBLE values(-1.79769313486231E+308);
--查询表T_TYPE_DOUBLE
select * from T_TYPE_DOUBLE;

--验证double类型负数最小值的尾数-0.01，是否报错
insert into T_TYPE_DOUBLE values(-1.80769313486231E+308);
--查询表T_TYPE_DOUBLE
select * from T_TYPE_DOUBLE;

--验证double类型负数最大值-2.22507385850720E-308
insert into T_TYPE_DOUBLE values(-2.22507385850720E-308);
--查询表T_TYPE_DOUBLE
select * from T_TYPE_DOUBLE;

--验证double类型负数最大值的尾数+0.01，是否报错
insert into T_TYPE_DOUBLE values(-2.21507385850720E-308);
--查询表T_TYPE_DOUBLE
select * from T_TYPE_DOUBLE;

--验证double类型插入0
insert into T_TYPE_DOUBLE values(0);
--查询表T_TYPE_DOUBLE
select * from T_TYPE_DOUBLE;

--验证double类型正数最小值2.22507385850720E-308
insert into T_TYPE_DOUBLE values(2.22507385850720E-308);
--查询表T_TYPE_DOUBLE
select * from T_TYPE_DOUBLE;

--验证double类型正数最小值的尾数-0.01，是否报错
insert into T_TYPE_DOUBLE values(2.21507385850720E-308);
--查询表T_TYPE_DOUBLE
select * from T_TYPE_DOUBLE;

--验证double类型正数最大值1.79769313486231E+308
insert into T_TYPE_DOUBLE values(1.79769313486231E+308);
--查询表T_TYPE_DOUBLE
select * from T_TYPE_DOUBLE;

--验证double类型正数最大值的尾数+0.01，是否报错
insert into T_TYPE_DOUBLE values(1.80769313486231E+308);
--查询表T_TYPE_DOUBLE
select * from T_TYPE_DOUBLE;

--验证double类型有效位小于等于15
insert into T_TYPE_DOUBLE values(1.23456789012345);
--查询表T_TYPE_DOUBLE
select * from T_TYPE_DOUBLE;

--验证double类型的有效位超出15个，截断
insert into T_TYPE_DOUBLE values(1.23456789012345678);
--查询表T_TYPE_DOUBLE
select * from T_TYPE_DOUBLE;

--验证插入int类型
insert into T_TYPE_DOUBLE values(289);
--查询表T_TYPE_DOUBLE
select * from T_TYPE_DOUBLE;

--验证插入varchar类型，插入数字'1234.56'
insert into T_TYPE_DOUBLE values('1234.56');
--查询表T_TYPE_DOUBLE
select * from T_TYPE_DOUBLE;

--验证插入varchar类型，插入英文字母'AAAbcd'
insert into T_TYPE_DOUBLE values('AAAbcd');
--查询表T_TYPE_DOUBLE
select * from T_TYPE_DOUBLE;

--验证插入varchar类型，插入汉字'北京'
insert into T_TYPE_DOUBLE values('北京');
--查询表T_TYPE_DOUBLE
select * from T_TYPE_DOUBLE;

--验证插入date类型，格式yyyy-mm-dd
insert into T_TYPE_DOUBLE values(to_date('2020-05-08','yyyy-mm-dd'));
--查询表T_TYPE_DOUBLE
select * from T_TYPE_DOUBLE;

--验证插入timestamp类型，格式yyyy-mm-dd hh24:mi:ss
insert into T_TYPE_DOUBLE values(TO_TIMESTAMP('2020-05-08 12:19:01', 'yyyy-mm-dd hh24:mi:ss'));
--查询表T_TYPE_DOUBLE
select * from T_TYPE_DOUBLE;

--验证插入boolean类型，插入true                                                       
insert into T_TYPE_DOUBLE values(true);
--查询表T_TYPE_DOUBLE
select * from T_TYPE_DOUBLE;

--验证插入boolean类型，插入false
insert into T_TYPE_DOUBLE values(false); 
--查询表T_TYPE_DOUBLE
select * from T_TYPE_DOUBLE; 

--验证插入空值''                                                   
insert into T_TYPE_DOUBLE values('');     
--查询表T_TYPE_DOUBLE
select * from T_TYPE_DOUBLE;

--验证插入空格' '                                                   
insert into T_TYPE_DOUBLE values(' ');     
--查询表T_TYPE_DOUBLE
select * from T_TYPE_DOUBLE;

--验证插入null                                                    
insert into T_TYPE_DOUBLE values(null);  
--查询表T_TYPE_DOUBLE
select * from T_TYPE_DOUBLE;  

--验证插入NULL                                                   
insert into T_TYPE_DOUBLE values(NULL);  
--查询表T_TYPE_DOUBLE
select * from T_TYPE_DOUBLE; 