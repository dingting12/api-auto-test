
-- smallint边界值测试
-- 删除T_TYPE_SMALLINT表
drop table if exists T_TYPE_SMALLINT;

-- 创建表T_TYPE_SMALLINT
create table T_TYPE_SMALLINT(
a1 smallint  
);
 
 --测试samllint类型最小值-32768
insert into T_TYPE_SMALLINT values(-32768);  
--查询T_TYPE_SMALLINT的数据
select * from T_TYPE_SMALLINT;

--测试samllint类型异常值-32769
insert into T_TYPE_SMALLINT values(-32769);   
--查询T_TYPE_SMALLINT的数据
select * from T_TYPE_SMALLINT;

--测试samllint类型最大值32767
insert into T_TYPE_SMALLINT values(32767);    
--查询T_TYPE_SMALLINT的数据
select * from T_TYPE_SMALLINT;

--测试samllint类型异常值32768
insert into T_TYPE_SMALLINT values(32768);    
--查询T_TYPE_SMALLINT的数据
select * from T_TYPE_SMALLINT;

--测试double类型
insert into T_TYPE_SMALLINT values(172.23);   
--查询T_TYPE_SMALLINT的数据
select * from T_TYPE_SMALLINT;

--测试varchar类型'12345'
insert into T_TYPE_SMALLINT values('12345');  
--查询T_TYPE_SMALLINT的数据
select * from T_TYPE_SMALLINT;

--测试date类型
insert into T_TYPE_SMALLINT values(to_date('2020-05-08','yyyy-mm-dd')); 
--查询T_TYPE_SMALLINT的数据
select * from T_TYPE_SMALLINT;

--测试timestamp类型
insert into T_TYPE_SMALLINT values(TO_TIMESTAMP('2020-05-08 12:19:01', 'yyyy-mm-dd hh24:mi:ss'));
--查询T_TYPE_SMALLINT的数据
select * from T_TYPE_SMALLINT;

--测试varchar类型'adcd'  
insert into T_TYPE_SMALLINT values('adcd');  
--查询T_TYPE_SMALLINT的数据
select * from T_TYPE_SMALLINT;

--测试boolean类型                                                       
insert into T_TYPE_SMALLINT values(true);    
--查询T_TYPE_SMALLINT的数据
select * from T_TYPE_SMALLINT;  
      
--测试double类型，值已经超出数据范围                                              
insert into T_TYPE_SMALLINT values(327690.123);  
--查询T_TYPE_SMALLINT的数据
select * from T_TYPE_SMALLINT;

--测试空值                                                   
insert into T_TYPE_SMALLINT values('');     
--查询T_TYPE_SMALLINT的数据
select * from T_TYPE_SMALLINT;

--测试null                                                    
insert into T_TYPE_SMALLINT values(null);  
--查询T_TYPE_SMALLINT的数据
select * from T_TYPE_SMALLINT;                                                        





-- int边界值测试
-- 删除T_TYPE_INT表
drop table if exists T_TYPE_INT;

--创建表T_TYPE_INT
create table T_TYPE_INT(
a1 int  
);

--测试int类型最小值-2147483648
insert into T_TYPE_INT values(-2147483648);
--查询T_TYPE_INT的数据
select * from T_TYPE_INT;

--测试int类型异常值-2147483649
insert into T_TYPE_INT values(-2147483649);
--查询T_TYPE_INT的数据
select * from T_TYPE_INT;

--测试int类型最大值2147483647
insert into T_TYPE_INT values(2147483647);
--查询T_TYPE_INT的数据
select * from T_TYPE_INT;

 --测试int类型异常值2147483648
insert into T_TYPE_INT values(2147483648);
--查询T_TYPE_INT的数据
select * from T_TYPE_INT;

--测试double类型,数据范围内
insert into T_TYPE_INT values(172.23);
--查询T_TYPE_INT的数据
select * from T_TYPE_INT;

--测试varchar类型'12345'
insert into T_TYPE_INT values('1234');
--查询T_TYPE_INT的数据
select * from T_TYPE_INT;

 --测试date类型
insert into T_TYPE_INT values(to_date('2020-05-08','yyyy-mm-dd'));
--查询T_TYPE_INT的数据
select * from T_TYPE_INT;

--测试timestamp类型
insert into T_TYPE_INT values(TO_TIMESTAMP('2020-05-08 12:19:01', 'yyyy-mm-dd hh24:mi:ss'));
--查询T_TYPE_INT的数据
select * from T_TYPE_INT;

--测试varchar类型'adcd'
insert into T_TYPE_INT values('adcd');
--查询T_TYPE_INT的数据
select * from T_TYPE_INT;

