package dao;

import connection.MySQLConnection;
import static connection.MySQLConnection.getConnection;
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
            if (affectedRows > 0) {
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
        try (Connection connection = MySQLConnection.getConnection(); PreparedStatement ps = connection.prepareStatement(sql);) {
            ps.setString(1, quiz_name);

            ps.setInt(2, creator_id);
            ps.setInt(3, course_id);
            ps.setString(4, quiz_content);

            int rowAffected = ps.executeUpdate();
            if (rowAffected > 0) {
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return false;
    }

    public static ArrayList<Quiz> getQuizzes() {
        ArrayList<Quiz> list = new ArrayList<>();
        String sql = "SELECT * FROM quiz";

        try (Connection conn = getConnection(); PreparedStatement st = conn.prepareStatement(sql); ResultSet rs = st.executeQuery()) {

            while (rs.next()) {
                int quiz_id = rs.getInt("quiz_id");
                String quiz_name = rs.getString("quiz_name");
                String quiz_content = rs.getString("quiz_content");

                // Tạo một đối tượng Quiz từ dữ liệu từ ResultSet
                Quiz quiz = Quiz.builder()
                        .quiz_id(quiz_id)
                        .quiz_name(quiz_name)
                        .quiz_content(quiz_content)
                        .build();

                list.add(quiz);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }

    public static boolean deleteQuiz(int quiz_id) {
        // Khai báo biến kiểm tra kết quả xóa
        boolean deleted = false;

        // Chuỗi SQL để xóa câu hỏi từ cơ sở dữ liệu
        String sql = "DELETE FROM quiz WHERE quiz_id = ?";

        try (
                // Kết nối cơ sở dữ liệu
                Connection connection = MySQLConnection.getConnection(); // Chuẩn bị câu lệnh SQL
                 PreparedStatement statement = connection.prepareStatement(sql);) {
            // Thiết lập giá trị tham số cho câu lệnh SQL
            statement.setInt(1, quiz_id);

            // Thực thi câu lệnh SQL
            int rowsAffected = statement.executeUpdate();

            // Kiểm tra xem câu hỏi đã được xóa thành công hay không
            if (rowsAffected > 0) {
                deleted = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return deleted;
    }

    public static void addQuiz(String quizName, String quizContent) {
        String sql = "INSERT INTO quiz (quiz_name, quiz_content) VALUES (?, ?)";
        try (Connection conn = MySQLConnection.getConnection(); PreparedStatement statement = conn.prepareStatement(sql)) {
            statement.setString(1, quizName);
            statement.setString(2, quizContent);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public Quiz getQuizByID(String quiz_id) {
        String sql = "SELECT * FROM quiz WHERE quiz_id = ?";
        try (Connection conn = getConnection(); PreparedStatement st = conn.prepareStatement(sql)) {
            st.setString(1, quiz_id); // Thiết lập giá trị cho tham số trong câu lệnh SQL

            try (ResultSet rs = st.executeQuery()) {
                while (rs.next()) {
                    Quiz quiz = Quiz.builder()
                            .quiz_id(rs.getInt("quiz_id"))
                            .quiz_name(rs.getString("quiz_name"))
                            .quiz_content(rs.getString("quiz_content"))
                            .build();
                    // Các trường thông tin khác của quiz

                    return quiz;
                }
            }
        } catch (SQLException e) {
            // Xử lý ngoại lệ SQLException
            System.err.println("Lỗi khi lấy thông tin quiz từ cơ sở dữ liệu: " + e.getMessage());
        }
        return null;
    }

    public void updateQuiz(int quizId, String quizName, String quizContent) {
        String sql = "UPDATE quiz SET quiz_name = ?, quiz_content = ? WHERE quiz_id = ?";
        try (Connection connection = MySQLConnection.getConnection(); PreparedStatement ps = connection.prepareStatement(sql);) {
            ps.setString(1, quizName);
            ps.setString(2, quizContent);
            ps.setInt(3, quizId); // Set the third parameter (quiz_id) using the provided quizId
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

}
