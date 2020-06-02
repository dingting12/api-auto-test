--Description：boolean data type
--Date：2020-05-22
--Author：李爱敏

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

--验证boolean类型的异常值truew，是否报错
insert into T_TYPE_BOOLEAN values(truew);
--查询表T_TYPE_BOOLEAN
select * from T_TYPE_BOOLEAN;