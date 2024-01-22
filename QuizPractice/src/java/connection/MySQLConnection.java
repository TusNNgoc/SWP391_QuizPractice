package Connection;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class MySqlConnection {
    Connection connection = null;
    public MySqlConnection() {
        // JDBC URL, username, and password of MySQL server
        String url = "jdbc:mysql://localhost:3306/swp391";
        String user = "root";
        String password = "123456@bC";

        // JDBC variables for opening, closing, and managing connection
        

        try {
            // Register JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Open a connection
            System.out.println("Connecting to database...");
            connection = DriverManager.getConnection(url, user, password);

            // Perform database operations here...

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        } finally {
            try {
                if (connection != null) {
                    // Close the connection
                    connection.close();
                    System.out.println("Connection closed.");
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
    public static void main(String[] args) {
        try {
            System.out.println(new MySqlConnection().connection);

        } catch (Exception e) {

        }
    }
}
