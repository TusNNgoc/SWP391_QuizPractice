/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import connection.MySQLConnection;
import entity.Answer;
import entity.Courses;
import entity.Questions;
import entity.Quiz;
import entity.Type;
import entity.Users;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author ASUS
 */
public class TeacherDAO {

    public Connection conn = null;
    public PreparedStatement ps = null;
    public ResultSet rs = null;
    public String xSql = null;

    public void createQuiz(String course_id, String quiz_name, int creator_id, String quiz_content) {
        try {
            try (Connection con = MySQLConnection.getConnection()) {
                String sql = "INSERT INTO quiz (quiz_name, creator_id, course_id, quiz_content)\n"
                        + " VALUES (?,?,?,?);";
                ps = con.prepareStatement(sql);
                ps.setString(1, quiz_name);
                ps.setInt(2, creator_id);
                ps.setString(3, course_id);
                ps.setString(4, quiz_content);
                ps.executeUpdate();
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Message: " + e.getMessage());
        }
    }

    public boolean isQuizIdExist(String quizID) {
        try {
            try (Connection con = MySQLConnection.getConnection()) {
                // SQL query to check if a service exists with the given parameters and is not valid
                String sql = "SELECT * FROM quiz\n"
                        + "WHERE quiz_id = ?;  ";
                // Create a prepared statement
                ps = con.prepareStatement(sql);
                ps.setString(1, quizID);
                // Execute the query
                rs = ps.executeQuery();
                //if rs has value
                if (rs.next()) {
                    // Close resources
                    rs.close();
                    ps.close();
                    return true;
                }
                // Close resources
                rs.close();
                ps.close();
                // No matching autoPartID found
                return false;
            }
        } catch (SQLException e) {
            // Handle any errors that may occur
            e.printStackTrace();
            // Handle the error here and return false or throw an exception
            return false;
        }
    }

    public void addQuestion(String question_text, String quiz_id, String type) {
        try {
            try (Connection con = MySQLConnection.getConnection()) {
                String sql = "INSERT INTO question (question_text, quiz_id, type_id)\n"
                        + " VALUES (?,?,?);";
                ps = con.prepareStatement(sql);
                ps.setString(1, question_text);
                ps.setString(2, quiz_id);
                ps.setString(3, type);
                ps.executeUpdate();
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Message: " + e.getMessage());
        }
    }

    public List<Courses> getAllCourseName() {
        List<Courses> list = new ArrayList<>();
        try {
            try (Connection con = MySQLConnection.getConnection()) {

                // SQL query to check if a service exists with the given parameters and is not valid
                String sql = "SELECT course_id, course_name, student_id FROM course;";
                // Create a prepared statement
                ps = con.prepareStatement(sql);
                // Execute the query
                rs = ps.executeQuery();
                //if rs has value
                while (rs.next()) {
                    Users u = new Users(rs.getInt("student_id"));
                    Courses c = new Courses(rs.getInt(1), rs.getString(2), u);
                    list.add(c);
                }
                // Close resources
                rs.close();
                ps.close();
                // No matching autoPartID found                
            }
        } catch (SQLException e) {
            // Handle any errors that may occur
            e.printStackTrace();
            // Handle the error here and return false or throw an exception
        }
        return list;
    }

    public List<Type> getAllType() {
        List<Type> list = new ArrayList<>();
        try {
            try (Connection con = MySQLConnection.getConnection()) {

                // SQL query to check if a service exists with the given parameters and is not valid
                String sql = "SELECT * FROM type;";
                // Create a prepared statement
                ps = con.prepareStatement(sql);
                // Execute the query
                rs = ps.executeQuery();
                //if rs has value
                while (rs.next()) {
                    Type c = new Type(rs.getInt(1), rs.getString(2));
                    list.add(c);
                }
                // Close resources
                rs.close();
                ps.close();
                // No matching autoPartID found                
            }
        } catch (SQLException e) {
            // Handle any errors that may occur
            e.printStackTrace();
            // Handle the error here and return false or throw an exception
        }
        return list;
    }

    public int getNewestQuizId() {
        int id = 0;
        try {
            try (Connection con = MySQLConnection.getConnection()) {

                // SQL query to check if a service exists with the given parameters and is not valid
                String sql = "SELECT MAX(quiz_id) FROM quiz;";
                // Create a prepared statement
                ps = con.prepareStatement(sql);
                // Execute the query
                rs = ps.executeQuery();
                //if rs has value
                while (rs.next()) {
                    id = rs.getInt(1);
                }
                // Close resources
                rs.close();
                ps.close();
                // No matching autoPartID found                
            }
        } catch (SQLException e) {
            // Handle any errors that may occur
            e.printStackTrace();
            // Handle the error here and return false or throw an exception
        }
        return id;
    }

    public int getNewestQuestionId() {
        int id = 0;
        try {
            try (Connection con = MySQLConnection.getConnection()) {

                // SQL query to check if a service exists with the given parameters and is not valid
                String sql = "SELECT MAX(question_id) FROM question;";
                // Create a prepared statement
                ps = con.prepareStatement(sql);
                // Execute the query
                rs = ps.executeQuery();
                //if rs has value
                while (rs.next()) {
                    id = rs.getInt(1);
                }
                // Close resources
                rs.close();
                ps.close();
                // No matching autoPartID found                
            }
        } catch (SQLException e) {
            // Handle any errors that may occur
            e.printStackTrace();
            // Handle the error here and return false or throw an exception
        }
        return id;
    }

    public void addAnswer(String answer_text, String question_id, boolean isCorrect) {
        try {
            try (Connection con = MySQLConnection.getConnection()) {
                String sql = "INSERT INTO answer (question_id, answer_text, is_correct)\n"
                        + " VALUES (?,?,?);";
                ps = con.prepareStatement(sql);
                ps.setString(1, question_id);
                ps.setString(2, answer_text);
                ps.setBoolean(3, isCorrect);
                ps.executeUpdate();
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Message: " + e.getMessage());
        }
    }

    public Quiz getQuizByID(String quizID) {
        Quiz list = new Quiz();
        String query = "SELECT quiz_id, quiz_name, course.course_id, course_name from quiz INNER JOIN course\n"
                + "ON quiz.course_id = course.course_id\n"
                + "where quiz_id = ?;";
        try {
            try (Connection con = MySQLConnection.getConnection()) {
                ps = con.prepareStatement(query);
                ps.setString(1, quizID);
                rs = ps.executeQuery();
                while (rs.next()) {
                    Courses c = new Courses(rs.getInt("course_id"), rs.getString("course_name"));
                    list = new Quiz(rs.getInt(1),
                            rs.getString(2),
                            c);
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public Questions getQuestionByID(String questionID) {
        Questions list = new Questions();
        String query = "SELECT question_id, type_id, question_text, quiz_id from question \n"
                + "where quiz_id = ?;";
        try {
            try (Connection con = MySQLConnection.getConnection()) {
                ps = con.prepareStatement(query);
                ps.setString(1, questionID);
                rs = ps.executeQuery();
                while (rs.next()) {
                    Quiz c = new Quiz(rs.getInt("quiz_id"));
                    Type t = new Type(rs.getInt("type_id"));
                    list = new Questions(rs.getInt(1), t,
                            rs.getString(3),
                            c);
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Answer> getAnswerByQuestion(String questionID) {
        List<Answer> list = new ArrayList<>();
        String query = "SELECT * FROM answer "
                + "WHERE question_id = ? "
                + "ORDER BY is_correct DESC;";

        try {
            try (Connection con = MySQLConnection.getConnection()) {
                ps = con.prepareStatement(query);
                ps.setString(1, questionID);
                rs = ps.executeQuery();
                while (rs.next()) {
                    Questions c = new Questions(rs.getInt("question_id"));
                    Answer q = new Answer(rs.getInt(1), c,
                            rs.getString(3),
                            rs.getByte(4));
                    list.add(q);
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public void updateQuiz(String quiz_id, String quiz_name, String course_id) {
        String query = "Update quiz\n"
                + "Set quiz_name=? ,course_id=?\n"
                + "where quiz_id = ?;";
        try {
            try (Connection con = MySQLConnection.getConnection()) {
                ps = con.prepareStatement(query);
                ps.setString(1, quiz_name);
                ps.setString(2, course_id);
                ps.setString(3, quiz_id);
                ps.executeUpdate();
            }
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public void updateQuestion(String question_id, String question_text, String type_id) {
        String query = "Update question\n"
                + "Set question_text=? ,type_id=?\n"
                + "where question_id = ?;";
        try {
            try (Connection con = MySQLConnection.getConnection()) {
                ps = con.prepareStatement(query);
                ps.setString(1, question_text);
                ps.setString(2, type_id);
                ps.setString(3, question_id);
                ps.executeUpdate();
            }
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public void updateAnswer(String answer_id, String answer_text) {
        String query = "Update answer\n"
                + "Set answer_text=?\n"
                + "where answer_id = ?;";
        try {
            try (Connection con = MySQLConnection.getConnection()) {
                ps = con.prepareStatement(query);
                ps.setString(1, answer_text);
                ps.setString(2, answer_id);
                ps.executeUpdate();
            }
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public void deleteAllAnswer(String question_id) {
        String query = "DELETE FROM answer \n"
                + "WHERE question_id = ?;";
        try {
            try (Connection con = MySQLConnection.getConnection()) {
                ps = con.prepareStatement(query);
                ps.setString(1, question_id);
                ps.executeUpdate();
            }
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public void deleteQuestion(String question_id) {
        String query = "DELETE FROM question \n"
                + "WHERE question_id = ?;";
        try {
            try (Connection con = MySQLConnection.getConnection()) {
                ps = con.prepareStatement(query);
                ps.setString(1, question_id);
                ps.executeUpdate();
            }
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public void deleteQuiz(String quiz_id) {
        String query = "DELETE FROM quiz \n"
                + "WHERE quiz_id = ?;";
        try {
            try (Connection con = MySQLConnection.getConnection()) {
                ps = con.prepareStatement(query);
                ps.setString(1, quiz_id);
                ps.executeUpdate();
            }
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public List<Questions> getQuestionByQuizID(String quiz_id) {
        List<Questions> list = new ArrayList<>();
        String query = "SELECT * FROM question "
                + "WHERE quiz_id = ? ";

        try {
            try (Connection con = MySQLConnection.getConnection()) {
                ps = con.prepareStatement(query);
                ps.setString(1, quiz_id);
                rs = ps.executeQuery();
                while (rs.next()) {
                    Quiz c = new Quiz(rs.getInt("quiz_id"));
                    Type t = new Type(rs.getByte("type_id"));
                    Questions q = new Questions(rs.getInt(1), t, rs.getString(3),
                            c);
                    list.add(q);
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public static void main(String[] args) {
        TeacherDAO test = new TeacherDAO();
//        if(test.isQuizIdExist("2")) System.out.println("Existed");
//        else System.out.println("Not existed");
//        test.createQuiz("2", "Test", 46);
//        test.addQuestion("123", "1", "1");
//        System.out.println(test.getAllCourseName());
//        System.out.println(test.getNewestQuizId());
//        System.out.println(test.getAllType());
//        test.addAnswer("123", "13", true);
//        System.out.println(test.getQuizByID("5"));
//        test.updateQuiz("13", "updated name", "1");
//        System.out.println(test.getQuestionByID("1"));
//        System.out.println(test.getAnswerByQuestion("1"));
        System.out.println(test.getQuestionByQuizID("2"));
    }
}
