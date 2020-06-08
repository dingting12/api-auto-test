--Description:update
--Date：2020-06-05
--Author：耿晨雨


connect admin/123456


set timing on

set ECHO ON

set WHENEVER_SQLERROR CONTINUE

-- 清空环境
drop table P1000_CY_UPDATE					if exists;
drop index TSMALLINT_INDEX 				 	if exists;
drop index TINTEGER_INDEX 				 	if exists;
drop index TBIGINT_INDEX 				 	if exists;
drop index TREAL_INDEX 					 	if exists;
drop index TDOUBLE_INDEX 				 	if exists;
drop index TFLOAT_INDEX 				 	if exists;
drop index TDECIMAL_INDEX 				 	if exists;
drop index TNUMERIC_INDEX 				 	if exists;
drop index TDATE_INDEX 					 	if exists;
drop index TTIMESTAMP_INDEX 			 	if exists;
drop index TBOOL_INDEX 					 	if exists;
drop index TCHAR_INDEX 					 	if exists;
drop index TVARCHAR_INDEX 				 	if exists;
drop index SINT_BINT_REAL_DOU_FL_DEC_INDEX 	if exists;


-- 复制数据表，执行update操作使用 
create table P1000_CY_UPDATE as (select * from P1000)with data ;

-- 更新SMALLINT类型的数据，单个条件，无索引，更新条数为 9894
UPDATE P1000_CY_UPDATE set TSMALLINT=10 where TSMALLINT=257;

-- 创建SMALLINT类型单列索引
CREATE index TSMALLINT_INDEX on P1000_CY_UPDATE(TSMALLINT);

-- 更新SMALLINT类型的数据，单个条件，条件列为索引列，更新条数为 9894
UPDATE P1000_CY_UPDATE set TSMALLINT=257 where TSMALLINT=10;

-- 更新INTEGER类型的数据，单个条件，无索引，更新条数为 1031
UPDATE P1000_CY_UPDATE set TINTEGER=10 where TINTEGER=725415;

-- 创建INTEGER类型单列索引
create index TINTEGER_INDEX on 	P1000_CY_UPDATE(TINTEGER);

-- 更新INTEGER类型的数据，单个条件，条件列为索引列，更新条数为 1031
UPDATE P1000_CY_UPDATE set TINTEGER=725415 where TINTEGER=10;

-- 更新BIGINT类型的数据，单个条件，无索引，更新条数为 1004
UPDATE P1000_CY_UPDATE set TBIGINT=10000 where TBIGINT=731238745177;

-- 创建BIGINT类型单列索引
create index TBIGINT_INDEX on P1000_CY_UPDATE(TBIGINT);

-- 更新BIGINT类型的数据，单个条件，条件列为索引列，更新条数为 1004
UPDATE P1000_CY_UPDATE set TBIGINT=731238745177 where TBIGINT=10000;

-- 更新REAL类型的数据，单个条件，无索引，更新条数为 406
UPDATE P1000_CY_UPDATE set TREAL=10.47 where TREAL=8638.47;

-- 创建REAL类型单列索引
create index TREAL_INDEX on P1000_CY_UPDATE(TREAL);

-- 更新REAL类型的数据，单个条件，条件列为索引列，更新条数为 406
UPDATE P1000_CY_UPDATE set TREAL=8638.47 where TREAL=10.47;

-- 更新DOUBLE类型的数据，单个条件，无索引，更新条数为 354
UPDATE P1000_CY_UPDATE set TDOUBLE=10.57 where TDOUBLE=8633.57;

-- 创建DOUBLE类型单列索引
create index TDOUBLE_INDEX on P1000_CY_UPDATE(TDOUBLE);

-- 更新DOUBLE类型的数据，单个条件，条件列为索引列，更新条数为354
UPDATE P1000_CY_UPDATE set TDOUBLE=8633.57 where TDOUBLE=10.57;

-- 更新FLOAT类型的数据，单个条件，无索引，更新条数为186，为了调试case临时加上单引号查询
UPDATE P1000_CY_UPDATE set TFLOAT='10.39' where TFLOAT='6408.39';

-- 创建FLOAT类型单列索引
create index TFLOAT_INDEX on P1000_CY_UPDATE(TFLOAT);

-- 更新FLOAT类型的数据，单个条件，条件列为索引列，更新条数为186，为了调试case临时加上单引号查询
UPDATE P1000_CY_UPDATE set TFLOAT='6408.39' where TFLOAT='10.39';

-- 更新DECIMAL类型的数据，单个条件，无索引，更新条数为300
UPDATE P1000_CY_UPDATE set TDECIMAL=10.13 where TDECIMAL=5252.13;

-- 创建DECIMAL类型单列索引
create index TDECIMAL_INDEX on P1000_CY_UPDATE(TDECIMAL);

-- 更新DECIMAL类型的数据，单个条件，条件列为索引列，更新条数为300
UPDATE P1000_CY_UPDATE set TDECIMAL=5252.13 where TDECIMAL=10.13;

-- 更新NUMERIC类型的数据，单个条件，无索引，更新条数为13
UPDATE P1000_CY_UPDATE set TNUMERIC=10.2450 where TNUMERIC=325.2450;

