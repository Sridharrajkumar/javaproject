<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="jakarta.servlet.*" %>
<%@page import="java.util.*" %>

<%
		String productname=respnse.getParameter("");
		String productdescription="";
		String productprice="";
		byte[] productimg=null;

%>