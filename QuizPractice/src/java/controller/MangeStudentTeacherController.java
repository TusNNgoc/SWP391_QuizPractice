/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.CoursesDAO;
import dao.UsersDAO;
import entity.Courses;
import entity.Users;
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
@WebServlet(name = "MangeStudentTeacher", urlPatterns = {"/managestudent"})
public class MangeStudentTeacherController extends HttpServlet {

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
            out.println("<title>Servlet MangeStudentTeacher</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet MangeStudentTeacher at " + request.getContextPath() + "</h1>");
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
        String course_name = request.getParameter("course_name");

        UsersDAO ud = new UsersDAO();
        List<Users> listStudent = ud.getStudentByCourseName(course_name);
        
//        PrintWriter out = response.getWriter() ;
//        out.println(listStudent);
        session.setAttribute("course_name", course_name);
        request.setAttribute("listStudent", listStudent);
        request.getRequestDispatcher("teacher/student.jsp").forward(request, response);
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
        int user_id = Integer.parseInt(request.getParameter("user_id"));
        String action = request.getParameter("action");
        String course_name = (String) session.getAttribute("course_name");

        UsersDAO ud = new UsersDAO();
        CoursesDAO cd = new CoursesDAO();
        Users student = ud.getUserById(user_id);
        List<Courses> listCourse = cd.getCourseByStudentId(user_id);
        if (action.equalsIgnoreCase("view")) {
            request.setAttribute("student", student);
            request.setAttribute("listCourse", listCourse);
            request.getRequestDispatcher("teacher/about_student.jsp").forward(request, response);
        }
        if (action.equalsIgnoreCase("delete")) {
            cd.deleteStudentByCoursenameAndUserid(user_id, course_name);
            response.sendRedirect("/QuizPractice/managestudent?course_name=" + course_name);
             
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
