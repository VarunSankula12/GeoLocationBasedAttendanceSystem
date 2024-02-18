<%@page import="com.codebook.user.userDao"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.codebook.user.LocationComparator"%>
<%@page import="com.codebook.faculty.facultyDao"%>
<%@page import="com.codebook.admin.ScanQrcode"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="com.codebook.bean.Bean"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="com.codebook.admin.ScanQrcode"%>
<%@page import="java.io.*"%>
<%@page import="java.util.*, java.sql.*,java.sql.*, java.util.Date, java.text.SimpleDateFormat"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Get Precise Location using Google Maps Geolocation API</title>
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCK0T9gA3_pLhLoihh-CjwI17Me9eDFitI&libraries=places"></script>
</head>
<body>

  <%
      String id="";
    String name=""; 
    String subject="";
    String branch="";
    String section="";
    String stime="";
    String etime="";
    String date="";
    String lon=request.getParameter("longitude");
    String lat=request.getParameter("latitude");
    
      Date currentDate = new Date();
    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
    String currentDateOnly = dateFormat.format(currentDate);
      
    SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm");
    String currentTimeOnly = timeFormat.format(currentDate);
    
    Bean b=new Bean();
boolean isMultipart = ServletFileUpload.isMultipartContent(request);

if (isMultipart) {
    DiskFileItemFactory factory = new DiskFileItemFactory();
    ServletFileUpload upload = new ServletFileUpload(factory);
    List<FileItem> items = upload.parseRequest(request);

    
    for (FileItem item : items) {
        if (!item.isFormField()) { 
            String fieldName = item.getFieldName();
            String fileName = new File(item.getName()).getName();
            
            if (fieldName.equals("file")) {
                File tempFile = File.createTempFile("uploadedFile", ".tmp");
                item.write(tempFile); 
                ScanQrcode obj=new ScanQrcode();
                String qrCodeResult = obj.scanQR(tempFile);
                String[] values = qrCodeResult.split(",");
                id = values[0].trim();
                name = values[1].trim();
                subject = values[2].trim();
                branch = values[3].trim();
                section = values[4].trim();
                stime=values[5].trim();
                etime=values[6].trim();
                date=values[7].trim();
                }
            }
        }
        String trimmedDate = date.substring(0, 10);
        for (FileItem item : items) {
    if (item.isFormField()) { // Check if it's a form field
        String fieldName = item.getFieldName();
        String fieldValue = item.getString();

        if (fieldName.equalsIgnoreCase("longitude")) {
            lon = fieldValue; 
        }
        if (fieldName.equalsIgnoreCase("latitude")) {
            lat = fieldValue;
        }
    }
}
    String rollnum=(String)session.getAttribute("rollnum");
        b.setMobile(rollnum);
        b.setTemp(id);
        b.setName(name);
        b.setTemp2(subject);
        b.setTemp3(date);
        b.setFlag(stime);
        b.setAddress(currentTimeOnly);
        String query="SELECT * FROM classlocation WHERE classid='"+id+"'";
        ResultSet rs=facultyDao.Retrieve(query);
        if(rs.next()){
        double lat1=Double.parseDouble(lat);
        double lon1=Double.parseDouble(lon);
        double dlon=Double.parseDouble(rs.getString("longitude"));
        double dlat=Double.parseDouble(rs.getString("latitude"));
        double threshold=100;
        boolean val=LocationComparator.areLocationsWithinThreshold(lat1, lon1, dlat, dlon, threshold);
        if(val){
            String q4="SELECT * FROM classdetails WHERE classid='"+id+"'";
            ResultSet rs2=userDao.Retrieve(q4);
            if(rs2.next()){
                            if(rs2.getString("status").equalsIgnoreCase("Active")){
                                     if (currentDateOnly.equals(trimmedDate)) {
                                        if (currentTimeOnly.compareTo(stime) >= 0 && currentTimeOnly.compareTo(etime) <= 0) {
                                        String q2="SELECT * FROM attendance WHERE classid='"+id+"' AND rollnum='"+rollnum+"'";
                                        ResultSet rs1=facultyDao.Retrieve(q2);
                                        if(rs1.next()){
                                        request.getSession();
                                        session.setAttribute("failed", "Your attendance already marked!");
                                        response.sendRedirect("recordAttendance.jsp");
                                        }else{
                                        String q1="INSERT INTO attendance(classid,rollnum,inchargeName,subject,date,classtime,attendancetime) VALUES (?,?,?,?,?,?,?)";
                                        int rowCount=userDao.Attendance(b, q1);
                                        if(rowCount>0){
                                        request.getSession();
                                        session.setAttribute("success", "Attendance Marked Successfully!");
                                        response.sendRedirect("recordAttendance.jsp");
                                        }else{
                                            request.getSession();
                                            session.setAttribute("failed", "Failed to Mark Attendance!");
                                            response.sendRedirect("recordAttendance.jsp");
                                        }
                                        }
                                        } else {
                                        request.getSession();
                                            session.setAttribute("failed", "Class Timings doesn't Match!");
                                            response.sendRedirect("recordAttendance.jsp");
                                    }
                                   } else {
                                            request.getSession();
                                            session.setAttribute("failed", "Date doesn't match!");
                                            response.sendRedirect("recordAttendance.jsp");
                                }
                            }else{
                                            request.getSession();
                                            session.setAttribute("failed", "Class is not Active to mark your attendance!");
                                            response.sendRedirect("recordAttendance.jsp");
                            }
                        }else{
                                            request.getSession();
                                            session.setAttribute("failed", "Class not Exists!");
                                            response.sendRedirect("recordAttendance.jsp");
                        }
               
        }else{
            request.getSession();
            session.setAttribute("failed", "You are very far from class location!");
            response.sendRedirect("recordAttendance.jsp");
        }
        
        }
    }
%>