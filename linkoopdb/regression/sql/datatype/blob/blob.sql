-- Description：blob data type
-- Date：2020-06-12
-- Author：李爱敏

set echo on
set timing on

--验证BLOB数据类型
--如果表已存在，则先删除
drop table T_TYPE_BLOB1 if exists;
drop table T_TYPE_BLOB2 if exists;
drop table T_TYPE_BLOB3 if exists;

create table T_TYPE_BLOB1 (a1 blob(100),a2 blob(5K),a3 blob(5M),a4 blob(5G));
insert into T_TYPE_BLOB1 values ('abcdef','aaaaaaaa','bbbbbbbbbb','ccccccccccccccc');
select * from T_TYPE_BLOB1;

--验证32个lob列
create table T_TYPE_BLOB2 (a1 blob(100),a2 blob(5K),a3 blob(5M),a4 blob(1G),a5 clob(100),a6 clob(5K),a7 clob(5M),a8 clob(1G),a9 blob(100),a10 blob(100),a11 blob(100),a12 blob(100),a13 blob(100),a14 blob(100),a15 blob(100),a16 blob(100),a17 blob(100),a18 blob(100),a19 blob(100),a20 clob(100),a21 clob(5K),a22 clob(5K),a23 clob(5K),a24 clob(5K),a25 clob(5K),a26 clob(5K),a27 clob(5K),a28 clob(5K),a29 clob(5K),a30 blob(5M),a31 blob(5M),a32 blob(5M));
insert into T_TYPE_BLOB2 values ('aaaaaaaa','bbbbbbbbbb','ccccccccccccccc','ddddddddd','eeeeee','ffffff','ggggggggg','hhhhhhhh','iiiiiii','jjjjjjjj','kkkkkkkkk','lllllllll','mmmmmmmmmm','nnnnnnnn','oooooooo','ppppppp','qqqqqqq','rrrrr','ssssss','tttttt','uuuuuuu','vvvvvv','wwwwwww','xxxxx','yyyyyy','zzzzzz','aaaaa','bbbbbb','cccccc','ddddddd','eeeeeee','fffffff');
select * from T_TYPE_BLOB2;

--验证lob列超过32个，是否报错
create table T_TYPE_BLOB3 (a1 blob(100),a2 blob(5K),a3 blob(5M),a4 blob(1G),a5 clob(100),a6 clob(5K),a7 clob(5M),a8 clob(1G),a9 blob(100),a10 blob(100),a11 blob(100),a12 blob(100),a13 blob(100),a14 blob(100),a15 blob(100),a16 blob(100),a17 blob(100),a18 blob(100),a19 blob(100),a20 clob(100),a21 clob(5K),a22 clob(5K),a23 clob(5K),a24 clob(5K),a25 clob(5K),a26 clob(5K),a27 clob(5K),a28 clob(5K),a29 clob(5K),a30 blob(5M),a31 blob(5M),a32 blob(5M),a33 blob(5M));
insert into T_TYPE_BLOB3 values ('aaaaaaaa','bbbbbbbbbb','ccccccccccccccc','ddddddddd','eeeeee','ffffff','ggggggggg','hhhhhhhh','iiiiiii','jjjjjjjj','kkkkkkkkk','lllllllll','mmmmmmmmmm','nnnnnnnn','oooooooo','ppppppp','qqqqqqq','rrrrr','ssssss','tttttt','uuuuuuu','vvvvvv','wwwwwww','xxxxx','yyyyyy','zzzzzz','aaaaa','bbbbbb','cccccc','ddddddd','eeeeeee','fffffff','gggg');
select * from T_TYPE_BLOB3;


--最后删除创建的表
drop table T_TYPE_BLOB1 if exists;
drop table T_TYPE_BLOB2 if exists;
drop table T_TYPE_BLOB3 if exists;