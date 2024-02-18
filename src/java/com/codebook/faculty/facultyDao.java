
package com.codebook.faculty;

import com.codebook.Connections.ConnectionFactory;
import com.codebook.bean.Bean;
import com.codebook.user.userDao;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Base64;

public class facultyDao {
    
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
            ps.setString(2, b.getEmail());
            ps.setString(3, b.getDob());
            ps.setString(4, b.getTemp());
            ps.setString(5, b.getFlag());
            ps.setString(6, b.getTemp2());
            ps.setString(7, b.getMobile());
            ps.setString(8, b.getAddress());
            ps.setString(9, b.getGender());
            ps.setString(10, b.getPassword());
            ps.setBlob(11, b.getBlob());

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
    
    public static int Accept(String query){
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
    
     public static String imageConversion(Blob pic){
        String Profilepic="";
        try{
            InputStream inputStream = pic.getBinaryStream();

                     ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
                     byte[] buffer = new byte[4096];
                        int bytesRead;
                        while ((bytesRead = inputStream.read(buffer)) != -1) {
                         outputStream.write(buffer, 0, bytesRead);
                                         }
                        Profilepic= Base64.getEncoder().encodeToString(outputStream.toByteArray());
        }catch(Exception e){
            e.printStackTrace();
        }
        return Profilepic;
    }
    
    public static int UpdateComplaint(String query){
        int rowCount=0;
        Connection connection=null;
        try{
             ConnectionFactory.BuildConnection();
            connection=ConnectionFactory.getConnection();
       PreparedStatement ps=connection.prepareStatement(query);
       rowCount=ps.executeUpdate();
        }catch(Exception e){
            e.printStackTrace();
        }
       return rowCount;
    } 
    
    
     public static int UpdateProfile(Bean b,String query){
        int rowCount=0;
        Connection connection=null;
        try{
             ConnectionFactory.BuildConnection();
            connection=ConnectionFactory.getConnection();
       PreparedStatement ps=connection.prepareStatement(query);
            ps.setString(1, b.getName());
            ps.setString(2, b.getEmail());
            ps.setString(3, b.getDob());
            ps.setString(4, b.getTemp());
            ps.setString(5, b.getFlag());
            ps.setString(6, b.getTemp2());
            ps.setString(7, b.getMobile());
            ps.setString(8, b.getAddress());
       if(b.getBlob().length()==0){
           String query1="SELECT * from students WHERE email='"+b.getEmail()+"'";
           ResultSet rs=facultyDao.Retrieve(query1);
           if(rs.next()){
           b.setBlob(rs.getBlob("profile"));
           }
       }
            ps.setBlob(9, b.getBlob());
       rowCount=ps.executeUpdate();
        }catch(Exception e){
            e.printStackTrace();
        }
       return rowCount;
    }
     
     public static int addClass(Bean b,String query){
        int rowCount=0;
        Connection connection=null;
        try{
             ConnectionFactory.BuildConnection();
            connection=ConnectionFactory.getConnection();
       PreparedStatement ps=connection.prepareStatement(query);
            ps.setString(1, b.getOrder());
            ps.setString(2, b.getName());
            ps.setString(3, b.getFlag());
            ps.setString(4, b.getTemp());
            ps.setString(5, b.getTemp2());
            ps.setString(6, b.getTemp3());
            ps.setString(7, b.getDistName());
       rowCount=ps.executeUpdate();
        }catch(Exception e){
            e.printStackTrace();
        }
       return rowCount;
    }
     
     
     
     public static int addQR(byte[] bytes,ByteArrayInputStream inputStream,String query){
        int rowCount=0;
        Connection connection=null;
        try{
             ConnectionFactory.BuildConnection();
            connection=ConnectionFactory.getConnection();
       PreparedStatement ps=connection.prepareStatement(query);
            ps.setBinaryStream(1, inputStream, bytes.length);
       rowCount=ps.executeUpdate();
        }catch(Exception e){
            e.printStackTrace();
        }
       return rowCount;
    }
     
     public static int addLocation(Bean b,String query){
        int rowCount=0;
        Connection connection=null;
        try{
             ConnectionFactory.BuildConnection();
            connection=ConnectionFactory.getConnection();
       PreparedStatement ps=connection.prepareStatement(query);
            ps.setString(1, b.getOrder());
            ps.setString(2, b.getName());
            ps.setString(3, b.getDistName());
            ps.setString(4, b.getFlag());
            ps.setString(5, b.getTemp());
            ps.setString(6, b.getTemp2());
       rowCount=ps.executeUpdate();
        }catch(Exception e){
            e.printStackTrace();
        }
       return rowCount;
    }
}
