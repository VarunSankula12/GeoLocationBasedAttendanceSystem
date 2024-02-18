<%@page import="com.codebook.user.userDao"%>
<%@page import="com.codebook.faculty.facultyDao,java.sql.*"%>
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
                    <a href="profile.jsp" class="nav-item nav-link">Profile</a>
                    <a href="qrDetails.jsp" class="nav-item nav-link active">QR Details</a>
                    <a href="recordAttendance.jsp" class="nav-item nav-link">Record Attendance</a>
                    <a href="attendanceDetails.jsp" class="nav-item nav-link">My Attendance Details</a>
                    <a href="../index.html" class="nav-item nav-link ">Log Out</a>
                </div>
            </div>
        </nav>
    </div>
    <!-- Navbar End -->


    <!-- Page Header Start -->
    <div class="container-fluid page-header mb-5 wow fadeIn" data-wow-delay="0.1s">
        <div class="container">
            <h1 class="display-3 mb-4 animated slideInDown">QR Details</h1>
            <nav aria-label="breadcrumb">
                        <ol class="breadcrumb justify-content-center">
                            <li class="breadcrumb-item"><a class="text-white" href="student-dashboard.jsp">Dashboard</a></li>
                            <li class="breadcrumb-item text-white active" aria-current="page">QR Details</li>
                        </ol>
                    </nav>
        </div>
    </div>
    <!-- Page Header End -->


    <!-- Contact Start -->
    <section>
         <div class="container mt-5">
            <div class="row">
                <div class="col-md-12">
                    <div class="card mb-4">
                        <div class="card-header py-3">
                            <h2 class="mb-0 text-center"><b>QR Details</b></h2>
                        </div>
                        <table class="table table-striped custab mt-2">
                            <thead>
                                <tr>
                                    <th>Class Incharge</th>
                                    <th>Subject</th>
                                    <th>Block</th>
                                    <th>Floor No</th>
                                    <th>Room No</th>
                                    <th>Attendance Valid From</th>
                                    <th>Attendance Valid To</th>
                                    <th>QR Code</th>
                                </tr>
                            </thead>
        <%
                String rollnum=(String)session.getAttribute("rollnum");
                String q1="SELECT * FROM students WHERE rollnum='"+rollnum+"'";
                ResultSet rs1=userDao.Retrieve(q1);
                if(rs1.next()){
                String query="SELECT * FROM classdetails cd JOIN classlocation cl ON cd.classid=cl.classid WHERE cd.status='Active' AND (cd.branch='"+rs1.getString("branch")+"' OR cd.branch='All') ORDER BY cd.active_time ASC";
                ResultSet rs=facultyDao.Retrieve(query);
                while(rs.next()){
        %>                    
                            <tbody>  
                                <tr>
                                    <td><%=rs.getString("facultyname")%></td>
                                    <td><%=rs.getString("subject")%></td>
                                    <td><%=rs.getString("block")%></td>
                                    <td><%=rs.getString("floor")%></td>
                                    <td><%=rs.getString("roomnum")%></td>
                                    <td><%=rs.getString("start_time")%></td>
                                    <td><%=rs.getString("end_time")%></td>
                                    <td><a href="downloadAction.jsp?classid=<%=rs.getString("classid")%>">Download QR</a></td>
                                </tr>
                            </tbody>
        <%
            }
        }
        %>                    
                        </table>
                        <div class="pagination d-flex justify-content-center">
    <button id="prev-page" class="text-center">Previous</button>
    <button id="next-page" class="text-center">Next</button>
                            </div><br>

        </main><!-- End #main -->
      <script>
  document.addEventListener('DOMContentLoaded', function () {
    const tableRows = document.querySelectorAll('.table tbody tr');
    const itemsPerPage = 4; // Change this to the desired number of items per page.
    let currentPage = 1;

    function showPage(page) {
      tableRows.forEach((row, index) => {
        if (index >= (page - 1) * itemsPerPage && index < page * itemsPerPage) {
          row.style.display = 'table-row';
        } else {
          row.style.display = 'none';
        }
      });
    }

    // Initial page display
    showPage(currentPage);

    document.getElementById('prev-page').addEventListener('click', function (e) {
      e.preventDefault();
      if (currentPage > 1) {
        currentPage--;
        showPage(currentPage);
      }
    });

    document.getElementById('next-page').addEventListener('click', function (e) {
      e.preventDefault();
      const maxPage = Math.ceil(tableRows.length / itemsPerPage);
      if (currentPage < maxPage) {
        currentPage++;
        showPage(currentPage);
      }
    });
  });
</script>  
                    </div>
                </div>
            </div>
        </div>           
    </section>
    <!-- Contact End -->


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