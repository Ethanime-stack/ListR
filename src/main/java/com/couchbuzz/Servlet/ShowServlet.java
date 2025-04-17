package com.couchbuzz.Servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.couchbuzz.DataAccessObject.ShowDAO;
import com.couchbuzz.DataModels.Show;



@WebServlet("/ShowServlet")
public class ShowServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private ShowDAO showdao = new ShowDAO();

       
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	
        // Search Query + Show Details
        String searchQuery = request.getParameter("searchQuery");
        Show show = showdao.getShowDetails(searchQuery);
        
        

        //  Data Filtering 
        if (show != null) { 
        	request.setAttribute("showName", show.getTitle());
        } else {
        	request.setAttribute("error", "Sorry that searched show isn't available yet! "); 
        }
        
        
       // Forward to static hardcoded JSP page temp. 
        request.getRequestDispatcher("daredevil.jsp").forward(request, response); 
}
}
