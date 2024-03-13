
/*  
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import connection.MySQLConnection;
import entity.Role;
import entity.Users;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import javax.lang.model.util.Types;

/**
 *
 * @author HP
 */
public class UsersDAO {

    public int getSizeStudent() {

        String mysql = "Select count(`user_id`) as `totalStudent`  FROM `users` WHERE `role_id` = 2 and  `account_actived` = 1;";

        try (Connection connection = MySQLConnection.getConnection(); PreparedStatement ps = connection.prepareStatement(mysql);) {
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt("totalStudent");
            }
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return 0;
    }

    public Users authenticate(String username, String pass) {

        String sql = "SELECT u.user_id, u.username, u.email, u.fullname, u.country, u.address, u.gender, u.dob, u.phone, r.role_name \n"
                + "from `users` u join `role` r on u.role_id = r.role_id\n"
                + "Where u.username = ? And u.password = ? AND account_actived = 1;";
        try (Connection con = MySQLConnection.getConnection(); PreparedStatement ps = con.prepareCall(sql)) {
            String ePassword = PasswordEncrypt.hashPassword(pass);
            ps.setString(1, username);
            ps.setString(2, pass);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Users u = Users.builder()
                        .user_id(rs.getInt("user_id"))
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

    public Users getOneByUsername(String username) {
        String sql = "SELECT * FROM users \n"
                + "WHERE `username` = ?;";

        try (Connection con = MySQLConnection.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Users u = Users.builder()
                        .username(rs.getString("username"))
                        .user_id(rs.getInt("user_id"))
                        .build();
                return u;
            }

        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
        return null;
    }

    public List<Users> getStudentByCourseName(String course_name) {
        String sql = "select * from users u join course c on c.user_id_course = user_id where role_id  = 2 and course_name = ?";
        List<Users> l = new ArrayList<>();
        try (Connection con = MySQLConnection.getConnection(); PreparedStatement ps = con.prepareCall(sql)) {
            ps.setString(1, course_name);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {

                Users std = Users.builder()
                        .user_id(rs.getInt("user_id"))
                        .username(rs.getString("username"))
                        .fullname(rs.getString("fullname"))
                        .email(rs.getString("email"))
                        .country(rs.getString("country"))
                        .address(rs.getString("address"))
                        .gender(rs.getString("gender"))
                        .dob(rs.getDate("dob"))
                        .phone(rs.getString("phone"))
                        .course_name(rs.getString("course_name"))
                        .description(rs.getString("description"))
                        .build();

                l.add(std);
            }
            return l;
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return null;
    }

    public Users getUserById(int user_id) {
        String sql = "select * from users u join role r on u.role_id = r.role_id  where user_id = ?";

        try (Connection con = MySQLConnection.getConnection(); PreparedStatement ps = con.prepareCall(sql)) {
            ps.setInt(1, user_id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Role role = Role.builder().build();
                role.setRole_name(rs.getString("role_name"));

                Users user = Users.builder()
                        .user_id(rs.getInt("user_id"))
                        .username(rs.getString("username"))
                        .fullname(rs.getString("fullname"))
                        .email(rs.getString("email"))
                        .country(rs.getString("country"))
                        .address(rs.getString("address"))
                        .gender(rs.getString("gender"))
                        .dob(rs.getDate("dob"))
                        .phone(rs.getString("phone"))
                        .description(rs.getString("description"))
                        .role(role)
                        .build();

                return user;
            }

        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return null;
    }

    public boolean updateUser(String fullname, String username, String email, String curpass) {
        String sql = "UPDATE users \n"
                + "SET fullname = ?, username = ?, email = ?, password=?\n"
                + "WHERE  user_id = 42 ; ";
        try (Connection connection = MySQLConnection.getConnection(); PreparedStatement ps = connection.prepareStatement(sql);) {
            ps.setString(1, fullname);
            ps.setString(2, username);
            ps.setString(3, email);
            ps.setString(4, curpass);

            int affectedRows = ps.executeUpdate();
            if (affectedRows > 0) {
                return true;
            }

        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }

        return false;
    }

    public boolean checkUsername(String username) {
        String sql = "select * from users where username= ?";
        try (Connection connection = MySQLConnection.getConnection(); PreparedStatement ps = connection.prepareStatement(sql);) {
            ps.setString(1, username);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return true;
            }

        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return false;
    }

    public static void main(String[] args) {
        System.out.println(new UsersDAO().updateUser("test", "test", "test", "test"));
    }
}