-- 创建NUMERIC类型单列索引
create index TNUMERIC_INDEX on P1000_CY_UPDATE(TNUMERIC);

-- 更新NUMERIC类型的数据，单个条件，条件列为索引列，更新条数为13
UPDATE P1000_CY_UPDATE set TNUMERIC=325.2450 where TNUMERIC=10.2450;

-- 更新DATE类型的数据，单个条件，无索引，更新条数为384
UPDATE P1000_CY_UPDATE set TDATE='2050-02-06' where TDATE='1995-02-06';

-- 创建DATE类型单列索引
create index TDATE_INDEX on P1000_CY_UPDATE(TDATE);

-- 更新DATE类型的数据，单个条件，条件列为索引列，更新条数为384
UPDATE P1000_CY_UPDATE set TDATE='1995-02-06' where TDATE='2050-02-06';

-- 更新TIMESTAMP类型的数据，单个条件，无索引，更新条数为1
UPDATE P1000_CY_UPDATE set TTIMESTAMP='2015-01-22 19:27:39.0' where TTIMESTAMP='2011-01-22 19:27:39.0';

-- 创建TIMESTAMP类型单列索引
create index TTIMESTAMP_INDEX on P1000_CY_UPDATE(TTIMESTAMP);

-- 更新TIMESTAMP类型的数据，单个条件，条件列为索引列，更新条数为1
UPDATE P1000_CY_UPDATE set TTIMESTAMP='2011-01-22 19:27:39.0' where TTIMESTAMP='2015-01-22 19:27:39.0';

-- 更新BOOLEAN类型的数据，单个条件，无索引，更新条数为10000000
UPDATE P1000_CY_UPDATE set TBOOL=false where TBOOL=TRUE;

-- 创建BOOLEAN类型单列索引
create index TBOOL_INDEX on P1000_CY_UPDATE(TBOOL);

-- 更新BOOLEAN类型的数据，单个条件，条件列为索引列，更新条数为10000000
UPDATE P1000_CY_UPDATE set TBOOL=TRUE where TBOOL=false;

-- 更新CHAR类型的数据，单个条件，无索引，更新条数为989
UPDATE P1000_CY_UPDATE set TCHAR='L8vkenCPnzttqb8zxnJ2TkxwfE6luKcLO4hGRubfiD6FEyVksl1' where TCHAR='L8vkenCPnzttqb8zxnJ2TkxwfE6luKcLO4hGRubfiD6FEyVksl';

-- 创建CHAR类型单列索引
create index TCHAR_INDEX on P1000_CY_UPDATE(TCHAR);

-- 更新CHAR类型的数据，单个条件，条件列为索引列，更新条数为989
UPDATE P1000_CY_UPDATE set TCHAR='L8vkenCPnzttqb8zxnJ2TkxwfE6luKcLO4hGRubfiD6FEyVksl' where TCHAR='L8vkenCPnzttqb8zxnJ2TkxwfE6luKcLO4hGRubfiD6FEyVksl1';

-- 更新VARCHAR类型的数据，单个条件，无索引，更新条数为969
UPDATE P1000_CY_UPDATE set TVARCHAR='F8UDC4m0NBbTom475NCKOFbZIpi62DxtdqvKPBrR6Sda2sc1NeaeqHXEeY1WxsDunXWAaaDCPnCunZnFogT5vgWPmIENYRBOUcdE1' where TVARCHAR='F8UDC4m0NBbTom475NCKOFbZIpi62DxtdqvKPBrR6Sda2sc1NeaeqHXEeY1WxsDunXWAaaDCPnCunZnFogT5vgWPmIENYRBOUcdE';

-- 创建VARCHAR类型单列索引
create index TVARCHAR_INDEX on P1000_CY_UPDATE(TVARCHAR);

-- 更新VARCHAR类型的数据，单个条件，条件列为索引列，更新条数为969
UPDATE P1000_CY_UPDATE set TVARCHAR='F8UDC4m0NBbTom475NCKOFbZIpi62DxtdqvKPBrR6Sda2sc1NeaeqHXEeY1WxsDunXWAaaDCPnCunZnFogT5vgWPmIENYRBOUcdE' where TVARCHAR='F8UDC4m0NBbTom475NCKOFbZIpi62DxtdqvKPBrR6Sda2sc1NeaeqHXEeY1WxsDunXWAaaDCPnCunZnFogT5vgWPmIENYRBOUcdE1';


drop index TINTEGER_INDEX 				 	if exists;
drop index TBIGINT_INDEX 				 	if exists;
drop index SINT_BINT_REAL_DOU_FL_DEC_INDEX	if exists;

-- 更新包含SMALLINT、INTEGER、BIGINT、REAL、DOUBLE、FLOAT和DECIMAL类型的数据，单个条件，无索引，更新条数为965
update P1000_CY_UPDATE set TSMALLINT=10 ,TINTEGER=100 ,TBIGINT=101 ,TREAL=10.1,TDOUBLE=10.2,TFLOAT=10.5 ,TDECIMAL=100.011 where TINTEGER=7877248;


