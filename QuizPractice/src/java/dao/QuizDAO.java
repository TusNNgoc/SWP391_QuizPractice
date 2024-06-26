package dao;

import com.microsoft.sqlserver.jdbc.SQLServerException;
import connection.MySQLConnection;
import entity.Courses;
import entity.Quiz;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author HP
 */
public class QuizDAO {

    public Quiz getFirst() {

        String sql = "SELECT * \n"
                + "FROM course c \n"
                + "JOIN quiz q ON c.course_id = q.course_id\n"
                + "LIMIT 1; ";
        try (Connection connection = MySQLConnection.getConnection(); PreparedStatement ps = connection.prepareStatement(sql);) {
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {

                Courses course = Courses.builder().build();
                course.setCourse_name(rs.getString("course_name"));

                Quiz quiz = Quiz.builder()
                        .quiz_name(rs.getString("quiz_name"))
                        .course_id(course)
                        .build();
            }

        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }

        return null;
    }

    public List<Quiz> getQuizByCourseId(int course_id) {
        String sql = "select DISTINCT * from quiz q join course c on c.course_id = q.course_id where q.course_id = ? ";
        try (Connection connection = MySQLConnection.getConnection(); PreparedStatement ps = connection.prepareStatement(sql);) {
            ps.setInt(1, course_id);
            ResultSet rs = ps.executeQuery();
            List<Quiz> list = new ArrayList<>();
            while (rs.next()) {
                
    
                
                Courses course = Courses.builder().build();
                course.setCourse_name(rs.getString("course_name"));

                Quiz quiz = Quiz.builder()
                        .quiz_id(rs.getInt("quiz_id"))
                        .quiz_name(rs.getString("quiz_name"))
                        .quiz_content(rs.getString("quiz_content"))
                        .course_id(course)
                        .build();
                list.add(quiz);
            }
            return list;
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }

        return null;
    }

    public boolean updateQuizById(String quizName, String quizContent, int quiz_id) {
        String sql = "UPDATE quiz \n"
                + "SET quiz_name = ?, quiz_content = ?\n"
                + "WHERE quiz.quiz_id = ?;";
        try (Connection connection = MySQLConnection.getConnection(); PreparedStatement ps = connection.prepareStatement(sql);) {
            ps.setString(1, quizName);
            ps.setString(2, quizContent);
            ps.setInt(3, quiz_id);
            int affectedRows = ps.executeUpdate();
            if(affectedRows > 0){
                return true;
            }
 
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }

        return false;
    }
    
    public boolean insertQuiz(String quiz_name, String quiz_content, int course_id, int creator_id) {
        String sql = "INSERT INTO quiz (quiz_name, creator_id, course_id, quiz_content )\n"
                + "VALUES (?, ?, ?, ?);";
        try(Connection connection = MySQLConnection.getConnection(); PreparedStatement ps = connection.prepareStatement(sql);){
            ps.setString(1, quiz_name);
            
            ps.setInt(2, creator_id);
            ps.setInt(3, course_id);
            ps.setString(4, quiz_content);
            
            int rowAffected = ps.executeUpdate();
            if(rowAffected > 0){
                return true;
            }
        }catch(SQLException e){
            e.printStackTrace(System.out);
        }
        return false;
    }

}