--测试boolean类型
insert into T_TYPE_INT values(true);
--查询T_TYPE_INT的数据
select * from T_TYPE_INT;

--测试double类型，值已经超出数据范围
insert into T_TYPE_INT values(2147483690.12);
--查询T_TYPE_INT的数据
select * from T_TYPE_INT;

--测试空值
insert into T_TYPE_INT values('');
--查询T_TYPE_INT的数据
select * from T_TYPE_INT;

--测试null
insert into T_TYPE_INT values(null);
--查询T_TYPE_INT的数据
select * from T_TYPE_INT;






-- bigint边界值测试
--删除表T_TYPE_BIGINT
drop table if exists T_TYPE_BIGINT;

--创建表T_TYPE_BIGINT
create table T_TYPE_BIGINT(
a1 bigint  
);

--测试bigint类型最小值-9223372036854775808
insert into T_TYPE_BIGINT values(-9223372036854775808);
--查询表T_TYPE_BIGINT
select * from T_TYPE_BIGINT;

--测试bigint类型异常值-9223372036854775809
insert into T_TYPE_BIGINT values(-9223372036854775809);
--查询表T_TYPE_BIGINT
select * from T_TYPE_BIGINT;

--测试bigint类型最大值9223372036854775807
insert into T_TYPE_BIGINT values(9223372036854775807);
--查询表T_TYPE_BIGINT
select * from T_TYPE_BIGINT;

--测试bigint类型异常值9223372036854775808
insert into T_TYPE_BIGINT values(9223372036854775808);
--查询表T_TYPE_BIGINT
select * from T_TYPE_BIGINT;

--测试double类型
insert into T_TYPE_BIGINT values(172.23);
--查询表T_TYPE_BIGINT
select * from T_TYPE_BIGINT;

--测试double类型，值已经超出数据范围
insert into T_TYPE_BIGINT values(9223372036854775890.231);
--查询表T_TYPE_BIGINT
select * from T_TYPE_BIGINT;

--测试date类型，插入是否成功
insert into T_TYPE_BIGINT values(to_date('2020-05-08','yyyy-mm-dd'));
--查询表T_TYPE_BIGINT
select * from T_TYPE_BIGINT;

--测试timestamp类型
insert into T_TYPE_BIGINT values(TO_TIMESTAMP('2020-05-08 12:19:01', 'yyyy-mm-dd hh24:mi:ss'));
--查询表T_TYPE_BIGINT
select * from T_TYPE_BIGINT;

 --测试varchar类型'adcd'
insert into T_TYPE_BIGINT values('adcd');
--查询表T_TYPE_BIGINT
select * from T_TYPE_BIGINT;

--测试varchar类型'123456789'
insert into T_TYPE_BIGINT values('123456789');
--查询表T_TYPE_BIGINT
select * from T_TYPE_BIGINT;

--测试boolean类型
insert into T_TYPE_BIGINT values(true);
--查询表T_TYPE_BIGINT
select * from T_TYPE_BIGINT;

--测试空值
insert into T_TYPE_BIGINT values('');
--查询表T_TYPE_BIGINT
select * from T_TYPE_BIGINT;

--测试null
insert into T_TYPE_BIGINT values(null);
--查询表T_TYPE_BIGINT
select * from T_TYPE_BIGINT;






-- real边界值测试，15个有效位，范围为-1.79769313486231E+308~ -2.22507385850720E-308, 0,2.22507385850720E-308 ~ 1.79769313486231E+308
--删除表T_TYPE_REAL
drop table if exists T_TYPE_REAL;

--创建表T_TYPE_REAL
create table T_TYPE_REAL(
a1 real     
);          
           
--测试real类型异常值-1.79769313486231E+308-1
insert into T_TYPE_REAL values(-1.80769313486231E+308);
--查询表T_TYPE_REAL
select * from T_TYPE_REAL;

 --测试real类型异常值-2.22507385850720E-308+1E-308
insert into T_TYPE_REAL values(-2.22507385850720E-308+1E-308);
--查询表T_TYPE_REAL
select * from T_TYPE_REAL;

 --测试real类型异常值2.22507385850720E-308+1E-308
insert into T_TYPE_REAL values(2.22507385850720E-308-1E-308);
--查询表T_TYPE_REAL
select * from T_TYPE_REAL;

 --测试real类型异常值1.79769313486231E+308+1
insert into T_TYPE_REAL values(1.79769313486231E+308+1);
--查询表T_TYPE_REAL
select * from T_TYPE_REAL;

--测试real类型的小数位超出有效位15个
insert into T_TYPE_REAL values(12.1234567891234567);
--查询表T_TYPE_REAL
select * from T_TYPE_REAL;

