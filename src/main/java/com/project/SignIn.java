

package com.project;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/sigup")
@MultipartConfig(maxFileSize = 16177215)  
public class SignIn extends HttpServlet {
	
	public void init(ServletConfig config) throws ServletException {
		
	}

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		String fname=request.getParameter("firstname");
		String lname=request.getParameter("lastname");
		String email=request.getParameter("mail");
		String pass=request.getParameter("password");
		String cpass=request.getParameter("conpassword");
		String mobile=request.getParameter("mobile");
		String address=request.getParameter("address");
		String photo=request.getParameter("photo");
		String usertype=request.getParameter("usertype");
		out.println(photo);
		File file=new File(photo);
		FileInputStream fis=new FileInputStream(file);
		
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/finalproject","root","root");
			
			PreparedStatement checkStmt = conn.prepareStatement("select * from signup where username=?");
			checkStmt.setString(1, email);
			ResultSet resultSet=checkStmt.executeQuery();
			
			if(resultSet.next()) {
				out.println("Email already exists. please use a different email address.");
			}
			else
			{

				PreparedStatement pstmt=conn.prepareStatement("insert into signup(firstname,lastname,username,password,confirmpassword,mobile,address,photo,role) values(?,?,?,?,?,?,?,?,?)");
				pstmt.setString(1,fname);
				pstmt.setString(2,lname);
				pstmt.setString(3,email);
				pstmt.setString(4,pass);
				pstmt.setString(5,cpass);
				pstmt.setString(6, mobile);
				pstmt.setString(7,address);
				pstmt.setBinaryStream(8, fis,(int)file.length());
				pstmt.setString(9,usertype);
				int count=pstmt.executeUpdate();
				if(count>0) 
				{
					response.sendRedirect("home.jsp");
				}
				else
				{
					out.println("record not inserted");
				}   
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


