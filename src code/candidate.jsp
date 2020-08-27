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
String grade=request.getParameter("grade");
String count=request.getParameter("count");
out.print(name+"::"+grade);
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection
		("jdbc:mysql://127.0.0.1:3306/examportal", "root", "1234");
PreparedStatement pp = con.prepareStatement("insert into candidate values(?,?,?,?,?)");
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select * from detail");
while(rs.next()){
	if(name.equals(rs.getString("name")) && password.equals(rs.getString("password")))
	{
String technology=rs.getString("technology");
pp.setString(1,name);
pp.setString(3,password);
pp.setString(2,technology);
pp.setString(5,grade);
pp.setString(4,count);
pp.executeUpdate();
	}
}
con.close();
%>
click as per your choice:<br>
<a href="review.html">give your review></a><br>
</body>
</html>