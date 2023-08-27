package com.project;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/userlogin")
public class UserLogin extends HttpServlet {
	
	public void init(ServletConfig config) throws ServletException {
		
	}
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email=request.getParameter("mail");
		String password=request.getParameter("password");
		PrintWriter out=response.getWriter();
		
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn=DriverManager.getConnection("jdbc:mysql://localhost/finalproject","root","root");
			PreparedStatement pstmt=conn.prepareStatement("select * from signup where username=? and password=?");
			pstmt.setString(1,email);
		    pstmt.setString(2,password);
		    ResultSet rs=pstmt.executeQuery();
		    if(rs.next())
		    {
		    	String mail = rs.getString("username");
		    	request.setAttribute("email", mail);
		    	request.getRequestDispatcher("userhome.jsp").forward(request,response);
		    	
		    }
		    else
		    {
		    	out.println("<h3>please check the username and password</h3>");
		    }
		}
		catch(Exception e)
		{
			out.println(e);
		}
		
		
		
		
	}

	
	public void destroy() {
		
	}

	

}
