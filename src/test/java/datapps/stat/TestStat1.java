package datapps.stat;

import datapps.connection.ConnUtil;
import org.junit.Before;
import org.junit.Test;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import static org.junit.Assert.assertEquals;

/**
 * @Author: wangyu
 * @CreateDate: 2019/7/15 17:35
 * 测试statement，其中包括statement的各个方法
*/

public class TestStat1 {
    Connection connection=null;
    Statement statement=null;
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
    public void TestStatA(){

        try {
            connection.setAutoCommit(true);
            String ddl1="drop view v_stat_wy1 if exists";
            String ddl2="drop table t_stat_wy1 if exists";
            String ddl3="create table t_stat_wy1(tsmallint smallint,tinteger integer,tbigint bigint,treal real,tdouble double,tfloat float,tdecimal decimal(6,3),tnumeric numeric(6,2),tdate date,ttimestamp timestamp,tvarchar varchar(200),tchar char(20),tbit bit,tbinary binary,tvarbinary varbinary(200))";
            String ddl4="create view v_stat_wy1 as select count(*) from t_stat_wy1";

            String dml1="insert into t_stat_wy1 values(12,234,345456,213.343,312334.545,7896.3545,123.43,-454.6,\'2090-12-12\',\'2090-12-12 12:12:12\',\'我是谁@@￥64ds\',\'XXX！\',\'1\',\'0\',\'0\')";
            String dml2="select * from v_stat_wy1";
            String dml3="update t_stat_wy1 set tsmallint=123 where tinteger=234";
            String dml4="select distinct tsmallint from t_stat_wy1";
            String dml5="delete from t_stat_wy1";
            String dml6="alter table t_stat_wy1 add tid int";
            String dml7="insert into t_stat_wy1(tid) values(12)";
            String dml8="select tsmallint from t_stat_wy1";
            boolean flag1=statement.execute(ddl1);
            boolean flag2=statement.execute(ddl2);
            boolean flag3=statement.execute(ddl3);
            boolean flag4=statement.execute(ddl4);
            cu.drop_table(flag1);
            cu.drop_view(flag2);
            cu.create_table(flag3);

            for (int i=1;i<=10;i++){
                statement.executeUpdate(dml1);
            }

            cu.create_view(flag4);

            int count=0;
            rs=statement.executeQuery(dml2);
            while(rs.next()){
                count=rs.getInt(1);

                System.out.println(count);
            }

            assertEquals("test failed",10,count);

            int counts1=statement.executeUpdate(dml3);

            assertEquals("test failed",10,counts1);

            rs=null;
            rs=statement.executeQuery(dml4);
            while(rs.next()){
                System.out.println("tsmallint is "+rs.getInt(1));
            }

            statement.executeUpdate(dml5);
            rs=null;
            rs=statement.executeQuery(dml2);
            int counts2=0;
            while(rs.next()){
                counts2=rs.getInt(1);
            }

            assertEquals("test failed",0,counts2);

            statement.executeUpdate(dml6);
            statement.executeUpdate(dml7);

            rs=null;
            rs=statement.executeQuery(dml8);

            int tsmallint=0;

            while(rs.next()){
                tsmallint=rs.getInt(1);
                System.out.println("smallint is "+rs.getInt(1));
            }

            assertEquals("test failed",0,tsmallint);


        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            String ddl1="drop view v_stat_wy1 if exists";
            String ddl2="drop table t_stat_wy1 if exists";
            try {
                boolean flag1=statement.execute(ddl1);
                boolean flag2=statement.execute(ddl2);
                cu.drop_view(flag1);
                cu.drop_table(flag2);
            } catch (SQLException e) {
                e.printStackTrace();
            }
            cu.closeConnection(connection,statement,rs);
        }
    }


}
