
/*  
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import connection.MySQLConnection;
import entity.Users;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.lang.model.util.Types;

/**
 *
 * @author HP
 */
public class UsersDAO {

    public int getSize() {

        String mysql = "Select count(`user_id`) as `totalTeacher`  FROM `users` WHERE  `account_actived` = 1;";

        try (Connection connection = MySQLConnection.getConnection(); PreparedStatement ps = connection.prepareStatement(mysql);) {
            ResultSet rs = ps.executeQuery();
            while (rs.next() ) {
                return rs.getInt("totalTeacher");
            }
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return 0;
    }

    public Users authenticate(String username, String pass) {

        String sql = "SELECT u.username, u.email, u.fullname, u.country, u.address, u.gender, u.dob, u.phone, r.role_name \n"
                + "from `users` u join `role` r on u.role_id = r.role_id\n"
                + "Where u.username = ? And u.password = ? AND account_actived = 1;";
        try (Connection con = MySQLConnection.getConnection(); PreparedStatement ps = con.prepareCall(sql)) {
            String ePassword = PasswordEncrypt.hashPassword(pass);
            ps.setString(1, username);
            ps.setString(2, pass);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Users u = Users.builder()
                        .username(rs.getString("username"))
                        .email(rs.getString("email"))
                        .fullname(rs.getString("fullname"))
                        .roleName(rs.getString("role_name"))
                        .country(rs.getString("country"))
                        .address(rs.getString("address"))
                        .gender(rs.getString("gender"))
                        .dob(rs.getDate("dob"))
                        .phone(rs.getString("phone"))
                        .build();

                return u;
            }
        } catch (SQLException e) {
            e.printStackTrace(System.out);

        }

        return null;
    }

    public int register(Users user) {
        int generatedKey = 0;
        String sql = "INSERT INTO users(username, password, role_id, email , account_actived, country, address, gender, dob, phone, fullname)"
                + " VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection con = MySQLConnection.getConnection(); PreparedStatement ps = con.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS);) {
            // Thiết lập các tham số trong câu lệnh SQL
            ps.setString(1, user.getUsername());
            ps.setString(2, user.getPassword());
            ps.setInt(3, user.getRole().getRole_id());
            ps.setString(4, user.getEmail());
            ps.setInt(5, 1);
            ps.setString(6, user.getCountry());
            ps.setString(7, user.getAddress());
            ps.setString(8, user.getGender());

            //NOTE:::::::::
//            java.sql.Date sqlDate = new java.sql.Date(user.getDob().getTime());
//            ps.setDate(9,  sqlDate);
            java.util.Date dob = user.getDob();
            if (dob != null) {
                java.sql.Date sqlDate = new java.sql.Date(dob.getTime());
                ps.setDate(9, sqlDate);
            } else {
                ;
            }

            ps.setString(10, user.getPhone());
            ps.setString(11, user.getFullname());

            // Thực hiện câu lệnh SQL
            int affectedRows = ps.executeUpdate();

            //kiem tra xem da update thanh cong chua
            if (affectedRows > 0) {
//                con.commit();
                //lay thong tin ve khoa chinh dc tao tu dong
                try (ResultSet generatedKeys = ps.getGeneratedKeys()) {
                    if (generatedKeys.next()) {
                        generatedKey = generatedKeys.getInt(1);
                        return generatedKey;
                    } else {
                        System.out.println("nothing in here");
                        return -3;
                    }

                } catch (SQLException e) {
                    e.printStackTrace();
                    return -1;
                }
            }

        } catch (SQLException e) {
            e.printStackTrace(System.out);
            return -1;
        }
        return generatedKey;
    }

    public Users getOneByEmail(String email) {
        String sql = "SELECT * FROM users \n"
                + "WHERE `email` = ?;";

        try (Connection con = MySQLConnection.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                String resultEmail = rs.getString("email");
                Users u = Users.builder().email(resultEmail).build();
                return u;
            }

        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
        return null;
    }

    public Users getOneByUser(String username) {
        String sql = "SELECT * FROM users \n"
                + "WHERE `username` = ?;";

        try (Connection con = MySQLConnection.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Users u = Users.builder().username(rs.getString("username")).build();
                return u;
            }

        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
        return null;
    }

    public static void main(String[] args) {
        System.out.println(new UsersDAO().getSize());
    }
}
