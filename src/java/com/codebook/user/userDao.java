package com.codebook.user;

import com.codebook.Connections.ConnectionFactory;
import com.codebook.bean.Bean;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.*;

public class userDao {
    
    
    
   public static int Registration(Bean b, String query) {
    int rowCount = 0;

    try {
        ConnectionFactory.BuildConnection();
        Connection connection = ConnectionFactory.getConnection();

        // Use Statement to execute SET GLOBAL if needed
        try (Statement statement = connection.createStatement()) {
            statement.execute("SET GLOBAL max_allowed_packet=16777216"); // Adjust the size as needed
        }

        // Now create the PreparedStatement
        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setString(1, b.getName());
            ps.setString(2, b.getFlag());
            ps.setString(3, b.getEmail());
            ps.setString(4, b.getGender());
            ps.setString(5, b.getMobile());
            ps.setString(6, b.getDob());
            ps.setString(7, b.getAddress());
            ps.setString(8, b.getPassword());
            ps.setString(9, b.getCpassword());
            ps.setBlob(10, b.getBlob());

            rowCount = ps.executeUpdate();
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    return rowCount;
}



    
    public static ResultSet Retrieve(String query){
        ResultSet rs=null;
        try{
            ConnectionFactory.BuildConnection();
            Connection connection=ConnectionFactory.getConnection();
            PreparedStatement ps=connection.prepareStatement(query);
            rs=ps.executeQuery();
        }catch(Exception e){
            e.printStackTrace();
        }
        return rs;
    }
    
    
     public static int UpdateProfile(Bean b,String query){
        int rowCount=0;
        Connection connection=null;
        try{
             ConnectionFactory.BuildConnection();
            connection=ConnectionFactory.getConnection();
       PreparedStatement ps=connection.prepareStatement(query);
       ps.setString(1, b.getName());
            ps.setString(2, b.getFlag());
            ps.setString(3, b.getEmail());
            ps.setString(4, b.getMobile());
            ps.setString(5, b.getGender());
            ps.setString(6, b.getDob());
            ps.setString(7, b.getAddress());
       if(b.getBlob().length()==0){
           String query1="SELECT * from user WHERE email='"+b.getEmail()+"'";
           ResultSet rs=userDao.Retrieve(query1);
           if(rs.next()){
           b.setBlob(rs.getBlob("image"));
           }
       }
            ps.setBlob(8, b.getBlob());
       rowCount=ps.executeUpdate();
        }catch(Exception e){
            e.printStackTrace();
        }
       return rowCount;
    }
     
     
            

     
     public static int DonateOrgans(Bean b,String query){
        int rowCount=0;
        Connection connection=null;
        try{
             ConnectionFactory.BuildConnection();
            connection=ConnectionFactory.getConnection();
       PreparedStatement ps=connection.prepareStatement(query);
       ps.setString(1, b.getName());
            ps.setString(2, b.getFlag());
            ps.setString(3, b.getEmail());
            ps.setString(4, b.getMobile());
            ps.setString(5, b.getGender());
            ps.setString(6, b.getAddress());
            ps.setString(7, b.getDob());
            ps.setString(8, b.getDistName());
            ps.setString(9, b.getOrder());
            ps.setString(10, b.getTemp());
            ps.setString(11, b.getTemp2());
            ps.setString(12, b.getTemp3());
            ps.setString(13, b.getCpassword());
            ps.setString(14, b.getPassword());
       rowCount=ps.executeUpdate();
        }catch(Exception e){
           e.printStackTrace();
        }
       return rowCount;
    }
     
   public static int DeleteDonation(String query){
        int rowCount=0;
        try{
            ConnectionFactory.BuildConnection();
        Connection connection=ConnectionFactory.getConnection();
        PreparedStatement ps=connection.prepareStatement(query);
        rowCount=ps.executeUpdate();
        }catch(Exception e){
            e.printStackTrace();
        }
        return rowCount;
    }
   
   public static int Attendance(Bean b,String query){
        int rowCount=0;
        try{
            ConnectionFactory.BuildConnection();
        Connection connection=ConnectionFactory.getConnection();
        PreparedStatement ps=connection.prepareStatement(query);
        ps.setString(1, b.getTemp());
        ps.setString(2,b.getMobile());
        ps.setString(3,b.getName());
        ps.setString(4,b.getTemp2());
        ps.setString(5,b.getTemp3());
        ps.setString(6,b.getFlag());
        ps.setString(7,b.getAddress());
        rowCount=ps.executeUpdate();
        }catch(Exception e){
            e.printStackTrace();
        }
        return rowCount;
    }
    
    public static int Feedback(Bean b,String query){
        int rowCount=0;
        try{
            ConnectionFactory.BuildConnection();
        Connection connection=ConnectionFactory.getConnection();
        PreparedStatement ps=connection.prepareStatement(query);
        ps.setString(1, b.getEmail());
        ps.setString(2,b.getMobile() );
        ps.setString(3, b.getName());
        rowCount=ps.executeUpdate();
        }catch(Exception e){
            e.printStackTrace();
        }
        return rowCount;
    }
      
}
