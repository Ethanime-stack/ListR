package com.couchbuzz.Servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.couchbuzz.DataAccessObject.ReviewDAO;
import com.couchbuzz.DataModels.Review;

/**
 * Servlet implementation class ReviewServlet
 */
@WebServlet("/ReviewServlet")
public class ReviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private ReviewDAO reviewdao = new ReviewDAO();
    
    
    
    
    // -> doGet in this scenario will retrieve and display reviews 
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	
    	try {
    	  //Retrieve episodeID
    	  String episodeIdParam = request.getParameter("episodeId");
          int episodeId = (episodeIdParam != null) ? Integer.parseInt(episodeIdParam) : 1;
          
          //Retrieve Reviews
          List<Review> reviews = reviewdao.getReviewsAndRatings(episodeId);
          //Get Reviews
          request.setAttribute("reviews", reviews);
          //Request toJSP page so reviews get rendered in
          request.getRequestDispatcher("daredevil.jsp").forward(request, response);

    } catch (Exception e) {
    	e.printStackTrace();
    	response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error loading reviews");
    }
    }
    
    
    // -> doPost in this scenario will submit a new review/rating
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    	// Retrieve the inputs
        String reviewText = request.getParameter("reviewText");
        int rating = Integer.parseInt(request.getParameter("rating"));
        int episodeId = Integer.parseInt(request.getParameter("episodeId")); 
        // Retrieve User (currently hardcoded) 
        String username = "Buzzer"; 
         
        // Adding to DB via DAO
        reviewdao.addReviewAndRating(username, episodeId, reviewText, rating);

  
        //Redirect back to ShowServlet. 
        response.sendRedirect("Showservlet?searchQuery=" + request.getParameter("searchQuery") + "&episodeId=" + episodeId); 
    }
}
