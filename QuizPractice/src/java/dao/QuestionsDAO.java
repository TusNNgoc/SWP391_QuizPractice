
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import connection.MySQLConnection;
import static connection.MySQLConnection.getConnection;
import entity.Courses;
import entity.Questions;
import entity.Quiz;
import entity.Type;
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
public class QuestionsDAO {

    public List<Questions> getQuestionByQuizId(int quiz_id) {
        String sql = "select * from question q join quiz i on q.quiz_id = i.quiz_id join type t on q.type_id = t.type_id where q.quiz_id = ?";
        try (Connection connection = MySQLConnection.getConnection(); PreparedStatement ps = connection.prepareStatement(sql);) {
            ps.setInt(1, quiz_id);
            ResultSet rs = ps.executeQuery();
            List<Questions> list = new ArrayList<>();
            while (rs.next()) {

                Quiz quiz = Quiz.builder().build();
                quiz.setQuiz_name(rs.getString("quiz_name"));

                Type type = Type.builder().build();
                type.setType_name(rs.getString("type_name"));

                Questions questions = Questions.builder()
                        .question_id(rs.getInt("question_id"))
                        .question_text(rs.getString("question_text"))
                        .type_id(type)
                        .quiz_id(quiz)
                        .build();
                list.add(questions);
            }
            return list;
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }

        return null;
    }

