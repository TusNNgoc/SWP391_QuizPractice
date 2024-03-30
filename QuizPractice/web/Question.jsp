<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="db.StoreResult" %>
<%@ page import="db.MathsQuiz" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Question</title>
</head>
<body>
<%
String start = request.getParameter("start");
if (start == null) {
%>
    <script>history.back();</script>
<%
}

if (start != null) {
    if (start.equals("Start Quiz")) {
        session.setAttribute("score", 0);
        int mycount = 0;
        session.setAttribute("count", mycount);
        int arr[] = new int[11]; // Tăng kích thước mảng để lưu 11 câu hỏi
        session.setAttribute("qarray", arr);
    }

    if (!start.equals("Start Quiz")) {
        StoreResult.storeData((int) session.getAttribute("count"), (String) session.getAttribute("myq"),
                (String) session.getAttribute("mya"), (String) session.getAttribute("myb"),
                (String) session.getAttribute("myc"), (String) session.getAttribute("myd"),
                (int) session.getAttribute("usans"), (int) session.getAttribute("myans"));
    }

    int mycount = (int) session.getAttribute("count");

    if (mycount >= 10) {
%>
        <script>
            location.href = "Quiz_Result.jsp";
        </script>
<%
    }
    session.setAttribute("start", start);
    session.setAttribute("count", mycount + 1);
}

MathsQuiz mathsQuiz = new MathsQuiz();
int maxsrno = mathsQuiz.getMaxSrNo();
int count = (int) session.getAttribute("count");
int arr[] = (int[]) session.getAttribute("qarray");

if (maxsrno < 1) {
%>
    <script>
        alert("Sorry, Not Enough Question Yet!");
        history.back();
    </script>
<%
}

ArrayList<Integer> selectedQuestions = new ArrayList<Integer>();

// Sử dụng vòng lặp for để lặp lại tất cả các câu hỏi
for (int i = 0; i < count-1; i++) {
    int rand_int;
    do {
        rand_int = (int) (Math.random() * maxsrno) + 1;
    } while (selectedQuestions.contains(rand_int)); // Kiểm tra xem câu hỏi đã được chọn chưa
    selectedQuestions.add(rand_int);

    arr[i] = rand_int;
    if (!mathsQuiz.createQuestion(rand_int, mathsQuiz)) {
%>
    <script>
        alert("Questions Not Found!");
        location.href = "Maths_Exam.jsp";
    </script>
<%
    }
}

String question = mathsQuiz.question;
String a = mathsQuiz.a;
String b = mathsQuiz.b;
String c = mathsQuiz.c;
String d = mathsQuiz.d;
int ans = mathsQuiz.answer_index;

session.setAttribute("myq", question);
session.setAttribute("mya", a);
session.setAttribute("myb", b);
session.setAttribute("myc", c);
session.setAttribute("myd", d);
session.setAttribute("myans", ans);
%>

<script>
    location.href = "Maths_Quiz.jsp";
</script>
</body>
</html>
