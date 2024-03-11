
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import connection.MySQLConnection;
import entity.Answer;
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
public class AnswerDAO {

    public Answer getAnswerByAnswerId(int answer_id){
        String sql = "select * from answer where answer_id = ?";
        
        return null;
    }
    
    public List<Answer> getAnswerByQuestionId(int quiz_id) {
        String sql = "select * from answer a join question q on a.question_id = q.question_id where a.question_id = ?";
        try (Connection connection = MySQLConnection.getConnection(); PreparedStatement ps = connection.prepareStatement(sql);) {
            ps.setInt(1, quiz_id);
            ResultSet rs = ps.executeQuery();
            List<Answer> list = new ArrayList<>();
            while (rs.next()) {

                Answer answer = Answer.builder()
                        .answer_id(rs.getInt("answer_id"))
                        .answer_text(rs.getString("answer_text"))
                        .is_correct(rs.getByte("is_correct"))
                        .build();
                list.add(answer);
            }
            return list;
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }

        return null;
    }

    public boolean insertAnswer(int question_id, String answer_text, int is_correct) {
        String sql = "INSERT INTO answer (answer_text, question_id, is_correct)\n"
                + "VALUES (?, ?, ?);";
        try (Connection connection = MySQLConnection.getConnection(); PreparedStatement ps = connection.prepareStatement(sql);) {
            ps.setString(1, answer_text);
            ps.setInt(2, question_id);
            ps.setInt(3, is_correct);

            int rowAffected = ps.executeUpdate();
            if (rowAffected > 0) {
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return true;
    }

}
