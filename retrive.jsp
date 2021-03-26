<%-- 
    Document   : retrive
    Created on : Mar 11, 2021, 7:44:26 AM
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
        <h1>Hello World!</h1>
        
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
			
			PreparedStatement ps=con.prepareStatement("Select * from employee");
            //ps.setInt(1,accountno);
			ResultSet rs=ps.executeQuery();
			//out.print("<table align='left' width='300' border='0' cellspacing='10' cellpadding='0'>");
			out.print("<tr><th>name</th><th>image</th></tr>");
			while(rs.next()){
				//int id=rs.getInt(1);
				//session.setAttribute("id",id);
                            //int accountno1=rs.getInt(1);
				//session.setAttribute("accountno",accountno1);
				out.print("<tr>");
				out.print("<td>" + rs.getInt(1) + "</td>");
				out.print("<td>" + rs.getBlob(2) + "</td>");				
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