-- 创建INTEGER类型单列索引
create index TINTEGER_INDEX on 	P1000_CY_UPDATE(TINTEGER);

-- 更新包含SMALLINT、INTEGER、BIGINT、REAL、DOUBLE、FLOAT和DECIMAL类型的数据，单个条件，条件列为索引列，更新条数为965
update P1000_CY_UPDATE set TSMALLINT=20 ,TINTEGER=68 ,TBIGINT=201 ,TREAL=20.1,TDOUBLE=20.2,TFLOAT=20.5 ,TDECIMAL=200.011 where TINTEGER=100;

-- 更新包含所有类型的数据，单个条件，无索引，更新条数为1046
update P1000_CY_UPDATE set TSMALLINT=10 ,TINTEGER=100 ,TBIGINT=1000 ,TREAL=10.1 ,TDOUBLE=10.2 ,TFLOAT=10.5 ,TDECIMAL=100.011 ,TNUMERIC=200.022 ,TDATE='2019-01-01' ,TTIMESTAMP='2019-01-01 20:30:10' ,TBOOL=true ,TCHAR='zhang' ,TVARCHAR='zhangsan' where TBIGINT=85284992681;

-- 创建BIGINT类型单列索引
create index TBIGINT_INDEX on P1000_CY_UPDATE(TBIGINT);

-- 更新包含所有类型的数据，单个条件，条件列为索引列
update P1000_CY_UPDATE set TSMALLINT=257 ,TINTEGER=200 ,TBIGINT=2000 ,TREAL=20.1 ,TDOUBLE=20.2 ,TFLOAT=20.5 ,TDECIMAL=200.011 ,TNUMERIC=300.022 ,TDATE='2020-01-01' ,TTIMESTAMP='2020-01-01 20:30:10' ,TBOOL=false ,TCHAR='li' ,TVARCHAR='lisi' where TBIGINT=1000;


-- 更新包含SMALLINT、BIGINT、REAL、DOUBLE、FLOAT和DECIMAL类型的数据，单个条件，无索引，更新条数为965
update P1000_CY_UPDATE set TSMALLINT=10 ,TBIGINT=101 ,TREAL=10.1,TDOUBLE=10.2,TFLOAT=10.5 ,TDECIMAL=100.011 where TINTEGER=7877248;

-- 创建更新列的二级索引，包含SMALLINT、BIGINT、REAL、DOUBLE、FLOAT和DECIMAL类型
create index SINT_BINT_REAL_DOU_FL_DEC_INDEX on P1000_CY_UPDATE(TSMALLINT,TBIGINT,TREAL,TDOUBLE,TFLOAT,TDECIMAL);

-- 更新包含SMALLINT、BIGINT、REAL、DOUBLE、FLOAT和DECIMAL类型的数据，单个条件，更新列为索引列，更新条数为965
update P1000_CY_UPDATE set TSMALLINT=20 ,TINTEGER=68 ,TBIGINT=201 ,TREAL=20.1,TDOUBLE=20.2,TFLOAT=20.5 ,TDECIMAL=200.011 where TINTEGER=10;


drop index TSMALLINT_INDEX if exists;
drop index TDOUBLE_INDEX if exists;
drop index TDATE_INDEX if exists;
drop index TVARCHAR_INDEX if exists;

-- 更新SMALLINT类型的数据，无条件，无索引，更新条数为数据条数
UPDATE P1000_CY_UPDATE set TSMALLINT=10;


-- 创建SMALLINT类型单列索引
CREATE index TSMALLINT_INDEX on P1000_CY_UPDATE(TSMALLINT);

-- 更新SMALLINT类型的数据，无条件，有索引，更新条数为数据条数
UPDATE P1000_CY_UPDATE set TSMALLINT=100;

-- 更新DOUBLE类型的数据，无条件，无索引，更新条数为数据条数
UPDATE P1000_CY_UPDATE set TDOUBLE=10.01;

-- 创建DOUBLE类型单列索引
create index TDOUBLE_INDEX on P1000_CY_UPDATE(TDOUBLE);

-- 更新DOUBLE类型的数据，无条件，有索引，更新条数为数据条数
UPDATE P1000_CY_UPDATE set TDOUBLE=20.01;

-- 更新DATE类型的数据，无条件，无索引，更新条数为数据条数
UPDATE P1000_CY_UPDATE set TDATE='2019-01-01';

-- 创建DATE类型单列索引
create index TDATE_INDEX on P1000_CY_UPDATE(TDATE);

-- 更新DATE类型的数据，无条件，有索引，更新条数为数据条数
UPDATE P1000_CY_UPDATE set TDATE='2018-01-01';

-- 更新VARCHAR类型的数据，无条件，无索引，更新条数为数据条数
UPDATE P1000_CY_UPDATE set TVARCHAR='lisi';

-- 创建VARCHAR类型单列索引
create index TVARCHAR_INDEX on P1000_CY_UPDATE(TVARCHAR);

-- 更新VARCHAR类型的数据，无条件，有索引，更新条数为数据条数
UPDATE P1000_CY_UPDATE set TVARCHAR='wangwu';