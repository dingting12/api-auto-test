package datapps.rollback;

import datapps.connection.ConnUtil;
import org.junit.Before;
import org.junit.Test;

import java.sql.*;

/**
 * @Author: wangyu
 * @CreateDate: 2019/7/15 10:23
 * 测试rollback
*/


public class TestRollback1 {

    Connection connection=null;
    Statement statement=null;
    PreparedStatement ps=null;
    ResultSet rs=null;
    ConnUtil cu=new ConnUtil();

    @Before
    public void setUp(){

        try {
            connection=cu.jdbcConnection();
            statement=connection.createStatement();
        } catch (SQLException e) {
            System.out.printf(String.valueOf(e));
        }

    }


    @Test
    public void testRollbackA(){
        try {
            connection.setAutoCommit(false);
            String ddl1="DROP TABLE t_rollback_wy1 IF EXISTS";
            String ddl2="CREATE TABLE t_rollback_wy1(id int PRIMARY key,name VARCHAR(200)) engine pallas";

            boolean flag1=statement.execute(ddl1);
            if(flag1==false) System.out.println("drop table succeed");
            else System.out.println("drop table failed");

            boolean flag2=statement.execute(ddl2);
            if(flag1==false) System.out.println("drop table succeed");
            else System.out.println("drop table failed");

            String dml1="INSERT INTO t_rollback_wy1 VALUES(1,'cdf')";
//            String dml2="INSERT INTO t_rollback_wy1 VALUES(1,'cnmcuyi')";
            String dml3="INSERT INTO t_rollback_wy1 VALUES(2,'znu')";

            statement.executeUpdate(dml1);

//            statement.executeUpdate(dml2);
            statement.executeUpdate(dml3);
            connection.rollback();
            connection.commit();


            String dml4="select count(*) from t_rollback_wy1";


            rs=statement.executeQuery(dml4);

            while (rs.next()){
                int count1=rs.getInt(1);
                System.out.println("table's counts:"+count1);
            }

            boolean flag3=statement.execute(ddl1);
            if(flag3==false) System.out.println("drop table succeed");


            rs.close();
            statement.close();
            connection.close();



        } catch (SQLException e) {
            e.printStackTrace();
            System.out.printf("test failure");




        }finally {
            cu.closeConnection(connection,statement,rs,ps);
        }
    }


}
