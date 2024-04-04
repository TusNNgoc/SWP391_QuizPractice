
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import connection.MySQLConnection;
import entity.Feedback;
import entity.Quiz;
import entity.Users;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.concurrent.ThreadLocalRandom;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class FeedbackDAO {

    public Connection conn = null;
    public PreparedStatement ps = null;
    public ResultSet rs = null;
    public String xSql = null;

    public int getBiggestFeedbackID() {
        int id = 0;
        try {
            // Use try-with-resources to ensure proper resource management
            try (Connection con = MySQLConnection.getConnection()) {
                String strSelect = "SELECT MAX(feedback_id) FROM feedback;;";
                ps = con.prepareStatement(strSelect);
                rs = ps.executeQuery();
                while (rs.next()) {
                    id = rs.getInt(1);
                }
                con.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Message: " + e.getMessage());
        }
        return id;
    }

    public void addFeedBack(String content, String quiz_id, String user_id, String feedbackid) {
        try {
            // Use try-with-resources to ensure proper resource management
            try (Connection con = MySQLConnection.getConnection()) {
                String strSelect = "INSERT INTO feedback (feedback_id, user_id, quiz_id, feedback_text)\n"
                        + "VALUES (?,?,?,?);";
                ps = con.prepareStatement(strSelect);
                ps.setString(2, user_id);
                ps.setString(3, quiz_id);
                ps.setString(4, content);
                ps.setString(1, feedbackid);
                ps.executeUpdate();
                con.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Message: " + e.getMessage());
        }
    }

    public void updateFeedback(String content, String feedbackid) {
        try {
            // Use try-with-resources to ensure proper resource management
            try (Connection con = MySQLConnection.getConnection()) {
                String strSelect = "UPDATE feedback\n"
                        + "SET feedback_text = ?\n"
                        + "WHERE feedback_id = ?;";
                ps = con.prepareStatement(strSelect);
                ps.setString(1, content);
                ps.setString(2, feedbackid);
                ps.executeUpdate();
                con.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Message: " + e.getMessage());
        }
    }

    public Feedback getFeedback(String user_id, String quiz_id) {
        try {
            // Use try-with-resources to ensure proper resource management
            try (Connection con = MySQLConnection.getConnection()) {
                String strSelect = "SELECT * \n"
                        + "FROM feedback \n"
                        + "WHERE user_id = ? AND quiz_id = ? ;";
                ps = con.prepareStatement(strSelect);
                ps.setString(1, user_id);
                ps.setString(2, quiz_id);
                rs = ps.executeQuery();
                while (rs.next()) {
                    Quiz q = Quiz.builder().quiz_id(rs.getInt(3)).build();
                    Users u = Users.builder().user_id(rs.getInt(2)).build();
                    return Feedback.builder().feedback_id(rs.getInt(1))
                            .user_id(u)
                            .quiz_id(q)
                            .feedback_text(rs.getString(4))
                            .build();
                }
                con.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Message: " + e.getMessage());
        }
        return null;
    }

    public List<Feedback> getAllFeedback(String quiz_id) {
        List<Feedback> list = new ArrayList<>();
        try {
            // Use try-with-resources to ensure proper resource management
            try (Connection con = MySQLConnection.getConnection()) {
                String strSelect = "SELECT f.*, fr.*\n"
                        + "FROM feedback f\n"
                        + "LEFT JOIN users fr ON f.user_id = fr.user_id\n"
                        + "WHERE quiz_id = ? ;";
                ps = con.prepareStatement(strSelect);
                ps.setString(1, quiz_id);
                rs = ps.executeQuery();
                while (rs.next()) {
                    Quiz q = Quiz.builder().quiz_id(rs.getInt(3)).build();
                    Users u = Users.builder().user_id(rs.getInt(2)).username(rs.getString(6)).fullname(rs.getString(10)).build();
                    Feedback f = Feedback.builder().feedback_id(rs.getInt(1))
                            .user_id(u)
                            .quiz_id(q)
                            .feedback_text(rs.getString(4))
                            .build();
                    list.add(f);
                }
                con.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Message: " + e.getMessage());
        }
        return list;
    }

    public void deleteFeedback(String feedbackid) {
        String query = "DELETE FROM feedback\n"
                + "where feedback_id = ?;";
        try {
            try (Connection con = MySQLConnection.getConnection()) {
                ps = con.prepareStatement(query);
                ps.setString(1, feedbackid);
                ps.executeUpdate();
            }
        } catch (Exception e) {
            System.out.println(e);
        }
    }
    public String getQuizname(String quiz_id) {
        try {
            // Use try-with-resources to ensure proper resource management
            try (Connection con = MySQLConnection.getConnection()) {
                String strSelect = "SELECT * \n"
                        + "FROM quiz \n"
                        + "WHERE quiz_id = ? ;";
                ps = con.prepareStatement(strSelect);
                ps.setString(1, quiz_id);
                rs = ps.executeQuery();
                while (rs.next()) {
                    return rs.getString("quiz_name");
                }
                con.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Message: " + e.getMessage());
        }
        return null;
    }
    public static void main(String[] args) {
        FeedbackDAO test = new FeedbackDAO();
//        System.out.println(test.getFeedback("40", "1"));
//        System.out.println(test.getAllFeedback("1"));
//        System.out.println(test.getResponse("1"));
//        System.out.println(test.getAllResponse());
//        test.addFeedBack("Good quiz", "1", "74","7");
//        System.out.println(test.getBiggestFeedbackID());
//        test.deleteFeedback("1");
//        test.updateFeedback("1111111111", "8");
System.out.println(test.getQuizname("1"));
    }
}
