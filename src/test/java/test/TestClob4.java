package test;

import com.datapps.linkoopdb.jdbc.impl.JDBCClob;
import com.datapps.linkoopdb.jdbc.lib.StopWatch;
import org.junit.Before;
import org.junit.Test;
import util.JdbcUtil;

import java.io.Reader;
import java.sql.*;

public class TestClob4 {

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
    public void testClobE() {

        try {
            String ddl0 = "DROP TABLE t_clob_wy4 IF EXISTS";
            String ddl1 =
                    "CREATE TABLE t_clob_wy4 (stateid varchar(128),varid numeric(16,0),  "
                            + "scalabilitypassivated char(1) DEFAULT 'N', value1 clob(2000), scopeguid varchar(128),"
                            + "primary key (stateid, scalabilitypassivated, scopeguid)) engine pallas";

            statement.execute(ddl0);
            boolean flag1=statement.execute(ddl1);

            if(flag1==false) System.out.println("create succeed");
            else System.out.println("create failed");

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }

        try {
            String dml0 = "INSERT INTO t_clob_wy4 VALUES (?, ?, 'N', ?, ?)";
            String dml1 =
                    "UPDATE t_clob_wy4 SET varid = varid + 1 WHERE stateid = ? AND "
                            + "varid = ? AND scalabilitypassivated = 'N' AND scopeguid = ?";
            PreparedStatement ps = connection.prepareStatement(dml0);

            connection.setAutoCommit(false);

            JDBCClob dataClob =
                    new JDBCClob("the quick brown fox jumps on the lazy dog");
            Reader reader = null;
            StopWatch sw = new StopWatch();

            sw.start();

            for (int i = 0; i < 100; i++) {
                reader = dataClob.getCharacterStream();

                ps.setString(1, "test-id-1" + i);
                ps.setLong(2, 23456789123456L + i);
                ps.setCharacterStream(3, reader, dataClob.length());
                ps.setString(4, "test-scope-1" + i);
                ps.executeUpdate();
                connection.commit();
            }

            sw.stop();
            System.out.println(sw.elapsedTimeToMessage("Time for inserts"));

            ps = connection.prepareStatement(dml1);

            sw.zero();
            sw.start();

            for (int i = 10; i < 20; i++) {
                ps.setString(1, "test-id-1" + i);
                ps.setLong(2, 23456789123456L + i);
                ps.setString(3, "test-scope-1" + i);
                ps.executeUpdate();
                connection.commit();
            }

            connection.commit();

            ResultSet rs = statement.executeQuery("SELECT value1 FROM t_clob_wy4");

            Clob clob = null;

            while (rs.next()) {
                clob = rs.getClob("value1");

//                System.out.println("value1: "+clob);


            }

            long dataLength = dataClob.length();
            long clobLength = clob.length();

            System.out.println("dataLength: "+dataLength+",clobLength: "+clobLength);


            System.out.println("dataClob: "+dataClob.getSubString(1, 30)+",clob "+clob.getSubString(1, 30));

            rs = statement.executeQuery(
                    "SELECT CAST(SUBSTRING(value1 FROM 19) AS VARCHAR(100)),STATEID,"
                            + "CHARACTER_LENGTH(value1),CAST(value1 AS VARCHAR(100)) FROM t_clob_wy4 "
                            + "WHERE STATEID>'TEST-ID-197'");

            while (rs.next()) {
                //              assertTrue(rs.getString(1).equals("x jumps on the lazy dog"));
                /*if(rs.getString(1).equals("x jumps on the lazy dog")) System.out.println("y");
                else System.out.println("n");*/

                rs.getString(1);

            }


            sw.stop();
            System.out.println(sw.elapsedTimeToMessage("Time for updates"));

            rs.close();
            ps.close();
            statement.close();
            connection.close();

        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("test failure");
        }finally {
            ju.closeConnection(connection,statement,rs,ps);
        }
    }
}
