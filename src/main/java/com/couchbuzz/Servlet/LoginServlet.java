package com.couchbuzz.Servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// import the Encrypt 
import com.couchbuzz.Utility.*;


@WebServlet("/LoginServlet")

// Temp Hardcoded Username + Password (Still Encrypting) 
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String HARDCODE_USERNAME = "DemoAccount";
	private static final String HARDCODE_PASS = "$2a$12$vdOk3rvfWUVo9rCqX/xKP.Rs1MqhxfJiNCd6ZeRAusoyPMApMqRdG"; // Raw Hash
	
	@Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
		try {
    	String username = request.getParameter("username");
        String password = request.getParameter("password");
        
        response.setContentType("text/plain");
        response.setCharacterEncoding("UTF-8");
        
        // DB validation in the future
        if (HARDCODE_USERNAME.equals(username) && 
            PasswordEncryption.checkPassword(password, HARDCODE_PASS)) {
        	
        	// User session on success
        	  HttpSession session = request.getSession();
              session.setAttribute("username", username);
  
              response.getWriter().write("success");
             } else {
            response.getWriter().write("error");
        }
    } catch (Exception e) {
    	e.printStackTrace();
    	response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Login failed due to server issue");
    }
	}
}

    