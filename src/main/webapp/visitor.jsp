<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="jakarta.servlet.*" %>
<%@ page import="java.util.*" %>
 
 
 <html>
    <head>
        <title>visitor page</title>
        <link rel="stylesheet" href="visitor.css">
    </head>
    <body style="text-align:center">
       
        <h1>Visitors List</h1>
        <div class="visitoritem">
             <%

						   try{
						       Class.forName("com.mysql.cj.jdbc.Driver");
						       Connection conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/finalproject", "root", "root");
						       PreparedStatement pstmt=conn.prepareStatement("select * from signup");
						       ResultSet rs=pstmt.executeQuery();
						       int visitorid=0;
						       while(rs.next())
						       {
						          String firstname=rs.getString("firstname");
						          String lastname=rs.getString("lastname");
						          String mobile=rs.getString("mobile");
						          String username=rs.getString("username");
						          byte[] img=rs.getBytes("photo");
						          String base64img=Base64.getEncoder().encodeToString(img);
						          visitorid++;

						          
						       

              %>
                              <div class="visitorcard">
                                      <img src="data:image/jpeg;base64,<%=base64img%>" alt=<%=lastname%> class="visitorimg" onClick="displayInfo(<%=visitorid%>)">
                                      <h3 class="visitorname"><%=firstname %>  <%=lastname %></h3>
	                                  <div id="info-<%=visitorid%>" class="visiorsdetail" style="display:none;">
	                                      <h4 class="visitormobile"><%=mobile %></h4>
	                                      <h4 class="visitoremail"><%=username %></h4>
                                      </div>
                                      
                              </div>
                               
              <%
						       }
						       rs.close();
						       pstmt.close();
						       conn.close();
						   }
                           catch(Exception e)
                           {
                        	   out.println(e);
                           }
              %>
              </div>  
              <script>
                  const displayInfo= (visitorid) =>{
                	  var info=document.getElementById('info-'+ visitorid);
                	  info.style.display= info.style.display==='none' ? 'block' : 'none';
                  }
              </script>      
        
    </body>
 </html>

