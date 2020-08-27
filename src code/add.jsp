<%@ page import="java.sql.*,java.util.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String a = request.getParameter("name");
String p = request.getParameter("password");
String l = request.getParameter("location");
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection
		("jdbc:mysql://127.0.0.1:3306/examportal", "root", "1234");
PreparedStatement pp = con.prepareStatement("insert into companydetail values(?,?,?)");
Statement st=con.createStatement();
pp.setString(1,a);
pp.setString(2,p);
pp.setString(3,l);
pp.executeUpdate();
con.close();
%>
</body>
</html>