--测试date类型，插入是否成功
insert into T_TYPE_REAL values(to_date('2020-05-08','yyyy-mm-dd'));
--查询表T_TYPE_REAL
select * from T_TYPE_REAL;

--测试boolean类型，插入是否成功
insert into T_TYPE_REAL values(true);
--查询表T_TYPE_REAL
select * from T_TYPE_REAL;

--测试varchar类型'asdf'
insert into T_TYPE_REAL values('asdf');
--查询表T_TYPE_REAL
select * from T_TYPE_REAL;

--测试timestamp类型
insert into T_TYPE_REAL values(TO_TIMESTAMP('2020-05-08 12:19:01', 'yyyy-mm-dd hh24:mi:ss'));
--查询表T_TYPE_REAL
select * from T_TYPE_REAL;

--测试smallint类型
insert into T_TYPE_REAL values(289);
--查询表T_TYPE_REAL
select * from T_TYPE_REAL;

--测试varchar类型'123.34'
insert into T_TYPE_REAL values('123.34');
--查询表T_TYPE_REAL
select * from T_TYPE_REAL;

--测试空值
insert into T_TYPE_REAL values('');
--查询表T_TYPE_REAL
select * from T_TYPE_REAL;

--测试null
insert into T_TYPE_REAL values(null);
--查询表T_TYPE_REAL
select * from T_TYPE_REAL;





-- double边界值测试
--删除表T_TYPE_DOUBLE
drop table if exists T_TYPE_DOUBLE;

--创建表T_TYPE_DOUBLE
create table T_TYPE_DOUBLE(
a1 double
);          

--测试double类型异常值-1.79769313486231E+308-1
insert into T_TYPE_DOUBLE values(-1.80769313486231E+308);
--查询表T_TYPE_REAL
select * from T_TYPE_DOUBLE;

 --测试double类型异常值-2.22507385850720E-308+1E-308
insert into T_TYPE_DOUBLE values(-2.22507385850720E-308+1E-308);
--查询表T_TYPE_REAL
select * from T_TYPE_DOUBLE;

 --测试double类型异常值2.22507385850720E-308+1E-308
insert into T_TYPE_DOUBLE values(2.22507385850720E-308-1E-308);
--查询表T_TYPE_REAL
select * from T_TYPE_DOUBLE;

 --测试double类型异常值1.79769313486231E+308+1
insert into T_TYPE_DOUBLE values(1.80769313486231E+308);
--查询表T_TYPE_REAL
select * from T_TYPE_DOUBLE;

--测试double类型的小数位超出有效位15个
insert into T_TYPE_DOUBLE values(12.1234567891234567);
--查询表T_TYPE_DOUBLE
select * from T_TYPE_DOUBLE;

--测试date类型，插入是否成功
insert into T_TYPE_DOUBLE values(to_date('2020-05-08','yyyy-mm-dd'));
--查询表T_TYPE_DOUBLE
select * from T_TYPE_DOUBLE;

--测试boolean类型，插入是否成功
insert into T_TYPE_DOUBLE values(true);
--查询表T_TYPE_DOUBLE
select * from T_TYPE_DOUBLE;

--测试varchar类型'asdf'
insert into T_TYPE_DOUBLE values('asdf');
--查询表T_TYPE_DOUBLE
select * from T_TYPE_DOUBLE;

--测试timestamp类型
insert into T_TYPE_DOUBLE values(TO_TIMESTAMP('2020-05-08 12:19:01', 'yyyy-mm-dd hh24:mi:ss'));
--查询表T_TYPE_DOUBLE
select * from T_TYPE_DOUBLE;

--测试smallint类型
insert into T_TYPE_DOUBLE values(289);
--查询表T_TYPE_DOUBLE
select * from T_TYPE_DOUBLE;

--测试varchar类型'123.34'
insert into T_TYPE_DOUBLE values('123.34');
--查询表T_TYPE_DOUBLE
select * from T_TYPE_DOUBLE;

--测试空值
insert into T_TYPE_DOUBLE values('');
--查询表T_TYPE_DOUBLE
select * from T_TYPE_DOUBLE;

--测试null
insert into T_TYPE_DOUBLE values(null);
--查询表T_TYPE_DOUBLE
select * from T_TYPE_DOUBLE;






-- float边界值测试,有效位为7位，范围为-3.402823E+38 ~ -1.175494E-38, 0,1.175494E-38 ~ 3.402823E+38
--删除表T_TYPE_FLOAT
drop table if exists T_TYPE_FLOAT;
drop table if exists T_TYPE_FLOAT1;

--创建表T_TYPE_FLOAT1
create table T_TYPE_FLOAT1(
a1 float
);  

