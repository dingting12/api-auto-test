package datapps.connection;

import org.junit.Test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

/**
 * @Author: wangyu
 * @CreateDate: 2019/7/12 20:00
 * 测试不同schema下的连接
*/

public class TestConn3 {

    public static final String URL="jdbc:linkoopdb:tcp://192.168.1.79:9197/sc_jdbc_wy";
    public static final String USER="admin";
    public static final String PASS="123456";
    public static final String DRIVER="com.datapps.linkoopdb.jdbc.JdbcDriver";

    Connection connection=null;
    Statement statement=null;

    ConnUtil cu=new ConnUtil();

    @Test(expected= SQLException.class)
    public void testConnC() throws SQLException, ClassNotFoundException {

            Class.forName(DRIVER);
            connection= DriverManager.getConnection(URL,USER,PASS);

            statement=connection.createStatement();


            cu.closeConnection(connection,statement);

            if(connection.isClosed()) System.out.printf("连接已断开！");
            else System.out.printf("连接未断开！");



    }

}
