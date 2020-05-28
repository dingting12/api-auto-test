--Description：real data type
--Date：2020-05-22
--Author：李爱敏

-- real数据类型验证
--删除表T_TYPE_REAL
drop table T_TYPE_REAL if exists ;

--创建表T_TYPE_REAL
create table T_TYPE_REAL(
a1 real     
);          

--验证real类型负数最小值-1.7976931348623157E+308
insert into T_TYPE_REAL values(-1.7976931348623157E+308);
--查询表T_TYPE_REAL
select * from T_TYPE_REAL; 
        
--验证real类型负数最小值的尾数-0.01，是否报错
insert into T_TYPE_REAL values(-1.8076931348623157E+308);
--查询表T_TYPE_REAL
select * from T_TYPE_REAL;

--验证real类型负数最大值-2.2250738585072014E-308
insert into T_TYPE_REAL values(-2.2250738585072014E-308);
--查询表T_TYPE_REAL
select * from T_TYPE_REAL; 
        
--验证real类型负数最大值的尾数+0.01，是否报错
insert into T_TYPE_REAL values(-2.2150738585072014E-308);
--查询表T_TYPE_REAL
select * from T_TYPE_REAL;

--验证real类型正数最小值2.2250738585072014E-308
insert into T_TYPE_REAL values(2.2250738585072014E-308);
--查询表T_TYPE_REAL
select * from T_TYPE_REAL;

--验证real类型正数最小值的尾数-0.01，是否报错
insert into T_TYPE_REAL values(2.2150738585072014E-308);
--查询表T_TYPE_REAL
select * from T_TYPE_REAL;

--验证real类型正数最大值1.7976931348623157E+308
insert into T_TYPE_REAL values(1.7976931348623157E+308);
--查询表T_TYPE_REAL
select * from T_TYPE_REAL;

--验证real类型正数最大值的尾数+0.01，是否报错
insert into T_TYPE_REAL values(1.8076931348623157E+308);
--查询表T_TYPE_REAL
select * from T_TYPE_REAL;

--验证real类型15个有效位
insert into T_TYPE_REAL values(1.23456789012345);
--查询表T_TYPE_REAL
select * from T_TYPE_REAL;

--验证real类型的有效位超出15个，四舍五入
insert into T_TYPE_REAL values(1.23456789012345678);
--查询表T_TYPE_REAL
select * from T_TYPE_REAL;

--验证插入int类型
insert into T_TYPE_REAL values(289);
--查询表T_TYPE_REAL
select * from T_TYPE_REAL;

--验证插入varchar类型，插入数字'12345'
insert into T_TYPE_REAL values('1234');
--查询表T_TYPE_REAL
select * from T_TYPE_REAL;

--验证插入varchar类型，插入英文字母'AAAbcd'
insert into T_TYPE_REAL values('AAAbcd');
--查询表T_TYPE_REAL
select * from T_TYPE_REAL;

--验证插入varchar类型，插入汉字'北京'
insert into T_TYPE_REAL values('北京');
--查询表T_TYPE_REAL
select * from T_TYPE_REAL;

--验证插入date类型，格式yyyy-mm-dd
insert into T_TYPE_REAL values(to_date('2020-05-08','yyyy-mm-dd'));
--查询表T_TYPE_REAL
select * from T_TYPE_REAL;

--验证插入timestamp类型，格式yyyy-mm-dd hh24:mi:ss
insert into T_TYPE_REAL values(TO_TIMESTAMP('2020-05-08 12:19:01', 'yyyy-mm-dd hh24:mi:ss'));
--查询表T_TYPE_REAL
select * from T_TYPE_REAL;

--验证插入boolean类型，插入true                                                       
insert into T_TYPE_REAL values(true);
--查询表T_TYPE_REAL
select * from T_TYPE_REAL;

--验证插入boolean类型，插入false
insert into T_TYPE_REAL values(false); 
--查询表T_TYPE_REAL
select * from T_TYPE_REAL; 

--验证插入空值''                                                   
insert into T_TYPE_REAL values('');     
--查询表T_TYPE_REAL
select * from T_TYPE_REAL;

--验证插入空格' '                                                   
insert into T_TYPE_REAL values(' ');     
--查询表T_TYPE_REAL
select * from T_TYPE_REAL;

--验证插入null                                                    
insert into T_TYPE_REAL values(null);  
--查询表T_TYPE_REAL
select * from T_TYPE_REAL;  

--验证插入NULL                                                   
insert into T_TYPE_REAL values(NULL);  
--查询表T_TYPE_REAL
select * from T_TYPE_REAL; 