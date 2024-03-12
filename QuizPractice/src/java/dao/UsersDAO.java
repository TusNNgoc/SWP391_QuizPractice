
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
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
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

    public static void insertStudent(String fullname, String password, String username, String email, boolean accountActived, int role, String country, String address, String gender, java.util.Date dob, String phone) {
        // Convert Date to String
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        String dobString = dateFormat.format(dob);

        // Convert int to String
        String roleString = String.valueOf(role);

        // Your insertion logic here
        // For example:
        String sql = "INSERT INTO users (fullname, username, password, email, account_actived, role_id, country, address, gender, dob, phone) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try (Connection conn = MySQLConnection.getConnection(); PreparedStatement statement = conn.prepareStatement(sql)) {
            statement.setString(1, fullname);
            statement.setString(2, username);
            statement.setString(3, password);
            statement.setString(4, email);
            statement.setBoolean(5, accountActived);
            statement.setString(6, roleString);
            statement.setString(7, country);
            statement.setString(8, address);
            statement.setString(9, gender);
            statement.setString(10, dobString);
            statement.setString(11, phone);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public User getUserByID(String user_id) {
        String sql = "SELECT * FROM users WHERE user_id = ?";
        try (Connection conn = getConnection(); PreparedStatement st = conn.prepareStatement(sql)) {
            st.setString(1, user_id); // Thiết lập giá trị cho tham số trong câu lệnh SQL

            try (ResultSet rs = st.executeQuery()) {
                if (rs.next()) {
                    User u = new User(rs.getInt("user_id"), rs.getString("username"),
                            rs.getString("password"), rs.getString("username"),
                            rs.getString("email"), rs.getBoolean("account_actived"),
                            rs.getInt("role_id"), rs.getString("country"),
                            rs.getString("address"), rs.getString("gender"),
                            rs.getDate("dob"), rs.getString("phone"));
                    return u;
                }
            }
        } catch (SQLException e) {
            // Xử lý ngoại lệ SQLException
            System.err.println("Lỗi khi lấy người dùng từ cơ sở dữ liệu: " + e.getMessage());
        }
        return null;
    }

    public void updateAllUser(String userId, String fullname, String username, String password, String email, int role, String country, String address, String gender, String dob, String phone) {
        String sql = "UPDATE users SET fullname = ?, username = ?, password = ?, email = ?, role_id = ?, country = ?, address = ?, gender = ?, dob = ?, phone = ? WHERE user_id = ?";
        try (Connection connection = MySQLConnection.getConnection(); PreparedStatement ps = connection.prepareStatement(sql);) {
            ps.setString(1, fullname);
            ps.setString(2, username);
            ps.setString(3, password);
            ps.setString(4, email);
            ps.setInt(5, role);
            ps.setString(6, country);
            ps.setString(7, address);
            ps.setString(8, gender);
            ps.setString(9, dob);
            ps.setString(10, phone);
            ps.setString(11, userId);
            ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();

        }
    }

    public boolean isUsernameUnique(String username, String userId) {
        String sql = "SELECT COUNT(*) FROM users WHERE username = ? AND user_id != ?";
        try (Connection connection = MySQLConnection.getConnection(); PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, username);
            ps.setString(2, userId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    int count = rs.getInt(1);
                    return count == 0; // Trả về true nếu không có người dùng nào khác sử dụng tên người dùng này, trừ người dùng hiện tại
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false; // Trả về false nếu có lỗi xảy ra hoặc không thể kiểm tra
    }

    public static void main(String[] args) {

        UsersDAO dao = new UsersDAO();

        // Get user by ID
        User u = dao.getUserByID("79");

        // Print the retrieved user
        System.out.println(u);

        // Perform update operation
        dao.updateAllUser("41", "Tú Ngu ", "johndoe", "newpassword", "johndoe@example.com", 2, "USA", "123 Main St", "Male", "1990-01-01", "1234567890");

        // Print a message after update operation
        System.out.println("User updated successfully.");
    }

}
