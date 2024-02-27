package connection;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.ResultSet;
import java.sql.Statement;



/**
 *
 * @author HP
 */


public class MySQLConnection {

    private static  String PORT = "3310";
    private static String DB_NAME = "quizpracticedb";

    
    private static String DB_URL = "jdbc:mysql://localhost:"+PORT+"/" + DB_NAME;
    private static String USER_NAME = "root";
    private static String PASSWORD = "123456@bC";
    
    
    
     public static Connection getConnection() {
        return getConnection(DB_URL, USER_NAME, PASSWORD);
    }
    
    
    public static Connection getConnection(String dbURL, String userName, String password) {
        Connection conn = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(dbURL, userName, password);
            System.out.println("connect successfully!");
        } catch (Exception ex) {
            System.out.println("connect failure!");
            ex.printStackTrace();
        }
        return conn;
    }
    
    public static void main(String[] args) {
        Connection conn = getConnection(DB_URL, USER_NAME, PASSWORD);   
        System.out.println(conn);
    }
    

}
