package test;

import org.junit.Before;
import org.junit.Test;
import util.JdbcUtil;

import java.io.CharArrayReader;
import java.io.IOException;
import java.io.Reader;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class TestClob5 {


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
    public void testClobF() {

        try {
            String ddl0 = "DROP TABLE t_clobjdbc_wy5 IF EXISTS";
            String ddl1 =
                    "CREATE TABLE t_clobjdbc_wy5(ID int, CLOBFIELD CLOB(100000)) engine pallas";

            statement.execute(ddl0);
            statement.execute(ddl1);
        } catch (Exception e) {
        }

        try {

            connection.setAutoCommit(false);
            String dml0 = "insert into t_clobjdbc_wy5 values(1,?)";
            String value = "0123456789";
            PreparedStatement ps = connection.prepareStatement(dml0);
            ps.setString(1, value);
            ps.executeUpdate();

            String dq1 = "select CHARACTER_LENGTH(clobfield) from t_clobjdbc_wy5;";

            ResultSet rs = statement.executeQuery(dq1);

            rs.next();

            int length = rs.getInt(1);

            //           assertTrue(value.length() == length);

            System.out.println("value's length: "+value.length()+",length: "+length);

            rs.close();

            String dq3 = "delete from t_clobjdbc_wy5;";

            statement.execute(dq3);

            char[] testChars = new char[11111];

            for (int i = 0, j = 32; i < testChars.length; i++, j++) {
                if (j > 255) {
                    j = 32;
                }

                testChars[i] = (char) j;


            }

            ps.setCharacterStream(1, new CharArrayReader(testChars), testChars.length);

            ps.executeUpdate();

            String dq2 = "select clobfield from t_clobjdbc_wy5;";

            rs = statement.executeQuery(dq2);

            rs.next();

            Reader reader = rs.getCharacterStream(1);

            char[] newChars = new char[testChars.length];

            try {
                reader.read(newChars);
            } catch (IOException e) {
                System.out.println("test failure");
            }

            int count_val=0,i;
            for (i = 0; i < testChars.length; i++) {

                if (testChars[i] != newChars[i]) {
                    System.out.println("test failure");
                }else count_val++;
            }

            if(count_val==i) System.out.println("counts: "+count_val+",test succeed");

            connection.commit();
            rs.close();
            ps.close();
            statement.close();
            connection.close();


        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("test failure");
        } finally {
            ju.closeConnection(connection,statement,rs,ps);
        }
    }
}
