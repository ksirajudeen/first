<%-- 
    Document   : Deletecustomer1
    Created on : Mar 7, 2021, 7:52:44 PM
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
          			   <%-- <table cellspacing="10" cellpadding="8">	--%>
  			   
	  	<% 
%>
<table><%
         String ph=request.getParameter("accountno");
        
		 //int id=Double.parseDouble(ph);
		
         int  id=Integer.parseInt(ph);
      		Connection con=GetCon.getCon();
		
		   
		 boolean status=VerifyLoginforcustadmin1.checkLogin(id);
			if(status==true){
			     				   
		try {
			PreparedStatement ps=con.prepareStatement("delete  from customer where accountno = '"+id+"' ");
			
			ResultSet rs=ps.executeQuery();
           			
		    if(rs.next()){          			
	        out.print("your Details has been deleted");
			request.setAttribute("deleted","your Details has been deleted");
			%>			
			<jsp:forward page="customeradmin.jsp"></jsp:forward> 
			<% 
				
			}
           	
          
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		}else{
		out.println("your given id is wrong");
		request.setAttribute("wrong","your given id is wrong");	
		%>			
			<jsp:forward page="Deletecustomer.jsp"></jsp:forward> 
			<% 
		}
		
		%></table><%
%>

<%@ page import="java.sql.*"%>
<%@ page import="java.io.*" %>
<%@ page import="javax.servlet.*"%>

    </body>
</html>
