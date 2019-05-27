package test;

import com.datapps.linkoopdb.jdbc.impl.JDBCClob;
import com.datapps.linkoopdb.jdbc.lib.StopWatch;
import org.junit.Before;
import org.junit.Test;
import util.JdbcUtil;

import java.io.Reader;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class TestClob3 {

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
    public void testClobD() {

        try {
            String ddl0 = "DROP TABLE t_clobjdbc_wy3 IF EXISTS";
            String ddl1 =
                    "CREATE TABLE t_clobjdbc_wy3 (stateid varchar(128), varid numeric(16,0), "
                            + "scalabilitypassivated char(1) DEFAULT 'N', value clob(20000), scopeguid varchar(128),"
                            + "primary key (stateid, scalabilitypassivated, scopeguid))engine pallas";

            statement.execute(ddl0);
            boolean flag1=statement.execute(ddl1);
            if(flag1==false) System.out.println("create succeed");
            else System.out.println("create failed");


            connection.setAutoCommit(false);

            String dml0 = "INSERT INTO t_clobjdbc_wy3 VALUES (?, ?, 'N', ?, ?)";
            String dml1 =
                    "UPDATE t_clobjdbc_wy3 SET value = ? WHERE stateid = ? AND "
                            + "varid = ? AND scalabilitypassivated = 'N' AND scopeguid = ?";
            PreparedStatement ps = connection.prepareStatement(dml0);


            JDBCClob dataClob =
                    new JDBCClob("the quick brown fox jumps on the lazy dog");
            Reader reader = null;
            StopWatch sw = new StopWatch();

            sw.start();

            for (int i = 0; i < 1000; i++) {
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
/*            sw.start();

            for (int i = 100; i < 200; i++) {
                reader = dataClob.getCharacterStream();

                ps.setCharacterStream(1, reader, dataClob.length());
                ps.setString(2, "test-id-1" + i);
                ps.setLong(3, 23456789123456L + i);
                ps.setString(4, "test-scope-1" + i);
                ps.executeUpdate();
                connection.commit();


            }


            sw.stop();
            System.out.println(sw.elapsedTimeToMessage("Time for updates"));*/
            connection.commit();
//            rs.close();
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
