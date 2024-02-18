<%@page import="com.codebook.faculty.facultyDao"%>
<%
    String email=request.getParameter("email");
    String query="UPDATE students SET status='Accepted' WHERE email='"+email+"'";
    int rowCount=facultyDao.Accept(query);
    if(rowCount>0){
        request.getSession();
            session.setAttribute("success", "Student Accepted!");
            response.sendRedirect("manageStudents.jsp");
    }else{
        request.getSession();
            session.setAttribute("failed", "Failed to Accept Student!");
            response.sendRedirect("manageStudents.jsp");
    }
%>

