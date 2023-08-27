package com.project;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Base64;

import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/searchservlet")
public class SearchServlet extends HttpServlet {
	
	public void init(ServletConfig config) throws ServletException 
	{
		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String item=request.getParameter("searchedname");
		PrintWriter out=response.getWriter();
		
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/finalproject","root","root");
			PreparedStatement pstmt=conn.prepareStatement("select * from products where name=?");
			pstmt.setString(1, item);
			ResultSet rs=pstmt.executeQuery();
			while(rs.next())
			{
				String pdescription=rs.getString("description");
				String pprice=rs.getString("cost");
				byte[] img=rs.getBytes("image");
				String base64img=Base64.getEncoder().encodeToString(img);
				out.println("<div>");
				out.println("<img src="data:image/jpeg;base64,")
			}
			
		}
		catch(Exception e)
		{
			out.println("e");
		}
		
	}

	
	public void destroy() 
	{
		
	}

	

}
