
/*  
     * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
     * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import connection.MySQLConnection;
import static connection.MySQLConnection.getConnection;
import entity.User;
import entity.Users;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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

    //       public boolean updateUser (String fullname, String username, String email, String curpass, String newpass){
    //           String sql = "UPDATE users \n"
    //                + "SET fullname = ?, username = ?, email = ?, curpass = ?, newpass=?\n"
    //                + "WHERE  = ?;";
    //        try (Connection connection = MySQLConnection.getConnection(); PreparedStatement ps = connection.prepareStatement(sql);) {
    //            ps.setString(1, quizName);
    //            ps.setString(2, quizContent);
    //            ps.setInt(3, quiz_id);
    //            int affectedRows = ps.executeUpdate();
    //            if(affectedRows > 0){
    //                return true;
    //            }
    // 
    //        } catch (SQLException e) {
    //            e.printStackTrace(System.out);
    //        }
    //
    //        return false;
    //       }
    public boolean updateUser(String fullname, String username, String email, String curpass) {
        String sql = "UPDATE users \n"
                + "SET fullname = ?, username = ?, email = ?, password=?\n"
                + "WHERE  user_id = 20 ; ";
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

    public static int getTotalUsersWithRole1() {
        Connection conn = null;
        PreparedStatement stmt = null;
        int totalUsers = 0;
        ResultSet rs = null;
        try {
            conn = getConnection(); // Sử dụng kết nối từ lớp cha
            String sql = "SELECT COUNT(*) AS TotalUsersWithRole1 FROM users WHERE role_id = 1";
            stmt = conn.prepareStatement(sql);
            rs = stmt.executeQuery();
            if (rs.next()) {
                totalUsers = rs.getInt("TotalUsersWithRole1");
            }
        } catch (SQLException se) {
            se.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (stmt != null) {
                    stmt.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return totalUsers;
    }

    public static int getTotalUsersWithRole2() {
        Connection conn = null;
        PreparedStatement stmt = null;
        int totalUsers = 0;
        ResultSet rs = null;
        try {
            conn = getConnection(); // Sử dụng kết nối từ lớp cha
            String sql = "SELECT COUNT(*) AS TotalUsersWithRole2 FROM users WHERE role_id = 2";
            stmt = conn.prepareStatement(sql);
            rs = stmt.executeQuery();
            if (rs.next()) {
                totalUsers = rs.getInt("TotalUsersWithRole2");
            }
        } catch (SQLException se) {
            se.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (stmt != null) {
                    stmt.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return totalUsers;
    }

    public static int getTotalActiveUsersWithRole() {
        Connection conn = null;
        PreparedStatement stmt = null;
        int totalUsers = 0;
        ResultSet rs = null;
        try {
            conn = getConnection();
            String sql = "SELECT COUNT(*) AS TotalActiveUsersWithRole FROM users WHERE role_id AND account_actived = 1";
            stmt = conn.prepareStatement(sql);
            rs = stmt.executeQuery();
            if (rs.next()) {
                totalUsers = rs.getInt("TotalActiveUsersWithRole");
            }
        } catch (SQLException se) {
            se.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (stmt != null) {
                    stmt.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return totalUsers;
    }

    public static int getTotalAccounts() {
        Connection conn = null;
        PreparedStatement stmt = null;
        int totalAccounts = 0;
        ResultSet rs = null;
        try {
            conn = getConnection(); // Lấy kết nối đến cơ sở dữ liệu
            String sql = "SELECT COUNT(*) AS TotalAccounts FROM users";
            stmt = conn.prepareStatement(sql);
            rs = stmt.executeQuery();
            if (rs.next()) {
                totalAccounts = rs.getInt("TotalAccounts");
            }
        } catch (SQLException se) {
            se.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                // Đóng kết nối, câu lệnh và ResultSet
                if (rs != null) {
                    rs.close();
                }
                if (stmt != null) {
                    stmt.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return totalAccounts;
    }

    public static ArrayList<User> getAccount() {
        ArrayList<User> list = new ArrayList<>();
        String sql = "SELECT * FROM users;";

        try (Connection conn = getConnection(); PreparedStatement st = conn.prepareStatement(sql); ResultSet rs = st.executeQuery()) {

            while (rs.next()) {
                User u = new User(rs.getInt("user_id"), rs.getString("username"),
                        rs.getString("password"), rs.getString("username"),
                        rs.getString("email"), rs.getBoolean("account_actived"),
                        rs.getInt("role_id"), rs.getString("country"),
                        rs.getString("address"), rs.getString("gender"),
                        rs.getDate("dob"), rs.getString("phone"));
                list.add(u);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }



    //tim Users_id


    public static boolean deleteAccount(int user_id) {
        String sql = "DELETE FROM users WHERE user_id = ?";
        try (Connection conn = MySQLConnection.getConnection(); PreparedStatement st = conn.prepareStatement(sql)) {
            st.setInt(1, user_id);
            int rowsDeleted = st.executeUpdate();
            return rowsDeleted > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

//    public boolean updateAccount(User user) {
//        Connection conn = null;
//        PreparedStatement stmt = null;
//
//        try {
//            conn = MySQLConnection.getConnection(); // Lấy kết nối đến cơ sở dữ liệu
//
//            // Câu lệnh SQL để cập nhật thông tin người dùng
//            String sql = "UPDATE users SET fullname=?, username=?, password=?, email=?, country=?, address=?, gender=?, dob=?, phone=? WHERE user_id=?";
//
//            stmt = conn.prepareStatement(sql);
//
//            // Thiết lập các tham số cho câu lệnh SQL
//            stmt.setString(1, user.getFullname());
//            stmt.setString(2, user.getUsername());
//            stmt.setString(3, user.getPassword());
//            stmt.setString(4, user.getEmail());
//            stmt.setString(5, user.getCountry());
//            stmt.setString(6, user.getAddress());
//            stmt.setString(7, user.getGender());
//            stmt.setDate(8, new java.sql.Date(user.getDob().getTime())); // Chuyển đổi java.util.Date sang java.sql.Date
//            stmt.setString(9, user.getPhone());
//            stmt.setInt(10, user.getUser_id());
//
//            // Thực thi câu lệnh SQL để cập nhật dữ liệu
//            int rowsAffected = stmt.executeUpdate();
//
//            // Trả về true nếu có ít nhất một hàng được cập nhật thành công
//            return rowsAffected > 0;
//        } catch (SQLException ex) {
//            // Xử lý các ngoại lệ SQL
//            ex.printStackTrace();
//            return false; // Trả về false nếu có lỗi xảy ra
//        } finally {
//            // Đóng các tài nguyên (connection, statement) sau khi sử dụng
//            try {
//                if (stmt != null) {
//                    stmt.close();
//                }
//                if (conn != null) {
//                    conn.close();
//                }
//            } catch (SQLException ex) {
//                ex.printStackTrace();
//            }
//        }
//    }

//    public boolean addUser(User user) {
//        Connection conn = null;
//        PreparedStatement stmt = null;
//
//        try {
//            // Làm kết nối cơ sở dữ liệu và thêm người dùng vào bảng tương ứng
//            conn = MySQLConnection.getConnection(); // Lấy kết nối đến cơ sở dữ liệu
//            String query = "INSERT INTO users (fullname, username, password, email, role, country, address, gender, dob, phone) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
//            stmt = conn.prepareStatement(query);
//            stmt.setString(1, user.getFullname());
//            stmt.setString(2, user.getUsername());
//            stmt.setString(3, user.getPassword());
//            stmt.setString(4, user.getEmail());
//            stmt.setInt(5, user.getRole());
//            stmt.setString(6, user.getCountry());
//            stmt.setString(7, user.getAddress());
//            stmt.setString(8, user.getGender());
//            java.sql.Date dob = new java.sql.Date(user.getDob().getTime());
//            stmt.setDate(9, dob);
//            stmt.setString(10, user.getPhone());
//
//            int rowsInserted = stmt.executeUpdate();
//            return rowsInserted > 0;
//        } catch (SQLException ex) {
//            ex.printStackTrace();
//            return false;
//        } finally {
//            // Đóng các tài nguyên
//            try {
//                if (stmt != null) {
//                    stmt.close();
//                }
//                if (conn != null) {
//                    conn.close();
//                }
//            } catch (SQLException ex) {
//                ex.printStackTrace();
//            }
//        }
//    }
    
    
    

    public static void main(String[] args) {
        System.out.println(new UsersDAO().updateUser("test", "test", "test", "test"));
        int total = getTotalUsersWithRole1();
        System.out.println(total);
        int to = getTotalUsersWithRole2();
        System.out.println(to);
        int tt = getTotalActiveUsersWithRole();
        System.out.println(tt);
        int t1 = getTotalAccounts();
        System.out.println(t1);

        List<User> accountList = UsersDAO.getAccount();

        // Hiển thị thông tin của từng tài khoản
        for (User user : accountList) {
            System.out.println("User ID: " + user.getUser_id());
            System.out.println("Username: " + user.getUsername());
            System.out.println("Email: " + user.getEmail());
            System.out.println("Account Activated: " + user.isAccountActived());
            System.out.println("Role ID: " + user.getRole());
            System.out.println("country: " + user.getCountry());
            System.out.println("Address: " + user.getAddress());
            System.out.println("Gender: " + user.getGender());
            System.out.println("Date of Birth: " + user.getDob());
            System.out.println("Phone: " + user.getPhone());
            System.out.println("--------------------------------------------");
        }

    }
}
