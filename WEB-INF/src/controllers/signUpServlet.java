package controllers;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.User;

import javax.servlet.annotation.WebServlet;
import javax.servlet.ServletException;
import java.io.IOException;


@WebServlet("/signUp.do")
public class signUpServlet extends HttpServlet{
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws  ServletException, IOException{
        
         String name  = request.getParameter("name");
         String email = request.getParameter("email"); 
         String pass  = request.getParameter("pass");
         String pass_repeated = request.getParameter("pass-repeated");
         


        String success = "Signed In Successfully";
        String error = "Sign In Failed";

        User obj = new User(name, email, pass);

        if( pass.equals(pass_repeated)  && obj.saveUser())
          {
              request.setAttribute("status", success);
              request.setAttribute("name", name);
              request.setAttribute("email", email);
              request.setAttribute("pass", pass);
              
              request.getRequestDispatcher("userLogin.do").forward(request, response);
          }

          else
          {
             request.setAttribute("status", error);
             request.getRequestDispatcher("index.jsp").forward(request, response);
          } 
    }
}

