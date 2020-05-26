--load E:\pycharmProject\driver\linkoopdb-jdbc-2.2.2.jar com.datapps.linkoopdb.jdbc.JdbcDriver
--connect admin/123456@jdbc:linkoopdb:tcp://192.168.1.74:9105/ldb
--set echo on

-- smallint数据类型验证
--删除T_TYPE_SMALLINT表
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

--验证插入double类型的数据
insert into T_TYPE_SMALLINT values(172.23);   
--查询表T_TYPE_SMALLINT
select * from T_TYPE_SMALLINT;

--验证插入double类型的数据，值已超出SMALLINT最大范围，是否报错                                              
insert into T_TYPE_SMALLINT values(327690.123);  
--查询表T_TYPE_SMALLINT
select * from T_TYPE_SMALLINT;

--验证插入double类型的数据，值已超出SMALLINT最小范围，是否报错                                             
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




-- int数据类型验证
--删除T_TYPE_INT表
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

--验证插入double类型,数据范围内
insert into T_TYPE_INT values(172.23);
--查询表T_TYPE_INT
select * from T_TYPE_INT;

--验证插入double类型，值已超出INT最大范围，是否报错
insert into T_TYPE_INT values(2147483690.12);
--查询表T_TYPE_INT
select * from T_TYPE_INT;

--验证插入double类型，值已超出INT最小范围，是否报错
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

--验证插入double类型
insert into T_TYPE_BIGINT values(172.23);
--查询表T_TYPE_BIGINT
select * from T_TYPE_BIGINT;

--验证插入double类型，值已经超出BIGINT最大范围，是否报错
insert into T_TYPE_BIGINT values(9223372036854775890.231);
--查询表T_TYPE_BIGINT
select * from T_TYPE_BIGINT;

--验证插入double类型，值已经超出BIGINT最小范围，是否报错
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




-- real数据类型验证
--删除表T_TYPE_REAL
drop table T_TYPE_REAL if exists ;

--创建表T_TYPE_REAL
create table T_TYPE_REAL(
a1 real     
);          

--验证real类型最小值-1.7E308
insert into T_TYPE_REAL values(-1.7E308);
--查询表T_TYPE_REAL
select * from T_TYPE_REAL; 
        
--验证real类型最小值的尾数-0.1，是否报错
insert into T_TYPE_REAL values(-1.8E308);
--查询表T_TYPE_REAL
select * from T_TYPE_REAL;

--验证real类型最大值1.7E308
insert into T_TYPE_REAL values(1.7E308);
--查询表T_TYPE_REAL
select * from T_TYPE_REAL; 
        
--验证real类型最大值的尾数+0.1，是否报错
insert into T_TYPE_REAL values(1.8E308);
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





-- double数据类型验证
--删除表T_TYPE_DOUBLE
drop table T_TYPE_DOUBLE if exists;

--创建表T_TYPE_DOUBLE
create table T_TYPE_DOUBLE(
a1 double
);          

--验证double类型最小值-1.7E308
insert into T_TYPE_DOUBLE values(-1.7E308);
--查询表T_TYPE_DOUBLE
select * from T_TYPE_DOUBLE; 
        
--验证double类型最小值的尾数-0.1，是否报错
insert into T_TYPE_DOUBLE values(-1.8E308);
--查询表T_TYPE_DOUBLE
select * from T_TYPE_DOUBLE;

--验证double类型最大值1.7E308
insert into T_TYPE_DOUBLE values(1.7E308);
--查询表T_TYPE_DOUBLE
select * from T_TYPE_DOUBLE; 
        
--验证double类型最大值的尾数+0.1，是否报错
insert into T_TYPE_DOUBLE values(1.8E308);
--查询表T_TYPE_DOUBLE
select * from T_TYPE_DOUBLE;

 --验证double类型15个有效位
insert into T_TYPE_DOUBLE values(1.23456789012345);
--查询表T_TYPE_DOUBLE
select * from T_TYPE_DOUBLE;

--验证double类型的有效位超出15个，四舍五入
insert into T_TYPE_DOUBLE values(1.23456789012345678);
--查询表T_TYPE_DOUBLE
select * from T_TYPE_DOUBLE;

--验证插入int类型
insert into T_TYPE_DOUBLE values(289);
--查询表T_TYPE_DOUBLE
select * from T_TYPE_DOUBLE;

--验证插入varchar类型，插入数字'12345'
insert into T_TYPE_DOUBLE values('1234');
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






-- float数据类型验证
--删除表T_TYPE_FLOAT
drop table T_TYPE_FLOAT if exists;

--创建表T_TYPE_FLOAT
create table T_TYPE_FLOAT(
a1 float
);

--验证float类型最小值-3.4E38
insert into T_TYPE_FLOAT values(-3.4E38);
--查询表T_TYPE_FLOAT
select * from T_TYPE_FLOAT; 
        
--验证float类型最小值的尾数-0.1，是否报错
insert into T_TYPE_FLOAT values(-3.5E38);
--查询表T_TYPE_FLOAT
select * from T_TYPE_FLOAT;

--验证float类型最大值3.4E38
insert into T_TYPE_FLOAT values(3.4E38);
--查询表T_TYPE_FLOAT
select * from T_TYPE_FLOAT; 
        
--验证float类型最大值的尾数+0.1，是否报错
insert into T_TYPE_FLOAT values(3.5E38);
--查询表T_TYPE_FLOAT
select * from T_TYPE_FLOAT;

 --验证float类型7个有效位
