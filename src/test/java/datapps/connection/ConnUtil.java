package datapps.connection;

import java.sql.*;

/**
* @Author: wangyu 
* @CreateDate: 2019/7/12 17:54
*/

public class ConnUtil {


    public static final String URL="jdbc:linkoopdb:tcp://192.168.1.71:9105/ldb";
    public static final String USER="admin";
    public static final String PASS="123456";
    public static final String DRIVER="com.datapps.linkoopdb.jdbc.JdbcDriver";
    /**
     * 创建连接数据库的方法
     * @param url
     * @param user
     * @param pass
     * @param driver
     * @return
     */
    public static Connection jdbcConnection(String url,String user,String pass,String driver){
        Connection conn=null;
        try {
            Class.forName(driver);
            conn= DriverManager.getConnection(url,user,pass);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }

           return conn;
    }


    public static Connection jdbcConnection(){
        Connection conn=null;
        try {
            Class.forName(DRIVER);
            try {
                conn=DriverManager.getConnection(URL,USER,PASS);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
            return conn;

    }


    /**
     * 创建断开数据库的方法
     * @param conn
     * @param st
     * @param rs
     * @param ps
     */
    public static void closeConnection(Connection conn, Statement st, ResultSet rs, PreparedStatement ps) {

        try {

            if(rs!=null) rs.close();
            if(ps!=null) ps.close();
            if(st!=null) st.close();
            if(conn!=null)	conn.close();


        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }


    }

    public static void closeConnection(Connection conn,Statement st,ResultSet rs) {

        try {

            if(rs!=null) rs.close();
            if(st!=null) st.close();
            if(conn!=null)	conn.close();


        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

    }


    public static void closeConnection(Connection conn,PreparedStatement ps,ResultSet rs) {

        try {

            if(rs!=null) rs.close();
            if(ps!=null) ps.close();
            if(conn!=null)	conn.close();


        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

    }

    public static void closeConnection(Connection conn,PreparedStatement ps) {

        try {

            if(ps!=null) ps.close();
            if(conn!=null)	conn.close();


        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

    }

    public static void closeConnection(Connection conn,Statement st) {

        try {

            if(st!=null) st.close();
            if(conn!=null)	conn.close();

//            System.out.printf(""+conn);

        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

    }

    public static void create_table(boolean flag){
        if(flag==false) System.out.println("create table succeed");
        else System.out.println("create table failed");
    }

    public  static  void create_view(boolean flag){
        if(flag==false) System.out.println("create view succeed");
        else System.out.println("create view failed");
    }

    public static void create_proc(boolean flag){
        if(flag==false) System.out.println("create proc succeed");
        else System.out.println("create proc failed");
    }

    public static void create_fun(boolean flag){
        if(flag==false) System.out.println("create fun succeed");
        else System.out.println("create fun failed");
    }

    public static void drop_table(boolean flag){
        if(flag==false) System.out.println("drop table succeed");
        else System.out.println("drop table failed");
    }

    public  static  void drop_view(boolean flag){
        if(flag==false) System.out.println("drop view succeed");
        else System.out.println("drop view failed");
    }

    public static void drop_proc(boolean flag){
        if(flag==false) System.out.println("drop proc succeed");
        else System.out.println("drop proc failed");
    }

    public static void drop_fun(boolean flag){
        if(flag==false) System.out.println("drop fun succeed");
        else System.out.println("drop fun failed");
    }

}
