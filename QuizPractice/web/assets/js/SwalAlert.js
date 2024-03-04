/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */


            var status = document.getElementById("status").value;
            if (status === "password don't match") {
                Swal.fire({
                    title: "Error",
                    text: "Password do not match. Please try again",
                    icon: "error"
                });
            }
  