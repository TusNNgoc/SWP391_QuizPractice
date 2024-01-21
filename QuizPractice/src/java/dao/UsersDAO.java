/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;
import Connection.MySQLConnection;
import entity.Users;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author HP
 */
public class UsersDAO {
    public int getSize() {

        String mysql = "Select count(`user_id`) as `totalTeacher`  FROM `users` WHERE `role_id` = 1 and `account_actived` = 1;";

        try ( Connection connection = MySQLConnection.getConnection();  PreparedStatement ps = connection.prepareStatement(mysql);) {
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt("totalTeacher");
            }
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return 0;
    }
    
//    public int register(Users obj) {
//        int check = 0;
//        String sql = "INSERT INTO Users(user_email, user_account, role_id, account_actived)"
//                + " VALUES(?, ?, ?, ?)";
//        try ( Connection con = MySQLConnection.getConnection();  PreparedStatement ps = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);) {
//            ps.setObject(1, obj.getEmail());
//            ps.setObject(2, obj.getPassword());
//            ps.setObject(3, 2);
//            ps.setObject(4, false);
//            check = ps.executeUpdate();
//            if (check > 0) {
//                try ( ResultSet rs = ps.getGeneratedKeys()) {
//                    if (rs.next()) {
//                        int accountId = rs.getInt(1);
//                        return accountId;
//                    }
//                }
//            }
//        } catch (SQLException e) {  
//            e.printStackTrace(System.out);
//        }
//        return 0;
//    }
    
    public void register(){
         
    }
    
    public static void main(String[] args) {
        System.out.println(new UsersDAO().getSize());
    }
}
