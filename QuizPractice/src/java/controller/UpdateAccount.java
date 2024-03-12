package controller;

import dao.UsersDAO;
import entity.User;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.PrintWriter;

@WebServlet(name = "UpdateAccount", urlPatterns = {"/update"})

public class UpdateAccount extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String userIdParameter = request.getParameter("user_id");
        if (userIdParameter != null && !userIdParameter.isEmpty()) {
            UsersDAO dao = new UsersDAO();
            User s = dao.getUserByID(userIdParameter);
            if (s != null) {
                int roleId = s.getRole();
                request.setAttribute("role_id", roleId);
                request.setAttribute("st", s);
                request.setAttribute("user_id", userIdParameter);
                request.getRequestDispatcher("update_account.jsp").forward(request, response);
                return;
            }
        }
        response.sendRedirect("error.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String userId = request.getParameter("user_id");
        String fullname = request.getParameter("fullname");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        int role = Integer.parseInt(request.getParameter("role"));
        String country = request.getParameter("country");
        String address = request.getParameter("address");
        String gender = request.getParameter("gender");
        String dob = request.getParameter("dob");
        String phone = request.getParameter("phone");
//        PrintWriter out = response.getWriter();
//        out.print(userId + address + country + dob + fullname + email + gender );
        // Kiểm tra xem tên người dùng đã được sử dụng bởi người dùng khác chưa
        UsersDAO dao = new UsersDAO();
        if (dao.isUsernameUnique(username, userId)) { // Pass userId để loại trừ người dùng hiện tại khỏi kiểm tra
            // Thực hiện cập nhật người dùng nếu tên người dùng là duy nhất
            dao.updateAllUser(userId, fullname, username, password, email, role, country, address, gender, dob, phone);
            response.sendRedirect("admin_account.jsp");
        } else {
            // Hiển thị thông báo lỗi nếu tên người dùng đã tồn tại
            request.setAttribute("errorMessage", "Tên người dùng đã được sử dụng bởi người dùng khác.");
            request.getRequestDispatcher("update_account.jsp").forward(request, response);
        }
    }

}
