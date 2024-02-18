<%@page import="com.codebook.faculty.facultyDao"%>
<%
    String email=request.getParameter("email");
    String query="UPDATE students SET status='Rejected' WHERE email='"+email+"'";
    int rowCount=facultyDao.Accept(query);
    if(rowCount>0){
        request.getSession();
            session.setAttribute("rejected", "Student Rejected!");
            response.sendRedirect("manageStudents.jsp");
    }else{
        request.getSession();
            session.setAttribute("failed", "Failed to Reject Student!");
            response.sendRedirect("manageStudents.jsp");
    }
%>

