package test;

import com.datapps.linkoopdb.jdbc.impl.JDBCClob;
import org.junit.Before;
import org.junit.Test;
import util.JdbcUtil;

import java.io.Reader;
import java.sql.*;

import static org.junit.Assert.assertTrue;

public class TestClob2 {

    Connection connection;
    Statement statement;
    ResultSet rs;
    PreparedStatement ps;
    PreparedStatement ps2;

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
    public void testClobB() {

        try {
            String ddl0 = "DROP TABLE t_clob_wy2 IF EXISTS";
            String ddl1 =
                    "CREATE TABLE t_clob_wy2(ID int, V VARCHAR(10), I INT, CLOBFIELD CLOB(100000)) engine pallas";

            statement.execute(ddl0);
            boolean flag1= statement.execute(ddl1);
            if(flag1==false) System.out.println("create succeed");
            else System.out.println("create failed");


            connection.setAutoCommit(false);
            String dml0 = "insert into t_clob_wy2 values(1, ?, ?, ?)";
            String dql0 = "select * from t_clob_wy2";
            ps = connection.prepareStatement(dml0);
            String data = "Testing clob insert and select ops";
            Clob clob = new JDBCClob(data);

            System.out.println(clob);
            ps.setString(1, "test");
            ps.setInt(2, 5);
            ps.setClob(3, clob);
            ps.executeUpdate();

            data = data.replaceFirst("insert", "INSERT");
            clob = new JDBCClob(data);

            System.out.println(clob);
            ps.setString(1, "test");
            ps.setInt(2, 6);
            ps.setClob(3, clob);
            ps.executeUpdate();

            ps2 = connection.prepareStatement(dql0);
            ResultSet rs = ps2.executeQuery();

            rs.next();

            Clob clob1 = rs.getClob(4);

            rs.next();

            Clob clob2 = rs.getClob(4);

            System.out.println("clob1: "+clob1+",clob2: "+clob2 );

            int data1 = clob1.getSubString(1, data.length()).indexOf("insert");
            int data2 = clob2.getSubString(1, data.length()).indexOf("INSERT");

            System.out.println("data1: "+data1+",data2: "+data2 );


            if(data1 == data2 && data1 > 0) System.out.println("insert succeed");
            else System.out.println("insert failed");


            Clob clob3 = new JDBCClob(data);
            Reader reader = clob3.getCharacterStream();

            System.out.println(reader);

            ps.setCharacterStream(3, reader, (int) clob3.length());
            ps.executeUpdate();

            //
            reader = clob2.getCharacterStream();

            System.out.println(reader);

            try {
                ps.setCharacterStream(3, reader, (int) clob3.length());
                ps.executeUpdate();
            } catch (SQLException e) {
            }

            connection.commit();
            rs.close();
            ps.close();
            ps2.close();
            statement.close();
            connection.close();

        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("test failure");
        }finally {
            try {
                if(rs!=null) rs.close();
                if(ps!=null) ps.close();
                if(ps2!=null) ps2.close();
                if(statement!=null) statement.close();
                if(connection!=null) connection.close();


            }catch(SQLException e) {
                e.printStackTrace();
            }
        }

    }



}