--插入数据到表T_TYPE_FLOAT1，测试固定有效位
insert into T_TYPE_FLOAT1 values(1234.56789)   ; 

--查询表T_TYPE_FLOAT1
select * from    T_TYPE_FLOAT1;

--创建表T_TYPE_FLOAT
create table T_TYPE_FLOAT(
a1 float
);
--测试float类型异常值3.4E38+1
insert into T_TYPE_FLOAT values(-3.412823E+38);
--查询表T_TYPE_FLOAT
select * from T_TYPE_FLOAT;

 --测试float类型异常值-3.4E38-1
insert into T_TYPE_FLOAT values(-1.175494E-38+1E-38);
--查询表T_TYPE_FLOAT
select * from T_TYPE_FLOAT;


 --测试float类型异常值-3.4E38-1
insert into T_TYPE_FLOAT values(1.175494E-38-1E-38);
--查询表T_TYPE_FLOAT
select * from T_TYPE_FLOAT;

--测试float类型的小数位超出有效位7个
insert into T_TYPE_FLOAT values(3.412823E+38);
--查询表T_TYPE_FLOAT
select * from T_TYPE_FLOAT;

--测试date类型，插入是否成功
insert into T_TYPE_FLOAT values(to_date('2020-05-08','yyyy-mm-dd'));
--查询表T_TYPE_FLOAT
select * from T_TYPE_FLOAT;

--测试boolean类型，插入是否成功
insert into T_TYPE_FLOAT values(true);
--查询表T_TYPE_FLOAT
select * from T_TYPE_FLOAT;

--测试varchar类型'asdf'
insert into T_TYPE_FLOAT values('asdf');
--查询表T_TYPE_FLOAT
select * from T_TYPE_FLOAT;

--测试timestamp类型
insert into T_TYPE_FLOAT values(TO_TIMESTAMP('2020-05-08 12:19:01', 'yyyy-mm-dd hh24:mi:ss'));
--查询表T_TYPE_FLOAT
select * from T_TYPE_FLOAT;

--测试smallint类型，插入是否成功
insert into T_TYPE_FLOAT values(289);
--查询表T_TYPE_FLOAT
select * from T_TYPE_FLOAT;

--测试varchar类型'123.34'
insert into T_TYPE_FLOAT values('123.34');
--查询表T_TYPE_FLOAT
select * from T_TYPE_FLOAT;

--测试空值
insert into T_TYPE_FLOAT values('');
--查询表T_TYPE_FLOAT
select * from T_TYPE_FLOAT;

--测试null
insert into T_TYPE_FLOAT values(null);
--查询表T_TYPE_FLOAT
select * from T_TYPE_FLOAT;







-- decimal边界值测试
--删除表
drop table if exists T_TYPE_DECIMAL1;
drop table if exists T_TYPE_DECIMAL2;
drop table if exists T_TYPE_DECIMAL3;
drop table if exists T_TYPE_DECIMAL4;
drop table if exists T_TYPE_DECIMAL5;
drop table if exists T_TYPE_DECIMAL6;
drop table if exists T_TYPE_DECIMAL7;
drop table if exists T_TYPE_DECIMAL8;
drop table if exists T_TYPE_DECIMAL9;
drop table if exists T_TYPE_DECIMAL10;
drop table if exists T_TYPE_DECIMAL11;


--测试总长度n>38,创建失败
create table T_TYPE_DECIMAL1(
a1 decimal(39,1)
);

-- 测试总长度n<1,创建失败
create  table T_TYPE_DECIMAL2(
a1 decimal(0,0) 
);

-- 测试整数部分长度>n-m,例如234.01，应报错
create table T_TYPE_DECIMAL3(
a1 decimal(4,2)  
);
 insert into T_TYPE_DECIMAL3 values(234.01);
 
select * from T_TYPE_DECIMAL3;

--测试m小于0,创建失败
create  table T_TYPE_DECIMAL4(
a1 decimal(2,-1)  
);

--测试m大于n,创建失败
create  table T_TYPE_DECIMAL5(
a1 decimal(3,6)  
);


-- 测试(*,m),创建失败
create  table T_TYPE_DECIMAL6(
a1 decimal(*,m)  
);

--测试(*),创建失败
create  table T_TYPE_DECIMAL11(
a1 decimal(*)  
);
  
-- 测试numeric(n),n设置为39,创建报错
create  table T_TYPE_DECIMAL7(
a1 decimal(39)  
);
  
 

--测试numeric默认值是否为(5,0),值为123456，实际为123456
create  table T_TYPE_DECIMAL8(
a1 decimal  
);
 insert into T_TYPE_DECIMAL8 values(123456);
 
select * from T_TYPE_DECIMAL8;

