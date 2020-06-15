--    Description: 测试特征工程
--    Date:         2020-06-11
--    Author:       丁婷


--619 LDBX011-03 CountVectorizer
drop table countvectorizer_data_001 if exists cascade;
drop table Test_Feature_Engineering_001 if exists cascade;
drop model countvectorizer_model_001 if exists;
drop model tokenizer_model_001 if exists;

create table countvectorizer_data_001 (
label double,
sentence varchar(200)
);

insert into countvectorizer_data_001 values
(0.0,'Hi I heard about Spark'),
(0.0,'I wish Java could use case classes'),
(1.0,'Logistic regression models are neat');

create model tokenizer_model_001 as tokenizer_transformer();

create model countvectorizer_model_001 as countvectorizer_transformer
((select * from tokenizer(tokenizer_model_001,countvectorizer_data_001)));

SELECT *
FROM countvectorizer(countvectorizer_model_001, (
	SELECT *
	FROM tokenizer(tokenizer_model_001, countvectorizer_data_001)
));

update model countvectorizer_model_001 as countvectorizer_transformer((select * from tokenizer(tokenizer_model_001,countvectorizer_data_001)),262144,1.0,1.0,true);

desc model countvectorizer_model_001

select * from countvectorizer(countvectorizer_model_001,(select * from tokenizer(tokenizer_model_001,countvectorizer_data_001)));


drop table countvectorizer_data_001 if exists cascade;
drop table Test_Feature_Engineering_001 if exists cascade;
drop model countvectorizer_model_001 if exists;
drop model tokenizer_model_001 if exists;



--629 LDBX012-09 IndexToString

drop table stringindexer_data_001 if EXISTS cascade;
drop table Test_Feature_Engineering_002 if EXISTS cascade;
drop model string_indexer_model_001 if EXISTS;
drop model index_to_string_model_001 if EXISTS;

create table stringindexer_data_001(
category varchar(20)
);

insert into stringindexer_data_001 values
('a'),
('b'),
('c'),
('a'),
('b'),
('b'),
('c');

create model string_indexer_model_001 as string_indexer_transformer(stringindexer_data_001);

create model index_to_string_model_001 as index_to_string_transformer();

select * from index_to_string(index_to_string_model_001,(select * from string_indexer(string_indexer_model_001,stringindexer_data_001)));

create table Test_Feature_Engineering_002(c1 varchar(20));

insert into Test_Feature_Engineering_002 select ORIGINALCATEGORY from index_to_string(index_to_string_model_001,(select * from string_indexer(string_indexer_model_001,stringindexer_data_001)));

select * from Test_Feature_Engineering_002;

--645 LDBX013-01 VectorSlicer
drop table vectorslicer_data_001 if exists cascade;
drop table Test_Feature_Engineering_003 if exists cascade;
drop model m_rformula_model_001 if exists;
drop model vectorslicer_model_001 if exists;

create table vectorslicer_data_001 (
id double,
country varchar(32) ,
hour double,
clicked double
);

insert into vectorslicer_data_001 values
(7,'us',18,1.0),
(8,'ca',18,1.0),
(9,'nz',19,1.0),
(10,'as',18,1.0),
(11,'uu',18,0.0);

create model m_rformula_model_001 as rformula_transformer((select country,hour,clicked from vectorslicer_data_001));

create model vectorslicer_model_001 as vectorslicer_transformer(array[0,1]);

select * from vectorslicer(vectorslicer_model_001,(select * from rformula(m_rformula_model_001,(select country,hour,clicked from vectorslicer_data_001 order by country,hour,clicked))));

update model vectorslicer_model_001 as vectorslicer_transformer(array[2]);

desc model vectorslicer_model_001

select * from vectorslicer(vectorslicer_model_001,(select * from rformula(m_rformula_model_001,(select country,hour,clicked from vectorslicer_data_001 order by country,hour,clicked))));

create table Test_Feature_Engineering_003 (country varchar(32) ,hour double,clicked double,FEATURES double array,LABEL double,SELECTFEATURES double array);

insert into Test_Feature_Engineering_003 select * from vectorslicer(vectorslicer_model_001,(select * from rformula(m_rformula_model_001,(select country,hour,clicked from vectorslicer_data_001))));

select * from Test_Feature_Engineering_003;