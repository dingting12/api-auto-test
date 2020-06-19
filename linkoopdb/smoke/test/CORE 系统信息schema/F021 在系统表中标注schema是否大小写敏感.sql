DROP DATABASE LINK MYSQL_LINK IF  EXISTS CASCADE;

CREATE DATABASE LINK MYSQL_LINK CONNECT TO 'test' IDENTIFIED BY '123456' USING 'jdbc:mysql://192.168.1.72:3306/studio_test' PROPERTIES ('caseSensitive':'true');

select IS_CASE_SENSITIVE from INFORMATION_SCHEMA.SYSTEM_SCHEMAS where TABLE_SCHEM='MYSQL_LINK';