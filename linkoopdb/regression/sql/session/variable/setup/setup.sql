--Description:Data preparation
--Date：2020-07-17
--Author：王煜

--记录执行时间
set TIMING off
--返回结果
set TERMOUT on
--是否打印执行的SQL语句
set ECHO ON

--------------------------------------------------------

--dfs表
DROP TABLE t_session_var_dfs IF EXISTS;

CREATE TABLE t_session_var_dfs(tunique BIGINT,tint INT,tvarchar VARCHAR(200),tdouble DOUBLE,tdecimal DECIMAL(10,2),
                               tdate DATE,ttimestamp TIMESTAMP,tsmallint SMALLINT,tbigint BIGINT,tchar CHAR(20),
                               tnumeric NUMERIC(13,6),tfloat FLOAT,treal REAL,tboolean BOOLEAN,tbinary BINARY(100),
                               tvarbinary VARBINARY(100),tbit BIT);

INSERT INTO t_session_var_dfs VALUES(1,-453964439,'d*m0MQelJun',8395834.458193136,98820829.05,'2036-11-08','2020-07-17 17:20:35',-32506,-1659745308,'S%zoij9',3668542.819854,5591242.990233061,2315442.773261026,true,'TetVvr70ow$yz##pCrUzHSfZP5mNRh%atdTCxvH^vtn','nxL*(6KJXD8ba^*Obw07',0);
INSERT INTO t_session_var_dfs VALUES(2,-646501834,'dHRk^Tk*VvHGJ%',4003552.9779974404,79403933.17,'2007-06-21','2020-07-17 17:20:35',-2854,-17822322,'MMG',706533.255953,7659454.752059324,8661026.03624552,false,'dWY3ZTQw3JSv39w#mo%)RvH*T%rt*GfS3qHzf','yjF2K5B*ew*FCUdKQOrW0OfT70ohdKuyo(Y(BfC',0);
INSERT INTO t_session_var_dfs VALUES(3,1206408002,'tpX*$%djR(2Rr^aF4*soW#9fKD^VnxaWu(',4035508.561048575,17469172.39,'2000-11-28','2020-07-17 17:20:35',7612,941592840,'Q*#tj3E*%YQ0uu',9492813.175878,7916216.672929409,5084103.618434176,true,'bpY','FR',0);
INSERT INTO t_session_var_dfs VALUES(4,480464962,'z',5872427.749483647,73490624.43,'2008-02-05','2020-07-17 17:20:35',9,594103461,'6y8J8',335075.383644,4739849.802136333,7691998.306230841,false,'weVBpkH#FY%LIim)kJvf1lVI9B','vq*IZP4IJztGmGv7ALIU',0);
INSERT INTO t_session_var_dfs VALUES(5,535885154,'86f2TIX01U)uJgOyBoz$PKP1TGS7GDn6rfgBIyJ',8231735.393579465,50157354.54,'2027-04-04','2020-07-17 17:20:35',14653,-1618441241,'Wlu2Bng^*fNVK9n',8035644.601666,8796637.08647671,2361183.3127784953,true,'cPTZ3%^iywBNwiiNxM*v(N','ROcQ5#4Hah*d6rvsJSyaCtTrz7YdCWFoYm',1);
INSERT INTO t_session_var_dfs VALUES(6,-244279130,'kSAe%toEg%*YS70nexS(*EN(',453059.4480946924,21490058.45,'1992-05-06','2020-07-17 17:20:35',-973,-446993978,'$0Xp',130877.653202,1651924.295561214,980377.5956944575,false,'c$VXa*wPuCImFac*HKkN4guM3^P','My(M(1^ObTGt',1);
INSERT INTO t_session_var_dfs VALUES(7,-289905985,'2Y%SS%bLZ$X$',6336927.393890423,89243929.96,'2040-03-31','2020-07-17 17:20:35',-2893,2121452207,'oSoZCGa',161486.293798,2792138.7980474443,1277583.1950453892,false,'pM4Z1zFIRH','6L031s#MAV*#i^EZ*Ln#ofbvdB0^5Kblo#f*(U6ONe*',0);
INSERT INTO t_session_var_dfs VALUES(8,-528276827,'dgu3DhTzkpxiwAan45%Yx9##qq120ml5BlppB8jbk6R',5068191.371668093,81005557.58,'2013-12-30','2020-07-17 17:20:35',13836,327265310,'yy',865647.432893,6764301.947637059,3136270.313896088,true,'q5c*nQ*ah%WbkS*F4','D4Nlgf4qg0flgzXOpD6eFKPt*wyGWBCL^MFe#l8mMI27oMN',0);
INSERT INTO t_session_var_dfs VALUES(9,8554543,'jiz5(m',6695234.358959912,45087211.87,'1977-04-20','2020-07-17 17:20:35',-24644,-703153942,'OVsn8zWggoa#%',3000026.957717,9668245.521362236,8357221.539583703,true,'tijhQw7)R%JR**6r$(X#WKgk*bSmr5u$Nzayug8ql7','0Utrk(*D0*tB9mxv)#IUKz',1);
INSERT INTO t_session_var_dfs VALUES(10,724484623,'B7)rqlVvsJRvPcBcG6KaUs%Jy*nblh',6208429.299462363,49217421.38,'2037-12-05','2020-07-17 17:20:35',26981,-395707580,'Cvi)#cHbSWaMeBa96',3628381.917915,2675574.493188462,114852.0965330714,true,'Hn%QJ5t7844KRGlOo7PSwIq(K*NYsa)RhKr','#pSNqnnRFcn57MPKrn',0);
INSERT INTO t_session_var_dfs VALUES(11,1086142124,'AJXz^q6^u7Pb^ktwTfTk6LqS',4335361.516532874,65719875.91,'1994-02-09','2020-07-17 17:20:35',-804,-53032350,'gK#eLjC)ptk',2089072.307768,779808.0104834258,1962509.0821450953,false,'#(29D*ZoeQZt)gr','0o#j4NXQ0mO%(wyuUB5',0);
INSERT INTO t_session_var_dfs VALUES(12,-812075332,'EIhouOz9Db$))ETI4d(pI3S',2334240.347772705,42648573.43,'2033-08-26','2020-07-17 17:20:35',-9804,-668576724,'RVhWkj',9346443.665914,5504667.767519973,8701358.715345578,true,'4NsKKjZZiWv%6mySk89Uy1VF*rtAoKcc','Tvq0QBa3kFi#1GYuauoocSTPtyITSLueYTkg5%vEkW8T8LdTw6',1);
INSERT INTO t_session_var_dfs VALUES(13,-862405980,'jdzjfDR',4127116.053426594,65178430.60,'2006-03-16','2020-07-17 17:20:35',-14636,1576473908,'UA5j',4400144.585537,7931143.820409145,5251593.876100192,true,'XtOahCU)iX%aJRxsbr#Z%3ogyhayaWMEIquP%Ay','c$bC88M7vvN04r*i5i#fnn9DE7ccp%Fu5lf1ixCe8EBHbvd',0);
INSERT INTO t_session_var_dfs VALUES(14,474520099,'#UH%nlgX8)Lbxz#E4w#jDuj$2itBIm',596505.6684445145,6097510.11,'2019-09-05','2020-07-17 17:20:35',21912,-163953057,'7lKl*ZMr*5%PoR^',193243.065239,1986799.9092311827,7831591.166171993,false,'HF#%0Jh93yVv%0$#1*o(','1#5AqdS5tSK)HXR$4eqkAYkTPG%C^NTkbblI1gvw',1);
INSERT INTO t_session_var_dfs VALUES(15,983622507,')1XM',5516873.705163104,29857087.63,'2036-05-14','2020-07-17 17:20:35',-32634,-973623613,'sw#Yh4L(u#m',6815606.849015,529309.8230424672,207424.08666469212,true,'KhA^','%$V9ae#(Ea*k',0);
INSERT INTO t_session_var_dfs VALUES(16,-1059794530,'WBLmydKfWADnPuvCUgzHhaIt09Ai9DkaHrjAO9$1P',9869107.988581365,37344332.34,'1991-01-04','2020-07-17 17:20:35',10377,574960857,'FpZH*($',5503065.234849,8125898.801140503,7937763.929029542,true,'WtTMown108YA%LuyokjkWW$8F5q%i8aKDFYqkxb','$yg#)zP*au3im*pH7yG4D%0%%*BLZEIL8%XcI',0);
INSERT INTO t_session_var_dfs VALUES(17,-1300610592,'ArYapxOSq$%T##^Y',4873143.371257163,34071920.31,'2026-04-18','2020-07-17 17:20:35',32567,-1713883006,'vnPRckqO*MKvIy%US(c',7213976.790016,3575271.4072821387,4792703.562188398,true,'n5wU7','aSvL%P^4)jE19VHM(0RM',1);
INSERT INTO t_session_var_dfs VALUES(18,-1612532486,'bm%#NU4xE)EziF',4371823.930092179,43239632.42,'2013-08-25','2020-07-17 17:20:35',-19747,479903407,'P5gGF',1620246.110595,2851705.7066468005,7722514.387385103,true,'gndztjR7Gj1i2T%','H^VEYG8C%C#tAe%#VS',1);
INSERT INTO t_session_var_dfs VALUES(19,-442315470,'^Mx8%hEVzDiMx*i*7kX#l1km(b',3826937.3446670105,17212654.09,'2025-04-07','2020-07-17 17:20:35',5464,-396575562,'mvoGKS3N1O9zZ7RZvdTR',8845505.781035,4203937.027726319,2716581.04337268,false,'%8UdL27GGbF9','J3nevrlrapQ*Iqe$',1);
INSERT INTO t_session_var_dfs VALUES(20,-657015054,'*)qcRR$S#Mp',7484009.018682263,81164870.69,'1974-10-23','2020-07-17 17:20:35',-18758,-819941608,'Msa(XarP%i#Dexu4d',7853993.358340,3264463.2032110025,1914206.7494400255,true,'q2%#z*H82tc72zrOrAqYJ6YsUQ%ysTs9e6wP%x','E5b*EnP1sF98N6wlq',1);

