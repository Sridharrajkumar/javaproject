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

@WebServlet("/editproduct")
public class EditProduct extends HttpServlet 
{
	
	public void init(ServletConfig config) throws ServletException 
	{
		
	}
	
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
    	PrintWriter out=response.getWriter();
    	String id=request.getParameter("productId");
    	String name=request.getParameter("productName");
    	String description=request.getParameter("productDesc");
    	String price=request.getParameter("productPrice");
    	String photo=request.getParameter("productImg");
    	File file=new File(photo);
		FileInputStream fis=new FileInputStream(file);
		
		
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/finalproject","root","root");
			PreparedStatement pstmt=conn.prepareStatement("update products set name=?,cost=?,image=?,description=? where id=?");
			pstmt.setString(1, name);
			pstmt.setString(2, price);
			pstmt.setBinaryStream(3,fis,(int)file.length());
			pstmt.setString(4, description);
			pstmt.setString(5, id);
			int rowupdated=pstmt.executeUpdate();
			if(rowupdated>0)
			{
				response.sendRedirect("adminhome.jsp");
		    }
			else
			{
				out.println("product is not updated");
			}
			
		}
		catch(Exception e)
		{
			out.println(e);
		}
		
	}

	
	public void destroy() 
	{
		
	}

	
	

}