insert into T_TYPE_FLOAT values(1.234567);
--查询表T_TYPE_FLOAT
select * from T_TYPE_FLOAT;

--验证float类型的有效位超出7个，四舍五入
insert into T_TYPE_FLOAT values(1.2345678);
--查询表T_TYPE_FLOAT
select * from T_TYPE_FLOAT;

--验证插入int类型
insert into T_TYPE_FLOAT values(289);
--查询表T_TYPE_FLOAT
select * from T_TYPE_FLOAT;

--验证插入varchar类型，插入数字'12345'
insert into T_TYPE_FLOAT values('1234');
--查询表T_TYPE_FLOAT
select * from T_TYPE_FLOAT;

--验证插入varchar类型，插入英文字母'AAAbcd'
insert into T_TYPE_FLOAT values('AAAbcd');
--查询表T_TYPE_FLOAT
select * from T_TYPE_FLOAT;

--验证插入varchar类型，插入汉字'北京'
insert into T_TYPE_FLOAT values('北京');
--查询表T_TYPE_FLOAT
select * from T_TYPE_FLOAT;

--验证插入date类型，格式yyyy-mm-dd
insert into T_TYPE_FLOAT values(to_date('2020-05-08','yyyy-mm-dd'));
--查询表T_TYPE_FLOAT
select * from T_TYPE_FLOAT;

--验证插入timestamp类型，格式yyyy-mm-dd hh24:mi:ss
insert into T_TYPE_FLOAT values(TO_TIMESTAMP('2020-05-08 12:19:01', 'yyyy-mm-dd hh24:mi:ss'));
--查询表T_TYPE_FLOAT
select * from T_TYPE_FLOAT;

--验证插入boolean类型，插入true                                                       
insert into T_TYPE_FLOAT values(true);
--查询表T_TYPE_FLOAT
select * from T_TYPE_FLOAT;

--验证插入boolean类型，插入false
insert into T_TYPE_FLOAT values(false); 
--查询表T_TYPE_FLOAT
select * from T_TYPE_FLOAT; 

--验证插入空值''                                                   
insert into T_TYPE_FLOAT values('');     
--查询表T_TYPE_FLOAT
select * from T_TYPE_FLOAT;

--验证插入空格' '                                                   
insert into T_TYPE_FLOAT values(' ');     
--查询表T_TYPE_FLOAT
select * from T_TYPE_FLOAT;

--验证插入null                                                    
insert into T_TYPE_FLOAT values(null);  
--查询表T_TYPE_FLOAT
select * from T_TYPE_FLOAT;  

--验证插入NULL                                                   
insert into T_TYPE_FLOAT values(NULL);  
--查询表T_TYPE_FLOAT
select * from T_TYPE_FLOAT; 





-- decimal数据类型验证
--删除表
drop table T_TYPE_DECIMAL1 if exists;
drop table T_TYPE_DECIMAL2 if exists;
drop table T_TYPE_DECIMAL3 if exists;
drop table T_TYPE_DECIMAL4 if exists;
drop table T_TYPE_DECIMAL5 if exists;
drop table T_TYPE_DECIMAL6 if exists;
drop table T_TYPE_DECIMAL7 if exists;
drop table T_TYPE_DECIMAL8 if exists;

--创建字段长度>38的表T_TYPE_DECIMAL1，是否报错
create table T_TYPE_DECIMAL1(
a1 decimal(39,2)
);

--插入数据到表T_TYPE_DECIMAL1，字段长度为39，是否插入成功
insert into T_TYPE_DECIMAL1 values(12345678901234567890123456789012345678.9);
--查询表T_TYPE_DECIMAL1
select * from T_TYPE_DECIMAL1;

--插入数据到表T_TYPE_DECIMAL1，字段长度小于39
insert into T_TYPE_DECIMAL1 values(123456789012345678901234567890123456.78);
--查询表T_TYPE_DECIMAL1
select * from T_TYPE_DECIMAL1;

--创建字段长度为0的表T_TYPE_DECIMAL2，是否报错
create table T_TYPE_DECIMAL2(
a1 decimal(0,0)
);

--创建表T_TYPE_DECIMAL3
create table T_TYPE_DECIMAL3(
a1 decimal(5,3)
);

--验证插入int类型
insert into T_TYPE_DECIMAL3 values(2147483);
--查询表T_TYPE_DECIMAL3
select * from T_TYPE_DECIMAL3;

--验证插入varchar类型，插入数字'12345'
insert into T_TYPE_DECIMAL3 values('1234');
--查询表T_TYPE_DECIMAL3
select * from T_TYPE_DECIMAL3;

--验证插入varchar类型，插入英文字母'AAAbcd'
insert into T_TYPE_DECIMAL3 values('AAAbcd');
--查询表T_TYPE_DECIMAL3
select * from T_TYPE_DECIMAL3;

--验证插入varchar类型，插入汉字'北京'
insert into T_TYPE_DECIMAL3 values('北京');
--查询表T_TYPE_DECIMAL3
select * from T_TYPE_DECIMAL3;

--验证插入date类型，格式yyyy-mm-dd
insert into T_TYPE_DECIMAL3 values(to_date('2020-05-08','yyyy-mm-dd'));
--查询表T_TYPE_DECIMAL3
select * from T_TYPE_DECIMAL3;

