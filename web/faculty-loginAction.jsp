<%@page import="com.codebook.faculty.facultyDao"%>
<%@page import="java.sql.*"%>
<%
    String email=request.getParameter("email");
    String password=request.getParameter("password");
    String query="SELECT * FROM faculty WHERE email='"+email+"' && password='"+password+"'";
    ResultSet rs=facultyDao.Retrieve(query);
    if(rs.next()){
        request.getSession();
        session.setAttribute("success", "Login Successful!");
          response.sendRedirect("faculty/faculty-dashboard.jsp");
    }else{
        request.getSession();
        session.setAttribute("failed", "You may entered wrong credentials or You may not registered yet.!");
          response.sendRedirect("faculty-login.jsp");
    }
%>
