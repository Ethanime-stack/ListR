package com.couchbuzz.DataModels;

public class Review {
	// Review attributes 
	private String username; 
	private String reviewText;
	private int rating; 
	
	// constructor 
	public Review(String username, String reviewText, int rating) {
		this.username = username;
		this.reviewText= reviewText; 
		this.rating = rating; 
	}
	// setters getters
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getReviewText() {
		return reviewText;
	}
	public void setReviewText(String reviewText) {
		this.reviewText = reviewText; 
	}
	public int getRating() {
		return rating;
	}
	public void setRating(int rating) {
		this.rating = rating;
	}
	
	@Override
	public String toString() {
		return "Review [username=" + username + ", reviewText=" + reviewText + ", rating=" + rating + "]";
	}
	


		
}
