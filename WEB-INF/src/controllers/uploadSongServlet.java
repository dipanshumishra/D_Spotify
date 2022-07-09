package controllers;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import javax.imageio.ImageIO;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.fileupload.servlet.ServletFileUpload;

import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;

import java.time.LocalDateTime;  
import java.time.format.DateTimeFormatter;

@WebServlet("/uploadSong.do")
public class uploadSongServlet extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
       
        String image="";
        String songName="";
        
        ArrayList<String> artistNames = new ArrayList<>();
        int rating = 0;
        String result = "";
        int flag=0;


        long millis=System.currentTimeMillis();  
        java.sql.Date t_date = new java.sql.Date(millis);       


        if(ServletFileUpload.isMultipartContent(request)) {
            ServletFileUpload sfu = new ServletFileUpload(new DiskFileItemFactory());

            List<FileItem> fields = null;
           
            
            try {
                fields = sfu.parseRequest(request);

                for(FileItem field : fields) {
                    if(field.isFormField()) {   
                        if(field.getFieldName().equals("songName"))
                            songName  = field.getString();
                        else if(field.getFieldName().equals("artistNames"))
                              artistNames.add(field.getString());

                    } 
                    else
                     {
                        String uploadPath = getServletContext().getRealPath("/WEB-INF/upload");
                        File file = new File(uploadPath, field.getName());
                        image = field.getName();

                        try {
                             field.write(file);
                             flag = 1;
                        }
                        catch(Exception e)
                        {
                            e.printStackTrace();        
                        }
                    }
                }
            } catch(FileUploadException e) {
                e.printStackTrace();
            }  
        }

        if(flag!=0)
        {
      

            models.songs obj = new models.songs(image, songName, artistNames, String.valueOf(t_date),rating);
            if(obj.saveSong())
            {
               result += "Song is successfully Uploaded";
               request.getSession().setAttribute("result", result);
            }
            else
            System.out.println("error");
        }

        System.out.println(result);
        request.getRequestDispatcher("index.jsp").forward(request, response);    
    } 
}

