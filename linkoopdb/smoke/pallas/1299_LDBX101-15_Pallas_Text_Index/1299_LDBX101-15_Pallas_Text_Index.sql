--    Description: 测试pallas text index
--    Date:         2020-07-01
--    Author:       丁婷

set echo on

--测试查看分词结果的函数ft_split
CALL ft_split('i am a boy,大家都是好孩纸，大叔大婶都来瞧瞧 @#￥#￥%&*……&* but you are just a little baby',false);

CALL ft_split('i am a boy,大家都是好孩纸，大叔大婶都来瞧瞧 @#￥#￥%&*……&* but you are just a little baby',true);

CALL ft_split('i am a boy,大家都是好孩纸，大叔大婶都来瞧瞧 @#￥#￥%&*……&* but you are just a little baby');




--测试pallas全文索引

DROP TABLE T_PALLAS_TEXT_INDEX_001 IF EXISTS CASCADE;

CREATE TABLE T_PALLAS_TEXT_INDEX_001(
   tsmallint SMALLINT,
   tinteger INTEGER,
   tbigint BIGINT,
   treal REAL,
   tdouble DOUBLE,
   tfloat FLOAT,
   tdecimal DECIMAL(6,2),
   tnumeric NUMERIC(6,2),
   tdate DATE,
   ttimestamp TIMESTAMP,
   tvarchar VARCHAR(2000) primary key,
   tchar CHAR(20),
   tboolean BOOLEAN
)engine pallas;


