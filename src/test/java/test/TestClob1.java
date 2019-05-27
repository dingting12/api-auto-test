package test;

import com.datapps.linkoopdb.jdbc.impl.JDBCClob;

import org.junit.Before;
import org.junit.Test;
import util.JdbcUtil;

import java.sql.*;

public class TestClob1 {


    Connection connection;
    Statement statement;
    ResultSet rs;
    PreparedStatement ps;

    JdbcUtil ju=new JdbcUtil();

    @Before
    public void setUp() {


        try {
            connection=ju.jdbcConnection();
            statement=connection.createStatement();
        } catch (Exception e) {
            System.out.println(e);
        }
    }



    @Test
    public void testClobA() {

        try {

            String ddl0 = "DROP TABLE t_clobjdbc_wy1 IF EXISTS";
            String ddl1 =
                    "CREATE TABLE t_clobjdbc_wy1(ID int, CLOBFIELD CLOB(100000)) engine pallas";

            statement.execute(ddl0);
            statement.execute(ddl1);
        } catch (Exception e) {
        }

        try {
            connection.setAutoCommit(false);

            String dml0 = "insert into t_clobjdbc_wy1 values(?, ?)";
            String dql0 = "select * from t_clobjdbc_wy1 order by ID;";
            ps = connection.prepareStatement(dml0);
            String data = "Testing clob insert and select ops";
            Clob clob = new JDBCClob(data);

            ps.setInt(1, 1);
            ps.setClob(2, clob);
            ps.executeUpdate();

            data = data.replaceFirst("insert", "INSERT");
            clob = new JDBCClob(data);

            ps.setInt(1, 2);
            ps.setClob(2, clob);
            ps.executeUpdate();
//            ps.close();

            ps=null;

            ps = connection.prepareStatement(dql0);

            ResultSet rs = ps.executeQuery();

            rs.next();

            Clob clob1 = rs.getClob(2);

            rs.next();

            Clob clob2 = rs.getClob(2);

            System.out.println("clob1: "+clob1+",clob2: "+clob2);


            int data1 = clob1.getSubString(1, data.length()).indexOf("insert");
            int data2 = clob2.getSubString(1, data.length()).indexOf("INSERT");

            System.out.println("data1: "+data1+", data2: "+data2);

            if(data1 == data2 && data1 > 0) System.out.println("insert succeed");
            else System.out.println("insert failed");

            connection.commit();
            rs.close();
            ps.close();
            statement.close();
            connection.close();

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("test failure");
        }finally {

                ju.closeConnection(connection,statement,rs,ps);

        }


    }
}
