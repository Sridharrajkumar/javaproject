package com.project;




import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/addproject")
public class AddProject extends HttpServlet 
{
	
	public void init(ServletConfig config) throws ServletException 
	{
		
	}


	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		String id=request.getParameter("productId");
		String name=request.getParameter("productName");
		String cost=request.getParameter("productCost");
		String descriptions=request.getParameter("productDescription");
		String image=request.getParameter("productImage");
		File file=new File(image);
		FileInputStream fis=new FileInputStream(file);
		
		try 
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/finalproject","root","root");
			PreparedStatement pstmt=conn.prepareStatement("insert into products(id,name,cost,image,description) values(?,?,?,?,?)");
			pstmt.setString(1,id);
			pstmt.setString(2,name);
			pstmt.setString(3,cost);
			pstmt.setBinaryStream(4,fis,(int)file.length());
			pstmt.setString(5,descriptions);
			int count=pstmt.executeUpdate();
			if(count>0)
			{
				response.sendRedirect("adminhome.jsp");
				
			}
			else
			{
				out.println("product is not added");
			}
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
			
	}
	
	public void destroy() 
	{
		
	}

}
