package com.couchbuzz.DataAccessObject;
import com.couchbuzz.Utility.DatabaseUtility;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.*;

import com.couchbuzz.DataModels.User;

public class UserDAO {
	
	
	public User getUserByUsername(String username) {
        User user = null;
        String query = "SELECT * FROM users WHERE username = ?";
        
        
        try (Connection conn = DatabaseUtility.getConnection();
                PreparedStatement stmt = conn.prepareStatement(query)) {

               stmt.setString(1, username);
               ResultSet rs = stmt.executeQuery();
               
               if (rs.next()) {
            	   
            	   
            	   
                   user = new User();
                   user.setID(rs.getInt("user_id"));
                   user.setUsername(rs.getString("username"));
                   user.setEmail(rs.getString("email"));
                   
                   
                   // MORE FIELDS GO HERE BRO
                  
               }

           } catch (SQLException e) {
               e.printStackTrace();
           }

           return user;
       }
   }