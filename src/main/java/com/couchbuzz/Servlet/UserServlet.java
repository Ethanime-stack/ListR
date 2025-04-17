package com.couchbuzz.Servlet;
import com.couchbuzz.DataAccessObject.*;
import com.couchbuzz.DataModels.*;
import com.couchbuzz.Utility.*;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class User
 */
@WebServlet("/UserServlet")
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String username = request.getParameter("username");
		
		UserDAO userDAO = new UserDAO();
		User user = userDAO.getUserByUsername(username);
		
		if (user != null) {
			request.setAttribute("user", user);
			
			
			// Checking to verify if we are logged in
			
			HttpSession session = request.getSession(false);
			String loggedInUser = (session != null) ? (String) session.getAttribute("username") : null;
			request.setAttribute("isOwner", username.equals(loggedInUser));
		}
			
			
		request.getRequestDispatcher("User.jsp").forward(request, response);
			
		
		
		
		// If username = missing// redirect to login
		if (username == null || username.isEmpty()) {
		    HttpSession session = request.getSession(false);
		    if (session != null && session.getAttribute("username") != null) {
		        username = (String) session.getAttribute("username");
		        response.sendRedirect("UserServlet?username=" + username);
		        return;
		    } else {
		        response.sendRedirect("login.jsp"); // or home page
		        return;
		    }
		}
		
		
		
		
	
	}
}

