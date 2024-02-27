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

    public List<Quiz> getAll() {
        List<Quiz> quizzes = new ArrayList<>();
        String sql = "select * f";
        return null;

    }

    public Quiz getFirst() {
       
        String sql = "SELECT * \n"
                + "FROM course c \n"
                + "JOIN quiz q ON c.course_id = q.course_id\n"
                + "LIMIT 1; ";
        try(Connection connection = MySQLConnection.getConnection(); PreparedStatement ps = connection.prepareStatement(sql);){
            ResultSet rs = ps.executeQuery();
            while (rs.next() ) {
                
                Courses course = Courses.builder().build();
                course.setCourse_name(rs.getString("course_name"));
                
                Quiz quiz = Quiz.builder()
                        .quiz_name(rs.getString("quiz_name"))
                        .course_id(course)
                        .build();
            }
        
        }catch(SQLException e){
            e.printStackTrace(System.out);
        }

        return null;
    }
}
