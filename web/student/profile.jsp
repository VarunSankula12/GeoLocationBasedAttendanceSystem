<%@page import="com.codebook.faculty.facultyDao"%>
<%@page import="com.codebook.user.userDao"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.0/sweetalert.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <meta charset="utf-8">
    <title>GLSAS</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link
        href="https://fonts.googleapis.com/css2?family=Jost:wght@500;600;700&family=Open+Sans:wght@400;500&display=swap"
        rel="stylesheet">

    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="lib/animate/animate.min.css" rel="stylesheet">
    <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="css/style.css" rel="stylesheet">
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
    <!-- Spinner Start -->
    <div id="spinner"
        class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
        <div class="spinner-border text-primary" role="status" style="width: 3rem; height: 3rem;"></div>
    </div>
    <!-- Spinner End -->


    <!-- Navbar Start -->
    <div class="container-fluid fixed-top px-0 wow fadeIn" data-wow-delay="0.1s">
        <div class="top-bar row gx-0 align-items-center d-none d-lg-flex">
            <div class="col-lg-6 px-5 text-start">
                <small><i class="fa fa-map-marker-alt text-primary me-2"></i>L.B Nagar Metro Station,Hyderabad, Telangana 500074</small>
                <small class="ms-4"><i class="fa fa-clock text-primary me-2"></i>9.00 am - 9.00 pm</small>
            </div>
            <div class="col-lg-6 px-5 text-end">
                <small><i class="fa fa-envelope text-primary me-2"></i>codebook@gmail.com</small>
                <small class="ms-4"><i class="fa fa-phone-alt text-primary me-2"></i>+91 9848022602</small>
            </div>
        </div>

        <nav class="navbar navbar-expand-lg navbar-light py-lg-0 px-lg-5 wow fadeIn" data-wow-delay="0.1s">
            <a href="index.html" class="navbar-brand ms-4 ms-lg-0">
                <h1 class="display-5 text-primary m-0">GLSAS</h1>
            </a>
            <button type="button" class="navbar-toggler me-4" data-bs-toggle="collapse"
                data-bs-target="#navbarCollapse">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarCollapse">
                <div class="navbar-nav ms-auto p-4 p-lg-0">
                    <a href="student-dashboard.jsp" class="nav-item nav-link">Dashboard</a>
                    <a href="profile.jsp" class="nav-item nav-link active">Profile</a>
                    <a href="qrDetails.jsp" class="nav-item nav-link">QR Details</a>
                    <a href="recordAttendance.jsp" class="nav-item nav-link">Record Attendance</a>
                    <a href="attendanceDetails.jsp" class="nav-item nav-link">My Attendance Details</a>
                    <a href="../index.html" class="nav-item nav-link ">Log Out</a>
                </div>
            </div>
        </nav>
    </div>
    <!-- Navbar End -->


    <!-- Page Header Start -->
    <div class="container-fluid">
        <div class="row justify-content-center mt-8 mb-5 wow fadeIn" data-wow-delay="0.1s">
            <div class="col-lg-8">
                <h1 class="display-3 mb-4 animated slideInDown text-center " style="margin-top: 150px; padding: 20px">Student Profile</h1>
            </div>
        </div>
    </div>
    <!-- Page Header End -->

<%
        Blob img=null;
        String pic="";
        String rollnum=(String)session.getAttribute("rollnum");
        String query="SELECT * FROM students WHERE rollnum='"+rollnum+"'";
        ResultSet rs=userDao.Retrieve(query);
        if(rs.next()){
            img=rs.getBlob("profile");
            pic=facultyDao.imageConversion(img);
%>
    <!-- Contact Start -->
   <section class="section dashboard">
        <div class="container rounded bg-white mb-5 border border-black mt-5">
            <div class="row ">
                <div class="col-md-6 mx-auto px-5 pb-3 mt-3" style="border-bottom: 2px solid #31d2f2; ">
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
    <!-- Contact End -->
<%
    }
