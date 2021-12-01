package utils;

import java.sql.DriverManager;

import java.sql.Connection;

public class DBConnectionUtils {

//    private static String url = "jdbc:mysql://localhost:3306/fts";
//    private static String user = "root";
//    private static String password = "";
    private static String url = "jdbc:mysql://remotemysql.com:3306/QQETrxg9Za";
    private static String user = "QQETrxg9Za";
    private static String password = "njmySgZQPE";
    private static Connection conn = null;

    public static Connection getConnection() {
        try {
            Class.forName("com.mysql.jdbc.Driver");

            conn = (Connection) DriverManager.getConnection(url, user, password);
        } catch (Exception e) {
            System.out.println("Không thể nạp driver");
            e.printStackTrace();
        }
        return conn;
    }

    public static void main(String[] args) {
        System.out.println(DBConnectionUtils.getConnection());
    }
}