--验证插入timestamp类型，格式yyyy-mm-dd hh24:mi:ss
insert into T_TYPE_DECIMAL3 values(TO_TIMESTAMP('2020-05-08 12:19:01', 'yyyy-mm-dd hh24:mi:ss'));
--查询表T_TYPE_DECIMAL3
select * from T_TYPE_DECIMAL3;

--验证插入boolean类型，插入true                                                       
insert into T_TYPE_DECIMAL3 values(true);
--查询表T_TYPE_DECIMAL3
select * from T_TYPE_DECIMAL3;

--验证插入boolean类型，插入false
insert into T_TYPE_DECIMAL3 values(false); 
--查询表T_TYPE_DECIMAL3
select * from T_TYPE_DECIMAL3; 

--验证插入空值''                                                   
insert into T_TYPE_DECIMAL3 values('');     
--查询表T_TYPE_DECIMAL3
select * from T_TYPE_DECIMAL3;

--验证插入空格' '                                                   
insert into T_TYPE_DECIMAL3 values(' ');     
--查询表T_TYPE_DECIMAL3
select * from T_TYPE_DECIMAL3;

--验证插入null                                                    
insert into T_TYPE_DECIMAL3 values(null);  
--查询表T_TYPE_DECIMAL3
select * from T_TYPE_DECIMAL3;  

--验证插入NULL                                                   
insert into T_TYPE_DECIMAL3 values(NULL);  
--查询表T_TYPE_DECIMAL3
select * from T_TYPE_DECIMAL3; 

-- 验证DECIMAL(n,m)

--当整数部分的长度>n-m时，是否报错
insert into T_TYPE_DECIMAL3 values(123.67);   

--当小数部分的长度>m时，小数点后m位向右的数字被舍入
insert into T_TYPE_DECIMAL3 values(1.6798);  
--查询表T_TYPE_DECIMAL3
select * from T_TYPE_DECIMAL3; 


-- m值与有效位验证
--0=<m<n时
--有效位>n，是否报错
insert into T_TYPE_DECIMAL3 values(12345.12345);--报错 

--有效位<=n，精确到小数点右边m位，并四舍五入
insert into T_TYPE_DECIMAL3 values(1234.9876);  
--查询表T_TYPE_DECIMAL3
select * from T_TYPE_DECIMAL3; 

-- m>n时

--创建表T_TYPE_DECIMAL4，是否报错
create table T_TYPE_DECIMAL4(
a1 decimal(4,5)
);

-- m<0时

--创建表T_TYPE_DECIMAL4，是否报错
create table T_TYPE_DECIMAL4(
a1 decimal(5,-2)
);

-- 验证DECIMAL(n)，默认为decimal(n,0)

--创建表T_TYPE_DECIMAL5
create table T_TYPE_DECIMAL5(
a1 decimal(6)
);

--整数部分的长度>n，是否报错
insert into T_TYPE_DECIMAL5 values(1234567.9876);  

--整数部分的长度<=n，精确到整数位，小数部分被舍入
insert into T_TYPE_DECIMAL5 values(1234.9876);  
--查询表T_TYPE_DECIMAL5
select * from T_TYPE_DECIMAL5; 

-- 验证DECIMAL，默认为decimal(5,0)

--创建表T_TYPE_DECIMAL6
create table T_TYPE_DECIMAL6(
a1 decimal
);

--整数部分长度>5，是否报错
insert into T_TYPE_DECIMAL6 values(123456.78);  
--查询表T_TYPE_DECIMAL6
select * from T_TYPE_DECIMAL6; 

--整数部分长度<=5，小数部分四舍五入
insert into T_TYPE_DECIMAL6 values(1234.78);  
--查询表T_TYPE_DECIMAL6
select * from T_TYPE_DECIMAL6; 

--DECIMAL(*,m)
--删除表
drop table T_TYPE_DECIMAL7 if exists;

--创建表T_TYPE_DECIMAL7
create table T_TYPE_DECIMAL7(
a1 decimal(*,m)
);

--DECIMAL(*)
--删除表
drop table T_TYPE_DECIMAL8 if exists;

--创建表T_TYPE_DECIMAL8
create table T_TYPE_DECIMAL8(
a1 decimal(*)
);




-- numeric数据类型验证
--删除表
drop table T_TYPE_NUMERIC1 if exists;
drop table T_TYPE_NUMERIC2 if exists;
drop table T_TYPE_NUMERIC3 if exists;
drop table T_TYPE_NUMERIC4 if exists;
drop table T_TYPE_NUMERIC5 if exists;
drop table T_TYPE_NUMERIC6 if exists;
drop table T_TYPE_NUMERIC7 if exists;
drop table T_TYPE_NUMERIC8 if exists;

--创建字段长度>38的表T_TYPE_NUMERIC1，是否报错
create table T_TYPE_NUMERIC1(
a1 decimal(39,2)
);

--插入数据到表T_TYPE_NUMERIC1,字段长度为39，是否插入成功
insert into T_TYPE_NUMERIC1 values(123456789012345678901234567890123456789.12);
--查询表T_TYPE_NUMERIC1
select * from T_TYPE_NUMERIC1;

--插入数据到表T_TYPE_NUMERIC1,字段长度小于39
insert into T_TYPE_NUMERIC1 values(123456789012345678901234567890123456.78);
--查询表T_TYPE_NUMERIC1
select * from T_TYPE_NUMERIC1;

--创建字段长度为0的表T_TYPE_NUMERIC2，是否报错
create table T_TYPE_NUMERIC2(
a1 decimal(0,0)
);

