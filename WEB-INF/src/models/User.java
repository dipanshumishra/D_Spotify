package models;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class User {
     private int userId;
     private String name;
     private String email;
     private String password;


     //parameterised Constructor
     public User(String name, String email, String password) {
        this.name = name;
        this.email = email;
        this.password = password;
    }

    //Getter and setters
    public int getUserId() {
        return userId;
    }
    public void setUserId(int userId) {
        this.userId = userId;
    }
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email = email;
    }
    public String getPassword() {
        return password;
    }
    public void setPassword(String password) {
        this.password = password;
    }


    public boolean saveUser(){
        boolean flag=false;
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/musicworld?user=root&password=1234");
            String query  = "INSERT INTO Users (name,email,password) VALUES (?,?,?)";
            PreparedStatement pst = conn.prepareStatement(query);

            pst.setString(1,name);
            pst.setString(2, email);
            pst.setString(3, password);

            int rs = pst.executeUpdate();
            if(rs==1)
            flag= true;
            conn.close();
        }
        catch(ClassNotFoundException | SQLException e)
        {
            e.printStackTrace();
        }
        return flag;
    }

    public boolean userLogin(){
        
        boolean flag=false;
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/musicworld?user=root&password=1234");
            String query  = "SELECT password FROM Users where email=?";
            PreparedStatement pst = conn.prepareStatement(query);
        
            pst.setString(1,email);
        
            ResultSet  rs = pst.executeQuery();

            if(rs.next())
            {
            String db_pass = rs.getString("password");
            if(db_pass.equals(password))
            flag=true;
            }
            
            conn.close();
            return flag;
        }
        catch(ClassNotFoundException | SQLException e)
        {
            e.printStackTrace();
        }
            return flag;
        }
  

     
}
