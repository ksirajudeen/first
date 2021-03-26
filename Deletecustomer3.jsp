<%-- 
    Document   : Deletecustomer3
    Created on : Mar 8, 2021, 11:00:47 AM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello Admin Welcome!</h1>
        
      <a href="LogoutServlet"><h4 style="color:rgb(456,0,76)">Logout</h4></a>
<% 
%>
<table>
    <%
        String num=request.getParameter("accountno");
		int id=Integer.parseInt(num);
      	try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");		
      Connection con=DriverManager.getConnection("jdbc:derby://localhost:1527/CustDatabase","admin1","admin1");			
	//PreparedStatement ps=con.prepareStatement("delete from customer where accountno = '"+id+"' ");
        Statement stmt = con.createStatement();
        String query = "DELETE FROM customer1 WHERE accountno = "+id+" ";
        int num1 = stmt.executeUpdate(query);
        out.print("your Details has been deleted");
                        out.print("<td><a href='customeradmin.jsp'>Go Back TO Employer Login</a></td>");
        //out.println("Number of records deleted are: "+num1);
			//ps.executeUpdate();
                        //out.print("your Details has been deleted");		
			} catch (SQLException e) {
			e.printStackTrace();
		}
	
		%>
</table>
<%
%>

<%@ page import="java.sql.*"%>
<%@ page import="java.io.*" %>
<%@ page import="javax.servlet.*"%>
    </body>
</html>
