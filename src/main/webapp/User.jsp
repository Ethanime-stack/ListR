<%@ page language="java" contentType="text/html; charset=UTF-8" import="com.couchbuzz.DataModels.User" 
    pageEncoding="UTF-8"%>
    
    
    <!--  Login verificaiton -->
    <% User user = (User) request.getAttribute("user");
    Boolean isOwner = (Boolean) request.getAttribute("isOwner");
    %>
    
    
    
    
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/assets/styles.css">
</head>
<body>







<!--  NAVBAR  -->
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
    
<!--  NAVBAR  -->




<!--  Profile Page so far -->



<div class="user-profile">

<a href="UserServlet?username=<%= session.getAttribute("username") %>">
    My Public Profile
</a>

<% if (user != null) { %>
    <h2><%= user.getUsername() %>'s Profile</h2>
    <p>Email: <%= isOwner != null && isOwner ? user.getEmail() : "Hidden" %></p>
<% } else { %>
    <p>User not found.</p>
<% } %>


<% if (isOwner != null && isOwner) {%>
<a href="EditProfile.jsp">Edit Profile (WIP)</a>
<% } %>
</div>






</body>
</html>