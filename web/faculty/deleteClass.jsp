<%@page import="com.codebook.faculty.facultyDao"%>
<%
    String classid=request.getParameter("id");
    String query="DELETE FROM classdetails WHERE classid='"+classid+"'";
    int rowCount=facultyDao.UpdateComplaint(query);
    if(rowCount>0){
        String q1="DELETE FROM classlocation WHERE classid='"+classid+"'";
        int rc=facultyDao.UpdateComplaint(q1);
        if(rc>0){
            request.getSession();
            session.setAttribute("success", "Class deleted successfully!");
            response.sendRedirect("recordAttendance.jsp");
        }else{
            request.getSession();
            session.setAttribute("failed", "Failed to delete classlocation details!");
            response.sendRedirect("recordAttendance.jsp");
        }
    }else{
            request.getSession();
            session.setAttribute("failed", "Failed to delete classdetails!");
            response.sendRedirect("recordAttendance.jsp");
    }
%>
