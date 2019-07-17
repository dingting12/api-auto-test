package datapps.connection;

import com.datapps.linkoopdb.jdbc.impl.JDBCConnection;
import org.junit.Test;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

/**
 * @Author: wangyu
 * @CreateDate: 2019/7/12 20:01
 * 测试不同用户连接
*/

public class TestConn2 {

    public static final String URL="jdbc:linkoopdb:tcp://192.168.1.79:9197/ldb";
    public static final String USER="u_jdbc_wy";
    public static final String PASS="123456";
    public static final String DRIVER="com.datapps.linkoopdb.jdbc.JdbcDriver";

    Connection connection=null;
    Statement statement=null;

    ConnUtil cu=new ConnUtil();

    @Test
    public void testConnB(){
        try {

            connection=cu.jdbcConnection(URL,USER,PASS,DRIVER);
            long sessionId1=((JDBCConnection)connection).getSessionId();
            System.out.printf("sessionid为："+sessionId1);
            statement=connection.createStatement();

            System.out.println();

            cu.closeConnection(connection,statement);

            if(connection.isClosed()) System.out.printf("连接已断开！");
            else System.out.printf("连接未断开！");


        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            cu.closeConnection(connection,statement);
        }
    }

}
