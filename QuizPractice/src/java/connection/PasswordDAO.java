/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package connection;

import entity.Users;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author ASUS
 */
public class PasswordDAO extends MySqlConnection {

    public Connection con = null;
    public PreparedStatement ps = null;
    public ResultSet rs = null;
    public String xSql = null;

    public PasswordDAO() {
        con = connection;
    }

    public void finalize() {
        try {
            if (con != null) {
                con.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public Users getAccountByEmail(String email) {
        try {
            String strSelect = "select * from users \n"
                    + "where email = ?";
            ps = con.prepareStatement(strSelect);
            ps.setString(1, email);
            rs = ps.executeQuery();
            while (rs.next()) {

                return new Users(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8));
            }
        } catch (Exception e) {
            System.out.println("checkAccount: " + e.getMessage());
        }
        return null;
    }

    public static void main(String[] args) {
        PasswordDAO test = new PasswordDAO();
        if (test.getAccountByEmail("123@gmail.com") == null) {
            System.out.println("true");
        } else {
            System.out.println("False");
        }
    }
}
