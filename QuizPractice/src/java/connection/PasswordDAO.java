package connection;

import entity.Users;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 * DAO class for handling password-related operations.
 */
public class PasswordDAO extends MySQLConnection{

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
                String strSelect = "SELECT * FROM users WHERE email = ?";
                ps = con.prepareStatement(strSelect);
                ps.setString(1, email);
                rs = ps.executeQuery();

                while (rs.next()) {
                    return new Users(
                            rs.getInt(1),
                            rs.getString(2),
                            rs.getString(3),
                            rs.getString(4),
                            rs.getString(5),
                            rs.getString(6),
                            rs.getString(7),
                            rs.getString(8)
                    );
                }
                con.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("getAccountByEmail: " + e.getMessage());
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
        boolean a=test.updatePassword2("rerollchotrung@gmail.com", "12345");
        System.out.println(a);
    }
}
