/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.QuestionsDAO;
import dao.QuizDAO;
import entity.Questions;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author anhph
 */
@WebServlet(name = "UpdateQuestion", urlPatterns = {"/updatequestion"})
public class UpdateQuestion extends HttpServlet {

    @Override
protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    String questionIdParameter = request.getParameter("question_id");
    if (questionIdParameter != null && !questionIdParameter.isEmpty()) {
        QuestionsDAO dao = new QuestionsDAO();
        String[] questionInfo = dao.getQuestionById(questionIdParameter);
        if (questionInfo != null) {
            request.setAttribute("questionInfo", questionInfo); // Pass question details to JSP
            request.getRequestDispatcher("update_question.jsp").forward(request, response);
            return;
        }
    }
    response.sendRedirect("error.jsp");
}

@Override
protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    // Lấy thông tin từ request
    String questionIdString = request.getParameter("questionId");
    String questionText = request.getParameter("quizName");
    String difficultyIdString = request.getParameter("role");

    if (questionIdString != null && questionText != null && difficultyIdString != null) {
        // Chuyển đổi các thông tin thành kiểu dữ liệu phù hợp
        int questionId = Integer.parseInt(questionIdString);
        int difficultyId = Integer.parseInt(difficultyIdString);

        // Tạo đối tượng DAO và cập nhật câu hỏi
        QuestionsDAO dao = new QuestionsDAO();
        dao.updateQuestion(questionId, questionText, difficultyId);

        // Chuyển hướng về trang danh sách câu hỏi
        response.sendRedirect("admin_question");
    } else {
        response.sendRedirect("error.jsp"); // Xử lý lỗi nếu dữ liệu không hợp lệ
    }
}

        
        
        

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}



