<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Prison Break</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/styles.css">
</head>
<body>

    <nav> 
        <div class="nav-left">
                     <!--  Temp Logo   -->
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
 <h2 id="showTitle"><%= request.getAttribute("showName") != null ? request.getAttribute("showName").toString() : "Prison Break" %></h2>
    <h3 id="seasonNumber"><%= request.getAttribute("season") != null ? request.getAttribute("season").toString() : "Season 1" %></h3>

    <p id="description">
        "Yes they will have to breakout of a prison every season"
    </p>
    <div class="review-section">
        <h3>Leave a Review:</h3>
        <form id="reviewForm" action="<%= request.getContextPath() %>/CouchBuzzServlet" method="post">
            <textarea name="reviewText" placeholder="Your Buzzing Review"></textarea>
        

        <div id="rating-container">
            <div id="star-rating">
                <span class="star" data-value="1">&#9733;</span>
                <span class="star" data-value="2">&#9733;</span>
                <span class="star" data-value="3">&#9733;</span>
                <span class="star" data-value="4">&#9733;</span>
                <span class="star" data-value="5">&#9733;</span>
            </div>
        </div>

        <div class="submit-container">
            <button type="submit" >Submit</button>
        </div>
        </form>
    </div>

    <h3>Recent Reviews:</h3>
    <div class="reviews">
        <p>
            <strong>Ethan</strong>: 
            <span class="review-stars">★★★★☆</span> - "Worth the wait, the premiere was stellar."
        </p>
        <p>
            <strong>Abiola</strong>: 
            <span class="review-stars">★★★★★</span> - "This new season is lit!"
        </p>
    </div>

    <footer>
        <p>&copy; 2025 CouchBuzz. All rights reserved</p>
    </footer>

    <script>
        document.addEventListener("DOMContentLoaded", () => {
            const searchBox = document.getElementById("searchQuery");
            const searchSuggestions = document.querySelector(".search-suggestions");

            searchBox.addEventListener("focus", () => searchSuggestions.style.display = "block");
            searchBox.addEventListener("input", () => searchSuggestions.style.display = searchBox.value.trim() ? "none" : "block");

            document.addEventListener("click", (e) => {
                if (!searchBox.contains(e.target) && !searchSuggestions.contains(e.target)) {
                    searchSuggestions.style.display = "none";
                }
            });

            const stars = document.querySelectorAll('.star');
            const ratingInput = document.createElement("input");
            ratingInput.type = "hidden";
            ratingInput.name = "rating";
            document.getElementById("reviewForm").appendChild(ratingInput);

            let selectedRating = 0;

            stars.forEach(star => {
                star.addEventListener('mouseover', () => highlight(star.dataset.value));
                star.addEventListener('click', () => selectRating(star.dataset.value));
                star.addEventListener('mouseout', () => highlight(selectedRating));
            });

            function highlight(rating) {
                stars.forEach(star => star.classList.toggle('selected', star.dataset.value <= rating));
            }

            function selectRating(rating) {
                selectedRating = rating;
                ratingInput.value = rating;
                highlight(rating);
            }
        });
    </script>

</body>
</html>
