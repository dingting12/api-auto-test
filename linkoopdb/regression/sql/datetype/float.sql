--Description：float data type
--Date：2020-05-22
--Author：李爱敏

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
