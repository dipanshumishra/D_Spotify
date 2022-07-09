package models;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class Artist {
    private int artistId;
    private String name;
    private int rating;
    private String dob;
    private String bio;
    private String songImage;


    public Artist(){}

    // Parameterised Constructor
    public Artist(String name, String dob, String bio) {
        this.name = name;
        this.dob = dob;
        this.bio = bio;
    }
    public Artist(String name, String dob, String bio,int rating, String songImage) {
        this.name = name;
        this.dob = dob;
        this.bio = bio;
        this.rating = rating;
        this.songImage = songImage;
    }

    //  Getter and Setter
    public int getArtistId() {
        return artistId;
    }


    public void setArtistId(int artistId) {
        this.artistId = artistId;
    }


    public String getName() {
        return name;
    }


    public void setName(String name) {
        this.name = name;
    }


    public String getDob() {
        return dob;
    }


    public void setDob(String dob) {
        this.dob = dob;
    }


    public String getBio() {
        return bio;
    }


    public void setBio(String bio) {
        this.bio = bio;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    public String getSongImage() {
        return songImage;
    }

    public void setSongImage(String songImage) {
        this.songImage = songImage;
    }   




    
    public boolean addNewArtist(){
        
        boolean flag=false;
                try{
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/musicworld?user=root&password=1234");
                    String query  = "INSERT INTO Artists (Name,DOB,Bio) VALUES (?,?,?)";
                    PreparedStatement pst = conn.prepareStatement(query);
            
                    pst.setString(1, name);
                    pst.setString(2, dob);
                    pst.setString(3, bio);
            
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


}
