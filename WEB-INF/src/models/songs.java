package models;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class songs {
    
    private String coverImage;
    private String songName;
    private ArrayList<String> artistNames;
    private String DOR;
    private int rating;

    // default constructor
    public songs(){}

    //parameterised constructor
    public songs( String coverImage,String songName, ArrayList<String> artistNames, String DOR,int rating) {
        this.coverImage = coverImage;
        this.songName = songName;
        this.artistNames = artistNames;
        this.DOR = DOR;
        this.rating = rating;
    }

    //Getters and setter 
    public String getCoverImage() {
        return coverImage;
    }

    public void setCoverImage(String coverImage) {
        this.coverImage = coverImage;
    }
    
    public String getSongName() {
        return songName;
    }

    public void setSongName(String songName) {
        this.songName = songName;
    }

    public ArrayList<String> getArtistNames() {
        return artistNames;
    }

    public void setArtistNames(ArrayList<String> artistNames) {
        this.artistNames = artistNames;
    }

    public String getDOR() {
        return DOR;
    }

    public void setDOR(String DOR) {
        DOR = DOR;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }



//////////////////////////////////////////////////////////////////////////////////////////////
 
public boolean saveSong(){
        
    boolean flag=false;
    if(saveCoverImage(songName,coverImage,DOR,rating))
    {

        for(String name  : artistNames)
        {
            try{
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/musicworld?user=root&password=1234");
                String query  = "INSERT INTO Songs (songName,artistName) VALUES (?,?)";
                PreparedStatement pst = conn.prepareStatement(query);
        
                pst.setString(1, songName);
                pst.setString(2, name);
        
                int rs = pst.executeUpdate();
                if(rs==1)
                flag= true;
                conn.close();
            }
            catch(ClassNotFoundException | SQLException e)
            {
                e.printStackTrace();
            }
        }   
        return flag;
    }
    else 
    {
        System.out.println("SaveSOng- error");
      return false;
    }        
}


public boolean saveCoverImage(String name,String img,String DOR, int rating){
   
    boolean flag=false;
    try{
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/musicworld?user=root&password=1234");
        String query  = "INSERT INTO songImages (songName,image,DOR,rating) VALUES (?,?,?,?)";
        PreparedStatement pst = conn.prepareStatement(query);

        pst.setString(1,name);
        pst.setString(2, img);
        pst.setString(3, DOR);
        pst.setInt(4, rating);

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


public ArrayList getArtist(){

    ArrayList<String> artists = new ArrayList<String>();
    try{
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/musicworld?user=root&password=1234");
        String query = "Select *from Artists";
        PreparedStatement pst = conn.prepareStatement(query);

        ResultSet rs = pst.executeQuery();

        while(rs.next())
        {
            artists.add(rs.getString("Name"));
        }
    }
    
    catch(ClassNotFoundException | SQLException e)
    {
            e.printStackTrace();
    }

    return artists;
}
    
    
public ArrayList<songs> getAllSongs(){
      
    ArrayList<songs> songs = new ArrayList<songs>();
    
    try{
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/musicworld?user=root&password=1234");
        String query = "Select *from songImages";
        PreparedStatement pst = conn.prepareStatement(query);

        ResultSet rs = pst.executeQuery();
        while(rs.next())
        {
            String coverImage = rs.getString("image");
            String songName = rs.getString("songName");
            String DOR = rs.getString("DOR");
            int rating = rs.getInt("rating");

            songs song = new songs(coverImage, songName, songArtists(rs.getString("songName")) , DOR, rating);
            songs.add(song);      
        }
    }
    
    catch(ClassNotFoundException | SQLException e)
    {
            e.printStackTrace();
    }

    return songs;
}

   public ArrayList<String> songArtists(String songName){
      
        ArrayList<String> artists = new ArrayList<String>();
        
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/musicworld?user=root&password=1234");
            String query = "Select *from Songs where songName = ?";
            PreparedStatement pst = conn.prepareStatement(query);
            pst.setString(1, songName);

            ResultSet rs = pst.executeQuery();
            while(rs.next())
            {
                String artist = rs.getString("artistName");
                artists.add(artist);             
            }
        }
        
        catch(ClassNotFoundException | SQLException e)
        {
                e.printStackTrace();
        }

        return artists;
   }

   public int getAvgRating(){

    int rating = 0;
            try{
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/musicworld?user=root&password=1234");
                String query  = "SELECT AVG(rating) FROM songImages";
                PreparedStatement pst = conn.prepareStatement(query);
        
                
                ResultSet rs = pst.executeQuery();
                
                while(rs.next())
                rating = rs.getInt("AVG(rating)");
                conn.close();
            }
            catch(ClassNotFoundException | SQLException e)
            {
                e.printStackTrace();
            }
    System.out.println(rating);
    return rating;
}
   
    public ArrayList<songs> top10Songs(){
        
        ArrayList<songs> songs = new ArrayList<songs>();
        songs = getAllSongs();
        int avg_rating = getAvgRating();

        for(int i=0;i<songs.size();i++)
        {
            int rating = songs.get(i).getRating();
            if(rating<avg_rating)
            songs.remove(i);
        }

        return songs;
    }

    public ArrayList<Artist> top10Artists(){
        
        ArrayList<songs> songs = new ArrayList<songs>();
        ArrayList<Artist> top10Artists = new ArrayList<Artist>();

        songs = getAllSongs();
        int avg_rating = getAvgRating();

        for(int i=0;i<songs.size();i++)
        {
            int rating = songs.get(i).getRating();
            if(rating<avg_rating)
            songs.remove(i);
        }
        
        for(int i=0;i<songs.size();i++)
        {
            for(int j=0;j<songs.get(i).getArtistNames().size();j++)
             {
                String name = songs.get(i).getArtistNames().get(j);
                 
                String songImage = songs.get(i).getCoverImage();
                int rating = songs.get(i).getRating();
                Artist obj = getArtistDetails(name,rating,songImage);
                top10Artists.add(obj);
                
             }
        }
        return top10Artists;
    }


    
public Artist getArtistDetails(String name,int rating,String songImage){

    Artist obj = new Artist();
    try{
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/musicworld?user=root&password=1234");
        String query = "Select *from Artists WHERE Name= ?";
        PreparedStatement pst = conn.prepareStatement(query);
        pst.setString(1, name);

        ResultSet rs = pst.executeQuery();
        
        while(rs.next())
        {
            return new Artist(name, rs.getString("DOB"), rs.getString("Bio"),rating,songImage);        
        }

    }
    catch(ClassNotFoundException | SQLException e)
    {
            e.printStackTrace();
    }

    return obj;
}
  


    
}
