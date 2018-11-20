#!/bin/bash
host=192.168.1.91
#tbl=simpletest
~/linkoopdb/linkoopdb_current/bin/ldb-client.sh ${host} admin 123456 1> $0.output<<EOF
\t false
\?
:?
*?
/?
\q
EOF
