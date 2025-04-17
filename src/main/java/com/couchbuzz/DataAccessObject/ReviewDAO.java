package com.couchbuzz.DataAccessObject;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.couchbuzz.DataModels.Review;
import com.couchbuzz.Utility.DatabaseUtility;

public class ReviewDAO {

	
	
	
	
	
	// First: Method to get Reviews/Ratings
	public List<Review> getReviewsAndRatings(int episodeId) {
		List<Review> reviews = new ArrayList<>();
		
		// Same thing as above
		String query = "SELECT r.review_text, u.username, ra.rating FROM Reviews r JOIN Users u ON r.user_id = u.user_id JOIN Ratings ra ON r.episode_id = ra.episode_id WHERE r.episode_id = ?";
		
		// DB connect
		try (Connection conn = DatabaseUtility.getConnection()){
			PreparedStatement statement = conn.prepareStatement(query);
			statement.setInt(1, episodeId);
			ResultSet resultSet = statement.executeQuery();
			
			// Loop to continous grab all the matching reviews 
			while (resultSet.next()) {
				String reviewText = resultSet.getString("review_text");
				String username = resultSet.getString("username");
				int rating = resultSet.getInt("rating"); 
				
				reviews.add(new Review(username, reviewText, rating));
			}
		} catch (SQLException e) { 
			System.err.println("Error fetching reviews for that epsisode");
			e.printStackTrace();
		} return reviews;  
	}
	
	
	
	
	
	// Second: Method to ADD review and rating
	public void addReviewAndRating(String username, int episodeId, String reviewText, int rating) { 
		//insert review
		String insertReviewQuery = "INSERT INTO Reviews (user_id, episode_id, review_text) VALUES ((SELECT user_id FROM Users WHERE username = ?), ?, ?)";
		// insert rating 
		String insertRatingQuery = "INSERT INTO Ratings (user_id, episode_id, rating) VALUES ((SELECT user_id FROM Users WHERE username = ?), ?, ?)";
		// connect DB
		try (Connection conn = DatabaseUtility.getConnection()) {
			
			// Executing query to insert review 
			PreparedStatement reviewStatement = conn.prepareStatement(insertReviewQuery);
			reviewStatement.setString(1, username);
			reviewStatement.setInt(2, episodeId);
			reviewStatement.setString(3, reviewText);
			reviewStatement.executeUpdate();
			
			// Executing query to insert rating
			PreparedStatement ratingStatement = conn.prepareStatement(insertRatingQuery);
			ratingStatement.setString(1, username);
			ratingStatement.setInt(2, episodeId);
			ratingStatement.setInt(3, rating);
			ratingStatement.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	
	
	
}
