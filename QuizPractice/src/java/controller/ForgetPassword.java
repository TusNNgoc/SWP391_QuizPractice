/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import connection.PasswordDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.time.LocalDateTime;

/**
 *
 * @author ASUS
 */
@WebServlet(name = "ForgetPassword", urlPatterns = {"/resetpassword"})
public class ForgetPassword extends HttpServlet {

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
        if(request.getParameter("email")==null){
            HttpSession session = request.getSession();
            session.setAttribute("error", "");
            request.getRequestDispatcher("./ForgetPassword.jsp").forward(request, response);
        }else{
            request.getRequestDispatcher("./Resetpassword.jsp").forward(request, response);
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
        HttpSession session = request.getSession();
        String action = request.getParameter("action");
        try {
            if ("check".equals(action)) {
                String email = request.getParameter("email");

                // Calculate the expiration date 30 minutes from the current time
                LocalDateTime expirationDate = LocalDateTime.now().plusMinutes(30);

                // Create an instance of AccountDAO
                PasswordDAO DAO = new PasswordDAO();
                SendEmailReset sm = new SendEmailReset();

                // Check if an account with the provided email exists
                if (DAO.getAccountByEmail(email) == null) {
                    // If no account is found, set an error message and forward to EmailResetPassword.jsp
                    session.setAttribute("error", "The email didn't match any account.");
                    request.getRequestDispatcher("./ForgetPassword.jsp").forward(request, response);
                }
                String emailContent = 
                          "<h1 style=\"color:blue;\">Hi there</h1><br>"
                        + "To finish resetting your password, please go to the following page:<br>"
                        + "<a href=\"http://localhost:9999/QuizPractice/resetpassword?email="+ email
                        + "\">Click here</a><br>"
                        + "If you do not wish to reset the password, ignore this message; it will expire in 30 minutes.<br>"
                        + "All the best,<br>Auto99.";

                // Send the email with the constructed content
                sm.sendmail(email, emailContent, "RESET YOUR QUIZ PASSWORD");

                // Set a success message and forward to EmailResetPassword.jsp
                session.setAttribute("error", "The email has been sent to you. "
                        + "Please verify it to finish resetting the password");
                request.getRequestDispatcher("./ForgetPassword.jsp").forward(request, response);
            }else if ("reset".equals(action)){
                        response.setContentType("text/html;charset=UTF-8");

        // Get parameters from the HTTP request: email, password, and reentered password
        String email = request.getParameter("email");
        String pass = request.getParameter("newpass");
        String repass = request.getParameter("repass");

        // Check if the password and reentered password match
        if (pass.equals(repass)) {
            // If they match, create an instance of AccountDAO and update the password
            PasswordDAO DAO = new PasswordDAO();
            DAO.updatePassword2(email, pass);

            // Send a JavaScript alert to inform the user that the password has been changed
            PrintWriter pw = response.getWriter();
            pw.println("<script type=\"text/javascript\">");
            pw.println("alert('The password has been changed!');");
            pw.println("location='resetpassword';"); // Redirect the user
            pw.println("</script>");

            // Forward the request to the AdminHomePage.jsp page
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } else {
            // If passwords don't match, set an error message and forward to ResetPassword.jsp
            request.setAttribute("mess", "The password and reentered password didn't match!");
            request.setAttribute("email", email);
            request.getRequestDispatcher("Resetpassword.jsp").forward(request, response);
        }
            }
        } catch (Exception e) {
            System.out.println(e);
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
