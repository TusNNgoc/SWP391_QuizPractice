package db;

import static db.MathsQuiz.a;
import static db.MathsQuiz.answer_index;
import static db.MathsQuiz.b;
import static db.MathsQuiz.c;
import static db.MathsQuiz.d;
import static db.MathsQuiz.question;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

public class MathsQuizDAO {

    public static int getMaxSrNo() {
        try(Connection conn = Connect.createConnection()) {
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("select max(srno) from maths_ques");
            if(rs.next()) {
                return rs.getInt(1);
            } else {
                return 0;
            }
        } catch(Exception e) {
            e.printStackTrace();
            return 0;
        }
    }

    public static boolean createQuestion(int srno, MathsQuiz quiz) {
        try(Connection conn = Connect.createConnection()) {
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("select * from maths_ques where srno=" + srno);
            if(rs.next()) {
                quiz.setQuestion(rs.getString(2));
                quiz.setA(rs.getString(3));
                quiz.setB(rs.getString(4));
                quiz.setC(rs.getString(5));
                quiz.setD(rs.getString(6));
                quiz.setAnswerIndex(rs.getInt(7));
                return true;
            } else {
                return false;
            }
        } catch(Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}
