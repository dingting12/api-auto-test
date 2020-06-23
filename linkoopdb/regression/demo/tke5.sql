set echo on

__internal__ create hdfs file HDFS_URL/aa.txt
(fadfafasdfsdafsfdsfdsafdsafdsa,
fasfsaffdsfadsfafadsfadsfaafsdfadsfad
) rows 3;

__internal__ create hdfs file HDFS_URL/bb.txt
(fadfafasdfsdafsfdsfdsafdsafdsa,
fasfsaffdsfadsfafadsfadsfaafsdfadsfad
);

__internal__ create hdfs file HDFS_URL/cc.txt from fs file data/test.dat;
