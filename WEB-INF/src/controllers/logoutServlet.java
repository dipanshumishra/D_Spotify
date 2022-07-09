package controllers;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import javax.servlet.annotation.WebServlet;
import javax.servlet.ServletException;
import java.io.IOException;


@WebServlet("/userLogout.do")
public class logoutServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws  ServletException, IOException{
        
        if(request.getSession().getAttribute("auth")!=null){
         request.getSession().removeAttribute("auth");
         request.getSession().invalidate();
         System.out.print(request.getSession().getAttribute("auth"));
        }

        request.getRequestDispatcher("index.jsp").forward(request, response);
    }
}

