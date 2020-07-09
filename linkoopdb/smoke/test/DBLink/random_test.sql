set echo on

drop stream model_em_predict;

create stream model_em_predict(
features double ARRAY
) properties(
'type':'source',
'connector':'kafka',
'version':'0.10',
'topic':'model_em_predict',
'bootstrap.servers':'node74:29096',
'zookeeper.connect':'node72,node73,node74:2181/linkoopdb/luyao',
'group.id':'model_em_predict_010',
'format':'json'
);


alter stream model_em_predict set properties('group.id':'12random_str');