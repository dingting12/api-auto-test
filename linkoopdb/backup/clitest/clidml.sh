#!/bin/bash
host=node4
tbl=simpletest
~/linkoopdb/linkoopdb_current/bin/ldb-client.sh ${host} admin 123456 1> $0.output<<EOF
\t false
drop table ${tbl} if exists;
create table ${tbl} (id integer,name varchar(10));
insert into ${tbl} values (1,'张三'),(2,'lisi'),(3,'王五');
select * from ${tbl} ORDER BY id;
update ${tbl} set name = '赵六' where id = 3;
select name FROM ${tbl} ORDER BY id;
DELETE FROM ${tbl} WHERE id = 1;
select id FROM ${tbl} ORDER BY id;
drop table ${tbl} if exists;
EOF