SELECT * FROM t_session_var_dfs ORDER BY tunique;

SELECT COUNT(*) FROM t_session_var_dfs;

--pallas表
DROP TABLE t_session_var_pallas IF EXISTS;

CREATE TABLE t_session_var_pallas(tunique BIGINT,tint INT,tvarchar VARCHAR(200),tdouble DOUBLE,tdecimal DECIMAL(10,2),
                               tdate DATE,ttimestamp TIMESTAMP,tsmallint SMALLINT,tbigint BIGINT,tchar CHAR(20),
                               tnumeric NUMERIC(13,6),tfloat FLOAT,treal REAL,tboolean BOOLEAN,tbinary BINARY(100),
                               tvarbinary VARBINARY(100),tbit BIT,tclob CLOB,tblob BLOB) engine pallas;

INSERT INTO t_session_var_pallas VALUES(1,-2125315586,'#nCxEgF^j#^8)0eh5fT*#0U4mJL^^#*',3032923.2469458114,62153649.49,'1995-05-07','2020-07-17 17:27:36',-13656,-1063025674,'#wJMwrBOYZpp2XjE',741734.708703,8857773.44615378,8746102.264130196,false,'GjNN^iI)zXaGUM^s%g3O)P#KDT$XACuuTDq0hFUZ9fxoHu)xt','huJn*sb$fLzN',0,'pnE)I)LdvFS1zCjwD#9$JQq6fNngluGWnWPka%WC','Vb3)sF*KmS^j6Y75*FjlFzf^%y2WY80%MXUJIy0');
INSERT INTO t_session_var_pallas VALUES(2,2001162726,'H1*2DxtZLuKaYMQfLN4PdH)*WF*IC',8845479.06921504,92384137.78,'2009-10-20','2020-07-17 17:27:36',1340,436627498,'8*o9MagG*jipB8',1832984.602421,5181862.470002697,4028517.1552687837,false,'aHfAERKfzO*VfMjn4zxRNtFJYNblDyg#im(blvza0','VlK^6Mk%IZk(5*#es*C(4xca)x0',1,'l#*o^%h#)r48ZjP9AOGA*n#tGfiV','zvef%4)CmULL%4aPxw%3*#AkjtLEll*xlJJDs');
INSERT INTO t_session_var_pallas VALUES(3,2100146364,'#W',3401949.2766921837,41109157.33,'2004-12-21','2020-07-17 17:27:36',1972,-1262272161,'OjB(6',2698920.052976,8811334.264110187,2616708.7759991963,false,'DX4cb5#lC$*Q5zYgp6CTJrN','kvedmq)9#^*MCmO',0,'NfQp%6','UW0OnHqUp');
INSERT INTO t_session_var_pallas VALUES(4,-1332325398,'yf5rBlTgaZ*mILV#3w%n6xGSNzQ#oz717wT',3909314.8078924445,24805003.90,'2009-01-22','2020-07-17 17:27:36',17564,-588771438,'uR)6w',9840625.783101,5689635.456664299,9545700.170852922,false,'Hkp47P2sIE','%nU*k49*QSbmw*NLzA)oLUCNcI%t',1,'%JUC4f8gBVkz','Pr)8IzaMRHlz*4TGRDH1ARyJdp');
INSERT INTO t_session_var_pallas VALUES(5,328528106,'RVkMC3HILutfgBaxPLtT0t074spvlmMG5',4130499.969951394,82168289.46,'1973-03-25','2020-07-17 17:27:36',23123,304973917,'W(TGylyX#Vid8',6268831.109408,2918116.803185282,1130163.2049257697,true,'JhCBOF$L#FIjT7v^WB','G#X4to%CJ',1,'*pPyfVbk#K7#pP%FINX$zZ5x4ib*Z6k(%QSmPp78AE3cc$bP#','BBvL3jupgR#7D)#^eqXvEjrKX%nQ4O#dPZNEQw*U5*CySgp(');
INSERT INTO t_session_var_pallas VALUES(6,-799435613,'UTpbMtIFUWtS3FbU^C',5721.02853623028,44376852.98,'2030-03-25','2020-07-17 17:27:36',-23549,-1318818427,'(#0TfDNEL%sYSzO',8667151.268252,6018236.257268038,5461702.463964205,false,'1*rT)xH^MMd*wX','dTZno(uuVe(gxQ',0,'GGDz83KRtf(lq((q6mmSqd#','^JzC$E7J%V^tub*');
INSERT INTO t_session_var_pallas VALUES(7,-216471493,'HOZlULRgkYrC^FmkNW(43iW03rNg27^22#zb26*GB',2475277.478388033,58019236.09,'2022-07-14','2020-07-17 17:27:36',19508,1450579689,'QfFj',6991047.188421,3287247.7288560723,483180.01179590216,false,'0wPB9Q*Zf99cb','H*RPv$pJyokw#hY*^Y#r',0,'8afXMW3oOGAE#ISBtz5L)KymUHMLO*MN','XqM3yG0UPIhgEO#w^tw%dUFKQHsgFNYP');
INSERT INTO t_session_var_pallas VALUES(8,431635603,'tRXvx%SrN8)cFTiJG%8Wau##HU3*vsPyi*oO4OED7p61(U6LE#',3957061.1984991618,90426088.81,'1996-05-30','2020-07-17 17:27:36',29139,-1924201907,'ptwder9q',9176247.064513,7835384.046655695,1723066.7084652875,false,'Vaon5U8K%(1%)8l3hl4X3iQ594*P7Ye*9TfvTwMsLw','M%sHz*i%)K0p0V',1,'^duY538cQzZrZQNF0#2Gqr%*7*1*^tz#fd','5ehB%IpGNQfn3EfL*AM8nC)N)Xl2XQQZH1CwTzK');
INSERT INTO t_session_var_pallas VALUES(9,848509947,'dSqI%l5wie4*Ar*S#pqgMI^vWCtDBnsjzYxrJ)W0TtzDFa%MB',4835639.925666175,78146143.40,'1978-08-21','2020-07-17 17:27:36',-3388,1469249507,'bO(BABUo#l))#f05k6',945821.726813,3451716.924133992,6828224.063599671,false,'OUWwnS*eqNL8SzUA8tj3%p6B#Q45ow(8kXoR7lkO','z9%BPXojeLKOpB#j',0,'H(SgGD)v4o%fXhHImKI#axdD^#Yd%Eqrgxs*','BDljO728FysP%^D#eYLN5m4(G%MgP1McF5yIn');
INSERT INTO t_session_var_pallas VALUES(10,1140139929,'apWvZJfGX$%*Strr',8627586.091078855,81577208.55,'2010-08-22','2020-07-17 17:27:36',-1419,-733945253,'4l)j0eg2Vv)(2Vz',9941253.031332,4873926.206542332,5023132.3703561835,false,'$Gksb5J)K4QjkrFgfrbY7L6NxrrOL))M0q^RvxL)$NUW4','UD6*LGSVXbYBZ#MKngRY0',0,'#^zJZNWlw2','1Txt*KnUM3VYcws%nG5Ptee1zf^mD#Wqg');
INSERT INTO t_session_var_pallas VALUES(11,-2022721230,'1jkqzfrwBW7*qoW',2100045.678711772,77699234.41,'2006-02-04','2020-07-17 17:27:36',3825,2087992392,'WGS#R',4257102.286994,9547359.163196912,8901321.531877028,false,'Q3WIpG7zp8UvV2p9(H*v^6RbT','UxFiNVj^#1sn#f01%7f9htcKc22iM*oaAgPn3E$F',1,'gfC%b(44ypVDeX8A*','D#G)%W6f(3JE');
INSERT INTO t_session_var_pallas VALUES(12,377742016,'wOIXJ',1655572.45300155,33559348.70,'2008-07-02','2020-07-17 17:27:36',13771,1653542849,'Rz',3097105.308631,3982272.1015995,8842683.992273755,true,'MGwAUWDe0wZKs9N16970ARt','^5gAghI)C',0,'GQTAk3U0MDw*qXJ','0');
INSERT INTO t_session_var_pallas VALUES(13,-980560016,'h%1',3593953.3491240214,35413159.48,'1975-06-24','2020-07-17 17:27:36',15093,-1178888781,'E23#9i(2O',4826707.167331,7505727.169939988,7639466.1193206245,true,'IBslo61','^3YG35DLi*22Sznv3lEj9%z2w#1B28rB*iafu^*UNex',1,'7ImHPRoD54BG14#e$JnxB2)GamgTz*0ZapE%8bIPEhg1K','s2X%^6Al4yaOwbojpuYkn1IM)');
INSERT INTO t_session_var_pallas VALUES(14,20782516,'oyVwjz*iXogf8wk#rG%b99U#6pAAHBg1dPs2lR5JoAr8*',1477565.5194978537,11705295.33,'2018-01-19','2020-07-17 17:27:36',7089,1369629574,'Ns',8776419.967475,2925255.958336461,3363957.79457561,true,'DVNSe1Ntmsn79','QxStQiqm%iM8',1,'L*U','P2qzklhmVLoCiN*z3MURn*mnqyhDEQjace#JswRytF5BCTga)');
INSERT INTO t_session_var_pallas VALUES(15,1448327380,'vvV',3536362.008990318,46534899.93,'2037-10-20','2020-07-17 17:27:36',-28008,-1670379083,'lhBy92)nfi',8324484.226861,2462920.320203346,1350562.1654572634,false,'0yUa*','gyXnrqladHu7mgXSiY',1,'4NTm*fOdtZZWB*QBaLb(yn%jpX*m%C$X4qJrnX*3tOW3k*xH','SW57Jwl8xR2oFDCboj()Wx8Hg*YtrhBAIX');
INSERT INTO t_session_var_pallas VALUES(16,316087082,')H6Afkp#X4zsCleoiw48%bpaAnYKP',845859.0340804694,77746866.56,'1993-08-28','2020-07-17 17:27:36',32324,-1037925771,'4HvTc',6096960.700484,7587696.901337427,3591440.211687347,true,'ob5v34fPlbx*tU%wyH4o8JT','g$A$kdZazAV9z',1,'1F','pT9D0UuX%kfP*3j#i^(#eQ');
INSERT INTO t_session_var_pallas VALUES(17,-1987383101,'pBSiBk#3$Kg#ZY9%gEsdcVmpJ(',8609404.75332064,58851464.30,'2035-04-18','2020-07-17 17:27:36',12861,-367355706,'KBda3CR)2KM^',7578448.624213,9096240.51332569,3524210.2555497335,true,'bK5fIPNODWUlu9eSrbCU2B','efElkHLa$z%0',0,'#4B#sB*moSd#vxa','0v9N)N#021nF1ZU41*z)qX*ESU*lYT');
INSERT INTO t_session_var_pallas VALUES(18,592879058,'Ym',8206301.856199356,14826943.91,'2038-05-27','2020-07-17 17:27:36',-339,-986338392,'CiuS#cFYt**C5F9*e%',7505574.015034,4211469.94736182,1757055.068634408,false,'eaQQXF#4#rX9j8P*','oG#RdBtdLQm$7^USUy6k#^IZ)Je)uz4b#',0,'szgS)OAcB08ys8ADBx','it8IZPkJY*ZjbVVAyyhPP%%%ni');
INSERT INTO t_session_var_pallas VALUES(19,1450394597,')bGcbKmuWTyUxcHiUZX4',3380211.800531195,71411435.45,'2033-04-14','2020-07-17 17:27:36',-17772,-2142446497,'4Mb',7565512.423160,7547795.206453732,9834559.762158183,false,'rm49hjofXKIHjdha93XJ*dv(q7%kZf','AfL%%aCQkw',1,'DE3eiblBMX%1yg2ZAnd0H5NzDdeD3QYvrc','(qrYmAJ55t0x5*zxcLMoE');
INSERT INTO t_session_var_pallas VALUES(20,1954310147,'XWo7f9hRDN%h',5907108.695603745,98339822.77,'2010-09-01','2020-07-17 17:27:36',25901,-2115175123,'n#5PZne6NEZejesJiE',3059131.905616,3712879.6230584355,3768921.1678292933,false,'B(L1#FHSwR^Yk3Rap','2rik0dD*^2gCyV11lxQqm85M',1,'Okl','cRTGFyT6K#pBBmC5xeTquraU4eqwpi3Y$NW)LivrJNNyf^$cC');

