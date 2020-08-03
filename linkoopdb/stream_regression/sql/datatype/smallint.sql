--Description：smallint data type
--Date：2020-07-31
--Author：丁婷

set echo on
set timing on

-- smallint数据类型验证
--如果表已存在，则先删除
drop stream if exists S_PALLAS_DATATYPE_SMALLINT_001;

create stream S_PALLAS_DATATYPE_SMALLINT_001(
age smallint 
)properties(
  'connector':'pallas',
  'linkoopdb.pallas.shard_number' : '4',
  'linkoopdb.pallas.shard_duplicate_number' : '2'
);

 
--验证samllint类型最小值-32768
insert into S_PALLAS_DATATYPE_SMALLINT_001 values(-32768);  

--查询表T_TYPE_SMALLINT
select * from S_PALLAS_DATATYPE_SMALLINT_001 where 1=1;


--验证samllint类型最小值-1,是否报错
insert into S_PALLAS_DATATYPE_SMALLINT_001 values(-32769);   
--查询表T_TYPE_SMALLINT
select * from S_PALLAS_DATATYPE_SMALLINT_001;


--验证samllint类型最大值32767
insert into S_PALLAS_DATATYPE_SMALLINT_001 values(32767);    
--查询表T_TYPE_SMALLINT
select * from S_PALLAS_DATATYPE_SMALLINT_001;

--验证samllint类型最大值32767+1，是否报错
insert into S_PALLAS_DATATYPE_SMALLINT_001 values(32768);    
--查询表T_TYPE_SMALLINT
select * from S_PALLAS_DATATYPE_SMALLINT_001;

--验证精度超出范围，四舍五入
insert into S_PALLAS_DATATYPE_SMALLINT_001 values(123.456);
--查询表T_TYPE_SMALLINT
select * from S_PALLAS_DATATYPE_SMALLINT_001;

--验证插入double类型，数据在smallint范围内
insert into S_PALLAS_DATATYPE_SMALLINT_001 values(3276.123);
--查询表T_TYPE_SMALLINT
select * from S_PALLAS_DATATYPE_SMALLINT_001;

--验证插入double类型的数据，值已超出smallint最大范围，是否报错                                              
insert into S_PALLAS_DATATYPE_SMALLINT_001 values(327690.123);  
--查询表T_TYPE_SMALLINT
select * from S_PALLAS_DATATYPE_SMALLINT_001;

--验证插入double类型的数据，值已超出smallint最小范围，是否报错                                             
insert into S_PALLAS_DATATYPE_SMALLINT_001 values(-32767.1234);  
--查询表T_TYPE_SMALLINT
select * from S_PALLAS_DATATYPE_SMALLINT_001;

--验证插入varchar类型，插入数字'12345'
insert into S_PALLAS_DATATYPE_SMALLINT_001 values('12345');  
--查询表T_TYPE_SMALLINT
select * from S_PALLAS_DATATYPE_SMALLINT_001;

--验证插入varchar类型，插入英文字母'adcd'  
insert into S_PALLAS_DATATYPE_SMALLINT_001 values('adcd');  
--查询表T_TYPE_SMALLINT
select * from S_PALLAS_DATATYPE_SMALLINT_001;

--验证插入varchar类型，插入汉字'中国'  
insert into S_PALLAS_DATATYPE_SMALLINT_001 values('中国');  
--查询表T_TYPE_SMALLINT
select * from S_PALLAS_DATATYPE_SMALLINT_001;

--验证插入date类型的数据，格式yyyy-mm-dd
insert into S_PALLAS_DATATYPE_SMALLINT_001 values(to_date('2020-05-08','yyyy-mm-dd')); 
--查询表T_TYPE_SMALLINT
select * from S_PALLAS_DATATYPE_SMALLINT_001;

--验证插入timestamp类型的数据，格式yyyy-mm-dd hh24:mi:ss
insert into S_PALLAS_DATATYPE_SMALLINT_001 values(TO_TIMESTAMP('2020-05-08 12:19:01', 'yyyy-mm-dd hh24:mi:ss'));
--查询表T_TYPE_SMALLINT
select * from S_PALLAS_DATATYPE_SMALLINT_001;

--验证插入boolean类型，插入true                                                       
insert into S_PALLAS_DATATYPE_SMALLINT_001 values(true);
--查询表T_TYPE_SMALLINT
select * from S_PALLAS_DATATYPE_SMALLINT_001;

--验证插入boolean类型，插入false
insert into S_PALLAS_DATATYPE_SMALLINT_001 values(false); 
--查询表T_TYPE_SMALLINT
select * from S_PALLAS_DATATYPE_SMALLINT_001; 

--验证插入空值''                                                   
insert into S_PALLAS_DATATYPE_SMALLINT_001 values('');     
--查询表T_TYPE_SMALLINT
select * from S_PALLAS_DATATYPE_SMALLINT_001;

--验证插入空格' '                                                   
insert into S_PALLAS_DATATYPE_SMALLINT_001 values(' ');     
--查询表T_TYPE_SMALLINT
select * from S_PALLAS_DATATYPE_SMALLINT_001;

--验证插入null                                                    
insert into S_PALLAS_DATATYPE_SMALLINT_001 values(null);  
--查询表T_TYPE_SMALLINT
select * from S_PALLAS_DATATYPE_SMALLINT_001;  

--验证插入NULL                                                   
insert into S_PALLAS_DATATYPE_SMALLINT_001 values(NULL);  
--查询表T_TYPE_SMALLINT
select * from S_PALLAS_DATATYPE_SMALLINT_001;


--最后删除创建的表
drop table S_PALLAS_DATATYPE_SMALLINT_001 if exists;