--测试numeric(n),n设置为5,值为123456大于5，报错，实际返回空值 
create  table T_TYPE_DECIMAL9(
a1 decimal(5)  
);
 insert into T_TYPE_DECIMAL9 values(123456);
 
select * from T_TYPE_DECIMAL9;

--创建表T_TYPE_DECIMAL3
create table T_TYPE_DECIMAL10(
a1 decimal(5,3)
);

--测试samllint类型
insert into T_TYPE_DECIMAL10 values(32121);
--查询表T_TYPE_DECIMAL3
select * from T_TYPE_DECIMAL10;

--测试int类型，插入是否成功
insert into T_TYPE_DECIMAL10 values(2147483);
--查询表T_TYPE_DECIMAL3
select * from T_TYPE_DECIMAL10;

--测试double类型
insert into T_TYPE_DECIMAL10 values(138.92);
--查询表T_TYPE_DECIMAL3
select * from T_TYPE_DECIMAL10;

--测试date类型，插入是否成功
insert into T_TYPE_DECIMAL10 values(to_date('2020-05-08','yyyy-mm-dd'));
--查询表T_TYPE_DECIMAL3
select * from T_TYPE_DECIMAL10;

--测试boolean类型，插入是否成功
insert into T_TYPE_DECIMAL10 values(true);
--查询表T_TYPE_DECIMAL3
select * from T_TYPE_DECIMAL10;

--测试varchar类型
insert into T_TYPE_DECIMAL10 values('asdf');
--查询表T_TYPE_DECIMAL3
select * from T_TYPE_DECIMAL10;

--测试timestamp类型
insert into T_TYPE_DECIMAL10 values(TO_TIMESTAMP('2020-05-08 12:19:01', 'yyyy-mm-dd hh24:mi:ss'));
--查询表T_TYPE_DECIMAL3
select * from T_TYPE_DECIMAL10;



--测试空值
insert into T_TYPE_DECIMAL10 values('');
--查询表T_TYPE_DECIMAL3
select * from T_TYPE_DECIMAL10;

--测试null
insert into T_TYPE_DECIMAL10 values(null);
--查询表T_TYPE_DECIMAL3
select * from T_TYPE_DECIMAL10;






-- numeric边界值测试
-- 删除表
drop table if exists T_TYPE_numeric1;
drop table if exists T_TYPE_numeric2;
drop table if exists T_TYPE_numeric3;
drop table if exists T_TYPE_numeric4;
drop table if exists T_TYPE_numeric5;
drop table if exists T_TYPE_numeric6;
drop table if exists T_TYPE_numeric7;
drop table if exists T_TYPE_numeric8;
drop table if exists T_TYPE_numeric9;
drop table if exists T_TYPE_numeric10;
drop table if exists T_TYPE_numeric11;

--测试总长度n>38,创建失败
create table T_TYPE_numeric1(
a1 numeric(39,1)
);

-- 测试总长度n<1,创建失败
create  table T_TYPE_numeric2(
a1 numeric(0,0) 
);

-- 测试整数部分长度>n-m,例如234.01，应报错
create table T_TYPE_numeric3(
a1 numeric(4,2)  
);
 insert into T_TYPE_numeric3 values(234.01);
 
select * from T_TYPE_numeric3;

--测试m小于0,创建失败
create  table T_TYPE_numeric4(
a1 numeric(2,-1)  
);

--测试m大于n,创建失败
create  table T_TYPE_numeric5(
a1 numeric(3,6)  
);


-- 测试(*,m),创建失败
create  table T_TYPE_numeric6(
a1 numeric(*,m)  
);

--测试(*),创建失败
create  table T_TYPE_numeric7(
a1 numeric(*)  
);
  
-- 测试numeric(n),n设置为39,创建报错
create  table T_TYPE_numeric8(
a1 numeric(39)  
);
  

--测试numeric默认值是否为(5,0),值为123456，实际为123456
create  table T_TYPE_numeric9(
a1 numeric  
);
 insert into T_TYPE_numeric9 values(123456);
 
select * from T_TYPE_numeric9;

--测试numeric(n),n设置为5,值为123456大于5，报错，实际返回空值 
create  table T_TYPE_numeric10(
a1 numeric(5)  
);
 insert into T_TYPE_numeric10 values(123456);
 
select * from T_TYPE_numeric10;

--创建表T_TYPE_DECIMAL3
create table T_TYPE_numeric11(
a1 numeric(5,3)
);


--测试samllint类型
insert into T_TYPE_numeric11 values(32121);
-- 查询数据T_TYPE_NUMERIC3
select * from T_TYPE_numeric11;

