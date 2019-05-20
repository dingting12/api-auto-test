package com.testjdbc.util;

import java.sql.*;

public class JdbcUtil {

    public static final String JDBC_DRIVER="jdbc:linkoopdb:tcp://192.168.1.73/ldb";
    public static final String USER="admin";
    public static final String PASS="123456";




    /**
     *
     * connect
     */
    public static Connection jdbcConnection() {
        Connection	conn=null;

        try {
            Class.forName("com.datapps.linkoopdb.jdbc.JdbcDriver");
            conn= DriverManager.getConnection(JDBC_DRIVER, USER, PASS);
            conn.setAutoCommit(false);

        }catch(Exception e) {
            e.printStackTrace();

        }
        return conn;
    }


    /**
     *
     * close connect
     *
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


        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

    }



	/*
	 *
	 * create table
	 *
	 * */

    public static void createtable(String tableSql) {
        Connection conn=null;
        Statement st=null;
        try {

            conn=jdbcConnection();
            st=conn.createStatement();
            conn.setAutoCommit(false);
            boolean flag=st.execute(tableSql);
            if(flag==false) {
                System.out.println("create table succeed");
            }


            st.close();
            conn.close();

        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }finally {
            closeConnection(conn,st);
        }


    }


	/*
	 *
	 * drop table
	 *
	 * */

    public static void droptable(String tableName) {
        Connection conn=null;
        Statement st=null;

        try {

            String sql="drop table "+tableName+" if exists";
            conn=jdbcConnection();
            st=conn.createStatement();
            conn.setAutoCommit(false);
            boolean flag=st.execute(sql);
            if(flag==false) System.out.println("drop table succeed");

            st.close();
            conn.close();

        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }finally {
            closeConnection(conn,st);
        }


    }


}
