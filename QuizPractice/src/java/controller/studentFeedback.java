/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.FeedbackDAO;
import entity.Feedback;
import entity.Users;
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
@WebServlet(name = "studentFeedback", urlPatterns = {"/feedback"})
public class studentFeedback extends HttpServlet {

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
            out.println("<title>Servlet studentFeedback</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet studentFeedback at " + request.getContextPath() + "</h1>");
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
        String quizid = request.getParameter("quizid");
        if (quizid == null) {
            request.getRequestDispatcher("404.jsp").forward(request, response);
        }
        FeedbackDAO dao = new FeedbackDAO();
        HttpSession session = request.getSession();
        String action = request.getParameter("action");
        if(action==null){
        Users user = (Users) session.getAttribute("user");
        String name = dao.getQuizname(quizid);
        List<Feedback> list = dao.getAllFeedback(quizid);
        request.setAttribute("data", list);
        request.setAttribute("userid", user.getUser_id());
        request.setAttribute("quizname", name);
        request.getRequestDispatcher("feedback/Feedback.jsp").forward(request, response);
        }else if(action.equalsIgnoreCase("delete")){
            String feedbackid = request.getParameter("feedbackid");
            String quiz_id = request.getParameter("quizid");
            dao.deleteFeedback(feedbackid);
            response.sendRedirect("/QuizPractice/feedback?quizid="+quiz_id);
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
        FeedbackDAO dao = new FeedbackDAO();
        String action = request.getParameter("action");
        HttpSession session = request.getSession();
        if (action.equalsIgnoreCase("add")) {            
            Users user = (Users) session.getAttribute("user");
            String content = request.getParameter("feedbacktext");
            String quizid = request.getParameter("quizid");
            int i = user.getUser_id();
            String qid = String.valueOf(i);
            int feedbackidint = dao.getBiggestFeedbackID()+1;
            String feedbackid = String.valueOf(feedbackidint);
            dao.addFeedBack(content, quizid,qid , feedbackid);
            response.sendRedirect("/QuizPractice/feedback?quizid="+quizid);
        }else if(action.equalsIgnoreCase("update")){
            String content = request.getParameter("feedbacktext");
            String feedbackid= request.getParameter("feedbackid");
            String quizid = request.getParameter("quizid");
            dao.updateFeedback(content, feedbackid);
            response.sendRedirect("/QuizPractice/feedback?quizid="+quizid);
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
