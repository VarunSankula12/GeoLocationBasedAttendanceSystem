<%@page import="com.codebook.faculty.facultyDao"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.0/sweetalert.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <title>Faculty</title>
    <!-- HTML5 Shim and Respond.js IE9 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
      <![endif]-->
      <!-- Meta -->
      <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
      <meta http-equiv="X-UA-Compatible" content="IE=edge" />
      <meta name="description" content="CodedThemes">
      <meta name="keywords" content=" Admin , Responsive, Landing, Bootstrap, App, Template, Mobile, iOS, Android, apple, creative app">
      <meta name="author" content="CodedThemes">
      <!-- Favicon icon -->
      <link rel="icon" href="assets/images/favicon.ico" type="image/x-icon">
      <!-- Google font-->
      <link href="https://fonts.googleapis.com/css?family=Open+Sans:400,600" rel="stylesheet">
      <!-- Required Fremwork -->
      <link rel="stylesheet" type="text/css" href="assets/css/bootstrap/css/bootstrap.min.css">
      <!-- themify-icons line icon -->
      <link rel="stylesheet" type="text/css" href="assets/icon/themify-icons/themify-icons.css">
      <!-- ico font -->
      <link rel="stylesheet" type="text/css" href="assets/icon/icofont/css/icofont.css">
      <!-- Style.css -->
      <link rel="stylesheet" type="text/css" href="assets/css/style.css">
      <link rel="stylesheet" type="text/css" href="assets/css/jquery.mCustomScrollbar.css">
      
      <style>
          .welcome-heading {
    background-color: #007bff; /* Choose your desired background color */
    color: #ffffff; /* Choose your desired text color */
    padding: 15px;
    border-radius: 10px;
  }
      </style>
      <style>
        body {
            background-color: #f8f9fa;
        }

        .container {
            margin-top: 50px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-row {
            margin-bottom: 10px;
        }

        .form-container {
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
            padding: 20px;
            border-radius: 10px;
        }
    </style>
    <script type="text/javascript">  
            
        function validateuser(){  
            
        var name=document.myform.name.value;
        var rollnum=document.myform.rollnum.value;
        var mobile=document.myform.mobile.value;
        var email=document.myform.email.value;
        var address=document.myform.address.value;
        var gender=document.myform.gender.value;
        var age=document.myform.age.value; 
        var branch=document.myform.branch.value; 
        var section=document.myform.section.value; 
        var file=document.myform.file.value;
        var emailpattern = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([com\co\.\in])+$/; 
        var letter = /[a-z]/;
        var upper = /[A-Z]/;
        var number = /[0-9]/;

        if (name===""){ 
            Swal.fire('Name Cannot be empty');
          return false;  
        }
        if (email===""){
            Swal.fire("E-mail cannot be empty");           
            return false;
        }
        if(!email.match(emailpattern)){
            Swal.fire("Invalid Email format");             
            return false;
        }
        if(mobile===""){
            Swal.fire("Provide Mobile number");
            return false;
        }
        if(mobile.length!==10){
            Swal.fire("Missing length of Mobile number");
            return false;
        }
         if(isNaN(mobile)){
            Swal.fire("Invalid Mobile number");
            return false;
        }
        if (rollnum===""){ 
            Swal.fire('RollNum Cannot be empty');
          return false;  
        }
        if (branch===""){
           Swal.fire("Branch cannot be blank");            
            return false;
        }
        if (section===""){
           Swal.fire("Section cannot be blank");            
            return false;
        }
        if (gender===""){
           Swal.fire("Gender cannot be blank");            
            return false;
        } 
        if (age===""){
            Swal.fire("Age cannot be blank");            
            return false;
        }
        if (address===""){
           Swal.fire("Address cannot be blank");            
            return false;
        }
        
    }  
    </script>
  </head>

  <body>
      <script>
        var successMessage = '${sessionScope.success}';
        if (successMessage !== '') {
            Swal.fire({
                icon: 'success',
                title: 'Success!',
                text: successMessage,
                confirmButtonText: 'OK'
            });

            <% session.removeAttribute("success"); %>
        }
          
    </script>
    <script>
        var successMessage = '${sessionScope.failed}';
        if (successMessage !== '') {
            Swal.fire({
                icon: 'error',
                title: 'Failed!',
                text: successMessage,
                confirmButtonText: 'OK'
            });

            <% session.removeAttribute("failed"); %>
        }
          
    </script>
    <!-- Pre-loader start -->
    <div class="theme-loader">
        <div class="ball-scale">
            <div class='contain'>
                <div class="ring">
                    <div class="frame"></div>
                </div>
                <div class="ring">
                    <div class="frame"></div>
                </div>
                <div class="ring">

                    <div class="frame"></div>
                </div>
                <div class="ring">
                    <div class="frame"></div>
                </div>
                <div class="ring">
                    <div class="frame"></div>
                </div>
                <div class="ring">
                    <div class="frame"></div>
                </div>
                <div class="ring">
                    <div class="frame"></div>
                </div>
                <div class="ring">
                    <div class="frame"></div>
                </div>
                <div class="ring">
                    <div class="frame"></div>
                </div>
                <div class="ring">
                    <div class="frame"></div>
                </div>
            </div>
        </div>
    </div>
    <!-- Pre-loader end -->
    <div id="pcoded" class="pcoded">
        <div class="pcoded-overlay-box"></div>
        <div class="pcoded-container navbar-wrapper">

            <nav class="navbar header-navbar pcoded-header">
                <div class="navbar-wrapper">

                    <div class="navbar-logo">
                        <a class="mobile-menu" id="mobile-collapse" href="#!">
                            <i class="ti-menu"></i>
                        </a>
                        <a class="mobile-search morphsearch-search" href="#">
                            <i class="ti-search"></i>
                        </a>
                        <a href="index.html">
                            <img class="img-fluid" src="images/logo.png" height="200" width="100" alt="Theme-Logo" />
                        </a>
                        <a class="mobile-options">
                            <i class="ti-more"></i>
                        </a>
                    </div>

                    <div class="navbar-container container-fluid">
                        <ul class="nav-left">
                            <li>
                                <div class="sidebar_toggle"><a href="javascript:void(0)"><i class="ti-menu"></i></a></div>
                            </li>

                            <li>
                                <a href="#!" onclick="javascript:toggleFullScreen()">
                                    <i class="ti-fullscreen"></i>
                                </a>
                            </li>
                        </ul>
                        <ul class="nav-right">
                            
                            <li class="user-profile header-notification">
                                <a href="#!">
                                    <img src="images/admin1.avif" class="img-radius" alt="User-Profile-Image">
                                    <span>Faculty</span>
                                    <i class="ti-angle-down"></i>
                                </a>
                                <ul class="show-notification profile-notification">
                                    <li>
                                        <a href="../index.html">
                                            <i class="ti-layout-sidebar-left"></i> Logout
                                        </a>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
            <div class="pcoded-main-container">
                <div class="pcoded-wrapper">
                    <nav class="pcoded-navbar">
                        <div class="sidebar_toggle"><a href="#"><i class="icon-close icons"></i></a></div>
                        <div class="pcoded-inner-navbar main-menu">
                            <div class="pcoded-navigatio-lavel" data-i18n="nav.category.navigation">Faculty Dashboard</div>
                            <ul class="pcoded-item pcoded-left-item">
                                <li class="">
                                    <a href="faculty-dashboard.jsp">
                                        <span class="pcoded-micon"><i class="ti-home"></i><b>D</b></span>
                                        <span class="pcoded-mtext" data-i18n="nav.dash.main">Dashboard</span>
                                        <span class="pcoded-mcaret"></span>
                                    </a>
                                </li>
                                <li class="pcoded-hasmenu">
                                    <a href="javascript:void(0)">
                                        <span class="pcoded-micon"><i class="ti-layout-grid2-alt"></i></span>
                                        <span class="pcoded-mtext"  data-i18n="nav.basic-components.main">Student Management</span>
                                        <span class="pcoded-mcaret"></span>
                                    </a>
                                    <ul class="pcoded-submenu">
                                        <li class=" ">
                                            <a href="addStudents.jsp">
                                                <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                                <span class="pcoded-mtext" data-i18n="nav.basic-components.alert">Add Students</span>
                                                <span class="pcoded-mcaret"></span>
                                            </a>
                                        </li>
                                        <li class=" ">
                                            <a href="manageStudents.jsp">
                                                <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                                <span class="pcoded-mtext" data-i18n="nav.basic-components.breadcrumbs">Manage Students</span>
                                                <span class="pcoded-mcaret"></span>
                                            </a>
                                        </li>
                                        <li class="active">
                                            <a href="allStudents.jsp">
                                                <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                                <span class="pcoded-mtext" data-i18n="nav.basic-components.breadcrumbs">All Students</span>
                                                <span class="pcoded-mcaret"></span>
                                            </a>
                                        </li>
                                    </ul>
                                </li>
                                <li class="pcoded-hasmenu">
                                    <a href="javascript:void(0)">
                                        <span class="pcoded-micon"><i class="ti-layout-grid2-alt"></i></span>
                                        <span class="pcoded-mtext"  data-i18n="nav.basic-components.main">Class Management</span>
                                        <span class="pcoded-mcaret"></span>
                                    </a>
                                    <ul class="pcoded-submenu">
                                        <li class=" ">
                                            <a href="addClass.jsp">
                                                <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                                <span class="pcoded-mtext" data-i18n="nav.basic-components.alert">Add Class Details</span>
                                                <span class="pcoded-mcaret"></span>
                                            </a>
                                        </li>
                                        <li class=" ">
                                            <a href="addClassLocation.jsp">
                                                <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                                <span class="pcoded-mtext" data-i18n="nav.basic-components.alert">Add Class Location</span>
                                                <span class="pcoded-mcaret"></span>
                                            </a>
                                        </li>
                                    </ul>
                                </li>
                                <li class="pcoded-hasmenu">
                                    <a href="javascript:void(0)">
                                        <span class="pcoded-micon"><i class="ti-layout-grid2-alt"></i></span>
                                        <span class="pcoded-mtext"  data-i18n="nav.basic-components.main">Attendance Management</span>
                                        <span class="pcoded-mcaret"></span>
                                    </a>
                                    <ul class="pcoded-submenu">
                                        <li class=" ">
                                            <a href="recordAttendance.jsp">
                                                <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                                <span class="pcoded-mtext" data-i18n="nav.basic-components.alert">Record Attendance</span>
                                                <span class="pcoded-mcaret"></span>
                                            </a>
                                        </li>
                                        <li class=" ">
                                            <a href="attendanceDetails.jsp">
                                                <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                                <span class="pcoded-mtext" data-i18n="nav.basic-components.alert">Attendance Details</span>
                                                <span class="pcoded-mcaret"></span>
                                            </a>
                                        </li>
                                        <li class=" ">
                                            <a href="attendanceAnalysis.jsp">
                                                <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                                <span class="pcoded-mtext" data-i18n="nav.basic-components.alert">Attendance Analysis</span>
                                                <span class="pcoded-mcaret"></span>
                                            </a>
                                        </li>
                                    </ul>
                                </li>
                                
                            </ul>
                            
                        </div>
                    </nav>
              
                    
<%
    Blob img=null;
    String pic="";
    String email=request.getParameter("email");
    String query="SELECT * FROM students WHERE email='"+email+"'";
    ResultSet rs=facultyDao.Retrieve(query);
    if(rs.next()){
    img=rs.getBlob("profile");
    pic=facultyDao.imageConversion(img);
%>                    
<section class="section dashboard">
        <div class="container rounded bg-white mb-5 border border-black">
            <div class="row ">
                <!-- <h3 class="text-center">PROFILE </h3>  -->
                <div class="col-md-6 mx-auto px-5 pb-3 mt-3" style="border-bottom: 2px solid #31d2f2; ">
                    <div class="card-header py-3">
                        <h2 class="mb-0 text-center"><b>Student Profile</b></h2>
                    </div>
                    <br>
                    <div class="d-flex align-items-center">
                        <div class="image ml-5">
                            <img src='data:image/jpeg;base64, <%=pic%>' height="200px" width="200px" alt="image">
                        </div>
                        <div class="mx-5">
                            <h4 class="mb-0 mt-0"></h4>
                            <span></span>
                        </div>
                    </div>
                </div>
                <div class="col-md-10 mx-auto border border-black">
                    <div class="p-3 py-5">
                        <div class="d-flex justify-content-between align-items-center mb-3">
                            <h3 class="text-right">Profile Settings :</h3>
                        </div>

                        <p class="text-center m-2" style="font-size: 12px; color: tomato;">You can update everything except your email.</p>
                        <form action="updateStudentProfile.jsp" id="myform" name="myform" onsubmit="return validateuser()" class="form-box mainForm px-4  mb-2 pt-5" style="margin-top:-40px" method="post" enctype="multipart/form-data">
                       
                        <div class="form-row row mb-2">
                            <div class="col-md-5 mx-auto">                       
                                <label for="name" class="m-1  ">Full Name :</label> 
                                <input type="text" id="name" class="form-control"  name="name" value="<%=rs.getString("name")%>">
                            </div>
                            <div class="col-md-5 mx-auto">
                                <label for="email" class="m-1">Email :</label> 
                                <input type="text" id="email" class="form-control"   name="email" readonly value="<%=rs.getString("email")%>">
                            </div>
                        </div>
                        <div class="form-row row mb-2">
                            <div class="col-md-5 mx-auto">
                                <label for="rollnum" class="m-1">Roll Number :</label> 
                                <input type="text" id="rollnum" class="form-control"  readonly name="rollnum" value="<%=rs.getString("rollnum")%>">
                            </div>
                            <div class="col-md-5 mx-auto">
                                <label for="phone" class="m-1">Phone :</label>
                                <input type="number" id="mobile" class="form-control"  name="mobile" value="<%=rs.getString("mobile")%>">
                            </div>
                             
                        </div>
                            <div class="form-row row mb-2">
                            <div class="col-md-5 mx-auto">
                                <label for="branch" class="m-1">Branch :</label> 
                                <input type="text" id="branch" class="form-control"  readonly name="branch" value="<%=rs.getString("branch")%>">
                            </div>
                            <div class="col-md-5 mx-auto">
                                <label for="section" class="m-1">Section :</label>
                                <input type="text" id="section" class="form-control"  name="section" value="<%=rs.getString("section")%>">
                            </div>
                             
                        </div>
                        <div class="form-row row mb-2">
                            <div class="col-md-5 mx-auto">
                                <label for="gender" class="m-1">Gender :</label>
                                <select class="form-control" id="gender" name="gender" >
                                            <option value="<%=rs.getString("gender")%>" selected><%=rs.getString("gender")%>  </option>
                                            <option value="male">Male</option>
                                            <option value="female">Female</option>
                                            <option value="other">Other</option>
                                        </select>
                            </div>
                            <div class="col-md-5 mx-auto">
                                <label for="age" class="m-1">Age :</label>
                                <input type="text" id="age"  class="form-control"  name="age" value="<%=rs.getString("age")%>">
                            </div>
                        </div> 
                            
                            <div class="form-row row mb-2">
                            <div class="col-md-5 mx-auto">
                                <label for="address" class="m-1">Address :</label>
                                <input type="text" id="address"  class="form-control"  name="address" value="<%=rs.getString("address")%>">
                            </div>
                            <div class="col-md-5 mx-auto">
                                <label for="file" class="m-1">Upload Profile :</label>
                                <input type="file" id="file"  class="form-control"  name="file">
                            </div>
                        </div> 
                       
                        <div class="mt-5 text-center" value="Submit Button">
                                <button class="btn btn-info btn-pill col-md-4 justify-content-center text fw-bold" type="submit">Update Profile</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

        </div>
    </section>
  <%
      }
  %>                          

<!-- Required Jquery -->
<script type="text/javascript" src="assets/js/jquery/jquery.min.js"></script>
<script type="text/javascript" src="assets/js/jquery-ui/jquery-ui.min.js"></script>
<script type="text/javascript" src="assets/js/popper.js/popper.min.js"></script>
<script type="text/javascript" src="assets/js/bootstrap/js/bootstrap.min.js"></script>
<!-- jquery slimscroll js -->
<script type="text/javascript" src="assets/js/jquery-slimscroll/jquery.slimscroll.js"></script>
<!-- modernizr js -->
<script type="text/javascript" src="assets/js/modernizr/modernizr.js"></script>
<!-- am chart -->
<script src="assets/pages/widget/amchart/amcharts.min.js"></script>
<script src="assets/pages/widget/amchart/serial.min.js"></script>
<!-- Todo js -->
<script type="text/javascript " src="assets/pages/todo/todo.js "></script>
<!-- Custom js -->
<script type="text/javascript" src="assets/pages/dashboard/custom-dashboard.js"></script>
<script type="text/javascript" src="assets/js/script.js"></script>
<script type="text/javascript " src="assets/js/SmoothScroll.js"></script>
<script src="assets/js/pcoded.min.js"></script>
<script src="assets/js/demo-12.js"></script>
<script src="assets/js/jquery.mCustomScrollbar.concat.min.js"></script>
<script>
var $window = $(window);
var nav = $('.fixed-button');
    $window.scroll(function(){
        if ($window.scrollTop() >= 200) {
         nav.addClass('active');
     }
     else {
         nav.removeClass('active');
     }
 });
</script>
</body>

</html>