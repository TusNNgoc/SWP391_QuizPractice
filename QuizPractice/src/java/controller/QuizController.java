/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.CoursesDAO;
import dao.QuizDAO;
import entity.Quiz;
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
 * @author HP
 */
@WebServlet(name = "QuizController", urlPatterns = {"/quiz"})
public class QuizController extends HttpServlet {

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
            out.println("<title>Servlet QuizController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet QuizController at " + request.getContextPath() + "</h1>");
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
        int course_id = Integer.parseInt(request.getParameter("courseId"));
       
        QuizDAO qd = new QuizDAO();
        CoursesDAO cd = new CoursesDAO();
        
        Quiz quiz = Quiz.builder().build();
        List<Quiz> listQuiz = qd.getQuizByCourseId(course_id);

//        PrintWriter out = response.getWriter();
//        out.println(listQuiz);
        request.setAttribute("listQuiz", listQuiz);
        session.setAttribute("course_id", course_id);
        if(!listQuiz.isEmpty()){
            request.setAttribute("courseName", listQuiz.get(0).getCourse_id().getCourse_name());
            request.getRequestDispatcher("teacher/quiz.jsp").forward(request, response);
        }else{
             request.setAttribute("courseName", cd.getCourseNameByCourseId(course_id) );
            request.getRequestDispatcher("teacher/quiz.jsp").forward(request, response);
        }
        
//       PrintWriter out = response.getWriter();
//       out.print();
        
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
//        processRequest(request, response);
        HttpSession session = request.getSession();
        int course_id = (int) session.getAttribute("course_id");
        String action = request.getParameter("action");
        String quizName = request.getParameter("quizName");
        int quiz_id = Integer.parseInt(request.getParameter("quiz_id"));
        String quizContent = request.getParameter("quizContent");

        QuizDAO qd = new QuizDAO();

        if (action.equals("update")) {
            if (qd.updateQuizById(quizName, quizContent, quiz_id)) {
//                doGet(request, response);
                response.sendRedirect("/QuizPractice/quiz?courseId=" + course_id);
            } else {
                request.getRequestDispatcher("Home.jsp").forward(request, response);
            }

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
