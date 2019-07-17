package datapps.autocommit;

import datapps.connection.ConnUtil;
import org.junit.Before;
import org.junit.Test;

import java.sql.*;

import static org.junit.Assert.assertEquals;

/**
 * @Author: wangyu
 * @CreateDate: 2019/7/15 10:23
 * autocommit为true
*/


public class TestAutocommit2 {

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
    public void testAutocommitB(){
        try {
            connection.setAutoCommit(true);
            String ddl1="drop table t_autocommit_jdbc_wy2 if exists";
            String ddl2="create table t_autocommit_jdbc_wy2(tsmallint smallint,tinteger integer,tbigint bigint,treal real,tdouble double,tfloat float,tdecimal decimal(6,3),tnumeric numeric(6,2),tdate date,ttimestamp timestamp,tvarchar varchar(200),tchar char(20),tbit bit,tbinary binary,tvarbinary varbinary(200))";

            boolean flag1=statement.execute(ddl1);
            if(flag1==false) System.out.println("drop table succeed");
            else System.out.println("drop table failed");

            boolean flag2=statement.execute(ddl2);
            if(flag1==false) System.out.println("drop table succeed");
            else System.out.println("drop table failed");

            String dml1="insert into t_autocommit_jdbc_wy2 values(?,234,345456,213.343,312334.545,7896.3545,123.43,-454.6,\'2090-12-12\',\'2090-12-12 12:12:12\',\'我是谁@@￥64ds\',\'XXX！\',\'1\',\'0\',\'0\')";
            String dml2="select count(*) from t_autocommit_jdbc_wy2";

            for (int i=1;i<=10;i++){
                ps=connection.prepareStatement(dml1);
                ps.setInt(1,i);
                ps.executeUpdate();
            }

            rs=statement.executeQuery(dml2);

            while (rs.next()){
                int count1=rs.getInt(1);
                System.out.println("table's counts:"+count1);
            }

            rs.close();
            ps.close();
            statement.close();
            connection.close();

            connection=null;
            statement=null;
            rs=null;
            ps=null;


            connection=cu.jdbcConnection();
            statement=connection.createStatement();
            rs=statement.executeQuery(dml2);

            int count2=0;

            while (rs.next()){
                count2=rs.getInt(1);

                System.out.println("reconnect table's counts:"+count2);
            }

            //判断重新连接后表中个数是否为10
            assertEquals("test failure",10,count2);


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
