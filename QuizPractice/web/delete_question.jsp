<%@ page import="dao.QuestionsDAO" %>

<%
    // L?y question_id t? URL
    int questionId = Integer.parseInt(request.getParameter("question_id"));
    
    // G?i ph??ng th?c x�a c�u h?i t? QuestionsDAO
    boolean deleted = QuestionsDAO.deleteQuestion(questionId);
    
    if (deleted) {
        // N?u x�a th�nh c�ng, chuy?n h??ng ng??i d�ng ??n trang th�nh c�ng ho?c l�m m?i trang hi?n t?i
        response.sendRedirect("admin_question");
    } else {
        // N?u kh�ng, chuy?n h??ng ??n trang th?t b?i ho?c hi?n th? th�ng b�o l?i
        response.sendRedirect("admin_questions");
    }
%>