--创建表T_TYPE_NUMERIC3
create table T_TYPE_NUMERIC3(
a1 decimal(5,3)
);

--验证插入int类型
insert into T_TYPE_NUMERIC3 values(2147483);
--查询表T_TYPE_NUMERIC3
select * from T_TYPE_NUMERIC3;

--验证插入varchar类型，插入数字'12345'
insert into T_TYPE_NUMERIC3 values('1234');
--查询表T_TYPE_NUMERIC3
select * from T_TYPE_NUMERIC3;

--验证插入varchar类型，插入英文字母'AAAbcd'
insert into T_TYPE_NUMERIC3 values('AAAbcd');
--查询表T_TYPE_NUMERIC3
select * from T_TYPE_NUMERIC3;

--验证插入varchar类型，插入汉字'北京'
insert into T_TYPE_NUMERIC3 values('北京');
--查询表T_TYPE_NUMERIC3
select * from T_TYPE_NUMERIC3;

--验证插入date类型，格式yyyy-mm-dd
insert into T_TYPE_NUMERIC3 values(to_date('2020-05-08','yyyy-mm-dd'));
--查询表T_TYPE_NUMERIC3
select * from T_TYPE_NUMERIC3;

--验证插入timestamp类型，格式yyyy-mm-dd hh24:mi:ss
insert into T_TYPE_NUMERIC3 values(TO_TIMESTAMP('2020-05-08 12:19:01', 'yyyy-mm-dd hh24:mi:ss'));
--查询表T_TYPE_NUMERIC3
select * from T_TYPE_NUMERIC3;

--验证插入boolean类型，插入true                                                       
insert into T_TYPE_NUMERIC3 values(true);
--查询表T_TYPE_NUMERIC3
select * from T_TYPE_NUMERIC3;

--验证插入boolean类型，插入false
insert into T_TYPE_NUMERIC3 values(false); 
--查询表T_TYPE_NUMERIC3
select * from T_TYPE_NUMERIC3; 

--验证插入空值''                                                   
insert into T_TYPE_NUMERIC3 values('');     
--查询表T_TYPE_NUMERIC3
select * from T_TYPE_NUMERIC3;

--验证插入空格' '                                                   
insert into T_TYPE_NUMERIC3 values(' ');     
--查询表T_TYPE_NUMERIC3
select * from T_TYPE_NUMERIC3;

--验证插入null                                                    
insert into T_TYPE_NUMERIC3 values(null);  
--查询表T_TYPE_NUMERIC3
select * from T_TYPE_NUMERIC3;  

--验证插入NULL                                                   
insert into T_TYPE_NUMERIC3 values(NULL);  
--查询表T_TYPE_NUMERIC3
select * from T_TYPE_NUMERIC3; 


-- 验证DECIMAL(n,m)
--1=<n<=38时
--0=<m<=n
--当整数部分的长度>n-m时，是否报错
insert into T_TYPE_NUMERIC3 values(123.67);  
--查询表T_TYPE_NUMERIC3
select * from T_TYPE_NUMERIC3; 

--整数部分的长度<=n-m
--当小数部分的长度>m时，精确到小数点右边m位，m位向右的数字四舍五入
insert into T_TYPE_NUMERIC3 values(1.6798);  
--查询表T_TYPE_NUMERIC3
select * from T_TYPE_NUMERIC3; 

--小数部分的长度=m时，保持原值不变，小数点后保持m位
insert into T_TYPE_NUMERIC3 values(12345.123);

--小数部分的长度<m ，小数点后不足m位的在末尾补零，补足m位
insert into T_TYPE_NUMERIC3 values(1234.98);
--查询表T_TYPE_NUMERIC3
select * from T_TYPE_NUMERIC3; 

--m>n时
--创建表T_TYPE_NUMERIC4，是否报错
create table T_TYPE_NUMERIC4(
a1 decimal(4,5)
);

--m<0时
--创建表T_TYPE_NUMERIC4，是否报错
create table T_TYPE_NUMERIC4(
a1 decimal(5,-2)
);

--n<1时
--创建表T_TYPE_NUMERIC4，是否报错
create table T_TYPE_NUMERIC4(
a1 decimal(0,2)
);

--n>38时
--创建表T_TYPE_NUMERIC4，是否报错
create table T_TYPE_NUMERIC4(
a1 decimal(39,2)
);

-- 验证DECIMAL(n)，默认为decimal(n,0)

--创建表T_TYPE_DECIMAL5
create table T_TYPE_DECIMAL5(
a1 decimal(6)
);

--整数部分的长度>n，是否报错
insert into T_TYPE_DECIMAL5 values(1234567.9876);  
--查询表T_TYPE_DECIMAL5
select * from T_TYPE_DECIMAL5; 

--整数部分的长度 <=n，精确到整数位，小数部分四舍五入
insert into T_TYPE_DECIMAL5 values(1234.9876);  
--查询表T_TYPE_DECIMAL5
select * from T_TYPE_DECIMAL5; 


-- 验证DECIMAL，默认为decimal(5,0)

--创建表T_TYPE_DECIMAL6
create table T_TYPE_DECIMAL6(
a1 decimal
);

--整数部分的长度 >5，是否报错
insert into T_TYPE_DECIMAL6 values(123456.78);  
--查询表T_TYPE_DECIMAL6
select * from T_TYPE_DECIMAL6; 

