package test;

import com.datapps.linkoopdb.jdbc.impl.JDBCBlob;

import org.junit.Before;
import org.junit.Test;
import util.JdbcUtil;

import java.sql.*;

public class TestBlob1 {

    Connection connection;
    Statement statement;
    PreparedStatement ps;
    ResultSet rs;
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
    public void testBlobA() {

        try {
            String ddl0 = "DROP TABLE t_blob_wy1 IF EXISTS";
            String ddl1 =
                    "CREATE TABLE t_blob_wy1(ID int, BLOBFIELD1 BLOB(100000), BLOBFIELD2 BLOB(100000)) engine pallas";

            boolean flag1= statement.execute(ddl0);
            if(flag1==false) System.out.println("drop table succeed");
            boolean flag2=statement.execute(ddl1);
            if(flag2==false) System.out.println("create table succeed");
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("test failure");
        }

        try {
            connection.setAutoCommit(false);
            String dml0 = "insert into t_blob_wy1 values(?,?,?)";
            String dql0 = "select * from t_blob_wy1 order by ID";
            ps = connection.prepareStatement(dml0);
            byte[] data1 = new byte[]{
                    1, 2, 3, 4, 5, 6, 7, 8, 9, 10
            };

            byte[] data2 = new byte[]{
                    1, 2, 3, 4, 50, 6, 7, 8, 9, 10
            };
            Blob blob1 = new JDBCBlob(data1);
            ps.setInt(1, 1);
            ps.setBlob(2, blob1);
            Blob blob2 = new JDBCBlob(data2);
            ps.setBlob(3, blob2);
            ps.executeUpdate();


            data1[6] = 40;
            blob1 = new JDBCBlob(data1);
            data2[8] = 30;
            blob2 = new JDBCBlob(data2);

            ps.setInt(1, 2);
            ps.setBlob(2, blob1);
            ps.setBlob(3, blob2);
            ps.executeUpdate();

            ps = connection.prepareStatement(dql0);
            rs = ps.executeQuery();

            rs.next();

            Blob blob11 = rs.getBlob(2);
            Blob blob12 = rs.getBlob(3);

            System.out.println("ID: "+rs.getInt(1)+",BLOBFIELD1: "+blob11+"BLOBFIELD2: "+blob12);

            rs.next();

            Blob blob21 = rs.getBlob(2);
            Blob blob22 = rs.getBlob(3);

            System.out.println("ID: "+rs.getInt(1)+",BLOBFIELD1: "+blob11+"BLOBFIELD2: "+blob12);

            byte[] dataR1 = blob11.getBytes(1, 10);
            byte[] dataR2 = blob12.getBytes(1, 10);
            byte[] dataR3 = blob21.getBytes(1, 10);
            byte[] dataR4 = blob22.getBytes(1, 10);

            if((dataR1[4] == 5 && dataR2[4] == 50)&&(dataR3[6] == 40 && dataR4[8] == 30))
                System.out.println("insert succeed");
            else
                System.out.println("no");


            String deltab="delete from t_blob_wy1";




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