    //them quiz vao dang fix cung la type
    //auto la true
    public boolean insertQuestion(String question_text, int quiz_id) {
        String sql = "INSERT INTO question (question_text, quiz_id, type_id)\n"
                + "VALUES (?, ?, 1);";
        try (Connection connection = MySQLConnection.getConnection(); PreparedStatement ps = connection.prepareStatement(sql);) {
            ps.setString(1, question_text);
            ps.setInt(2, quiz_id);

            int rowAffected = ps.executeUpdate();
            if (rowAffected > 0) {
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return true;
    }

    public static ArrayList<Questions> getQuestionsWithQuizName() {
        ArrayList<Questions> list = new ArrayList<>();
        String sql = "SELECT q.question_id, q.type_id, q.question_text, q.quiz_id, q.difficulty_id, z.quiz_name "
                + "FROM question q INNER JOIN quiz z ON q.quiz_id = z.quiz_id"; // Thực hiện INNER JOIN để kết hợp thông tin của bài kiểm tra

        try (Connection conn = getConnection(); PreparedStatement st = conn.prepareStatement(sql); ResultSet rs = st.executeQuery()) {

            while (rs.next()) {
                int question_id = rs.getInt("question_id");
                int type_id = rs.getInt("type_id");
                String question_text = rs.getString("question_text");
                int quiz_id = rs.getInt("quiz_id");
                int difficulty_id = rs.getInt("difficulty_id");
                String quiz_name = rs.getString("quiz_name"); // Lấy tên của bài kiểm tra

                // Tạo đối tượng Questions với thông tin của câu hỏi và tên của bài kiểm tra
                Quiz quiz = Quiz.builder()
                        .quiz_id(quiz_id)
                        .quiz_name(quiz_name)
                        .build();

                Type type = Type.builder()
                        .type_id(type_id)
                        .build();

                Questions question = Questions.builder()
                        .question_id(question_id)
                        .type_id(type)
                        .question_text(question_text)
                        .quiz_id(quiz)
                        .dificulty_id(difficulty_id)
                        .build();

                list.add(question);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }

    public static boolean deleteQuestion(int questionId) {
        boolean deleted = false;
        String sql = "DELETE FROM question WHERE question_id = ?";

        try (Connection conn = getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, questionId);
            int rowsAffected = stmt.executeUpdate();

            if (rowsAffected > 0) {
                deleted = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return deleted;
    }

    public static List<String> getQuestionNames() {
        List<String> questionNames = new ArrayList<>();
        String sql = "SELECT question_text FROM question";

        try (Connection conn = getConnection(); PreparedStatement stmt = conn.prepareStatement(sql); ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                String questionName = rs.getString("question_text");
                questionNames.add(questionName);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        // Ghi danh sách tên câu hỏi ra console
        System.out.println("List of question names:");
        for (String name : questionNames) {
            System.out.println(name);
        }

        return questionNames;
    }

    public static int gettotal2() {
        Connection conn = null;
        PreparedStatement stmt = null;
        int num2 = 0;
        ResultSet rs = null;
        try {
            conn = getConnection(); // Sử dụng kết nối từ lớp cha
            String sql = "SELECT COUNT(*) AS num2\n"
                    + "FROM question\n"
                    + "WHERE difficulty_id = 2;";
            stmt = conn.prepareStatement(sql);
            rs = stmt.executeQuery();
            if (rs.next()) {
                num2 = rs.getInt("num2"); // Sửa lại tên cột này thành num2
            }
        } catch (SQLException se) {
            se.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (stmt != null) {
                    stmt.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return num2;
    }

    public static int gettotal1() {
        Connection conn = null;
        PreparedStatement stmt = null;
        int num1 = 0;
        ResultSet rs = null;
        try {
            conn = getConnection(); // Sử dụng kết nối từ lớp cha
            String sql = "SELECT COUNT(*) AS num1\n"
                    + "FROM question\n"
                    + "WHERE difficulty_id = 1;";
            stmt = conn.prepareStatement(sql);
            rs = stmt.executeQuery();
            if (rs.next()) {
                num1 = rs.getInt("num1");
            }
        } catch (SQLException se) {
            se.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (stmt != null) {
                    stmt.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return num1;
    }

    public static int gettotal3() {
        Connection conn = null;
        PreparedStatement stmt = null;
        int num3 = 0;
        ResultSet rs = null;
        try {
            conn = getConnection(); // Sử dụng kết nối từ lớp cha
            String sql = "SELECT COUNT(*) AS num3\n"
                    + "FROM question\n"
                    + "WHERE difficulty_id = 3;";
            stmt = conn.prepareStatement(sql);
            rs = stmt.executeQuery();
            if (rs.next()) {
                num3 = rs.getInt("num3");
            }
        } catch (SQLException se) {
            se.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (stmt != null) {
                    stmt.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return num3;
    }

    public String[] getQuestionById(String questionId) {
        String[] questionInfo = new String[2]; // Mảng chứa thông tin về cấp độ độ khó và nội dung câu hỏi
        String sql = "SELECT dl.difficulty_name, q.question_text "
                + "FROM question q "
                + "JOIN difficulty_levels dl ON q.difficulty_id = dl.difficulty_id "
                + "WHERE q.question_id = ?";
        try (Connection connection = MySQLConnection.getConnection(); PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, questionId); // Thiết lập giá trị cho tham số trong câu lệnh SQL

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    // Lấy thông tin từ ResultSet
                    String difficultyName = rs.getString("difficulty_name");
                    String questionText = rs.getString("question_text");

                    // Lưu thông tin vào mảng
                    questionInfo[0] = difficultyName;
                    questionInfo[1] = questionText;
                }
            }
        } catch (SQLException e) {
            // Xử lý ngoại lệ SQLException
            System.err.println("Lỗi khi lấy thông tin câu hỏi từ cơ sở dữ liệu: " + e.getMessage());
        }
        return questionInfo;
    }

    public void updateQuestion(int questionId, String newQuestionText, int newDifficultyId) {
        String sql = "UPDATE question SET question_text = ?, difficulty_id = ? WHERE question_id = ?";
        try (Connection connection = MySQLConnection.getConnection(); PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, newQuestionText);
            ps.setInt(2, newDifficultyId);
            ps.setInt(3, questionId);

            int rowsAffected = ps.executeUpdate();
            if (rowsAffected == 0) {
                System.out.println("Không có câu hỏi nào được cập nhật.");
            } else {
                System.out.println("Câu hỏi đã được cập nhật thành công.");
            }
        } catch (SQLException e) {
            System.err.println("Lỗi khi cập nhật câu hỏi trong cơ sở dữ liệu: " + e.getMessage());
        }
    }

    public static List<Questions> getEasyQuestions() {
        List<Questions> questions = new ArrayList<>();
        String sql = "SELECT question_id, type_id, question_text, quiz_id, difficulty_id FROM question WHERE difficulty_id = 1";

        try (Connection conn = getConnection(); PreparedStatement stmt = conn.prepareStatement(sql); ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                // Xử lý từng dòng dữ liệu từ ResultSet và thêm vào danh sách câu hỏi
                // Code tạo đối tượng Questions từ ResultSet ở đây
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return questions;
    }


    public static void main(String[] args) {
        // Cung cấp thông tin cho việc cập nhật câu hỏi
        int questionId = 1; // ID của câu hỏi cần cập nhật
        String newQuestionText = "anh dep trai khong?"; // Nội dung mới của câu hỏi
        int newDifficultyId = 2; // ID của cấp độ độ khó mới

        // Tạo một đối tượng QuestionsDAO để sử dụng phương thức updateQuestion
        QuestionsDAO dao = new QuestionsDAO();

        // Gọi phương thức updateQuestion với thông tin đã cung cấp
        dao.updateQuestion(questionId, newQuestionText, newDifficultyId);
    }


}



