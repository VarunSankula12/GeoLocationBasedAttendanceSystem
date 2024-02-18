

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
    <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDWhk8lV5pUYd9tol1ein41blRv9x8eQ3E&libraries=places&callback=initMap"></script>

    <style>
        #map {
            height: 400px;
        }
    </style>
    <script type="text/javascript">  
            
        function validateuser(){  
            
        var file=document.myform.file.value;
       
        if (file===""){
           Swal.fire("File cannot be empty");            
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
                    <a href="profile.jsp" class="nav-item nav-link">Profile</a>
                    <a href="qrDetails.jsp" class="nav-item nav-link">QR Details</a>
                    <a href="recordAttendance.jsp" class="nav-item nav-link active">Record Attendance</a>
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
    <p class="text-danger text-center"><b>Note: * If your current location is not matched or displayed properly. Please disconnect your Internet connection and connect again then refresh. *</b></p>
    <!-- Contact Start -->
    <section class="section">
        <div class="container">
            <div class="row">
                <!-- Map on Left Side -->
                
                <br>
                <div class="col-lg-6" id="map">
                    <!-- Google Maps API Script -->
                    
                </div>

                <!-- Box with Scan Card Field on Right Side -->
                <div class="col-lg-6">
    <div class="card">
        <div class="card-body">
            <h5 class="card-title">QR Options</h5>
            <br>
            <button onclick="getCurrentLocation()" class="btn btn-primary">Get My Location</button><br>
            <!-- Display QR Option -->
            <div class="mb-3"><br>
                <img src="img/qr-code.png" alt="QR Code" class="img-fluid mb-2" style="height: 100px; width: 100px;">
                <!-- Add your logic to generate/display the QR code here -->
            </div>
           <form action="ScanAction.jsp" method="POST" id="myform" onsubmit="return validateUser()" name="myform" class="contactForm" enctype="multipart/form-data">  
                <div class="mb-3">
                    <label for="file" class="form-label">Upload QR Code</label>
                    <input type="file" class="form-control" id="file" name="file" accept=".png, .jpg, .jpeg" >
                </div>
               <input type="hidden" name="latitude" id="latitude" value="">
                <input type="hidden" name="longitude" id="longitude" value="">
                <button type="submit" class="btn btn-primary">Submit</button>
            </form>
        </div>
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
                               placeholder="Your email" name="email" id="email" >
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

    <script>
    var map;
    var mapInitialized = false;

    function initMap() {
        if (!mapInitialized && navigator.geolocation) {
            navigator.geolocation.getCurrentPosition(function (position) {
                var latitude = position.coords.latitude;
                var longitude = position.coords.longitude;

                // Set the initial zoom level based on the desired radius (e.g., 100km)
                var zoomLevel = getZoomLevelForRadius(100);

                var mapOptions = {
                    center: { lat: latitude, lng: longitude },
                    zoom: zoomLevel
                };

                map = new google.maps.Map(document.getElementById('map'), mapOptions);
                mapInitialized = true;
            });
        } else if (!navigator.geolocation) {
            alert("Geolocation is not supported by this browser.");
        }
    }

    function getZoomLevelForRadius(radius) {
        // Calculate the zoom level based on the desired radius
        // Adjust this calculation based on your specific requirements
        return Math.round(15 - Math.log(radius / 1000) / Math.LN2);
    }

    function getCurrentLocation() {
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(function (position) {
            var latitude = position.coords.latitude;
            var longitude = position.coords.longitude;

            // Set the latitude and longitude values in the hidden fields
            document.getElementById('latitude').value = latitude;
            document.getElementById('longitude').value = longitude;

            // Center the map to the current location
            map.setCenter({ lat: latitude, lng: longitude });

            // Add a marker at the current location
            var marker = new google.maps.Marker({
                position: { lat: latitude, lng: longitude },
                map: map,
                title: 'Your Location'
            });

            // Display latitude and longitude values
            displayLocationValues(latitude, longitude);
        });
    } else {
        alert("Geolocation is not supported by this browser.");
    }
}

    function displayLocationValues(latitude, longitude) {
        // You can use these values as needed, for example, log them to the console or display on the page
        console.log("Latitude: " + latitude + ", Longitude: " + longitude);
        alert("Latitude: " + latitude + ", Longitude: " + longitude);
    }

    // Initialize the map when the page loads
    window.addEventListener('load', initMap);
</script>
    <!-- JavaScript Libraries -->
   <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="lib/wow/wow.min.js"></script>
    <script src="lib/easing/easing.min.js"></script>
    <script src="lib/waypoints/waypoints.min.js"></script>
    <script src="lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="lib/counterup/counterup.min.js"></script>


    <!-- Your Custom JavaScript -->
    <script src="js/main.js"></script>
</body>

</html>