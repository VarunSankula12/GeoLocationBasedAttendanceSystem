<%@page import="com.codebook.faculty.facultyDao"%>
<%@page import="com.codebook.bean.Bean"%>
<%@page import="com.codebook.Connections.DynamicImage"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>

<%@page import="java.sql.*"%>
<%
    Bean b=new Bean();
    
     boolean isMultipart = ServletFileUpload.isMultipartContent(request);
     
    if (isMultipart) {
        DiskFileItemFactory factory = new DiskFileItemFactory();
        ServletFileUpload upload = new ServletFileUpload(factory);
        List<FileItem> items = upload.parseRequest(request);
        for(FileItem item: items){
        String fieldName=item.getFieldName();
        String fieldValue = item.getString();
         if (fieldName.equals("file")) {
         Blob img=DynamicImage.getBlobProfile(item);
            b.setBlob(img);
            
    }
            if (fieldName.equals("name")) {
                b.setName(fieldValue);
            }  else if (fieldName.equals("email")) {
                b.setEmail(fieldValue);
            } else if (fieldName.equals("age")) {
                b.setDob(fieldValue);
            } else if (fieldName.equals("rollnum")) {
                b.setTemp(fieldValue);
            }else if (fieldName.equals("branch")) {
                b.setFlag(fieldValue);
            }  else if (fieldName.equals("section")) {
                b.setTemp2(fieldValue);
            }  else if (fieldName.equals("mobile")) {
                b.setMobile(fieldValue);
            }   else if (fieldName.equals("address")) {
                b.setAddress(fieldValue);
            }  
        }
        String query="UPDATE students SET name=?,email=?,age=?,rollnum=?,branch=?,section=?,mobile=?,address=?,profile=? WHERE email='"+b.getEmail()+"'";
        int rowCount=facultyDao.UpdateProfile(b,query);
        if(rowCount>0){
            request.getSession();
            session.setAttribute("success", "Updation Successful!");
            response.sendRedirect("profile.jsp");
        }else{
            request.getSession();
            session.setAttribute("failed", "Updation Failed!");
            response.sendRedirect("profile.jsp");
        }
    }
%>