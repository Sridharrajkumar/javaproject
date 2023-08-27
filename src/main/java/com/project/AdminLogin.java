package com.project;



import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/login")
public class AdminLogin extends HttpServlet {
	
	public void init(ServletConfig config) throws ServletException 
	{
		
	}
	
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
		String username= request.getParameter("mail");
		String password = request.getParameter("password");
		String role="admin";
		PrintWriter out=response.getWriter();
		try 
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/finalproject","root","root");
			Statement st=conn.createStatement();
			ResultSet rs= st.executeQuery("select * from signup where username='"+username+"' and password='"+password+"' and role='"+role+"'");
			if(rs.next())
			{
				response.sendRedirect("adminhome.jsp");
			}
			else
			{
				out.println("please check the password and username admin");
			}
			
		} 
		catch (Exception e) 
		{	
			out.println(e);
		}
	}

	public void destroy() 
	{
		
	}
}