SELECT * FROM t_session_var_pallas ORDER BY tunique;

SELECT COUNT(*) FROM t_session_var_pallas;

--外部表
DROP TABLE t_session_var_external IF EXISTS;

CREATE EXTERNAL TABLE t_session_var_external(tint INT,tvarchar VARCHAR(200),tdouble DOUBLE,tdecimal DECIMAL(10,2),
                                             tdate DATE,ttimestamp TIMESTAMP,tsmallint SMALLINT,tbigint BIGINT,tchar CHAR(20),
                                             tnumeric NUMERIC(13,6),tfloat FLOAT,treal REAL,tboolean BOOLEAN,tbinary BINARY(100),
                                             tvarbinary VARBINARY(100),tbit BIT)
LOCATION ('ldbdist://192.168.1.73:54322/testdata_session_var.csv') FORMAT 'csv' (DELIMITER ',');

SELECT * FROM t_session_var_external ORDER BY tint;

SELECT COUNT(*) FROM t_session_var_external;


--dblink

DROP DATABASE LINK link_oracle_session_var IF EXISTS CASCADE;

CREATE DATABASE LINK link_oracle_session_var connect to 'LINKOOPDB' identified by '123456' using 'jdbc:oracle:thin:@192.168.1.72:1521:xe';

DROP TABLE link_oracle_session_var.t_session_var IF EXISTS;

