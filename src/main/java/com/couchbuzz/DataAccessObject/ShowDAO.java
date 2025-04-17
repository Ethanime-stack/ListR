package com.couchbuzz.DataAccessObject;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.couchbuzz.DataModels.Show;
import com.couchbuzz.Utility.DatabaseUtility;


public class ShowDAO {

	public Show getShowDetails(String showName) { 
		Show show = null; 
		String query = "SELECT title, season, cover_url, about FROM Shows WHERE title like ?"; 
		
		// Connect to the DB
		try (Connection conn = DatabaseUtility.getConnection()) { 
			PreparedStatement statement = conn.prepareStatement(query);
			statement.setString(1, "%" + showName + "%");
			ResultSet resultSet = statement.executeQuery();
			
			// Details to grab once found
		if (resultSet.next()) {
			String title = resultSet.getString("title");
			String season = resultSet.getString("season");
			String coverUrl = resultSet.getString("cover_url");
			String about = resultSet.getString("about");
			
			show = new Show(title, season, coverUrl, about);
		}
		} 
		catch (SQLException e) {
			e.printStackTrace();
		} return show; // Returns the show object at the end 
	}
	
	
	
	
	
	
}
