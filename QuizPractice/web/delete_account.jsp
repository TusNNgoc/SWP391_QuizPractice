<%-- 
    Document   : delete_account
    Created on : Mar 4, 2024, 1:22:31 AM
    Author     : anhph
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.UsersDAO" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
<%
    String user_id = request.getParameter("user_id");
    if (user_id != null) {
        int userId = Integer.parseInt(user_id);
        boolean success = UsersDAO.deleteAccount(userId);
        if (success) {
            response.sendRedirect("admin_account.jsp"); // Chuyển hướng sau khi xóa thành công
        } else {
            out.println("Failed to delete account."); // Thông báo nếu xóa không thành công
        }
    } else {
        out.println("User ID is missing."); // Thông báo nếu không tìm thấy user_id trong yêu cầu
    }
%>    </body>
</html>
