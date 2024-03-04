
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
    public List<Questions> getAllQuestion() {
        String sql = "select * from question q join quiz i on q.quiz_id = i.quiz_id join type t on q.type_id = t.type_id";
        try (Connection connection = MySQLConnection.getConnection(); PreparedStatement ps = connection.prepareStatement(sql);) {
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
}