INSERT INTO T_PALLAS_TEXT_INDEX_001 VALUES(123,2343,23145,321.32,454.65,213.44,315.65,1289.32,'2019-06-17','2019-06-08 23:12:20',
'此外，宇宙射线每时每刻都在地球上引起核反应。自然界的碳14大部分是宇宙射线中的中子轰击氮14产生的。1919年英国的E。卢瑟福用天然放射性物质的α粒子轰击氮原子核，首次用人工方式实现了核反应。30年代初加速器的出现和40年代初反应堆的建成，为研究核反应提供了强有力的工具。已能将质子加速到5×10^5兆电子伏，将铀原子核加速到约9×10^4兆电子伏，并能获得介子束。高分辨率半导体探测器的使用，
大大提高了测量核辐射能量的精度。核电子学和计算机技术的发展，从根本上改善了数据的获 取和处理能力。在过去半个多世纪里，研究过的核反应类型数以千计，制备出了自然界不存在的放射性核素约2000种,发现了300余种基本粒子,获得了有关核素性质、核转变规律、核结构、基本粒子以及自然界四种相互作用的规律和相互联系的大量知识。In addition, cosmic rays cause nuclear reactions on earth all the time. Most natural carbon-14 is produced by bombarding nitrogen-14 with neutrons in cosmic rays. E of England in 1919. Rutherford first engineered a nuclear reaction by bombarding nitrogen nuclei with alpha particles of natural radioactive material. The advent of accelerators in the early 1930s and reactors in the early 1940s provided powerful tools for studying nuclear reactions. It has been able to accelerate protons to 5 x 10^5 mev, uranium nuclei to about 9 x 10^4 mev, and to get muon beams. The use of high resolution semiconductor detector greatly improves the accuracy of measuring nuclear radiation energy. The development of nuclear electronics and computer technology has fundamentally improved data acquisition and processing capacity. In the past more than half a century, has studied the reaction type thousands, the preparation of the radionuclide 2000 kind of nature does not exist, found more than 300 kinds of fundamental particles, acquired about the nature of the nuclide, nuclear transformation rule, nuclear structure, elementary particles, and the rule of four kinds of interaction between nature and connect with each other a lot of knowledge.','dbsakjds的撒回家看^&*%^ dsahjk圣诞节',TRUE);

INSERT INTO T_PALLAS_TEXT_INDEX_001 VALUES(322,3343,45578,321.32,454.65,213.44,315.65,1289.32,'2019-06-18','2019-06-09 09:08:06','γ射线的穿透力很强，是一种波长很短的电磁波。γ辐射和X射线相似，能穿透人体和建筑物，危害距离远。宇宙、自然界能产生放射性的物质不少但危害都不太大，只有核爆炸或核电站事故泄漏的放射性物质才能大范围地对人员造成伤亡。
电磁波是很常见的辐射，对人体的影响主要由功率（与场强有关）和频率决定。通讯用的无线电波是频率较低的电磁波，如果按照频率从低到高（波长从长到短）按次序排列，电磁波可以分为：长波、中波、短波、超短波、微波、远红外线、红外线、可见光、紫外线、X射线、γ射线、宇宙射线。以可见光为界，频率低于（波长长于）可见光的电磁波对人体产生的主要是热效应，频率高于可见光的射线对人体主要产生化学效应。Gamma rays are very penetrating and they are electromagnetic waves with very short wavelength. Gamma radiation, like x-rays, can penetrate the human body and buildings, harming people at great distances. The universe, nature can produce a lot of radioactive materials but the harm is not too big, only the nuclear explosion or nuclear power plant accident leakage of radioactive materials can cause casualties on a large scale. Electromagnetic wave is a very common radiation, the impact on the human body is mainly determined by the power (and field strength) and frequency. The radio wave used for communication is the electromagnetic wave with lower frequency. If the frequency is arranged in order from low to high (wavelength from long to short), the electromagnetic wave can be divided into: long wave, medium wave, short wave, ultra-short wave, microwave, far infrared ray, infrared ray, visible light, ultraviolet ray, X ray, gamma ray, cosmic ray. With visible light as the boundary, the electromagnetic wave with frequency lower than (wavelength longer than) visible light mainly produces thermal effect on human body, while the radiation with frequency higher than visible light mainly produces chemical effect on human body.','发!生fdf的借口 sd',FALSE);

INSERT INTO T_PALLAS_TEXT_INDEX_001 VALUES(124,2344,23146,321.33,454.66,213.45,315.66,1289.33,'2019-06-19','2019-06-010 12:12:20',
'此外，宇宙射线每时每刻都在地球上引起核反应。自然界的碳14大部分是宇宙射线中的中子轰击氮14产生的。1919年英国的E。卢瑟福用天然放射性物质的α粒子轰击氮原子核，首次用人工方式实现了核反应。30年代初加速器的出现和40年代初反应堆的建成，为研究核反应提供了强有力的工具。已能将质子加速到5×10^5兆电子伏，将铀原子核加速到约9×10^4兆电子伏，并能获得介子束。高分辨率半导体探测器的使用，
大大提高了测量核辐射能量的精度。核电子学和计算机技术的发展，从根本上改善了数据的获 取和处理能力。在过去半个多世纪里，研究过的核反应类型数以千计，制备出了自然界不存在的放射性核素约2000种,发现了300余种基本粒子,获得了有关核素性质、核转变规律、核结构、基本粒子以及自然界四种相互作用的规律和相互联系的大量知识。','owicdb圣诞树dsjh&*6',TRUE);

INSERT INTO T_PALLAS_TEXT_INDEX_001 VALUES(125,2345,23147,321.34,454.67,213.46,315.67,1289.34,'2019-06-20','2019-06-11 02:19:27',
'In addition, cosmic rays cause nuclear reactions on earth all the time. Most natural carbon-14 is produced by bombarding nitrogen-14 with neutrons in cosmic rays. 
E of England in 1919. Rutherford first engineered a nuclear reaction by bombarding nitrogen nuclei with alpha particles of natural radioactive material. 
The advent of accelerators in the early 1930s and reactors in the early 1940s provided powerful tools for studying nuclear reactions. 
It has been able to accelerate protons to 5 x 10^5 mev, uranium nuclei to about 9 x 10^4 mev, and to get muon beams. 
The use of high resolution semiconductor detector greatly improves the accuracy of measuring nuclear radiation energy. 
The development of nuclear electronics and computer technology has fundamentally improved data acquisition and processing capacity. 
In the past more than half a century, has studied the reaction type thousands, the preparation of the radionuclide 2000 kind of nature does not exist, 
found more than 300 kinds of fundamental particles, acquired about the nature of the nuclide, nuclear transformation rule, nuclear structure, elementary particles, 
and the rule of four kinds of interaction between nature and connect with each other a lot of knowledge.','核辐射 and 核反应 sdbn%$',FALSE);


INSERT INTO T_PALLAS_TEXT_INDEX_001 VALUES(323,3344,45579,321.33,454.66,213.45,315.66,1289.33,'2019-06-21','2019-07-11 03:04:05','γ射线的穿透力很强，是一种波长很短的电磁波。γ辐射和X射线相似，能穿透人体和建筑物，危害距离远。宇宙、自然界能产生放射性的物质不少但危害都不太大，只有核爆炸或核电站事故泄漏的放射性物质才能大范围地对人员造成伤亡。
电磁波是很常见的辐射，对人体的影响主要由功率（与场强有关）和频率决定。通讯用的无线电波是频率较低的电磁波，如果按照频率从低到高（波长从长到短）按次序排列，电磁波可以分为：长波、中波、短波、超短波、微波、远红外线、红外线、可见光、紫外线、X射线、γ射线、宇宙射线。以可见光为界，频率低于（波长长于）可见光的电磁波对人体产生的主要是热效应，频率高于可见光的射线对人体主要产生化学效应。','借钱1122334fgh',true);


INSERT INTO T_PALLAS_TEXT_INDEX_001 VALUES(324,3345,45580,321.34,454.68,213.46,315.67,1289.38,'2019-07-18','2019-0712-09 24:00:00','Gamma rays are very penetrating and they are electromagnetic waves with very short wavelength. 
Gamma radiation, like x-rays, can penetrate the human body and buildings, harming people at great distances. 
The universe, nature can produce a lot of radioactive materials but the harm is not too big, only the nuclear explosion or nuclear power plant accident leakage of radioactive materials can cause casualties on a large scale. 
Electromagnetic wave is a very common radiation, the impact on the human body is mainly determined by the power (and field strength) and frequency. 
The radio wave used for communication is the electromagnetic wave with lower frequency. If the frequency is arranged in order from low to high (wavelength from long to short), the electromagnetic wave can be divided into: long wave, medium wave, short wave, ultra-short wave, microwave, far infrared ray, infrared ray, visible light, ultraviolet ray, X ray, gamma ray, cosmic ray. 
With visible light as the boundary, the electromagnetic wave with frequency lower than (wavelength longer than) visible light mainly produces thermal effect on human body, while the radiation with frequency higher than visible light mainly produces chemical effect on human body.','发!生fdf的借口 sd',FALSE);





--除了varchar类型外其他数据类型列是否能创建全文索引
DROP INDEX TEXTINDEX_PALLAS_001 IF EXISTS;


CREATE FULLTEXT INDEX TEXTINDEX_PALLAS_001 ON T_PALLAS_TEXT_INDEX_001(tvarchar);

DROP INDEX TEXTINDEX_PALLAS_001 IF EXISTS;

CREATE FULLTEXT INDEX TEXTINDEX_PALLAS_001 ON T_PALLAS_TEXT_INDEX_001(tsmallint);





--创建多列的全文索引（其中包括各种数据类型）
DROP INDEX TEXTINDEX_PALLAS_002 IF EXISTS;

CREATE FULLTEXT INDEX TEXTINDEX_PALLAS_002 ON T_PALLAS_TEXT_INDEX_001(tvarchar,tsmallint);





--在hdfs表上创建全文索引，查看是否能创建成功
DROP TABLE T_PALLAS_TEXT_INDEX_002 IF EXISTS CASCADE;
DROP INDEX TEXTINDEX_PALLAS_003 IF EXISTS;

CREATE TABLE T_PALLAS_TEXT_INDEX_002(
   tsmallint SMALLINT,
   tinteger INTEGER,
   tbigint BIGINT,
   treal REAL,
   tdouble DOUBLE,
   tfloat FLOAT,
   tdecimal DECIMAL(6,2),
   tnumeric NUMERIC(6,2),
   tdate DATE,
   ttimestamp TIMESTAMP,
   tvarchar VARCHAR(2000),
   tchar CHAR(20),
   tboolean BOOLEAN
);

INSERT INTO T_PALLAS_TEXT_INDEX_002 VALUES(123,2343,23145,321.32,454.65,213.44,315.65,1289.32,'2019-06-17','2019-06-08 23:12:20',
'此外，宇宙射线每时每刻都在地球上引起核反应。自然界的碳14大部分是宇宙射线中的中子轰击氮14产生的。1919年英国的E。卢瑟福用天然放射性物质的α粒子轰击氮原子核，首次用人工方式实现了核反应。30年代初加速器的出现和40年代初反应堆的建成，为研究核反应提供了强有力的工具。已能将质子加速到5×10^5兆电子伏，将铀原子核加速到约9×10^4兆电子伏，并能获得介子束。高分辨率半导体探测器的使用，
大大提高了测量核辐射能量的精度。核电子学和计算机技术的发展，从根本上改善了数据的获 取和处理能力。在过去半个多世纪里，研究过的核反应类型数以千计，制备出了自然界不存在的放射性核素约2000种,发现了300余种基本粒子,获得了有关核素性质、核转变规律、核结构、基本粒子以及自然界四种相互作用的规律和相互联系的大量知识。In addition, cosmic rays cause nuclear reactions on earth all the time. Most natural carbon-14 is produced by bombarding nitrogen-14 with neutrons in cosmic rays. E of England in 1919. Rutherford first engineered a nuclear reaction by bombarding nitrogen nuclei with alpha particles of natural radioactive material. The advent of accelerators in the early 1930s and reactors in the early 1940s provided powerful tools for studying nuclear reactions. It has been able to accelerate protons to 5 x 10^5 mev, uranium nuclei to about 9 x 10^4 mev, and to get muon beams. The use of high resolution semiconductor detector greatly improves the accuracy of measuring nuclear radiation energy. The development of nuclear electronics and computer technology has fundamentally improved data acquisition and processing capacity. In the past more than half a century, has studied the reaction type thousands, the preparation of the radionuclide 2000 kind of nature does not exist, found more than 300 kinds of fundamental particles, acquired about the nature of the nuclide, nuclear transformation rule, nuclear structure, elementary particles, and the rule of four kinds of interaction between nature and connect with each other a lot of knowledge.','dbsakjds的撒回家看^&*%^ dsahjk圣诞节',TRUE);

INSERT INTO T_PALLAS_TEXT_INDEX_002 VALUES(322,3343,45578,321.32,454.65,213.44,315.65,1289.32,'2019-06-18','2019-06-09 09:08:06','γ射线的穿透力很强，是一种波长很短的电磁波。γ辐射和X射线相似，能穿透人体和建筑物，危害距离远。宇宙、自然界能产生放射性的物质不少但危害都不太大，只有核爆炸或核电站事故泄漏的放射性物质才能大范围地对人员造成伤亡。
电磁波是很常见的辐射，对人体的影响主要由功率（与场强有关）和频率决定。通讯用的无线电波是频率较低的电磁波，如果按照频率从低到高（波长从长到短）按次序排列，电磁波可以分为：长波、中波、短波、超短波、微波、远红外线、红外线、可见光、紫外线、X射线、γ射线、宇宙射线。以可见光为界，频率低于（波长长于）可见光的电磁波对人体产生的主要是热效应，频率高于可见光的射线对人体主要产生化学效应。Gamma rays are very penetrating and they are electromagnetic waves with very short wavelength. Gamma radiation, like x-rays, can penetrate the human body and buildings, harming people at great distances. The universe, nature can produce a lot of radioactive materials but the harm is not too big, only the nuclear explosion or nuclear power plant accident leakage of radioactive materials can cause casualties on a large scale. Electromagnetic wave is a very common radiation, the impact on the human body is mainly determined by the power (and field strength) and frequency. The radio wave used for communication is the electromagnetic wave with lower frequency. If the frequency is arranged in order from low to high (wavelength from long to short), the electromagnetic wave can be divided into: long wave, medium wave, short wave, ultra-short wave, microwave, far infrared ray, infrared ray, visible light, ultraviolet ray, X ray, gamma ray, cosmic ray. With visible light as the boundary, the electromagnetic wave with frequency lower than (wavelength longer than) visible light mainly produces thermal effect on human body, while the radiation with frequency higher than visible light mainly produces chemical effect on human body.','发!生fdf的借口 sd',FALSE);

CREATE fulltext INDEX TEXTINDEX_PALLAS_003 ON T_PALLAS_TEXT_INDEX_002(tvarchar);





--contains过滤器的第一个参数为全文索引的列和不为全文索引的列时，是否能执行成功，且结果是否正确
DROP INDEX TEXTINDEX_PALLAS_004 IF EXISTS;

CREATE FULLTEXT INDEX TEXTINDEX_PALLAS_004 ON T_PALLAS_TEXT_INDEX_001(tvarchar);

SELECT * FROM T_PALLAS_TEXT_INDEX_001 WHERE CONTAINS(tvarchar,'"自然界"') order by tsmallint,tinteger;

SELECT * FROM T_PALLAS_TEXT_INDEX_001 WHERE CONTAINS(tinteger,'"核反应"') order by tinteger,tvarchar;





--contains过滤器的第二个参数如果不包含逻辑操作符，检索目标分别用单引号、双引号、单双引号混合的方式括起来，测试是否能执行成功，且结果是否正确
DROP INDEX TEXTINDEX_PALLAS_005 IF EXISTS;

CREATE FULLTEXT INDEX TEXTINDEX_PALLAS_005 ON T_PALLAS_TEXT_INDEX_001(tvarchar);

SELECT * FROM T_PALLAS_TEXT_INDEX_001 WHERE CONTAINS(tvarchar,'"自然界"') order by tsmallint,tinteger;

SELECT * FROM T_PALLAS_TEXT_INDEX_001 WHERE CONTAINS(tvarchar,'自然界') order by tsmallint,tinteger;

SELECT * FROM T_PALLAS_TEXT_INDEX_001 WHERE CONTAINS(tvarchar,"自然界") order by tsmallint,tinteger;



--全文索引中的完全匹配和前缀匹配
SELECT * FROM T_PALLAS_TEXT_INDEX_001 WHERE CONTAINS(tvarchar,'"核*"') order by tsmallint,tinteger;

SELECT * FROM T_PALLAS_TEXT_INDEX_001 WHERE CONTAINS(tvarchar,'"自然*" or "圣诞*"') order by tsmallint,tinteger;



--contains过滤器中第二个参数中包含多个and和or的操作符，测试能否执行成功，且结果是否正确

SELECT * FROM T_PALLAS_TEXT_INDEX_001 WHERE CONTAINS(tvarchar,'"自然*" or "核反应" and "红外线" and "human" or "electromagnetic"') order by tsmallint,tinteger;






--多查询条件的情况，如同时存在普通索引跟全文索引，普通索引跟全文索引是相同的列，普通索引中包含全文索引的列
DROP INDEX TEXTINDEX_PALLAS_006 IF EXISTS;
DROP INDEX TEXTINDEX_PALLAS_007 IF EXISTS;
DROP INDEX TEXTINDEX_PALLAS_008 IF EXISTS;
DROP INDEX TEXTINDEX_PALLAS_009 IF EXISTS;

CREATE FULLTEXT INDEX TEXTINDEX_PALLAS_006 ON T_PALLAS_TEXT_INDEX_001(tvarchar);

CREATE INDEX TEXTINDEX_PALLAS_007 ON T_PALLAS_TEXT_INDEX_001(tvarchar);

SELECT * FROM T_PALLAS_TEXT_INDEX_001 WHERE CONTAINS(tvarchar,'"自然*" or "核反应" and "红外线" and "human" or "electromagnetic" and "泄漏" or "化学" and "frequency"') AND tinteger>2000 AND tnumeric>0 order by tsmallint,tinteger;


CREATE FULLTEXT INDEX TEXTINDEX_PALLAS_008 ON T_PALLAS_TEXT_INDEX_001(tvarchar);

CREATE INDEX TEXTINDEX_PALLAS_009 ON T_PALLAS_TEXT_INDEX_001(tvarchar,tinteger,tdate,tfloat);

SELECT * FROM T_PALLAS_TEXT_INDEX_001 WHERE CONTAINS(tvarchar,'"自然*" or "核反应" and "红外线" and "human" or "electromagnetic" and "泄漏" or "化学" and "frequency"') AND tinteger>2000 AND tnumeric>0 order by tsmallint,tinteger;