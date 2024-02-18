<%@page import="com.codebook.faculty.randomNumber"%>
<%@page import="com.codebook.faculty.facultyDao"%>
<%@page import="com.codebook.bean.Bean"%>
<%
    Bean b=new Bean();
    b.setName(request.getParameter("block"));
    b.setDistName(request.getParameter("floor"));
    b.setFlag(request.getParameter("room"));
    b.setOrder(request.getParameter("id"));
    b.setTemp(request.getParameter("longitude"));
    b.setTemp2(request.getParameter("latitude"));
    
     String query="INSERT INTO classlocation(classid,block,floor,roomnum,longitude,latitude) VALUES(?,?,?,?,?,?)";
    int rowCount=facultyDao.addLocation(b, query);
    if(rowCount>0){
            request.getSession();
            session.setAttribute("success", "Class Location Details Added Successfully!");
            response.sendRedirect("addClassLocation.jsp");
    }else{
            request.getSession();
            session.setAttribute("failed", "Failed to add Class Location!");
            response.sendRedirect("addClassLocation.jsp");
    }
%>
