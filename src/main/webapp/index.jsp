<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Welcome to CouchBuzz</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/styles.css">
    <style>
        body {
            background-color: black;
            color: white;
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }

        main {
            text-align: center;
            padding-bottom: 40px;
        }

        .home-section {
            padding: 40px 20px 10px;
        }

        .features-title {
            font-size: 24px;
            color: white;
            margin-top: 40px;
            margin-bottom: 20px;
        }

        .features {
            display: flex;
            justify-content: center;
            gap: 60px;
            flex-wrap: wrap;
            padding: 0 20px;
        }

        .show-card {
            text-align: center;
            flex: 1 1 400px;
            max-width: 400px;
            
        }

        .show-card img {
            width: 400px;
            height: auto;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.4);
            transition: transform 0.3s ease;
        }

        .show-card img:hover {
            transform: scale(1.05);
        }

        .show-card h3 {
            margin: 10px 0 5px;
        }

        .show-card a {
            color: #F87A63;
            text-decoration: none;
            font-weight: bold;
        }

        .stars {
            color: #FFD700;
            margin: 5px 0;
            font-size: 18px;
        }

        footer {
            background: #222;
            padding: 10px;
            width: 100%;
            text-align: center;
            margin-top: 60px;
        }
    </style>
</head>
<body>

<!-- Navigation Bar -->
<nav>
    <div class="nav-left">
        <a href="index.jsp">
            <img src="assets/listrtitle.png" alt="couchbuzztitlevariant" class="logo">
        </a>
    </div>

    <div class="nav-right">
    
      <!--  Profile Icon --> <!-- tied into isLoggedIn later -->
             <a href="User.jsp"><img src="assets/user-icon.png" alt="User Icon" class="user-icon"></a>
        <a href="Login.jsp" class="sign-in-button">
            <img src="assets/couchbuzzsignin2.png" alt="Sign In">
        </a>
    </div>

    <form action="<%= request.getContextPath() %>/CouchBuzzServlet" method="get">
        <div class="search-container">
            <input type="text" id="searchQuery" name="searchQuery" placeholder="Search CouchBuzz">
            <button type="submit">
                <img src="assets/searchicon.png" alt="search">
            </button>
            <div class="search-suggestions">
                <p class="suggestion-title">Buzzing:</p>
                <p><a href="https://www.youtube.com/watch?v=zL19uMsnpSU" target="_blank" class="suggestion-link">Stranger Things Season 5</a></p>
                <p><a href="http://youtube.com/watch?v=kRPGPAnPNa8" target="_blank" class="suggestion-link">Reacher Season 3</a></p>
            </div>
        </div>
    </form>
</nav>

<!-- Main Content -->
<main>
    <section class="home-section">
        <h2>Welcome to CouchBuzz</h2>
        <p>A great place to review your favorite TV shows and see what others also have to say...</p>
    </section>

    <h2 class="features-title">Recently reviewed TV Shows</h2>
    <section class="features">

        <!-- Show 1 -->
        <div class="show-card">
          <a href="daredevil.jsp">  <img src="assets/prisonbreak.jpg" alt="Prison Break"> </a>

            <h3>Prison Break</h3>
            <a href="#">See reviews »</a>
            <p class="stars">★★★★☆</p>
            <p>80 people rated this show 4/5</p>
        </div>

        <!-- Show 2 -->
        <div class="show-card">
            <img src="assets/youngsheldon.jpg" alt="Young Sheldon">
            <h3>Young Sheldon</h3>
            <a href="#">See reviews »</a>
            <p class="stars">★★★★☆</p>
            <p>80 people rated this show 4/5</p>
        </div>

        <!-- Show 3 -->
        <div class="show-card">
            <img src="assets/suits.jpg" alt="Suits">
            <h3>Suits</h3>
            <a href="#">See reviews »</a>
            <p class="stars">★★★★☆</p>
            <p>80 people rated this show 4/5</p>
        </div>
    </section>
</main>

<!-- Footer -->
<footer>
    <p>&copy; 2025 CouchBuzz. All rights reserved.</p>
</footer>

<!-- Search Suggestions Script -->
<script>
    document.addEventListener("DOMContentLoaded", function () {
        const searchBox = document.getElementById("searchQuery");
        const searchSuggestions = document.querySelector(".search-suggestions");

        searchBox.addEventListener("focus", () => searchSuggestions.style.display = "block");

        searchBox.addEventListener("input", function () {
            searchSuggestions.style.display = searchBox.value.trim() !== "" ? "none" : "block";
        });

        document.addEventListener("click", function (e) {
            if (!searchBox.contains(e.target) && !searchSuggestions.contains(e.target)) {
                searchSuggestions.style.display = "none";
            }
        });
    });
</script>

</body>
</html>