CREATE TABLE link_oracle_session_var.t_session_var(tunique BIGINT,tint INT,tvarchar VARCHAR(200),tdouble DOUBLE,tdecimal DECIMAL(10,2),
                               tdate DATE,ttimestamp TIMESTAMP,tsmallint SMALLINT,tbigint BIGINT,tchar CHAR(20),
                               tnumeric NUMERIC(13,6),tfloat FLOAT,treal REAL,tbinary BINARY(100),
                               tvarbinary VARBINARY(100),tbit BIT);

SELECT * FROM link_oracle_session_var.t_session_var ORDER BY tunique;

INSERT INTO link_oracle_session_var.t_session_var VALUES(1,-453964439,'d*m0MQelJun',8395834.458193136,98820829.05,'2036-11-08','2020-07-17 17:20:35',-32506,-1659745308,'S%zoij9',3668542.819854,5591242.990233061,2315442.773261026,'TetVvr70ow$yz##pCrUzHSfZP5mNRh%atdTCxvH^vtn','nxL*(6KJXD8ba^*Obw07',0)
,(2,-646501834,'dHRk^Tk*VvHGJ%',4003552.9779974404,79403933.17,'2007-06-21','2020-07-17 17:20:35',-2854,-17822322,'MMG',706533.255953,7659454.752059324,8661026.03624552,'dWY3ZTQw3JSv39w#mo%)RvH*T%rt*GfS3qHzf','yjF2K5B*ew*FCUdKQOrW0OfT70ohdKuyo(Y(BfC',0)
,(3,1206408002,'tpX*$%djR(2Rr^aF4*soW#9fKD^VnxaWu(',4035508.561048575,17469172.39,'2000-11-28','2020-07-17 17:20:35',7612,941592840,'Q*#tj3E*%YQ0uu',9492813.175878,7916216.672929409,5084103.618434176,'bpY','FR',0)
,(4,480464962,'z',5872427.749483647,73490624.43,'2008-02-05','2020-07-17 17:20:35',9,594103461,'6y8J8',335075.383644,4739849.802136333,7691998.306230841,'weVBpkH#FY%LIim)kJvf1lVI9B','vq*IZP4IJztGmGv7ALIU',0)
,(5,535885154,'86f2TIX01U)uJgOyBoz$PKP1TGS7GDn6rfgBIyJ',8231735.393579465,50157354.54,'2027-04-04','2020-07-17 17:20:35',14653,-1618441241,'Wlu2Bng^*fNVK9n',8035644.601666,8796637.08647671,2361183.3127784953,'cPTZ3%^iywBNwiiNxM*v(N','ROcQ5#4Hah*d6rvsJSyaCtTrz7YdCWFoYm',1)
,(6,-244279130,'kSAe%toEg%*YS70nexS(*EN(',453059.4480946924,21490058.45,'1992-05-06','2020-07-17 17:20:35',-973,-446993978,'$0Xp',130877.653202,1651924.295561214,980377.5956944575,'c$VXa*wPuCImFac*HKkN4guM3^P','My(M(1^ObTGt',1)
,(7,-289905985,'2Y%SS%bLZ$X$',6336927.393890423,89243929.96,'2040-03-31','2020-07-17 17:20:35',-2893,2121452207,'oSoZCGa',161486.293798,2792138.7980474443,1277583.1950453892,'pM4Z1zFIRH','6L031s#MAV*#i^EZ*Ln#ofbvdB0^5Kblo#f*(U6ONe*',0)
,(8,-528276827,'dgu3DhTzkpxiwAan45%Yx9##qq120ml5BlppB8jbk6R',5068191.371668093,81005557.58,'2013-12-30','2020-07-17 17:20:35',13836,327265310,'yy',865647.432893,6764301.947637059,3136270.313896088,'q5c*nQ*ah%WbkS*F4','D4Nlgf4qg0flgzXOpD6eFKPt*wyGWBCL^MFe#l8mMI27oMN',0)
,(9,8554543,'jiz5(m',6695234.358959912,45087211.87,'1977-04-20','2020-07-17 17:20:35',-24644,-703153942,'OVsn8zWggoa#%',3000026.957717,9668245.521362236,8357221.539583703,'tijhQw7)R%JR**6r$(X#WKgk*bSmr5u$Nzayug8ql7','0Utrk(*D0*tB9mxv)#IUKz',1)
,(10,724484623,'B7)rqlVvsJRvPcBcG6KaUs%Jy*nblh',6208429.299462363,49217421.38,'2037-12-05','2020-07-17 17:20:35',26981,-395707580,'Cvi)#cHbSWaMeBa96',3628381.917915,2675574.493188462,114852.0965330714,'Hn%QJ5t7844KRGlOo7PSwIq(K*NYsa)RhKr','#pSNqnnRFcn57MPKrn',0)
,(11,1086142124,'AJXz^q6^u7Pb^ktwTfTk6LqS',4335361.516532874,65719875.91,'1994-02-09','2020-07-17 17:20:35',-804,-53032350,'gK#eLjC)ptk',2089072.307768,779808.0104834258,1962509.0821450953,'#(29D*ZoeQZt)gr','0o#j4NXQ0mO%(wyuUB5',0)
,(12,-812075332,'EIhouOz9Db$))ETI4d(pI3S',2334240.347772705,42648573.43,'2033-08-26','2020-07-17 17:20:35',-9804,-668576724,'RVhWkj',9346443.665914,5504667.767519973,8701358.715345578,'4NsKKjZZiWv%6mySk89Uy1VF*rtAoKcc','Tvq0QBa3kFi#1GYuauoocSTPtyITSLueYTkg5%vEkW8T8LdTw6',1)
,(13,-862405980,'jdzjfDR',4127116.053426594,65178430.60,'2006-03-16','2020-07-17 17:20:35',-14636,1576473908,'UA5j',4400144.585537,7931143.820409145,5251593.876100192,'XtOahCU)iX%aJRxsbr#Z%3ogyhayaWMEIquP%Ay','c$bC88M7vvN04r*i5i#fnn9DE7ccp%Fu5lf1ixCe8EBHbvd',0)
,(14,474520099,'#UH%nlgX8)Lbxz#E4w#jDuj$2itBIm',596505.6684445145,6097510.11,'2019-09-05','2020-07-17 17:20:35',21912,-163953057,'7lKl*ZMr*5%PoR^',193243.065239,1986799.9092311827,7831591.166171993,'HF#%0Jh93yVv%0$#1*o(','1#5AqdS5tSK)HXR$4eqkAYkTPG%C^NTkbblI1gvw',1)
,(15,983622507,')1XM',5516873.705163104,29857087.63,'2036-05-14','2020-07-17 17:20:35',-32634,-973623613,'sw#Yh4L(u#m',6815606.849015,529309.8230424672,207424.08666469212,'KhA^','%$V9ae#(Ea*k',0)
,(16,-1059794530,'WBLmydKfWADnPuvCUgzHhaIt09Ai9DkaHrjAO9$1P',9869107.988581365,37344332.34,'1991-01-04','2020-07-17 17:20:35',10377,574960857,'FpZH*($',5503065.234849,8125898.801140503,7937763.929029542,'WtTMown108YA%LuyokjkWW$8F5q%i8aKDFYqkxb','$yg#)zP*au3im*pH7yG4D%0%%*BLZEIL8%XcI',0)
,(17,-1300610592,'ArYapxOSq$%T##^Y',4873143.371257163,34071920.31,'2026-04-18','2020-07-17 17:20:35',32567,-1713883006,'vnPRckqO*MKvIy%US(c',7213976.790016,3575271.4072821387,4792703.562188398,'n5wU7','aSvL%P^4)jE19VHM(0RM',1)
,(18,-1612532486,'bm%#NU4xE)EziF',4371823.930092179,43239632.42,'2013-08-25','2020-07-17 17:20:35',-19747,479903407,'P5gGF',1620246.110595,2851705.7066468005,7722514.387385103,'gndztjR7Gj1i2T%','H^VEYG8C%C#tAe%#VS',1)
,(19,-442315470,'^Mx8%hEVzDiMx*i*7kX#l1km(b',3826937.3446670105,17212654.09,'2025-04-07','2020-07-17 17:20:35',5464,-396575562,'mvoGKS3N1O9zZ7RZvdTR',8845505.781035,4203937.027726319,2716581.04337268,'%8UdL27GGbF9','J3nevrlrapQ*Iqe$',1)
,(20,-657015054,'*)qcRR$S#Mp',7484009.018682263,81164870.69,'1974-10-23','2020-07-17 17:20:35',-18758,-819941608,'Msa(XarP%i#Dexu4d',7853993.358340,3264463.2032110025,1914206.7494400255,'q2%#z*H82tc72zrOrAqYJ6YsUQ%ysTs9e6wP%x','E5b*EnP1sF98N6wlq',1);
