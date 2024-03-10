
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import connection.MySQLConnection;
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
        try(Connection connection = MySQLConnection.getConnection(); PreparedStatement ps = connection.prepareStatement(sql);){
            ps.setString(1, question_text);
            ps.setInt(2, quiz_id);
            
            int rowAffected = ps.executeUpdate();
            if(rowAffected > 0){
                return true;
            }
        }catch(SQLException e){
            e.printStackTrace(System.out);
        }
        return true;
    }
}
