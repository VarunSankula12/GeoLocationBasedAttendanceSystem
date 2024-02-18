<%@page import="com.codebook.faculty.facultyDao"%>
<%@page import="java.sql.*"%>
<%
    String rollnum=request.getParameter("rollnum");
    String password=request.getParameter("password");
    String query="SELECT * FROM students WHERE rollnum='"+rollnum+"' && password='"+password+"'";
    ResultSet rs=facultyDao.Retrieve(query);
    if(rs.next()){
        String status=rs.getString("status");
        if(status.equalsIgnoreCase("Accepted")){
            session.setAttribute("rollnum", rollnum);
            request.getSession();
            session.setAttribute("success", "Login Successful!");
          response.sendRedirect("student/student-dashboard.jsp");
        }else{
            request.getSession();
        session.setAttribute("failed", "Faculty has not yet Accepted your account!");
          response.sendRedirect("student-login.jsp");
        }
    }else{
        request.getSession();
        session.setAttribute("failed", "You may entered wrong credentials or You may not registered yet.!");
          response.sendRedirect("student-login.jsp");
    }
%>
