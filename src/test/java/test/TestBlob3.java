package test;


import org.junit.Before;
import org.junit.Test;
import util.JdbcUtil;

import java.io.FileInputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.sql.*;

public class TestBlob3 {


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
    public void testBlobC() {

        try {
            connection.setAutoCommit(false);

            Statement st = connection.createStatement();

            st.executeUpdate("DROP TABLE t_blobjdbc_wy3 IF EXISTS");

            st.executeUpdate("CREATE TABLE t_blobjdbc_wy3 (id INTEGER, b blob(100),name varchar(200)) engine pallas");

            ps = connection.prepareStatement(
                    "INSERT INTO t_blobjdbc_wy3 values(1, ?,\'vffg\')");


            FileInputStream fileInputStream = new FileInputStream("./src/test/java/img/123.jpg");

            ps.setBinaryStream(1, fileInputStream);
            ps.executeUpdate();

            rs = st.executeQuery("SELECT * FROM t_blobjdbc_wy3 WHERE name = \'vffg\'");

            if (rs.next()) {
                //assertTrue("No row with id 2", false);
                System.out.println("ID: "+rs.getInt("id")+", B: "+rs.getBlob("b"));
            }

            Blob blob1 = rs.getBlob("b");

            System.out.println(blob1);

            System.out.println("Size of retrieved blob: " + blob1.length());


            ps=null;
            rs=null;

            ps=connection.prepareStatement("update t_blobjdbc_wy3 set id=2 where name=?");
            ps.setString(1, "vffg");
            int flag=ps.executeUpdate();
            if(flag==1) System.out.println("update succeed");
            else System.out.println("update failed");

            rs = st.executeQuery("SELECT * FROM t_blobjdbc_wy3 WHERE id = 2");

            if (rs.next()) {
                System.out.println("ID: "+rs.getInt("id")+", B: "+rs.getBlob("b"));
            }





            InputStream binaryStream = blob1.getBinaryStream();


            OutputStream outputStream = Files.newOutputStream(Paths.get("./src/test/java/img/1234.jpg"));

            int localLength = 512;
            byte[] buffer = new byte[localLength];
            int readSize;

            while ((readSize = binaryStream.read(buffer)) > 0) {
                outputStream.write(buffer, 0, readSize);
            }
            outputStream.flush();
            binaryStream.close();
            outputStream.close();

            connection.commit();
            rs.close();
            ps.close();
            st.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("test failure");
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("test failure");
        }finally {


                ju.closeConnection(connection,statement,rs,ps);




        }
    }

}
