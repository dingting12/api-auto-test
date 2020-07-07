connect admin/123456

drop table if exists t_external_ldbdist_1111;
create external table t_external_ldbdist_111
(
    a1 varchar(64001)
)location('LDBDIST_URL/csv/varchar_001.csv')
format 'csv' (delimiter ',');