--测试int类型，插入是否成功
insert into T_TYPE_numeric11 values(2147483);
-- 查询数据T_TYPE_NUMERIC3
select * from T_TYPE_numeric11;

--测试double类型
insert into T_TYPE_numeric11 values(138.92);
-- 查询数据T_TYPE_NUMERIC3
select * from T_TYPE_numeric11;

--测试date类型，插入是否成功
insert into T_TYPE_numeric11 values(to_date('2020-05-08','yyyy-mm-dd'));
-- 查询数据T_TYPE_NUMERIC3
select * from T_TYPE_numeric11;

--测试boolean类型，插入是否成功
insert into T_TYPE_numeric11 values(true);
-- 查询数据T_TYPE_NUMERIC3
select * from T_TYPE_numeric11;

--测试varchar类型
insert into T_TYPE_numeric11 values('asdf');
-- 查询数据T_TYPE_NUMERIC3
select * from T_TYPE_numeric11;

--测试timestamp类型
insert into T_TYPE_numeric11 values(TO_TIMESTAMP('2020-05-08 12:19:01', 'yyyy-mm-dd hh24:mi:ss'));
-- 查询数据T_TYPE_NUMERIC3
select * from T_TYPE_numeric11;



--测试空值
insert into T_TYPE_numeric11 values('');
-- 查询数据T_TYPE_NUMERIC3
select * from T_TYPE_numeric11;

--测试null
insert into T_TYPE_numeric11 values(null);
-- 查询数据T_TYPE_NUMERIC3
select * from T_TYPE_numeric11;




-- boolean边界值测试
-- 删除表T_TYPE_BOOLEAN
drop table if exists T_TYPE_BOOLEAN;

-- 创建表T_TYPE_BOOLEAN
create table T_TYPE_BOOLEAN(
a1 boolean
);

--测试boolean正常值true
insert into T_TYPE_BOOLEAN values(true);
--查询数据
select * from T_TYPE_BOOLEAN;

--测试samllint类型
insert into T_TYPE_BOOLEAN values(14);
--查询数据
select * from T_TYPE_BOOLEAN;

--测试double类型
insert into T_TYPE_BOOLEAN values(15.23);
--查询数据
select * from T_TYPE_BOOLEAN;

--测试int类型，插入是否成功
insert into T_TYPE_BOOLEAN values(146798);
--查询数据
select * from T_TYPE_BOOLEAN;

--测试date类型，插入是否成功
insert into T_TYPE_BOOLEAN values(to_date('2020-05-08','yyyy-mm-dd'));
--查询数据
select * from T_TYPE_BOOLEAN;


--测试timestamp类型
insert into T_TYPE_BOOLEAN values(TO_TIMESTAMP('2020-05-08 12:19:01', 'yyyy-mm-dd hh24:mi:ss'));
--查询数据
--测试varchar类型
insert into T_TYPE_BOOLEAN values('adcd');
--查询数据
select * from T_TYPE_BOOLEAN;

--测试varchar类型数值类型
insert into T_TYPE_BOOLEAN values('12345');
--查询数据
select * from T_TYPE_BOOLEAN;

--测试varchar类型的'false'
insert into T_TYPE_BOOLEAN values('false');
--查询数据
select * from T_TYPE_BOOLEAN;

--测试boolean类型的异常值truew
insert into T_TYPE_BOOLEAN values(truew);
--查询数据
select * from T_TYPE_BOOLEAN;

--测试空值
insert into T_TYPE_BOOLEAN values('');
--查询数据
select * from T_TYPE_BOOLEAN;

--测试null
insert into T_TYPE_BOOLEAN values(null);
--查询数据
select * from T_TYPE_BOOLEAN;




-- date边界值测试
--删除T_TYPE_DATE表
drop table if exists T_TYPE_DATE;

--创建T_TYPE_DATE表
create table T_TYPE_DATE(
a1 DATE
);

--测试samllint类型
insert into T_TYPE_DATE values(32121);
-- 查询数据T_TYPE_DATE
select * from T_TYPE_DATE;

--测试int类型，插入是否成功
insert into T_TYPE_DATE values(2147483);
-- 查询数据T_TYPE_DATE
select * from T_TYPE_DATE;

--测试double类型
insert into T_TYPE_DATE values(138.92);
-- 查询数据T_TYPE_DATE
select * from T_TYPE_DATE;

--测试date类型，插入是否成功
insert into T_TYPE_DATE values('2020-05-08');
-- 查询数据T_TYPE_DATE
select * from T_TYPE_DATE;

--测试timestamp类型
insert into T_TYPE_DATE values(TO_TIMESTAMP('2020-05-08 12:19:01', 'yyyy-mm-dd hh24:mi:ss'));
-- 查询数据T_TYPE_DATE
select * from T_TYPE_DATE;

