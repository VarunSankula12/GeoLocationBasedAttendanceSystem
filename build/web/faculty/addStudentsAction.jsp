<%@page import="com.codebook.faculty.facultyDao"%>
<%@page import="com.codebook.faculty.randomNumber"%>
<%@page import="com.codebook.user.userDao"%>
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
            } else if (fieldName.equals("email")) {
                b.setEmail(fieldValue);
            } else if (fieldName.equals("age")) {
                b.setDob(fieldValue);
            } else if (fieldName.equals("rollnum")) {
                b.setTemp(fieldValue);
            } else if (fieldName.equals("branch")) {
                b.setFlag(fieldValue);
            } else if (fieldName.equals("section")) {
                b.setTemp2(fieldValue);
            }else if (fieldName.equals("phone")) {
                b.setMobile(fieldValue);
            }  else if (fieldName.equals("address")) {
                b.setAddress(fieldValue);
            }  else if (fieldName.equals("gender")) {
                b.setGender(fieldValue);
            }  
        }
       String q1="SELECT * FROM students WHERE email='"+b.getEmail()+"'";
       ResultSet rs=facultyDao.Retrieve(q1);
       String message="Your account Password : "+b.getPassword();
       String subject="Credentials for GLSAS";
       if(rs.next()){
            request.getSession();
            session.setAttribute("failed", "Student Already exists!");
            response.sendRedirect("addStudents.jsp");
        }else{
            String password=randomNumber.generateRandomAlphanumeric(8);
            b.setPassword(password);
            String query="INSERT into students(name,email,age,rollnum,branch,section,mobile,address,gender,password,profile) VALUES(?,?,?,?,?,?,?,?,?,?,?)";
        int rowCount=facultyDao.Registration(b,query);
        if(rowCount>0){
            response.sendRedirect("sendEmail.jsp?name=" + b.getName() + "&email=" + b.getEmail() + "&message=" + message + "&subject=" + subject);
        }else{
            request.getSession();
            session.setAttribute("failed", "Failed to add Student!");
            response.sendRedirect("addStudents.jsp");
        }
        }
        
    }
%>