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
    
    
    public int register(Users user) {
        int generatedKey = 0;
        String sql = "INSERT INTO users(username, password, role_id,email , account_actived)"
                + " VALUES(?, ?, ?, ?, ?)";
        
        try ( Connection con = MySQLConnection.getConnection(); 
             PreparedStatement ps = con.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS);
            )    
        {
            // Thiết lập các tham số trong câu lệnh SQL
            ps.setString(1, user.getUsername());
            ps.setString(2, user.getPassword());
            ps.setInt(3, 1);
            ps.setBoolean(4, true);
            
             // Thực hiện câu lệnh SQL
              int affectedRows = ps.executeUpdate();
            
            //kiem tra xem da update thanh cong chua
            if(affectedRows > 0){
                //lay thong tin ve khoa chinh dc tao tu dong
                try(ResultSet generatedKeys = ps.getGeneratedKeys()){
                    generatedKey = generatedKeys.getInt(1);
                    return generatedKey;
                    
                }catch(SQLException e){
                    e.printStackTrace();
                    return -1;
                }
            }

            
        } catch (SQLException e) {  
            e.printStackTrace(System.out);
            return -1;
        }
        return 0;
    }
    
 
    public static void main(String[] args) {
        System.out.println(new UsersDAO().getSize());
    }
}
