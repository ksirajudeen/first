<%-- 
    Document   : adminprocess
    Created on : Mar 5, 2021, 9:13:03 AM
    Author     : user
--%>

<%@page import="g.GetCon1"%>
<%@page import="g.verifyLogin2"%>
<%@page import="g.GetCon"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        				   <%-- <table >--%>	
	
    	<% 
%>
<table width="300" border="0" cellspacing="10" cellpadding="0" align="center"><%
        
        String username=request.getParameter("username");
		String password=request.getParameter("password");
	    boolean status=verifyLogin2.checkLogin(username,password);
		
		try {
		if(status==true){
			out.print("Welcome    " + username);
		    //out.print("<table>");
			out.println("<br><br><a href='customeradmin.jsp'> Go To customer Administration </a><br>");
			out.println("<br><a href='ordersadmin.jsp'> Go To Orders Administration </a><br>");
		   // out.print("</table>");
			
			Connection con=GetCon1.getCon1();
			PreparedStatement ps=con.prepareStatement("");
           			
		}
		else{
			out.print("Please check your username and Password");
			request.setAttribute("aa","Please check your username and Password");
			%>
			<jsp:forward page="admin.jsp"></jsp:forward> 
			<% 
			}
		 }catch (SQLException e) {
			e.printStackTrace();
		}
		
		//}
		
			//}
			%></table><%
%>
    	
    	
		<%-- </table>--%>


<%@ page import="java.sql.*"%>
<%@ page import="java.io.*" %>
<%@ page import="javax.servlet.*"%>
    </body>
</html>
