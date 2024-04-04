<%@ page import="dao.QuizDAO" %>
<%@ page import="java.io.IOException" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="entity.Quiz" %>

<%
    // L?y giá tr? c?a tham s? quiz_id t? URL
    int quiz_id = Integer.parseInt(request.getParameter("quiz_id"));
    
    // Xóa câu h?i t? c? s? d? li?u
    boolean deleted = QuizDAO.deleteQuiz(quiz_id);
    
    // Chuy?n h??ng ng??i dùng sau khi xóa câu h?i
    if(deleted) {
        response.sendRedirect("Listquiz");
    } else {
        // N?u không th? xóa, hi?n th? thông báo l?i
        out.println("Failed to delete quiz.");
    }
%>



