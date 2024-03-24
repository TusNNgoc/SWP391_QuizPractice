
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.UsersDAO;
import entity.Users;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

/**
 *
 * @author HP
 */
@WebServlet(name = "SignInController", urlPatterns = {"/signin"})
public class SignInController extends HttpServlet {

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
            out.println("<title>Servlet SignInController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SignInController at " + request.getContextPath() + "</h1>");
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
        doPost(request, response);
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
        RequestDispatcher dispatcher = null;

        String username = request.getParameter("username");
        String pass = request.getParameter("pass");
        String username_session = (String) session.getAttribute("username");
        String pass_session = (String) session.getAttribute("pass");
        String action = request.getParameter("action");
        UsersDAO ud = new UsersDAO();

        PrintWriter out = response.getWriter();

        if (username == null || pass == null) {
            if (action.equalsIgnoreCase("course")) {
                Users userAuthenticate = ud.authenticate(username_session, pass_session);
                session.setAttribute("user", userAuthenticate);
                request.getRequestDispatcher("teacher").forward(request, response);
            }
            if (action.equalsIgnoreCase("quiz")) {
                Users userAuthenticate = ud.authenticate(username_session, pass_session);
                session.setAttribute("user", userAuthenticate);
                request.getRequestDispatcher("quiz").forward(request, response);
            }
            if (action.equalsIgnoreCase("question")) {
                Users userAuthenticate = ud.authenticate(username_session, pass_session);
                session.setAttribute("user", userAuthenticate);
                request.getRequestDispatcher("question").forward(request, response);
            }

        } else {

            if (ud.authenticate(username, pass) == null) {
                request.setAttribute("err", "Wrong username or password ");
                dispatcher = request.getRequestDispatcher("signinOfficial.jsp");
                dispatcher.forward(request, response);
            } else {
                Users userAuthenticate = ud.authenticate(username, pass);
                if (userAuthenticate.getRoleName().equals("admin")) {
                    // Xử lý cho admin
                    session.setAttribute("user", userAuthenticate);
                    session.setAttribute("username", username);
                    session.setAttribute("pass", pass);

                    request.getRequestDispatcher("admin_home.jsp").forward(request, response);
                }
                if (userAuthenticate.getRoleName().equalsIgnoreCase("teacher")) {
                    // Xử lý cho teacher
                    session.setAttribute("user", userAuthenticate);
                    session.setAttribute("username", username);
                    session.setAttribute("pass", pass);

//                request.getRequestDispatcher("teacherhome.jsp").forward(request, response);
                    request.getRequestDispatcher("teacher").forward(request, response);
                }
                if (userAuthenticate.getRoleName().equals("student")) {
                    // Xử lý cho student
                    session.setAttribute("user1", userAuthenticate);
                    session.setAttribute("username", username);
                    session.setAttribute("pass", pass);
                    //TẠM THỜI///
                    request.setAttribute("fullname", userAuthenticate.getFullname());
                    request.getRequestDispatcher("Quiz.jsp").forward(request, response);
                }

//            request.setAttribute("err", "Please don't leave username or password blank");
//            dispatcher = request.getRequestDispatcher("Home.jsp");
//            dispatcher.forward(request, response);
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
