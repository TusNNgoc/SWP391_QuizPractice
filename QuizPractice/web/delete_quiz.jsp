<%@ page import="dao.QuizDAO" %>
<%@ page import="java.io.IOException" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="entity.Quiz" %>

<%
    // L?y gi� tr? c?a tham s? quiz_id t? URL
    int quiz_id = Integer.parseInt(request.getParameter("quiz_id"));
    
    // X�a c�u h?i t? c? s? d? li?u
    boolean deleted = QuizDAO.deleteQuiz(quiz_id);
    
    // Chuy?n h??ng ng??i d�ng sau khi x�a c�u h?i
    if(deleted) {
        response.sendRedirect("Listquiz");
    } else {
        // N?u kh�ng th? x�a, hi?n th? th�ng b�o l?i
        out.println("Failed to delete quiz.");
    }
%>



