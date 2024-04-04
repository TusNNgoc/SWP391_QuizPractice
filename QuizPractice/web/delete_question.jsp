<%@ page import="dao.QuestionsDAO" %>

<%
    // L?y question_id t? URL
    int questionId = Integer.parseInt(request.getParameter("question_id"));
    
    // G?i ph??ng th?c xóa câu h?i t? QuestionsDAO
    boolean deleted = QuestionsDAO.deleteQuestion(questionId);
    
    if (deleted) {
        // N?u xóa thành công, chuy?n h??ng ng??i dùng ??n trang thành công ho?c làm m?i trang hi?n t?i
        response.sendRedirect("admin_question");
    } else {
        // N?u không, chuy?n h??ng ??n trang th?t b?i ho?c hi?n th? thông báo l?i
        response.sendRedirect("admin_questions");
    }
%>



