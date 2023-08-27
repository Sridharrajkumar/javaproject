

package com.project;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/logout")
public class Logout extends HttpServlet {
	
	public void init(ServletConfig config) throws ServletException {
		
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		doPost(request, response);
    }
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session=request.getSession();
		 response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); 
		    response.setHeader("Pragma", "no-cache");
		    response.setDateHeader("Expires", 0); 
		    
		    request.setAttribute("status", "LogOut successfully");
		    RequestDispatcher rd = request.getRequestDispatcher("home.jsp");
		    rd.forward(request, response);
		
	}

	
	public void destroy() {
		
	}

	

}


