/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.QuestionsDAO;
import entity.Questions;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

/**
 *
 * @author -Pc-
 */
@WebServlet(name = "QuestionController", urlPatterns = {"/question"})
public class QuestionController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet QuestionController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet QuestionController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        QuestionsDAO questionDAO = new QuestionsDAO();
    
        String quiz = request.getParameter("quizId");



        if (quiz != null) {
            int quiz_id = Integer.parseInt(quiz);

            List<Questions> questions = questionDAO.getQuestionByQuizId(quiz_id);
            request.setAttribute("questions", questions);

            session.setAttribute("quizId", quiz_id);
            request.getRequestDispatcher("teacher/question.jsp").forward(request, response);
        }
        else{
            int quizId = (int) session.getAttribute("quizId");
            List<Questions> questions = questionDAO.getQuestionByQuizId(quizId);
            request.setAttribute("questions", questions);
           
            request.getRequestDispatcher("teacher/question.jsp").forward(request, response);
        }

    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String action = request.getParameter("action");

        if (action.equalsIgnoreCase("insert")) {
            QuestionsDAO questionDAO = new QuestionsDAO();
            int quizId = (int) session.getAttribute("quizId");
            String question_content = request.getParameter("question_text");


            if (questionDAO.insertQuestion(question_content, quizId)) {
                doGet(request, response);
            }

//                request.getRequestDispatcher("Home.jsp").forward(request, response);
        }
        if(action.equalsIgnoreCase("delete")){
            String question_id = request.getParameter("questionId");
                          PrintWriter out = response.getWriter();
            out.println(question_id);


        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
