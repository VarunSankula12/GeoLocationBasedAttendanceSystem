<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.io.ByteArrayInputStream"%>
<%@page import="com.codebook.bean.Bean"%>
<%@page import="com.codebook.admin.QRCodeGenerator"%>
<%@page import="com.codebook.faculty.facultyDao, java.sql.*"%>

<%
    Bean b = new Bean();
    String id = request.getParameter("classid");
    String data = "";
    String status = "Active";
    
    // Get current date and time
    Date currentDate = new Date();
    SimpleDateFormat dateTimeFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    String currentDateTime = dateTimeFormat.format(currentDate);

    String query = "SELECT * FROM classdetails WHERE classid='" + id + "'";
    ResultSet rs = facultyDao.Retrieve(query);

    if (rs.next()) {
        data = id + "," + rs.getString("facultyname") + "," + rs.getString("subject") + "," + rs.getString("branch") + "," + rs.getString("section") + "," + rs.getString("start_time") + "," + rs.getString("end_time") + "," + currentDateTime;

        byte[] qr = QRCodeGenerator.generateQRcode(data, 200, 200);
        ByteArrayInputStream inputStream = new ByteArrayInputStream(qr);

        String q1 = "UPDATE classdetails SET qr = ? WHERE classid ='" + id + "'";
        int rowCount = facultyDao.addQR(qr, inputStream, q1);

        if (rowCount > 0) {
            String q2 = "UPDATE classdetails SET status='Active', active_time='" + currentDateTime + "' WHERE classid='" + id + "'";
            int count = facultyDao.UpdateComplaint(q2);

            if (count > 0) {
                    request.getSession();
                    session.setAttribute("success", "QR Generated and Class Started Successfully!");
                    response.sendRedirect("recordAttendance.jsp");
            } else {
                    request.getSession();
                    session.setAttribute("failed", "Failed to Start Class!");
                    response.sendRedirect("recordAttendance.jsp");
            }
        } else {
                    request.getSession();
                    session.setAttribute("failed", "Failed to Insert QR code!");
                    response.sendRedirect("recordAttendance.jsp");
        }
    }
%>
