package datapps.callablestat;

import datapps.connection.ConnUtil;
import org.junit.Before;
import org.junit.Test;

import java.sql.*;

import static org.junit.Assert.*;

/**
 * @Author: wangyu
 * @CreateDate: 2019/7/15 14:11
 * 测试存储过程与函数
*/

public class TestCallablestatement1 {

    Connection connection=null;
    Statement statement=null;
    PreparedStatement ps=null;
    ResultSet rs=null;
    CallableStatement cs=null;
    ConnUtil cu=new ConnUtil();


    @Before
    public void setUp(){


        try {
            connection=cu.jdbcConnection();
            statement=connection.createStatement();
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("test failed");
        }

    }


    @Test
    public void testCallableA(){
        try {
            connection.setAutoCommit(true);
            String ddl1="DROP PROCEDURE p_callablestat_wy1 IF EXISTS";
            String ddl2="CREATE PROCEDURE p_callablestat_wy1(IN val1 DOUBLE,OUT rs1 DOUBLE) DYNAMIC RESULT SETS 1 BEGIN SET rs1=(val1+10)*3.20;END";

            boolean flag1=statement.execute(ddl1);
            if(flag1==false) System.out.println("drop proc succeed");
            else System.out.println("drop proc failed");

            boolean flag2=statement.execute(ddl2);
            if(flag2==false) System.out.println("create proc succeed");
            else System.out.println("create proc failed");

            cs=connection.prepareCall("{call p_callablestat_wy1(?,?)}");
            cs.setDouble(1,1.2);
            cs.registerOutParameter(2, Types.DOUBLE);
            cs.execute();
            Object objRst=cs.getObject(2);
            System.out.println("rs1 is "+objRst);

            assertEquals("test failed",35.839999999999996,objRst);

            boolean flag3=statement.execute(ddl1);
            if(flag3==false) System.out.println("drop proc succeed");
            else System.out.println("drop proc failed");

            cs.close();
            statement.close();
            connection.close();


        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            try {
                cs.close();
                cu.closeConnection(connection,statement);
            } catch (SQLException e) {
                e.printStackTrace();
            }

        }


    }


    @Test
    public void testCallableB(){
        try {
            connection.setAutoCommit(true);
            String ddl1="drop table t_callablestat_wy2 if exists";
            String ddl2="CREATE TABLE t_callablestat_wy2(employee_number INTEGER,manager_employee_number INTEGER,department_number INTEGER,job_code INTEGER,last_name CHAR(20) NOT NULL,first_name VARCHAR(30) NOT NULL,hire_date DATE NOT NULL,birthdate DATE NOT NULL,salary_amount DECIMAL(10,2) NOT NULL)";
            String ddl3="DROP PROCEDURE p_callablestat_wy2 IF EXISTS";
            String ddl4="CREATE PROCEDURE p_callablestat_wy2(OUT flag VARCHAR(50),INOUT name CHAR(5)) MODIFIES SQL DATA BEGIN DECLARE num INT; SET num=0; INSERT INTO t_callablestat_wy2 VALUES(1025,0801,201,211100,'Short','Michael',now(),now(),34700); SET num=(SELECT count(*) FROM t_callablestat_wy2); IF num=1 THEN SET flag='true'; END IF; SET name=(SELECT LAST_NAME FROM t_callablestat_wy2 WHERE EMPLOYEE_NUMBER=1025);END";

            String dml1="delete from t_callablestat_wy2";

            boolean flag1=statement.execute(ddl1);
            if(flag1==false) System.out.println("drop table succeed");
            else System.out.println("drop table failed");
            boolean flag2=statement.execute(ddl3);
            if(flag2==false) System.out.println("drop proc succeed");
            else System.out.println("drop proc failed");
            boolean flag3=statement.execute(ddl2);
            if(flag3==false) System.out.println("create table succeed");
            else System.out.println("create table failed");
            boolean flag4=statement.execute(ddl4);
            if(flag4==false) System.out.println("create proc succeed");
            else System.out.println("create proc failed");

            int flag5=statement.executeUpdate(dml1);
            if(flag5==1) System.out.println("delete all succeed");
            else System.out.println("delete all failed");

            cs=connection.prepareCall("{call p_callablestat_wy2(?,?)}");
            cs.registerOutParameter(1,Types.VARCHAR);
            cs.setString(2, String.valueOf(Types.CHAR));
            cs.execute();
            Object objRst1=cs.getObject(1);
            System.out.println("flag is "+objRst1);



            Object objRst2=cs.getObject(2);
            System.out.println("name is "+objRst2);

            assertEquals("test failed","Short",objRst2);



/*
            cs.close();
            statement.close();
            connection.close();
*/


        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            try {
                String ddl1="DROP TABLE t_callablestat_wy2 IF EXISTS";
                String ddl2="DROP PROCEDURE p_callablestat_wy2 IF EXISTS";
                boolean flag2=statement.execute(ddl2);
                if(flag2==false) System.out.println("drop proc succeed");
                else System.out.println("drop proc failed");
                boolean flag1=statement.execute(ddl1);
                if(flag1==false) System.out.println("drop table succeed");
                else System.out.println("drop table failed");
                cs.close();
                cu.closeConnection(connection,statement);
            } catch (SQLException e) {
                e.printStackTrace();
            }

        }


    }




