/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import connection.MySQLConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author ASUS
 */
public class TeacherDAO {

    public Connection conn = null;
    public PreparedStatement ps = null;
    public ResultSet rs = null;
    public String xSql = null;

    public void createQuiz(int quiz_id, String quiz_name, int creator_id) {
        try {
            try (Connection con = MySQLConnection.getConnection()) {
                String sql = "INSERT INTO quiz (quiz_id, quiz_name, creator_id)\n"
                        + " VALUES (?,?,?)";
                ps = con.prepareStatement(sql);
                ps.setInt(1, quiz_id);
                ps.setString(2, quiz_name);
                ps.setInt(3,creator_id);
                ps.executeUpdate();
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Message: " + e.getMessage());
        }
    }

    public static void main(String[] args) {
        TeacherDAO test = new TeacherDAO();
        test.createQuiz(3, "Test", 46);
    }
}
