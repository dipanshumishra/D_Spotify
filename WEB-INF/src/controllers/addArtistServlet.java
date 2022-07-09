package controllers;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.ServletException;
import java.io.IOException;

import com.google.gson.Gson;

import models.Artist;


@WebServlet("/addArtist.do")
public class addArtistServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws  ServletException, IOException{
        
         String data = request.getParameter("data");

         Gson gson = new Gson();
         Artist artist = gson.fromJson(data, Artist.class);    
         
         String artistName = artist.getName();
         String dob = artist.getDob();
         String bio = artist.getBio();
         
         Artist obj = new Artist(artistName, dob, bio);
         if(obj.addNewArtist())
         {
            System.out.println("done");
         }
         else
         System.out.println("failed");
         
         response.sendRedirect("addSong.jsp");
    }
}

