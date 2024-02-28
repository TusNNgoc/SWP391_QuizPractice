/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.TeacherDAO;
import entity.Quiz;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;

/**
 *
 * @author ASUS
 */
@WebServlet(name = "QuizCRUD", urlPatterns = {"/quizcrud"})
public class QuizCRUD extends HttpServlet {

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
            out.println("<title>Servlet QuizCRUD</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet QuizCRUD at " + request.getContextPath() + "</h1>");
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
        TeacherDAO dao = new TeacherDAO();
        String action = request.getParameter("action");
        HttpSession session = request.getSession();
        if ("add".equals(action)) {
            List courseList = dao.getAllCourseName();
            request.setAttribute("courseList", courseList);
            request.getRequestDispatcher("/createquiz.jsp").forward(request, response);
        } else if ("addquestion".equals(action)) {
            String quizid = request.getParameter("quizid");
            List typeList = dao.getAllType();
            request.setAttribute("questiontext", null);
            request.setAttribute("gettype", null);
            request.setAttribute("quizid", quizid);
            request.setAttribute("typeList", typeList);
            request.getRequestDispatcher("/createquestion.jsp").forward(request, response);
        } else if ("updatequiz".equals(action)) {
            String quizid = request.getParameter("quizid");
            Quiz quiz = dao.getQuizByID(quizid);
            List courseList = dao.getAllCourseName();
            request.setAttribute("courseList", courseList);
            request.setAttribute("quiz", quiz);
            request.getRequestDispatcher("/UpdateQuiz.jsp").forward(request, response);
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
        TeacherDAO dao = new TeacherDAO();
        String action = request.getParameter("action");
        if ("add".equals(action)) {
            String quizname = request.getParameter("quizname");
            String courseid = request.getParameter("courseid");
            int creatorid = 52;
            dao.createQuiz(courseid, quizname, creatorid);
            int id = dao.getNewestQuizId();
            response.sendRedirect("/QuizPractice/quizcrud?action=addquestion&quizid=" + id);
        } else if ("addquestion".equals(action)) {
            String question = request.getParameter("question");
            String type = request.getParameter("typelist");
            String quizid = request.getParameter("quizid");
            dao.addQuestion(question, quizid, type);
            List typeList = dao.getAllType();
            request.setAttribute("quizid", quizid);
            request.setAttribute("questionid", dao.getNewestQuestionId());
            request.setAttribute("typeList", typeList);
            request.setAttribute("gettype", type);
            request.setAttribute("questiontext", question);
            request.getRequestDispatcher("/createquestion.jsp").forward(request, response);
        } else if ("addanswer".equals(action)) {
            String rightanswer = request.getParameter("rightanswer");
            String wronganswer1 = request.getParameter("wronganswer1");
            String wronganswer2 = request.getParameter("wronganswer2");
            String wronganswer3 = request.getParameter("wronganswer3");
            String questionid = request.getParameter("questionid");
            String quizid = request.getParameter("quizid");
            dao.addAnswer(rightanswer, questionid, true);
            dao.addAnswer(wronganswer1, questionid, false);
            dao.addAnswer(wronganswer2, questionid, false);
            dao.addAnswer(wronganswer3, questionid, false);
            List typeList = dao.getAllType();
            request.setAttribute("questiontext", null);
            request.setAttribute("gettype", null);
            request.setAttribute("quizid", quizid);
            request.setAttribute("typeList", typeList);
            request.getRequestDispatcher("/createquestion.jsp").forward(request, response);
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