--测试boolean类型，插入是否成功
insert into T_TYPE_DATE values(true);
-- 查询数据T_TYPE_DATE
select * from T_TYPE_DATE;

--测试varchar类型
insert into T_TYPE_DATE values('asdf');
-- 查询数据T_TYPE_DATE
select * from T_TYPE_DATE;

--测试无效月份的date
insert into T_TYPE_DATE values('1000-13-02');
-- 查询数据T_TYPE_DATE
select * from T_TYPE_DATE;

--测试无效日期的date
insert into T_TYPE_DATE values('9999-12-41');
-- 查询数据T_TYPE_DATE
select * from T_TYPE_DATE;

--测试date的边界值0001-01-00 
insert into T_TYPE_DATE values('0001-01-00');
-- 查询数据T_TYPE_DATE
select * from T_TYPE_DATE;

--测试date的边界值10000-10-01
insert into T_TYPE_DATE values('10000-10-01');
-- 查询数据T_TYPE_DATE
select * from T_TYPE_DATE;

--测试空值
insert into T_TYPE_DATE values('');
-- 查询数据T_TYPE_DATE
select * from T_TYPE_DATE;

--测试null
insert into T_TYPE_DATE values(null);
-- 查询数据T_TYPE_DATE
select * from T_TYPE_DATE;






-- timestamp边界值测试
--删除T_TYPE_TIMESTAMP表
drop table if exists T_TYPE_TIMESTAMP;

--创建T_TYPE_TIMESTAMP表
create table T_TYPE_TIMESTAMP(
a1 TIMESTAMP
);

--测试samllint类型
insert into T_TYPE_TIMESTAMP values(32121);
-- 查询T_TYPE_TIMESTAMP表
select * from T_TYPE_TIMESTAMP;

--测试int类型，插入是否成功
insert into T_TYPE_TIMESTAMP values(2147483);
-- 查询T_TYPE_TIMESTAMP表
select * from T_TYPE_TIMESTAMP;

--测试double类型
insert into T_TYPE_TIMESTAMP values(138.92);
-- 查询T_TYPE_TIMESTAMP表
select * from T_TYPE_TIMESTAMP;

--测试date类型，插入是否成功
insert into T_TYPE_TIMESTAMP values(to_date('2020-05-08','yyyy-mm-dd'));
-- 查询T_TYPE_TIMESTAMP表
select * from T_TYPE_TIMESTAMP;

--测试boolean类型，插入是否成功
insert into T_TYPE_TIMESTAMP values(true);
-- 查询T_TYPE_TIMESTAMP表
select * from T_TYPE_TIMESTAMP;

--测试varchar类型
insert into T_TYPE_TIMESTAMP values('asdf');
-- 查询T_TYPE_TIMESTAMP表
select * from T_TYPE_TIMESTAMP;

--测试timestamp的边界值0001-01-00 00:00:00
insert into T_TYPE_TIMESTAMP values('0001-01-00 00:00:00');
-- 查询T_TYPE_TIMESTAMP表
select * from T_TYPE_TIMESTAMP;

--测试timestamp的边界值10000-10-01 23:01:01
insert into T_TYPE_TIMESTAMP values('10000-10-01 23:01:01');
-- 查询T_TYPE_TIMESTAMP表
select * from T_TYPE_TIMESTAMP;

--测试无效的日期 2020-05-42 12:19:01
insert into T_TYPE_TIMESTAMP values('2020-05-42 12:19:01');
-- 查询T_TYPE_TIMESTAMP表
select * from T_TYPE_TIMESTAMP;

--测试无效的小时 2020-05-12 28:19:01
insert into T_TYPE_TIMESTAMP values('2020-05-12 28:19:01');
-- 查询T_TYPE_TIMESTAMP表
select * from T_TYPE_TIMESTAMP;

--测试空值
insert into T_TYPE_TIMESTAMP values('');
-- 查询T_TYPE_TIMESTAMP表
select * from T_TYPE_TIMESTAMP;

--测试null
insert into T_TYPE_TIMESTAMP values(null);
-- 查询T_TYPE_TIMESTAMP表
select * from T_TYPE_TIMESTAMP;




-- char边界值测试
-- 删除char表
drop table if exists T_TYPE_CHAR1;
drop table if exists T_TYPE_CHAR2;
drop table if exists T_TYPE_CHAR3;
drop table if exists T_TYPE_CHAR4;

-- 创建T_TYPE_CHAR1，长度超过64000
create  table T_TYPE_CHAR1 (
name CHAR(64001)
) ;


-- 创建T_TYPE_CHAR2表
create table T_TYPE_CHAR2(
a1 char(5)
);

