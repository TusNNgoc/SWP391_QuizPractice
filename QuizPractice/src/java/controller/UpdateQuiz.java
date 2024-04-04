/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.QuizDAO;
import entity.Quiz;
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
@WebServlet(name = "UpdateQuiz", urlPatterns = {"/updatequiz"})
public class UpdateQuiz extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String quizIdParameter = request.getParameter("quiz_id");
        if (quizIdParameter != null && !quizIdParameter.isEmpty()) {
            QuizDAO dao = new QuizDAO();
            Quiz quiz = dao.getQuizByID(quizIdParameter);
            if (quiz != null) {
                request.setAttribute("quiz", quiz);
                request.getRequestDispatcher("update_quiz.jsp").forward(request, response);
                return;
            }
        }
        response.sendRedirect("error.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Get parameters from the request
        String quizId = request.getParameter("id");
        String quizName = request.getParameter("quizName");
        String quizContent = request.getParameter("quizContent");

        // Convert quizId to integer
        int id = Integer.parseInt(quizId);

        // Instantiate QuizDAO object
        QuizDAO dao = new QuizDAO();

        // Update quiz information
        dao.updateQuiz(id, quizName, quizContent);

        // Redirect to Listquiz servlet or JSP page
        response.sendRedirect("Listquiz");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}



