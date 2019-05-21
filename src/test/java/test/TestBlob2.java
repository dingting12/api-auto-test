package test;

import com.datapps.linkoopdb.jdbc.lib.HsqlByteArrayInputStream;

import org.junit.Before;
import org.junit.Test;
import util.JdbcUtil;

import javax.sql.rowset.serial.SerialBlob;
import java.sql.*;

import static org.junit.Assert.assertTrue;

public class TestBlob2 {
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
    public void testBlobB() {


        byte[] ba;
        byte[] baR1 = new byte[]{
                (byte) 0xF1, (byte) 0xF2, (byte) 0xF3, (byte) 0xF4, (byte) 0xF5,
                (byte) 0xF6, (byte) 0xF7, (byte) 0xF8, (byte) 0xF9, (byte) 0xFA,
                (byte) 0xFB
        };
        byte[] baR2 = new byte[]{
                (byte) 0xE1, (byte) 0xE2, (byte) 0xE3, (byte) 0xE4, (byte) 0xE5,
                (byte) 0xE6, (byte) 0xE7, (byte) 0xE8, (byte) 0xE9, (byte) 0xEA,
                (byte) 0xEB
        };

        try {

            connection.setAutoCommit(false);


            Statement st = connection.createStatement();

            int flag1=st.executeUpdate("DROP TABLE t_blob_wy2 IF EXISTS");

            if(flag1==0) System.out.println("drop table succeed");

            int flag2=st.executeUpdate("CREATE TABLE t_blob_wy2 (id INTEGER, b blob(100)) engine pallas");
            if(flag2==0) System.out.println("create table succeed");

             ps = connection.prepareStatement("INSERT INTO t_blob_wy2 values(2, ?)");


            ps.setBlob(1, new SerialBlob(baR1));
            int flag3=ps.executeUpdate();
            if(flag3==1) System.out.println("insert succeed");
            else System.out.println("insert failed");

            rs = st.executeQuery("SELECT b FROM t_blob_wy2 WHERE id = 2");

            if (!rs.next()) {
                assertTrue("No row with id 2", false);
            }

            Blob blob1 = rs.getBlob("b");

            System.out.println("Size of retrieved blob: " + blob1.length());

            //System.out.println("Value = (" + rs.getString("b") + ')');
            byte[] baOut = blob1.getBytes(1, (int) blob1.length());

            if (baOut.length != baR1.length) {
                assertTrue("Expected array len " + baR1.length + ", got len "
                        + baOut.length, false);
            }

            for (int i = 0; i < baOut.length; i++) {
                if (baOut[i] != baR1[i]) {
                    assertTrue("Expected array len " + baR1.length
                            + ", got len " + baOut.length, false);
                }
            }

            rs.close();

            rs = st.executeQuery("SELECT b FROM t_blob_wy2 WHERE id = 2");

            if (!rs.next()) {
                assertTrue("No row with id 2", false);
            }

//            ba = rs.getBytes("b"); doesn't convert but throws ClassCast
            blob1 = rs.getBlob("b");
            ba = blob1.getBytes(1, baR2.length);

            if (ba.length != baR2.length) {
                assertTrue("row2 byte length differs", false);
            }

            for (int i = 0; i < ba.length; i++) {
                if (ba[i] != baR1[i]) {
                    assertTrue("row2 byte " + i + " differs", false);
                }
            }

            rs.close();
            connection.rollback();

            // again with stream
            ps.setBinaryStream(1, new HsqlByteArrayInputStream(baR1),
                    baR1.length);
            ps.executeUpdate();

            rs = st.executeQuery("SELECT b FROM t_blob_wy2 WHERE id = 2");

            if (!rs.next()) {
                assertTrue("No row with id 2", false);
            }

            blob1 = rs.getBlob("b");

            System.out.println("Size of retrieved blob: " + blob1.length());

            //System.out.println("Value = (" + rs.getString("b") + ')');
            baOut = blob1.getBytes(1, (int) blob1.length());

            if (baOut.length != baR1.length) {
                assertTrue("Expected array len " + baR1.length + ", got len "
                        + baOut.length, false);
            }

            for (int i = 0; i < baOut.length; i++) {
                if (baOut[i] != baR1[i]) {
                    assertTrue("Expected array len " + baR1.length
                            + ", got len " + baOut.length, false);
                }
            }

            rs.close();
            ps.close();
            st.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("test failure");
        }finally {
            ju.closeConnection(connection,statement,rs,ps);
        }
    }

}