--整数部分的长度<=5，小数部分四舍五入
insert into T_TYPE_DECIMAL6 values(12345.78);  
--查询表T_TYPE_DECIMAL6
select * from T_TYPE_DECIMAL6; 


--DECIMAL(*,m)

--创建表T_TYPE_DECIMAL7
create table T_TYPE_DECIMAL7(
a1 decimal(*,m)
);


--DECIMAL(*)

--创建表T_TYPE_DECIMAL8
create table T_TYPE_DECIMAL8(
a1 decimal(*)
);





-- boolean数据类型验证

--删除表
drop table T_TYPE_BOOLEAN if exists;

--创建表T_TYPE_BOOLEAN
create table T_TYPE_BOOLEAN(
a1 boolean
);

--验证boolean正常值true
insert into T_TYPE_BOOLEAN values(true);
--查询表T_TYPE_BOOLEAN
select * from T_TYPE_BOOLEAN;

--验证boolean正常值false
insert into T_TYPE_BOOLEAN values(false);
--查询表T_TYPE_BOOLEAN
select * from T_TYPE_BOOLEAN;

--验证插入字符型的'true'
insert into T_TYPE_BOOLEAN values('true');
--查询表T_TYPE_BOOLEAN
select * from T_TYPE_BOOLEAN;

--验证插入字符型的'false'
insert into T_TYPE_BOOLEAN values('false');
--查询表T_TYPE_BOOLEAN
select * from T_TYPE_BOOLEAN;

--插入表示"真"的字符串
insert into T_TYPE_BOOLEAN values('t');
--查询表T_TYPE_BOOLEAN
select * from T_TYPE_BOOLEAN;

insert into T_TYPE_BOOLEAN values('yes');
--查询表T_TYPE_BOOLEAN
select * from T_TYPE_BOOLEAN;

--插入表示"假"的字符串
insert into T_TYPE_BOOLEAN values(0);
--查询表T_TYPE_BOOLEAN
select * from T_TYPE_BOOLEAN;

insert into T_TYPE_BOOLEAN values('f');
--查询表T_TYPE_BOOLEAN
select * from T_TYPE_BOOLEAN;

insert into T_TYPE_BOOLEAN values('no');
--查询表T_TYPE_BOOLEAN
select * from T_TYPE_BOOLEAN;

--验证插入int类型
insert into T_TYPE_BOOLEAN values(14567);
--查询表T_TYPE_BOOLEAN
select * from T_TYPE_BOOLEAN;

--验证插入double类型
insert into T_TYPE_BOOLEAN values(15.23);
--查询表T_TYPE_BOOLEAN
select * from T_TYPE_BOOLEAN;

--验证插入varchar类型，插入数字'12345'
insert into T_TYPE_BOOLEAN values('1234');
--查询表T_TYPE_BOOLEAN
select * from T_TYPE_BOOLEAN;

--验证插入varchar类型，插入英文字母'AAAbcd'
insert into T_TYPE_BOOLEAN values('AAAbcd');
--查询表T_TYPE_BOOLEAN
select * from T_TYPE_BOOLEAN;

--验证插入varchar类型，插入汉字'北京'
insert into T_TYPE_BOOLEAN values('北京');
--查询表T_TYPE_BOOLEAN
select * from T_TYPE_BOOLEAN;

--验证插入date类型，格式yyyy-mm-dd
insert into T_TYPE_BOOLEAN values(to_date('2020-05-08','yyyy-mm-dd'));
--查询表T_TYPE_BOOLEAN
select * from T_TYPE_BOOLEAN;

--验证插入timestamp类型，格式yyyy-mm-dd hh24:mi:ss
insert into T_TYPE_BOOLEAN values(TO_TIMESTAMP('2020-05-08 12:19:01', 'yyyy-mm-dd hh24:mi:ss'));
--查询表T_TYPE_BOOLEAN
select * from T_TYPE_BOOLEAN;

--验证插入空值''                                                   
insert into T_TYPE_BOOLEAN values('');     
--查询表T_TYPE_BOOLEAN
select * from T_TYPE_BOOLEAN;

--验证插入空格' '                                                   
insert into T_TYPE_BOOLEAN values(' ');     
--查询表T_TYPE_BOOLEAN
select * from T_TYPE_BOOLEAN;

--验证插入null                                                    
insert into T_TYPE_BOOLEAN values(null);  
--查询表T_TYPE_BOOLEAN
select * from T_TYPE_BOOLEAN;  

--验证插入NULL                                                   
insert into T_TYPE_BOOLEAN values(NULL);  
--查询表T_TYPE_BOOLEAN
select * from T_TYPE_BOOLEAN; 

--验证boolean类型的异常值truew
insert into T_TYPE_BOOLEAN values(truew);
--查询表T_TYPE_BOOLEAN
select * from T_TYPE_BOOLEAN;




-- date数据类型验证
--删除表
drop table T_TYPE_DATE if exists;

