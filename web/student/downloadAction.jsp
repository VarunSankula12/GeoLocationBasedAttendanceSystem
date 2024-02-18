<%@page import="com.codebook.faculty.facultyDao"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.nio.charset.StandardCharsets"%>
<%@page import="java.io.ByteArrayOutputStream"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.sql.*,java.util.*"%>
<%
    String id=request.getParameter("classid");
    String name="";
    InputStream inputStream = null;
    
    String query = "SELECT subject,qr FROM classdetails WHERE classid='" + id + "'";
    ResultSet rs = facultyDao.Retrieve(query);
     if (rs.next()) {
            name=rs.getString("subject")+"-"+"class";
            Blob blob = rs.getBlob("qr");
    response.setContentType("image/png");
    response.setHeader("Content-Disposition", "attachment; filename=" + name + ".png");
    
    InputStream imageStream = blob.getBinaryStream();
    OutputStream outputStream = response.getOutputStream();
    
    byte[] buffer = new byte[4096];
    int bytesRead;
    while ((bytesRead = imageStream.read(buffer)) != -1) {
        outputStream.write(buffer, 0, bytesRead);
    }
    
    imageStream.close();
    outputStream.close();

        
        }
    
%>