%>

    <!-- Footer Start -->
    <div class="container-fluid bg-dark text-light footer mt-5 py-5 wow fadeIn" data-wow-delay="0.1s">
        <div class="container py-5">
            <div class="row g-5">
                <div class="col-lg-3 col-md-6">
                    <h4 class="text-white mb-4">Our Office</h4>
                    <p class="mb-2"><i class="fa fa-map-marker-alt me-3"></i>#2nd Floor, Siris Rd, Near L.B Nagar Metro Station Pillar No, A1662, Snehapuri Colony, Hyderabad, Telangana 500074</p>
                    <p class="mb-2"><i class="fa fa-phone-alt me-3"></i>+91 9848022602</p>
                    <p class="mb-2"><i class="fa fa-envelope me-3"></i>codebook@gmail.com</p>
                    <div class="d-flex pt-2">
                        <a class="btn btn-square btn-outline-light rounded-circle me-2" href="https://www.codebook.in/"><i
                                class="fab fa-twitter"></i></a>
                        <a class="btn btn-square btn-outline-light rounded-circle me-2" href="https://www.codebook.in/"><i
                                class="fab fa-facebook-f"></i></a>
                        <a class="btn btn-square btn-outline-light rounded-circle me-2" href="https://www.codebook.in/"><i
                                class="fab fa-youtube"></i></a>
                        <a class="btn btn-square btn-outline-light rounded-circle me-2" href="https://www.codebook.in/"><i
                                class="fab fa-linkedin-in"></i></a>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <h4 class="text-white mb-4">Services</h4>
                    <a class="btn btn-link" href="../contact.jsp">Offline Classes</a>
                    <a class="btn btn-link" href="../contact.jsp">Subject Assistance</a>
                    <a class="btn btn-link" href="../contact.jsp">Upskilling Students</a>
                    <a class="btn btn-link" href="../contact.jsp">Skilled Instructors</a>
                </div>
                <div class="col-lg-3 col-md-6">
                    <h4 class="text-white mb-4">Quick Links</h4>
                    <a class="btn btn-link" href="../about.jsp">About Us</a>
                    <a class="btn btn-link" href="../contact.jsp">Contact Us</a>
                    <a class="btn btn-link" href="../contact.jsp">Our Services</a>
                    <a class="btn btn-link" href="../contact.jsp">Terms & Condition</a>
                    <a class="btn btn-link" href="../contact.jsp">Support</a>
                </div>
                <div class="col-lg-3 col-md-6">
                    <h4 class="text-white mb-4">Newsletter</h4>
                    <p>Any queries regarding our platform please feel free to contact us.</p>
                    <div class="position-relative w-100">
                        <input class="form-control bg-white border-0 w-100 py-3 ps-4 pe-5" type="text"
                            placeholder="Your email">
                        <button type="button"
                            class="btn btn-primary py-2 position-absolute top-0 end-0 mt-2 me-2">SignUp</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Footer End -->


    <!-- Copyright Start -->
    <div class="container-fluid copyright py-4">
        <div class="container">
            <div class="row">
                <div class="col-md-6 text-center text-md-start mb-3 mb-md-0">
                    &copy; <a class="border-bottom" href="#">GLSAS</a>, All Right Reserved.
                </div>
                <div class="col-md-6 text-center text-md-end">
                    <!--/*** This template is free as long as you keep the footer author?s credit link/attribution link/backlink. If you'd like to use the template without the footer author?s credit link/attribution link/backlink, you can purchase the Credit Removal License from "https://htmlcodex.com/credit-removal". Thank you for your support. ***/-->
                    Designed By <a class="border-bottom" href="https://www.codebook.in/">CODEBOOK.IN</a> Distributed By <a
                        href="https://themewagon.com">ThemeWagon</a>
                </div>
            </div>
        </div>
    </div>
    <!-- Copyright End -->


    <!-- Back to Top -->
    <a href="#" class="btn btn-lg btn-primary btn-lg-square rounded-circle back-to-top"><i
            class="bi bi-arrow-up"></i></a>


    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="lib/wow/wow.min.js"></script>
    <script src="lib/easing/easing.min.js"></script>
    <script src="lib/waypoints/waypoints.min.js"></script>
    <script src="lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="lib/counterup/counterup.min.js"></script>

    <!-- Template Javascript -->
    <script src="js/main.js"></script>
</body>

</html>