<%-- 
    Document   : imageprocess1
    Created on : Mar 12, 2021, 12:39:38 PM
    Author     : user
--%>

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
//Connection conn=null;
//PreparedStatement pstmt = null;
ResultSet rs=null;
//String url="jdbc:derby://localhost:1527/CustDatabase","admin1","admin1";
//FileInputStream fis=null;
String fname=request.getParameter("fname");
String lname=request.getParameter("lname");
String email=request.getParameter("email");
String myloc=request.getParameter("myimg");
//out.print("First Name :"+fname+"myloc="+myloc);
try{
Class.forName("org.apache.derby.jdbc.ClientDriver");
Connection conn=DriverManager.getConnection("jdbc:derby://localhost:1527/CustDatabase","admin1","admin1");
//File image= new File(myloc);
PreparedStatement pstmt = conn.prepareStatement("insert into image(firstname, lastname, email,image) " + "values(?,?,?,?)");
pstmt.setString(1, "Siraj");
pstmt.setString(2, "K");
pstmt.setString(3, "ksirajudeen13@gmail.com");
FileInputStream fis=new FileInputStream("C:\\Users\\user\\Documents\\New folder\\IMG.jpg");
pstmt.setBinaryStream(4,fis);
int count = pstmt.executeUpdate();
if(count>0)
{
out.println("insert successfully");
}
else
{
out.println("not successfully");
}
}
catch(Exception ex)
{
ex.printStackTrace();
}
finally{
try{
if(rs!=null){
rs.close();
rs= null;
}
}
catch(Exception e)
{
e.printStackTrace();
}
}
%>
    </body>
</html>

