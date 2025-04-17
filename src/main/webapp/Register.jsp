<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-SgOJa3DmI69IUzQ2PVdRZhwQ+dy64/BUtbMJw1MZ8t5HZApcHrRKUc4W0kG879m7" crossorigin="anonymous" />
            <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/styles.css">
    <title>CouchBuzz | User Registration</title>
</head>

<body class="bg-dark">

 <nav> 
        <div class="nav-left">
        
        <!--  Title  -->
           <a href="index.jsp"><img src="assets/listrtitle.png" alt="couchbuzztitlevariant" class="logo"> </a> 
        </div>     
             <div class="nav-right">   
             
             <!--  Profile Icon --> <!-- tied into isLoggedIn later -->
             <a href="User.jsp"><img src="assets/user-icon.png" alt="User Icon" class="user-icon"></a>
             
             
             <!--  Login Redirect   -->
<% Boolean isLoggedIn = (Boolean) request.getAttribute("isLoggedIn");
		if (isLoggedIn != null && isLoggedIn) { %>
				<!--  add logout later  -->
		<% } else { %>
		<a href="Login.jsp" class="sign-in-button">
		<img src="assets/couchbuzzsignin2.png" alt="Sign In"> </a>
		<% } %>
        </div>
                     <!--  Search Bar  -->
          <form action="<%= request.getContextPath() %>/CouchBuzzServlet" method="get">
                <div class="search-container">
                    <input type="text" id="searchQuery" name="searchQuery" placeholder="Search CouchBuzz">
                                        <button type="submit">  <img src="assets/searchicon.png" alt="search">   </button>
                    <div class="search-suggestions">
                        <p class="suggestion-title">Buzzing:</p>
                        <p><a href="https://www.youtube.com/watch?v=zL19uMsnpSU" target="_blank" class="suggestion-link">Stranger Things Season 5</a></p>
                        <p><a href="http://youtube.com/watch?v=kRPGPAnPNa8" target="_blank" class="suggestion-link">Reacher Season 3</a></p>
                  </div>
                </div>
            </form>
    </nav>
    

    <div class="container py-5">
        <div class="row justify-content-center">
            <div class="col-md-7 col-lg-5">
                <!-- Logo and Title -->
                <div class="text-center mb-4">
                    <!-- Replace the src below with your actual logo filename -->
                    <img src="assets/couchbuzztitle2.png" alt="CouchBuzz Logo" class="img-fluid mb-3"
                        style="max-width: 220px;" />
                    <h1 class="h3 mb-3 fw-bold text-light">Register Your Account</h1>
                    <p class="text-danger mb-0">
                        Join CouchBuzz and stay updated with the latest buzz!
                    </p>
                </div>

                <!-- Registration Form Card -->
                <div class="card shadow-sm border-0">
                    <div class="card-body p-4">
                        <!-- Registration Form -->
                        <form>
                            <!-- First Name -->
                            <div class="mb-3">
                                <label for="firstName" class="form-label fw-semibold">
                                    First Name
                                </label>
                                <input type="text" class="form-control" id="firstName"
                                    placeholder="Enter your first name" />
                            </div>

                            <!-- Last Name -->
                            <div class="mb-3">
                                <label for="lastName" class="form-label fw-semibold">
                                    Last Name
                                </label>
                                <input type="text" class="form-control" id="lastName"
                                    placeholder="Enter your last name" />
                            </div>

                            <!-- Username -->
                            <div class="mb-3">
                                <label for="username" class="form-label fw-semibold">
                                    Username
                                </label>
                                <input type="text" class="form-control" id="username" placeholder="Choose a username" />
                            </div>

                            <!-- Email -->
                            <div class="mb-3">
                                <label for="email" class="form-label fw-semibold">
                                    Email Address
                                </label>
                                <input type="email" class="form-control" id="email" placeholder="Enter your email" />
                            </div>

                            <!-- Password -->
                            <div class="mb-3">
                                <label for="password1" class="form-label fw-semibold">
                                    Password
                                </label>
                                <input type="password" class="form-control" id="password1"
                                    placeholder="Enter a secure password" />
                            </div>

                            <!-- Confirm Password -->
                            <div class="mb-3">
                                <label for="password2" class="form-label fw-semibold">
                                    Confirm Password
                                </label>
                                <input type="password" class="form-control" id="password2"
                                    placeholder="Re-enter your password" />
                            </div>

                            <!-- Country -->
                            <div class="mb-3">
                                <label for="country" class="form-label fw-semibold">
                                    Country
                                </label>
                                <select class="form-select" id="country">
                                    <option selected disabled value="">Select your country</option>
                                    <option value="usa">United States</option>
                                    <option value="uk">United Kingdom</option>
                                    <option value="ca">Canada</option>
                                    <option value="au">Australia</option>
                                    <!-- Add more countries as needed -->
                                </select>
                            </div>

                            <!-- Submit Button -->
                            <div class="d-grid">
                                <button type="submit" class="btn btn-danger fw-semibold">
                                    Register
                                </button>
                            </div>
                        </form>
                        <!-- End of Registration Form -->
                    </div>
                </div>
                <!-- End of Card -->

                <!-- Extra Link or Info (Optional) -->
                <div class="text-center text-white mt-4">
                    <small class="text-muted">
                        <span class="text-white">Already have an account?</span>
                        <a href="Login.jsp" class="link-warning fw-semibold">Sign In</a>
                    </small>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap 5 JS (with Popper) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-k6d4wzSIapyDyv1kpU366/PK5hCdSbCRGRCMv+eplOQJWyd1fbcAu9OCUj5zNLiq"
        crossorigin="anonymous"></script>
</body>

</html>