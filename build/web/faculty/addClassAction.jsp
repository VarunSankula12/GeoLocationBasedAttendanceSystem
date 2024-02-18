<%@page import="com.codebook.faculty.randomNumber"%>
<%@page import="com.codebook.faculty.facultyDao"%>
<%@page import="com.codebook.bean.Bean"%>
<%
    Bean b=new Bean();
    b.setName(request.getParameter("classIncharge"));
    b.setFlag(request.getParameter("subject"));
    b.setTemp(request.getParameter("branch"));
    b.setTemp2(request.getParameter("section"));
    b.setTemp3(request.getParameter("startTime"));
    b.setDistName(request.getParameter("endTime"));
    String classid=randomNumber.generateRandomAlphanumeric(10);
    b.setOrder(classid);
    String query="INSERT INTO classdetails(classid,facultyname,subject,branch,section,start_time,end_time) VALUES(?,?,?,?,?,?,?)";
    int rowCount=facultyDao.addClass(b, query);
    if(rowCount>0){
            request.getSession();
            session.setAttribute("success", "Class Added Successfully!");
            response.sendRedirect("addClass.jsp");
    }else{
            request.getSession();
            session.setAttribute("failed", "Failed to add class!");
            response.sendRedirect("addClass.jsp");
    }
%>
