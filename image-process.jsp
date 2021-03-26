<%-- 
    Document   : image-process
    Created on : Mar 11, 2021, 2:18:00 PM
    Author     : user
--%>

<%@page import="java.io.PrintWriter"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Insert an Image into MySQL Database</title>
    </head>
    <body>
         <%
             response.setContentType("text/html");
		PrintWriter out1=response.getWriter();
//String url="jdbc:derby://localhost:1527/CustDatabase","admin1","admin1";
String fname=request.getParameter("fname");
String lname=request.getParameter("lname");
String email=request.getParameter("email");
String myloc=request.getParameter("myimg");
//out.print("First Name :"+fname+"myloc="+myloc);
try 
{
   Class.forName("org.apache.derby.jdbc.ClientDriver");
   Connection con=DriverManager.getConnection("jdbc:derby://localhost:1527/CustDatabase","admin1","admin1");
   PreparedStatement ps = con.prepareStatement("Insert into image values(?,?,?,?)");
    ps.setString(1,fname);
    ps.setString(2,lname);
    ps.setString(3,email);
    FileInputStream fis=new FileInputStream(myloc);
    ps.setBinaryStream(4,fis,fis.available());
    int status=ps.executeUpdate();
                if(status>0)
                {
			out.print("WELCOME! YOUR ACCOUNT HAS OPENED");
                        out.print("<form action=storeimage.html> <br> <input type=submit value=Click Here For Home>");
                        out.print("</form>");
                        out.close();
			//RequestDispatcher rd=request.getRequestDispatcher("index.jsp");
			//rd.include(request, response);
		}
	else{
			out.print("Sorry,Registration failed. please try later");
			//RequestDispatcher rd=request.getRequestDispatcher("MyHtml.html");
			//rd.include(request, response);
		}
}
catch (Exception e) {
		
		e.printStackTrace();
	}
%>
    </body>
</html>
