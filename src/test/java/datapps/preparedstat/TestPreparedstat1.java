package datapps.preparedstat;

import datapps.connection.ConnUtil;
import org.junit.Before;
import org.junit.Test;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 * @Author: wangyu
 * @CreateDate: 2019/7/15 20:26
 * 测试preparedstatement
*/

public class TestPreparedstat1 {

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
    public void TestPreparedstatA(){
        String ddl1 = "drop table t_testps_wy1 if exists";
        String createTableSql = "create table t_testps_wy1 (id int , name varchar(10))";
        String insertTableSql = "insert into t_testps_wy1 values((1,'fdas'),(2,'fdas') )";
        String queryTable1Sql = "select * from t_testps_wy1";
        String queryTable2Sql = "select * from t_testps_wy1 order by id";



        try {

            statement.execute(ddl1);
            statement.execute(createTableSql);
            int flag1=statement.executeUpdate(insertTableSql);
            if(flag1==2) System.out.println("insert succeed");
            else System.out.println("insert failed");
            System.out.println();


            rs=statement.executeQuery(queryTable1Sql);
            while(rs.next()) {
                System.out.println("id: "+rs.getInt("id")+",name: "+rs.getString("name"));
            }

            System.out.println();

            ps=connection.prepareStatement("update t_testps_wy1 set name = ? where id = ?");

            List<Object[]> data=new ArrayList();
            Object[] objects1 =new Object[]{"2",1};
            Object[] objects2=new Object[]{"3",2};
            Object[] objects3=new Object[] {"123",2};
            data.add(objects1);
            data.add(objects2);
            data.add(objects3);
            for (Object[] datum : data) {
                for (int i = 0; i < datum.length; i++) {
                    if(i==1) {
                        ps.setString(i+1,datum[i].toString());
                    }else {
                        ps.setInt(i+1, Integer.parseInt(datum[i].toString()));
                    }

                }

            }

            int flag2=ps.executeUpdate();
            if(flag2==1) System.out.println("update succeed");
            else System.out.println("update failed");

            System.out.println();

            rs=statement.executeQuery(queryTable2Sql);
            while(rs.next()) {
                System.out.println("id: "+rs.getInt("id")+",name: "+rs.getString("name"));
            }

            System.out.println();

            ps.clearParameters();
            ps.setInt(2, 2);
            ps.setString(1, "wwww");
            int flag3=ps.executeUpdate();
            if(flag3==1) System.out.println("update succeed");
            else System.out.println("update failed");

            System.out.println();

            rs=statement.executeQuery(queryTable2Sql);
            while(rs.next()) {
                System.out.println("id: "+rs.getInt("id")+",name: "+rs.getString("name"));
            }

            statement.execute(ddl1);

            rs.close();
            ps.close();
            statement.close();
            connection.close();


        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }finally {
            cu.closeConnection(connection, statement, rs, ps);
        }

    }
}
