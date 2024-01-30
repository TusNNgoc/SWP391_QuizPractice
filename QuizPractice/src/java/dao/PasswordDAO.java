package dao;

import entity.Role;
import entity.Users;

import connection.MySQLConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.concurrent.ThreadLocalRandom;
import java.sql.SQLException;


public class PasswordDAO{

    // Fields for database connection
    public Connection conn = null;
    public PreparedStatement ps = null;
    public ResultSet rs = null;
    public String xSql = null;

    /**
     * Retrieves an account by email from the database.
     *
     * @param email Email of the account.
     * @return Users object if the account is found, null otherwise.
     */
    public Users getAccountByEmail(String email) {
        try {
            // Use try-with-resources to ensure proper resource management
            try (Connection con = MySQLConnection.getConnection()) {
                String strSelect = "Select user_id, password, username, email, account_actived, role_id from users WHERE email = ?";
                ps = con.prepareStatement(strSelect);
                ps.setString(1, email);
                rs = ps.executeQuery();
                
                while (rs.next()) {
                    Role r = new Role(rs.getInt("role_id"));
                    return new Users(
                            rs.getInt(1),
                            rs.getString(2),
                            rs.getString(3),
                            rs.getString(4),
                            rs.getBoolean(5),
                            r
                    );
                }
                con.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Message: " + e.getMessage());
        }
        return null;
    }
    public void updatePassword(String email, String password) {
        try (Connection con = MySQLConnection.getConnection()){
            String strAdd = "update Users set password = ? where email = ?";
            ps = con.prepareStatement(strAdd);
            ps.setString(1, password);
            ps.setString(2, email);
            ps.executeUpdate();
            
            con.close();
        } catch (Exception e) {
            System.out.println("updatePassword: " + e.getMessage());
        }
    }
    public boolean updatePassword2(String email, String password) {
    boolean updated = false;
        System.out.println(email);
        System.out.println(password);
    try (Connection con = MySQLConnection.getConnection()) {
        String strAdd = "UPDATE Users SET password = ? WHERE email = ?";
        try (PreparedStatement ps = con.prepareStatement(strAdd)) {
            ps.setString(1, password);
            ps.setString(2, email);

            int rowsAffected = ps.executeUpdate();
            
            if (rowsAffected > 0) {
                updated = true;
            }
        }
    } catch (Exception e) {
        System.out.println("updatePassword: " + e.getMessage());
    }
    return updated;
}
        public static String generateRandomString(int length) {
        StringBuilder stringBuilder = new StringBuilder(length);

        try {
            for (int i = 0; i < length; i++) {
                int randomType = ThreadLocalRandom.current().nextInt(2); // 0 for digit, 1 for uppercase letter
                char randomChar;

                if (randomType == 0) {
                    randomChar = (char) ('0' + ThreadLocalRandom.current().nextInt(10)); // Digit
                } else {
                    randomChar = (char) ('A' + ThreadLocalRandom.current().nextInt(26)); // Uppercase letter
                }

                stringBuilder.append(randomChar);
            }
        } catch (Exception e) {
            System.err.println("Error generating random string: " + e.getMessage());
            e.printStackTrace();
        }

        return stringBuilder.toString();
    }
    /**
     * Main method for testing the PasswordDAO class.
     *
     * @param args Command line arguments.
     */
    public static void main(String[] args) {
        PasswordDAO test = new PasswordDAO();
        if (test.getAccountByEmail("john@example.com") == null) {
            System.out.println("Account not found");
        } else {
            System.out.println("Account found");
        }
//        test.updatePassword("rerollchotrung@gmail.com", "123");
//        boolean a=test.updatePassword2("rerollchotrung@gmail.com", "12345");
//        System.out.println(a);
//     String randomString = generateRandomString(6);
//        System.out.println("Random String: " + randomString);
    }
}
