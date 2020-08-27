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
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection
		("jdbc:mysql://127.0.0.1:3306/examportal", "root", "1234");
Statement st = con.createStatement();
ResultSet rs=st.executeQuery("select * from companydetail");
String name = request.getParameter("name");
String password = request.getParameter("pass");
int flag=0;
while(rs.next())
{
	if(name.equals(rs.getString("name")))
	{
		flag=1;
	}
}
if(flag==1){
	%>
	your password and user name are correct<br><br>choose your task<br>
	<a href="filterbygrade.html">filter candidate by grade =></a><br>
	<a href="filterbytechnology.html">filter candidate by technology=></a>
<% 	
}
else
{
	%>
	<a href="loginuser.html">Your input are incorrect login again</a>
	<%
}
%>
</body>
</html>