--创建T_TYPE_DATE表
create table T_TYPE_DATE(
a1 DATE
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






-- timestamp数据类型验证
--删除表
drop table T_TYPE_TIMESTAMP if exists;

--创建T_TYPE_TIMESTAMP表
create table T_TYPE_TIMESTAMP(
a1 TIMESTAMP
);

--验证timestamp的最小值0001:01:01 00:00:00
insert into T_TYPE_TIMESTAMP values(to_timestamp('0001-01-01 00:00:00.000000','yyyy-mm-dd hh24:mi:ss'));
--查询表T_TYPE_TIMESTAMP
select * from T_TYPE_TIMESTAMP;

--验证timestamp的最小值-0.000001s，是否报错
insert into T_TYPE_TIMESTAMP values(to_timestamp('-0001-12-31 23:59:61.999999','yyyy-mm-dd hh24:mi:ss'));
--查询表T_TYPE_TIMESTAMP
select * from T_TYPE_TIMESTAMP;

--验证timestamp的最大值9999-12-31 23:59:61.999999
insert into T_TYPE_TIMESTAMP values(to_timestamp('9999-12-31 23:59:61.999999','yyyy-mm-dd hh24:mi:ss'));
--查询表T_TYPE_TIMESTAMP
select * from T_TYPE_TIMESTAMP;

--验证timestamp的最大值+0.000001s，是否报错
insert into T_TYPE_TIMESTAMP values(to_timestamp('10000-01-01 00:00:00.000000','yyyy-mm-dd hh24:mi:ss'));
--查询表T_TYPE_TIMESTAMP
select * from T_TYPE_TIMESTAMP;

--验证timestamp的格式：yyyy-mm-dd hh24:mi:ss
insert into T_TYPE_TIMESTAMP values(to_timestamp('1994-02-08 05:03:01','yyyy-mm-dd hh24:mi:ss'));
--查询表T_TYPE_TIMESTAMP
select * from T_TYPE_TIMESTAMP;

--验证timestamp的格式：yyyy-mm-dd hh24:mi:ss.ff
insert into T_TYPE_TIMESTAMP values(to_timestamp('1994-02-08 05:03:01.88877','yyyy-mm-dd hh24:mi:ss.ff'));
--查询表T_TYPE_TIMESTAMP
select * from T_TYPE_TIMESTAMP;

--验证timestamp的格式：YYYYMMDD HH24:MI:SS
insert into T_TYPE_TIMESTAMP values(to_timestamp('19940208 13:34:51','yyyymmdd hh24:mi:ss'));
--查询表T_TYPE_TIMESTAMP
select * from T_TYPE_TIMESTAMP;

--验证timestamp的格式：YYYY/MM/DD HH24:MI:SS
insert into T_TYPE_TIMESTAMP values(to_timestamp('1994/02/18 15:13:31','yyyy/mm/dd hh24:mi:ss'));
--查询表T_TYPE_TIMESTAMP
select * from T_TYPE_TIMESTAMP;

--验证无效的年份
insert into T_TYPE_TIMESTAMP values(to_timestamp('-50-01-01 00:00:00','yyyy-mm-dd hh24:mi:ss'));
--查询表T_TYPE_TIMESTAMP
select * from T_TYPE_TIMESTAMP;

--验证无效的月份
insert into T_TYPE_TIMESTAMP values(to_timestamp('1967-13-01 00:00:00','yyyy-mm-dd hh24:mi:ss'));
--查询表T_TYPE_TIMESTAMP
select * from T_TYPE_TIMESTAMP;

--验证无效的日期
insert into T_TYPE_TIMESTAMP values(to_timestamp('1967-12-35 00:00:00','yyyy-mm-dd hh24:mi:ss'));
--查询表T_TYPE_TIMESTAMP
select * from T_TYPE_TIMESTAMP;

--验证无效的小时
insert into T_TYPE_TIMESTAMP values(to_timestamp('1997-12-26 26:00:00','yyyy-mm-dd hh24:mi:ss'));
--查询表T_TYPE_TIMESTAMP
select * from T_TYPE_TIMESTAMP;

--验证无效的分钟
insert into T_TYPE_TIMESTAMP values(to_timestamp('1997-12-26 23:76:01','yyyy-mm-dd hh24:mi:ss'));
--查询表T_TYPE_TIMESTAMP
select * from T_TYPE_TIMESTAMP;

--验证无效的秒数
insert into T_TYPE_TIMESTAMP values(to_timestamp('1997-12-26 23:16:88','yyyy-mm-dd hh24:mi:ss'));
--查询表T_TYPE_TIMESTAMP
select * from T_TYPE_TIMESTAMP;

--验证插入int类型
insert into T_TYPE_TIMESTAMP values(2147483);
--查询表T_TYPE_TIMESTAMP
select * from T_TYPE_TIMESTAMP;

--验证插入double类型
insert into T_TYPE_TIMESTAMP values(138.92);
--查询表T_TYPE_TIMESTAMP
select * from T_TYPE_TIMESTAMP;

--验证插入varchar类型，插入数字'12345'
insert into T_TYPE_TIMESTAMP values('20100111');
--查询表T_TYPE_TIMESTAMP
select * from T_TYPE_TIMESTAMP;

--验证插入varchar类型，插入英文字母'AAAbcd'
insert into T_TYPE_TIMESTAMP values('AAAbcd');
--查询表T_TYPE_TIMESTAMP
select * from T_TYPE_TIMESTAMP;

--验证插入varchar类型，插入汉字'北京'
insert into T_TYPE_TIMESTAMP values('北京');
--查询表T_TYPE_TIMESTAMP
select * from T_TYPE_TIMESTAMP;

--验证插入date类型，格式yyyy-mm-dd
insert into T_TYPE_TIMESTAMP values(to_date('2020-05-08','yyyy-mm-dd'));
--查询表T_TYPE_TIMESTAMP
select * from T_TYPE_TIMESTAMP;

--验证插入空值''                                                   
insert into T_TYPE_TIMESTAMP values('');     
--查询表T_TYPE_TIMESTAMP
select * from T_TYPE_TIMESTAMP;

--验证插入空格' '                                                   
insert into T_TYPE_TIMESTAMP values(' ');     
--查询表T_TYPE_TIMESTAMP
select * from T_TYPE_TIMESTAMP;

--验证插入null                                                    
insert into T_TYPE_TIMESTAMP values(null);  
--查询表T_TYPE_TIMESTAMP
select * from T_TYPE_TIMESTAMP;  

--验证插入NULL                                                   
insert into T_TYPE_TIMESTAMP values(NULL);  
--查询表T_TYPE_TIMESTAMP
select * from T_TYPE_TIMESTAMP;

--验证插入0000-00-00 00:00:00.000000
insert into T_TYPE_TIMESTAMP values(to_timestamp('0000-00-00 00:00:00.000000','yyyy-mm-dd hh24:mi:ss'));
--查询表T_TYPE_TIMESTAMP
select * from T_TYPE_TIMESTAMP;





-- char数据类型验证
--删除表
drop table T_TYPE_CHAR1 if exists;
drop table T_TYPE_CHAR2 if exists;
drop table T_TYPE_CHAR3 if exists;

--创建表T_TYPE_CHAR1，字符长度为64000
create table T_TYPE_CHAR1 (
name CHAR(64000)
);

--通过脚本往表T_TYPE_CHAR1中插入64000个随机字符
--查询表T_TYPE_CHAR1
select length(name) from T_TYPE_CHAR1;

--创建T_TYPE_CHAR2表
create table T_TYPE_CHAR2(
a1 char(5)
);

--插入数据格式为双引号，报错
insert into T_TYPE_CHAR2 values("asdfg");
--查询表T_TYPE_CHAR2
select * from T_TYPE_CHAR2;

--插入数据格式为单引号
insert into T_TYPE_CHAR2 values('asdfg');
--查询表T_TYPE_CHAR2
select * from T_TYPE_CHAR2;

--插入的数据无引号
insert into T_TYPE_CHAR2 values(asdfg);
--查询表T_TYPE_CHAR2
select * from T_TYPE_CHAR2;

-- 创建T_TYPE_CHAR3表
create table T_TYPE_CHAR3(
a1 char(30)        
);

--验证插入30个英文字母
insert into T_TYPE_CHAR3 values('abcdefghijklmnopqrstuvwxyzabcd');
--查询表T_TYPE_CHAR3
select * from T_TYPE_CHAR3;

--验证插入31个英文字母，插入是否成功
insert into T_TYPE_CHAR3 values('abcdefghijklmnopqrstuvwxyzabcde');
--查询表T_TYPE_CHAR3
select * from T_TYPE_CHAR3;

--验证插入30个汉字
insert into T_TYPE_CHAR3 values('一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十');
--查询表T_TYPE_CHAR3
select * from T_TYPE_CHAR3;

--验证插入31个汉字，插入是否成功
insert into T_TYPE_CHAR3 values('一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十一'); --插入时不报错，查询时报错
--查询表T_TYPE_CHAR3
select * from T_TYPE_CHAR3;

--验证插入15个汉字
insert into T_TYPE_CHAR3 values('一二三四五六七八九十一二三四五');
--查询表T_TYPE_CHAR3
select * from T_TYPE_CHAR3;

--验证插入16个汉字，插入是否成功
insert into T_TYPE_CHAR3 values('一二三四五六七八九十一二三四五六');
--查询表T_TYPE_CHAR3
select * from T_TYPE_CHAR3;

--验证插入30个数字
insert into T_TYPE_CHAR3 values('123456789012345678901234567890');
--查询表T_TYPE_CHAR3
select * from T_TYPE_CHAR3;

--验证插入31个数字，插入是否成功
insert into T_TYPE_CHAR3 values('1234567890123456789012345678901');
--查询表T_TYPE_CHAR3
select * from T_TYPE_CHAR3;

--验证插入int类型
insert into T_TYPE_CHAR3 values(129);
--查询表T_TYPE_CHAR3
select * from T_TYPE_CHAR3;

--验证插入double类型
insert into T_TYPE_CHAR3 values(129.77);
--查询表T_TYPE_CHAR3
select * from T_TYPE_CHAR3;

--验证插入date类型
insert into T_TYPE_CHAR3 values(to_date('2020-05-08','yyyy-mm-dd'));
--查询表T_TYPE_CHAR3
select * from T_TYPE_CHAR3;

--验证插入timestamp类型
insert into T_TYPE_CHAR3 values(TO_TIMESTAMP('2020-05-08 12:19:01', 'yyyy-mm-dd hh24:mi:ss'));
--查询表T_TYPE_CHAR3
select * from T_TYPE_CHAR3;

--验证插入boolean类型
insert into T_TYPE_CHAR3 values(true);
--查询表T_TYPE_CHAR3
select * from T_TYPE_CHAR3;

--验证插入boolean类型
insert into T_TYPE_CHAR3 values(false);
--查询表T_TYPE_CHAR3
select * from T_TYPE_CHAR3;

--验证插入空值''                                                   
insert into T_TYPE_CHAR3 values('');     
--查询表T_TYPE_CHAR3
select * from T_TYPE_CHAR3;

--验证插入空格' '                                                   
insert into T_TYPE_CHAR3 values(' ');     
--查询表T_TYPE_CHAR3
select * from T_TYPE_CHAR3;

--验证插入null                                                    
insert into T_TYPE_CHAR3 values(null);  
--查询表T_TYPE_CHAR3
select * from T_TYPE_CHAR3;  

--验证插入NULL                                                   
insert into T_TYPE_CHAR3 values(NULL);  
--查询表T_TYPE_CHAR3
select * from T_TYPE_CHAR3; 




-- varchar数据类型验证

--删除表
drop table T_TYPE_VARCHAR1 if exists;
drop table T_TYPE_VARCHAR2 if exists;
drop table T_TYPE_VARCHAR3 if exists;

--创建表T_TYPE_VARCHAR1，字符长度为64000
create table T_TYPE_VARCHAR1 (
name CHAR(64000)
);

--通过脚本往表T_TYPE_VARCHAR1中插入64000个随机字符
--查询表T_TYPE_VARCHAR1
select length(name) from T_TYPE_VARCHAR1;

--创建T_TYPE_VARCHAR2表
create table T_TYPE_VARCHAR2(
a1 char(5)
);

--插入数据格式为双引号，报错
insert into T_TYPE_VARCHAR2 values("asdfg");
--查询表T_TYPE_VARCHAR2
select * from T_TYPE_VARCHAR2;

--插入数据格式为单引号
insert into T_TYPE_VARCHAR2 values('asdfg');
--查询表T_TYPE_VARCHAR2
select * from T_TYPE_VARCHAR2;

--插入的数据无引号
insert into T_TYPE_VARCHAR2 values(asdfg);
--查询表T_TYPE_VARCHAR2
select * from T_TYPE_VARCHAR2;

--创建T_TYPE_VARCHAR3表
create table T_TYPE_VARCHAR3(
a1 char(30)        
);

--验证插入30个英文字母
insert into T_TYPE_VARCHAR3 values('abcdefghijklmnopqrstuvwxyzabcd');
--查询表T_TYPE_VARCHAR3
select * from T_TYPE_VARCHAR3;

--验证插入31个英文字母，插入是否成功
insert into T_TYPE_VARCHAR3 values('abcdefghijklmnopqrstuvwxyzabcde');
--查询表T_TYPE_VARCHAR3
select * from T_TYPE_VARCHAR3;

--验证插入30个汉字
insert into T_TYPE_VARCHAR3 values('一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十');
--查询表T_TYPE_VARCHAR3
select * from T_TYPE_VARCHAR3;

--验证插入31个汉字，插入是否成功
insert into T_TYPE_VARCHAR3 values('一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十一');
--查询表T_TYPE_VARCHAR3
select * from T_TYPE_VARCHAR3;

--验证插入15个汉字
insert into T_TYPE_VARCHAR3 values('一二三四五六七八九十一二三四五');
--查询表T_TYPE_VARCHAR3
select * from T_TYPE_VARCHAR3;

--验证插入16个汉字，插入是否成功
insert into T_TYPE_VARCHAR3 values('一二三四五六七八九十一二三四五六');
--查询表T_TYPE_VARCHAR3
select * from T_TYPE_VARCHAR3;

--验证插入30个数字
insert into T_TYPE_VARCHAR3 values('123456789012345678901234567890');
--查询表T_TYPE_VARCHAR3
select * from T_TYPE_VARCHAR3;

--验证插入31个数字，插入是否成功
insert into T_TYPE_VARCHAR3 values('1234567890123456789012345678901');
--查询表T_TYPE_VARCHAR3
select * from T_TYPE_VARCHAR3;

--验证插入int类型
insert into T_TYPE_VARCHAR3 values(129);
--查询表T_TYPE_VARCHAR3
select * from T_TYPE_VARCHAR3;

--验证插入double类型
insert into T_TYPE_VARCHAR3 values(129.77);
--查询表T_TYPE_VARCHAR3
select * from T_TYPE_VARCHAR3;

--验证插入date类型
insert into T_TYPE_VARCHAR3 values(to_date('2020-05-08','yyyy-mm-dd'));
--查询表T_TYPE_VARCHAR3
select * from T_TYPE_VARCHAR3;

--验证插入timestamp类型
insert into T_TYPE_VARCHAR3 values(TO_TIMESTAMP('2020-05-08 12:19:01', 'yyyy-mm-dd hh24:mi:ss'));
--查询表T_TYPE_VARCHAR3
select * from T_TYPE_VARCHAR3;

--验证插入boolean类型
insert into T_TYPE_VARCHAR3 values(true);
--查询表T_TYPE_VARCHAR3
select * from T_TYPE_CHAR3;

--验证插入boolean类型
insert into T_TYPE_CHAR3 values(false);
--查询表T_TYPE_VARCHAR3
select * from T_TYPE_VARCHAR3;

--验证插入空值''                                                   
insert into T_TYPE_VARCHAR3 values('');     
--查询表T_TYPE_VARCHAR3
select * from T_TYPE_VARCHAR3;

--验证插入空格' '                                                   
insert into T_TYPE_VARCHAR3 values(' ');     
--查询表T_TYPE_VARCHAR3
select * from T_TYPE_VARCHAR3;

--验证插入null                                                    
insert into T_TYPE_VARCHAR3 values(null);  
--查询表T_TYPE_VARCHAR3
select * from T_TYPE_VARCHAR3;  

--验证插入NULL                                                   
insert into T_TYPE_VARCHAR3 values(NULL);  
--查询表T_TYPE_VARCHAR3
select * from T_TYPE_VARCHAR3; 

