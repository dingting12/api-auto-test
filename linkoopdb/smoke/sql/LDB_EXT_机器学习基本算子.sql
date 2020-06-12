--    Description: 测试机器学习算子
--    Date:         2020-06-11
--    Author:       丁婷

-- 测试decision tree

DROP MODEL M_Decision_Tree_001 IF EXISTS;
DROP TABLE T_Decision_Tree_001 IF EXISTS CASCADE;
DROP TABLE T_Decision_Tree_PREDICT_001 IF EXISTS CASCADE;

CREATE TABLE T_Decision_Tree_001(
LABEL DOUBLE, 
FEATURES DOUBLE ARRAY
);

INSERT INTO T_Decision_Tree_001 VALUES
 (0, ARRAY[1, 0, 0]),
 (0, ARRAY[2, 0, 0]),
 (0, ARRAY[3, 0, 0]),
 (0, ARRAY[4, 0, 0]),
 (1, ARRAY[0, 1, 0]),
 (1, ARRAY[0, 2, 0]),
 (1, ARRAY[0, 3, 0]),
 (1, ARRAY[0, 4, 0]),
 (2, ARRAY[0, 0, 1]),
 (2, ARRAY[0, 0, 2]),
 (2, ARRAY[0, 0, 3]),
 (2, ARRAY[0, 0, 4]);
 
CREATE TABLE T_Decision_Tree_PREDICT_001(
ID VARCHAR(20),
FEATURES DOUBLE ARRAY
 );
 
 
INSERT INTO T_Decision_Tree_PREDICT_001 VALUES
('ls', ARRAY[0.0, 0.0, 9.0]),
('zs', ARRAY[8.0, 0.0, 0.0]);
 
CREATE MODEL M_Decision_Tree_001 AS DECISION_TREE_TRAIN(T_Decision_Tree_001);
 
SELECT * FROM DECISION_TREE_PREDICT(M_Decision_Tree_001, (SELECT ID, FEATURES FROM T_Decision_Tree_PREDICT_001 order by ID));
 
UPDATE MODEL M_Decision_Tree_001 as DECISION_TREE_TRAIN(T_Decision_Tree_001,5,32,1,0.0,256,false);
 
SELECT * FROM DECISION_TREE_PREDICT(M_Decision_Tree_001, (SELECT ID, FEATURES FROM T_Decision_Tree_PREDICT_001 order by ID));

DROP MODEL M_Decision_Tree_001 IF EXISTS;
DROP TABLE T_Decision_Tree_001 IF EXISTS CASCADE;
DROP TABLE T_Decision_Tree_PREDICT_001 IF EXISTS CASCADE;


-- 测试als
DROP MODEL M_ALS_MODEL_001 if exists;
DROP TABLE T_ALS_DATA_001 IF EXISTS CASCADE;

CREATE TABLE T_ALS_DATA_001 (userId int, itemId int, rating float, timestamp bigint);

INSERT INTO T_ALS_DATA_001 VALUES ((0, 2, 3.0, 1424380288),(0, 3, 1.0, 1424380288),(0, 5, 2.0, 1424380288),(0, 9, 4.0, 1424380288),(0, 11, 1.0, 1424380288),(0, 12, 2.0, 1424380288),(0, 15, 1.0, 1424380288),(0, 17, 1.0, 1424380288),(0, 19, 1.0, 1424380288),(0, 21, 1.0, 1424380288),(0, 23, 1.0, 1424380288),(0, 26, 3.0, 1424380288),(0, 27, 1.0, 1424380288),(0, 28, 1.0, 1424380288),(0, 29, 1.0, 1424380288),(0, 30, 1.0, 1424380288),(0, 31, 1.0, 1424380288),(0, 34, 1.0, 1424380288),(0, 37, 1.0, 1424380288),(0, 41, 2.0, 1424380288),(0, 44, 1.0, 1424380288),(0, 45, 2.0, 1424380288),(0, 46, 1.0, 1424380288),(0, 47, 1.0, 1424380288),(0, 48, 1.0, 1424380288),(0, 50, 1.0, 1424380288),(0, 51, 1.0, 1424380288),(0, 54, 1.0, 1424380288));

CREATE MODEL M_ALS_MODEL_001 AS ALS_TRAIN(T_ALS_DATA_001);

UPDATE MODEL M_ALS_MODEL_001 AS ALS_TRAIN(T_ALS_DATA_001,10,0.1,10,10,10,false,1.0,false);

select userId,itemId,round(PREDICTION,315) from als_predict(M_ALS_MODEL_001,(select userId,itemId from T_ALS_DATA_001 order by userId,itemId));

DROP MODEL M_ALS_MODEL_001 if exists;
DROP TABLE T_ALS_DATA_001 IF EXISTS CASCADE;


