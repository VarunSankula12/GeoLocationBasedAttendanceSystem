<%@page import="com.codebook.faculty.facultyDao,java.sql.*"%>
<%
    String id = request.getParameter("classid");
    String query="SELECT * FROM classdetails WHERE classid='"+id+"'";
    ResultSet rs=facultyDao.Retrieve(query);
    if(rs.next()){
        String q1="UPDATE classdetails SET status='Deactive' WHERE classid='"+id+"'";
        int rowCount=facultyDao.UpdateComplaint(q1);
        if(rowCount>0){
            request.getSession();
            session.setAttribute("success", "Class Ended Successfully!");
            response.sendRedirect("recordAttendance.jsp");
        }else{
            request.getSession();
            session.setAttribute("failed", "Failed to end Class!");
            response.sendRedirect("recordAttendance.jsp");
        }
    }
%>
