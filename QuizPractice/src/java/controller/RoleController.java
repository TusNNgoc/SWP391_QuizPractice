/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.RoleDAO;
import entity.Role;
import entity.Users;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 *
 * @author ASUS
 */
@WebServlet(name = "RoleController", urlPatterns = {"/role"})
public class RoleController extends HttpServlet {

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
            out.println("<title>Servlet RoleController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RoleController at " + request.getContextPath() + "</h1>");
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
        String action = request.getParameter("action");
        RoleDAO dao = new RoleDAO();
        if (action == null) {
            
            String pageIndex = request.getParameter("index");
            if (pageIndex == null) {
                pageIndex = "1";
            }
            int index = Integer.parseInt(pageIndex);

            String name = request.getParameter("name");
            if (name == null) {
                name = "";
            }

            String quantityShow = request.getParameter("quantity");
            if (quantityShow == null) {
                quantityShow = "5";
            }
            int quantity = Integer.parseInt(quantityShow);
            int count = dao.getTotalPartByName(name);            
            int endPage = count / quantity;
            if (count % quantity != 0 || endPage == 0) {
                endPage++;
            }
//            List<Role> list = dao.getAllRole();
            List<Role> list = dao.getPaggingRoleByName(index, name, quantity);
            List<Users> user = dao.getAllUser();
            int i = user.size();
            
            request.setAttribute("endPage", endPage);
            request.setAttribute("data", list);
            request.setAttribute("index", index);
            request.setAttribute("quantity", quantity);
            request.setAttribute("name", name);
            request.setAttribute("userlist", user);
            request.setAttribute("size", i);
            request.setAttribute("count", count);
            request.getRequestDispatcher("role/ListRole2.jsp").forward(request, response);
        }else if (action.equalsIgnoreCase("addrole")) {
            int role_id = 1;
            String role_name = request.getParameter("rolename");
            while (dao.isRoleIdExist(role_id)) {
                role_id++;
            }
            dao.addRole(role_id, role_name);
            response.sendRedirect("/QuizPractice/role");
        }else if (action.equalsIgnoreCase("deleterole")) {
            String role_id = request.getParameter("roleid");
            dao.deleteRole(role_id);
            response.sendRedirect("/QuizPractice/role");
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
        String action = request.getParameter("action");
        RoleDAO dao = new RoleDAO();
        if (action.equalsIgnoreCase("updaterole")) {
            String roleid = request.getParameter("roleid");
            String rolename = request.getParameter("rolename");
            dao.updateRole(roleid, rolename);
            response.sendRedirect("/QuizPractice/role");
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
    }

}



