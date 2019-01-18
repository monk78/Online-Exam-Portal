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
PreparedStatement pp = con.prepareStatement("insert into candidate values(?,?,?,?,?)");
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select * from review");
while(rs.next()){
	
	String str=rs.getString("review");
	if(!str.contains("pagal")||!str.contains("mad"))
	{
		out.println(str+"<br>");
	}
}
%>
</body>
</html>