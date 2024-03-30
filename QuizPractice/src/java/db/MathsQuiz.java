package db;

import static db.Connect.createConnection;
import java.sql.*;
import java.util.Random;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

public class MathsQuiz
{
	public static String question;
	public static String a;
	public static String b;
	public static String c;
	public static String d;
	public static int answer_index;

    public static String getQuestion() {
        return question;
    }

    public static void setQuestion(String question) {
        MathsQuiz.question = question;
    }

    public static String getA() {
        return a;
    }

    public static void setA(String a) {
        MathsQuiz.a = a;
    }

    public static String getB() {
        return b;
    }

    public static void setB(String b) {
        MathsQuiz.b = b;
    }

    public static String getC() {
        return c;
    }

    public static void setC(String c) {
        MathsQuiz.c = c;
    }

    public static String getD() {
        return d;
    }

    public static void setD(String d) {
        MathsQuiz.d = d;
    }

    public static int getAnswerindex() {
        return answer_index;
    }

    void setAnswerIndex(int answer_index) {
        MathsQuiz.answer_index = answer_index;
    }   
    
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