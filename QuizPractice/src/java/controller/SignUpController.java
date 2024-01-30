/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.UsersDAO;
import entity.Role;
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
import java.util.Arrays;

/**
 *
 * @author HP
 */
@WebServlet(name = "SignUpController", urlPatterns = {"/signup"})
public class SignUpController extends HttpServlet {

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
            out.println("<title>Servlet SignUpController</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SignUpController at " + request.getContextPath() + "</h1>");
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
        processRequest(request, response);
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
        UsersDAO udao = new UsersDAO();
        RequestDispatcher dispatcher = null;
        
        
        String uname =  request.getParameter("username");
        String email = request.getParameter("email");
        String fullname = request.getParameter("fullname");
        String pass = request.getParameter("pass");
        String re_pass = request.getParameter("re_pass");
        int roleId = Integer.parseInt(request.getParameter("role"));
        
        
       
        //VALIDATORS for sign up
    if(uname == null || uname.equals("")){
        request.setAttribute("status", "invalid username");
        dispatcher = request.getRequestDispatcher("signinOfficial.jsp");
        dispatcher.forward(request, response);
    }
    if(email == null || email.equals("")){
        request.setAttribute("status", "invalid email");
        dispatcher = request.getRequestDispatcher("signinOfficial.jsp");
        dispatcher.forward(request, response);
    }
    if(pass == null || pass.equals("")){
        request.setAttribute("status", "invalid pass");
        dispatcher = request.getRequestDispatcher("signinOfficial.jsp");
        dispatcher.forward(request, response);
    }
    if(re_pass == null || re_pass.equals("")){
        request.setAttribute("status", "invalid repass");
        dispatcher = request.getRequestDispatcher("signinOfficial.jsp");
        dispatcher.forward(request, response);
    }
    
    //CHECK RE-PASS
    //1. convert to char arr
    char[] charPass = pass.toCharArray();
    char[] charRePass = re_pass.toCharArray();
    
    //2. compare with Arrays.equal(...)
    if(!Arrays.equals(charPass, charRePass)){
        dispatcher = request.getRequestDispatcher("signup_signin.jsp");
        dispatcher.forward(request, response);
    }   
    
        
        
        //create a role obj
        Role role = Role.builder().role_id(roleId).build();
        
        Users user = Users.builder()
                .username(uname)
                .email(email)
                .fullname(fullname)
                .password(pass)
                .role(role)
                .build();
        
       
        
        

        int userId = udao.register(user);
       
       
        if(userId> 0){
//            request.setAttribute("msg", "Sign up successful");
            session.setAttribute("userId", "");
            response.sendRedirect("Home.jsp");
        }else{            
//             request.setAttribute("msg", "Sign up-fail");
             response.sendRedirect("About.jsp");
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
