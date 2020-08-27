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
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection
		("jdbc:mysql://127.0.0.1:3306/examportal", "root", "1234");
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select * from candidate");
while(rs.next()){
	if(name.equals(rs.getString("name")) && password.equals(rs.getString("password")))
	{
		out.println("##### your report #####<br>");
		out.println("name:"+rs.getString("name")+"<br>");
		out.println("technology:"+rs.getString("technology")+"<br>");
		out.println("grade:"+rs.getString("grade")+"<br>");
		out.println("number of correct answers is:-"+rs.getString("correct")+"<br>");
	}
}
con.close();
%>
</body>
</html>