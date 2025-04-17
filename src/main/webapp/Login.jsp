<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Sign-in</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/styles.css">
</head>
<body>
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
    
    
    <!--  Login Form  -->
<form id="Login" action="Login" method="POST" class="login">
    <label for="username">Username:</label>
    <input type="text" id="username" name="username"
    placeholder="Enter your Username" required>
    
    <label for="password">Password:</label>
    <input type="password" id="password" name="password"
    placeholder="Enter your Password" required>
    
    <button type="submit" >Submit</button>
    
    <a href="#" onclick="openForm();">Forgot your Password? </a>
    
    </form>
    
    <!--  Forgot password popup  -->
    
    <div id="forgotpassword" class="popup">
    <h3> Reset Password </h3>
    <p> Enter your email to reset your password</p>
    <input type="email" id="email" placeholder="Enter your email" required>
    <button onclick="">Submit</button>                   <!--  Note for future: no onclick -->
    <button class="close-btn" onclick="closeForm()">Close</button>   
    </div>
    
    
    
   <a href="Register.jsp" class="SIGNUP"> SIGN UP </a>
    
  
    
    <!--  Open/Close popup script and login verification !--> 
 
    
    
    <script>
    function openForm() {
    	document.getElementById("forgotpassword").style.display = "block";
    }
    function closeForm() {
    	document.getElementById("forgotpassword").style.display = "none";
    }
   
    

   
    document.getElementById("Login").addEventListener("submit", function(event) {
        event.preventDefault();
        
        const form = this;
        fetch(form.action, {
            method: "POST",
            headers: {
                "Content-Type": "application/x-www-form-urlencoded",
            },
            body: new URLSearchParams(new FormData(form))
        })
        .then(response => response.text())
        .then(result => {
            if (result === "success") {
                alert("Verified!")
            } else {
                alert("Invalid credentials");
            }
        })
        .catch(error => {
            console.error("Error:", error);
            alert("Login failed");
        });
    });
    function openPopup(message) {   alert(message); }
    
    </script>
    <!--  Yea so this isn't really necessary anymore as I ditched the FormData route. HOWEVER- the alert popups are a lot more clean then the Servlet way. so ima leave it -->
    
    
    
</body>
</html>