--插入数据格式为双引号，报错
insert into T_TYPE_CHAR2 values("asdfg");

-- 创建T_TYPE_CHAR3表
create table T_TYPE_CHAR3(
a1 char(10)        
);

create table T_TYPE_CHAR4(
a1 char(19)        
);

--测试英文字符为11字符，插入是否报错
insert into T_TYPE_CHAR3 values('asdfgh,jkla');
-- 查询结果
select * from T_TYPE_CHAR3;

--测试中文字符为11字符，插入是否报错
insert into T_TYPE_CHAR3 values('好好好好好，好好好好好');
-- 查询结果
select * from T_TYPE_CHAR3;

--测试date类型，插入是否成功
insert into T_TYPE_CHAR3 values(to_date('2020-05-08','yyyy-mm-dd'));
-- 查询结果
select * from T_TYPE_CHAR3;

--测试boolean类型，插入是否成功
insert into T_TYPE_CHAR3 values(true);
-- 查询结果
select * from T_TYPE_CHAR3;

--测试timestamp类型
insert into T_TYPE_CHAR4 values(TO_TIMESTAMP('2020-05-08 12:19:01', 'yyyy-mm-dd hh24:mi:ss'));
-- 查询结果
select * from T_TYPE_CHAR3;

--测试int类型，插入是否成功
insert into T_TYPE_CHAR3 values(129);
-- 查询结果
select * from T_TYPE_CHAR3;

--测试decimal类型，插入是否成功
insert into T_TYPE_CHAR3 values(189.359);
-- 查询结果
select * from T_TYPE_CHAR3;

--测试空值
insert into T_TYPE_CHAR3 values('');
-- 查询结果
select * from T_TYPE_CHAR3;

--测试null
insert into T_TYPE_CHAR3 values(null);
-- 查询结果
select * from T_TYPE_CHAR3;




-- varchar边界值测试
-- 删除varchar表
drop table if exists T_TYPE_VARCHAR1;
drop table if exists T_TYPE_VARCHAR2;

drop table if exists T_TYPE_VARCHAR3;
drop table if exists T_TYPE_VARCHAR4;

-- 创建T_TYPE_CHAR1，长度超过64000
create  table T_TYPE_VARHAR4 (
name VARCHAR(64001)
) ;
-- 创建T_TYPE_VARCHAR1表
create table T_TYPE_VARCHAR1(
a1 varchar(5)
);

-- 插入数据格式为双引号，报错
insert into T_TYPE_VARCHAR1 values("asdfg");

-- 创建T_TYPE_VARCHAR3表
create table T_TYPE_VARCHAR2(
a1 varchar(10)        
);

create table T_TYPE_VARCHAR3(
a1 varchar(19)        
);

--测试英文字符为11字符，插入是否报错
insert into T_TYPE_VARCHAR2 values('asdfgh,jkla');
-- 查询结果T_TYPE_VARCHAR3
select * from T_TYPE_VARCHAR2;

--测试中文字符为11字符，插入是否报错
insert into T_TYPE_VARCHAR2 values('好好好好好，好好好好好');
-- 查询结果T_TYPE_VARCHAR3
select * from T_TYPE_VARCHAR2;

--测试date类型，插入是否成功
insert into T_TYPE_VARCHAR2 values(to_date('2020-05-08','yyyy-mm-dd'));
-- 查询结果T_TYPE_VARCHAR3
select * from T_TYPE_VARCHAR2;

--测试boolean类型，插入是否成功
insert into T_TYPE_VARCHAR2 values(true);
-- 查询结果T_TYPE_VARCHAR3
select * from T_TYPE_VARCHAR2;

--测试timestamp类型，插入是否成功
insert into T_TYPE_VARCHAR3 values(TO_TIMESTAMP('2020-05-08 12:19:01', 'yyyy-mm-dd hh24:mi:ss'));
-- 查询结果T_TYPE_VARCHAR3
select * from T_TYPE_VARCHAR3;

--测试int类型，插入是否成功
insert into T_TYPE_VARCHAR2 values(129);
-- 查询结果T_TYPE_VARCHAR3
select * from T_TYPE_VARCHAR2;

--测试decimal类型，插入是否成功
insert into T_TYPE_VARCHAR2 values(189.359);
-- 查询结果T_TYPE_VARCHAR3
select * from T_TYPE_VARCHAR2;

--测试空值
insert into T_TYPE_VARCHAR2 values('');
-- 查询结果T_TYPE_VARCHAR3
select * from T_TYPE_VARCHAR2;

--测试null
insert into T_TYPE_VARCHAR2 values(null);
-- 查询结果T_TYPE_VARCHAR3
select * from T_TYPE_VARCHAR2;

