package controllers;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.User;
import javax.servlet.annotation.WebServlet;
import javax.servlet.ServletException;
import java.io.IOException;

@WebServlet("/userLogin.do")
public class loginServlet extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws  ServletException, IOException{
        
        String name  = request.getParameter("name");
        String email  = request.getParameter("email");
        String password = request.getParameter("pass");

        User obj = new User(name, email, password);

        if(obj.userLogin()){
             request.getSession().setAttribute("auth", email);
        }

        request.getRequestDispatcher("index.jsp").forward(request, response);
    }
}

