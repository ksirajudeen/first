<%-- 
    Document   : Deletecustomer2
    Created on : Mar 7, 2021, 11:24:37 PM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>DELETE CUSTOMER</title>
    </head>
    <body>        
    <%
    String ph=request.getParameter("accountno");		
         int  id=Integer.parseInt(ph);
         try 
         {
             Class.forName("org.apache.derby.jdbc.ClientDriver");
             Connection con=DriverManager.getConnection("jdbc:derby://localhost:1527/CustDatabase","admin1","admin1");
             //Statement stmt=con.createStatement();
             //String sql = "delete from customer where accountno="+id;
             //stmt.executeQuery(sql);
             //out.println("Record deleted successfully");
             PreparedStatement ps=con.prepareStatement("delete from customer where accountno = '"+id+"' ");			
	     ResultSet rs=ps.executeQuery();
             if(rs.next()){          			
	        out.print("your Details has been deleted");
			request.setAttribute("deleted","your Details has been deleted");
             }
             else{
		out.println("your given id is wrong");
		request.setAttribute("wrong","your given id is wrong");
             }
         }
         catch (Exception e) {
			e.printStackTrace();
		}
			%>			
			 
			
				
			
             
             
         
   
       <%@ page import="java.sql.*"%>  
    </body>
</html>
