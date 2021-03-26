<%-- 
    Document   : customeradmin
    Created on : Mar 8, 2021, 9:28:02 AM
    Author     : user
--%>


<%@page import="g.GetCon1"%>
<%@page import="g.verifyLogin1"%>
<%@page import="g.GetCon"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello Admin Welcome!</h1>
        <table width="960" border="0" cellspacing="10" cellpadding="0" align="center">

<%if(request.getAttribute("deleted")!=null)
			{
			out.print("<table>");
			out.print("<div width='200' align='left'>");
			out.print("<font color='blue'><font size='10'>"+request.getAttribute("deleted"));
			
			out.print("</div>"); 
			out.print("<table>");
			}
			
			 %>
        </table>
      <a href="LogoutServlet"><h4 style="color:rgb(456,0,76)">Logout</h4></a>
<% 
%>
<table width="300" border="0" cellspacing="10" cellpadding="0" align="center"><%
        //String num=request.getParameter("accountno");
     //String num1=request.getParameter("amount");
		//int accountno=Integer.parseInt(num);
                //int amount=Integer.parseInt(num1);
        //String username=request.getParameter("username");
	//String password=request.getParameter("password");
               
	   // boolean status=verifyLogin1.checkLogin(accountno,username,password);

      	try {
			//Connection con=GetCon1.getCon1();
                        Class.forName("org.apache.derby.jdbc.ClientDriver");
		//con=DriverManager.getConnection(DBIntializer.CON_STRING,DBIntializer.USERNAME,DBIntializer.PASSWORD);
            Connection con=DriverManager.getConnection("jdbc:derby://localhost:1527/CustDatabase","admin1","admin1");
                        
			//PreparedStatement ps=con.prepareStatement("Select * from customer");
			//ps.setString(1,uname);
			//ResultSet rs=ps.executeQuery();
			//out.print("<table>");
			
			PreparedStatement ps=con.prepareStatement("Select * from customer1");
            //ps.setInt(1,accountno);
			ResultSet rs=ps.executeQuery();
			out.print("<td><a href='Deletecustomer.jsp'>Delete</a></td>");
			out.print("<td><a href='Acceptcustomer.jsp'>Accept</a></td>");
			//out.print("<table align='left' width='300' border='0' cellspacing='10' cellpadding='0'>");
			out.print("<tr><th>accountno</th><th>username</th><th>password</th><th>amount</th><th>address</th><th>Phoneno</th></tr>");
			while(rs.next()){
				//int id=rs.getInt(1);
				//session.setAttribute("id",id);
                            int accountno1=rs.getInt(1);
				session.setAttribute("accountno",accountno1);
				out.print("<tr>");
				out.print("<td>" + rs.getInt(1) + "</td>");
				out.print("<td>" + rs.getString(2) + "</td>");
				out.print("<td>" + rs.getString(3) + "</td>");
				out.print("<td>" + rs.getInt(5) + "</td>");
				out.print("<td>" + rs.getString(6) + "</td>");
				out.print("<td>" + rs.getString(7) + "</td>");
				//out.print("<td>" + rs.getString(4) + "</td>");
				//out.print("<td>" DeleteServlet.Del`"</td>");
				out.print("</tr>");
			
			
			}
			//out.print("</table>");
			//out.print("<table>");
			
			//out.print("</table>");
		
			} catch (SQLException e) {
			e.printStackTrace();
		}
	
		%></table><%
%>

<%@ page import="java.sql.*"%>
<%@ page import="java.io.*" %>
<%@ page import="javax.servlet.*"%>
    </body>
</html>