    @Test
    public void testCallableC(){
        try {
            connection.setAutoCommit(true);
            String ddl1="DROP TABLE t_callablestat_wy3 IF EXISTS";
            String ddl2="DROP PROCEDURE p_callablestat_wy3 IF EXISTS";
            String ddl3="CREATE TABLE t_callablestat_wy3(id INT,name VARCHAR(200))";
            String ddl4="CREATE PROCEDURE p_callablestat_wy3() DYNAMIC RESULT SETS 1 BEGIN DECLARE cur1 CURSOR FOR select * from t_callablestat_wy3; OPEN cur1; CLOSE cur1; END";

            boolean flag1=statement.execute(ddl1);
            if(flag1==false) System.out.println("drop table succeed");
            else System.out.println("drop table failed");

            boolean flag2=statement.execute(ddl2);
            if(flag2==false) System.out.println("drop proc succeed");
            else System.out.println("drop proc failed");

            boolean flag3=statement.execute(ddl3);
            if(flag1==false) System.out.println("create table succeed");
            else System.out.println("create table failed");

            boolean flag4=statement.execute(ddl4);
            if(flag2==false) System.out.println("create proc succeed");
            else System.out.println("create proc failed");

            cs=null;
            rs=null;
            cs=connection.prepareCall("{CALL p_callablestat_wy3()}");
            cs.execute();

            boolean rms=cs.getMoreResults();

            System.out.println(rms);

            assertTrue("test failed",rms);

            if(cs.getMoreResults()){
                rs=cs.getResultSet();
                while(rs.next()){
                    Object c1 = rs.getObject(1);
                    System.out.println("c1: " + c1);
                }
            }



//            rs.close();
/*            cs.close();
            statement.close();
            connection.close();*/


        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            try {
                String ddl1="DROP TABLE t_callablestat_wy3 IF EXISTS";
                String ddl2="DROP PROCEDURE p_callablestat_wy3 IF EXISTS";
                boolean flag2=statement.execute(ddl2);
                if(flag2==false) System.out.println("drop proc succeed");
                else System.out.println("drop proc failed");
                boolean flag1=statement.execute(ddl1);
                if(flag1==false) System.out.println("drop table succeed");
                else System.out.println("drop table failed");
                cs.close();
                cu.closeConnection(connection,statement);
            } catch (SQLException e) {
                e.printStackTrace();
            }

        }


    }




    @Test
    public void testCallableD(){
        try {
            connection.setAutoCommit(true);
            String ddl1="DROP TABLE t_callablestat_wy4 IF EXISTS";
            String ddl2="DROP PROCEDURE p_callablestat_wy4 IF EXISTS";
            String ddl3="CREATE TABLE t_callablestat_wy4(COL1 INT, COL2 INT)";
            String ddl4="CREATE PROCEDURE p_callablestat_wy4() DYNAMIC RESULT SETS 1 label_1: BEGIN ATOMIC DECLARE VAR_1 INT DEFAULT 0; DECLARE VAR_2 INT DEFAULT 0;while_1_lable: WHILE VAR_1 <= 10 DO SET VAR_1 = VAR_1 + 1;SET VAR_2 = 1;while_2_label: WHILE VAR_2 <= 2 DO IF MOD(VAR_1, 2) = MOD(VAR_2, 2) THEN ITERATE while_1_lable;END IF;INSERT INTO t_callablestat_wy4 VALUES(VAR_1, VAR_2);SET VAR_2 = VAR_2 + 1;END WHILE while_2_label;INSERT INTO t_callablestat_wy4 VALUES(-1, -1);END WHILE while_1_lable;END label_1\n";

            boolean flag1=statement.execute(ddl1);
            if(flag1==false) System.out.println("drop table succeed");
            else System.out.println("drop table failed");

            boolean flag2=statement.execute(ddl2);
            if(flag2==false) System.out.println("drop proc succeed");
            else System.out.println("drop proc failed");

            boolean flag3=statement.execute(ddl3);
            if(flag1==false) System.out.println("create table succeed");
            else System.out.println("create table failed");

            boolean flag4=statement.execute(ddl4);
            if(flag2==false) System.out.println("create proc succeed");
            else System.out.println("create proc failed");

            cs=null;
            rs=null;
            cs=connection.prepareCall("{CALL p_callablestat_wy4()}");
            cs.execute();

            boolean rms=cs.getMoreResults();
            System.out.println(rms);

            assertFalse("test failed",rms);



            rs=statement.executeQuery("select count(*) from t_callablestat_wy4");

            int count=0;
            while(rs.next()){
                count=rs.getInt(1);
                System.out.println("table's count: "+count);
            }

            assertEquals("test failed",5,count);


/*            rs.close();
            cs.close();
            statement.close();
            connection.close();*/


        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            try {
                String ddl1="DROP TABLE t_callablestat_wy4 IF EXISTS";
                String ddl2="DROP PROCEDURE p_callablestat_wy4 IF EXISTS";
                boolean flag2=statement.execute(ddl2);
                if(flag2==false) System.out.println("drop proc succeed");
                else System.out.println("drop proc failed");
                boolean flag1=statement.execute(ddl1);
                if(flag1==false) System.out.println("drop table succeed");
                else System.out.println("drop table failed");

                cs.close();
                cu.closeConnection(connection,statement,rs);
            } catch (SQLException e) {
                e.printStackTrace();
            }

        }


    }



}
