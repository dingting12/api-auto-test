#!/bin/bash
host=node4
tbl=simpletest
newtbl=simpletestnew
echo $0
~/linkoopdb/linkoopdb_current/bin/ldb-client.sh ${host} admin 123456 1> $0.output<<EOF
\t false
drop table ${tbl} if exists;
create table ${tbl} (id integer,name varchar(10));
alter table ${tbl} rename to ${newtbl};
ALTER TABLE ${newtbl} ALTER COLUMN id SET DATA TYPE SMALLINT;
select * from ${newtbl};
drop table ${newtbl} if exists;
EOF
