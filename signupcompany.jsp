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
	String name = request.getParameter("name");
	String password = request.getParameter("pass");
	String location=request.getParameter("location");
	out.println("name="+name);
	out.println("password="+password);
	out.println("location="+location);
	 Class.forName("com.mysql.jdbc.Driver");
    Connection con=DriverManager.getConnection
			("jdbc:mysql://127.0.0.1:3306/examportal", "root", "1234");
	PreparedStatement p = con.prepareStatement("insert into companydetail values(?,?,?)");
	p.setString(1,name);
	p.setString(2,password);
	p.setString(3,location);
	p.executeUpdate();
	con.close();
				%>
 <a href="logincompany.html">Sign In</a>
</body>
</html>