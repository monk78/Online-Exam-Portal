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
String technology = request.getParameter("technology");
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection
		("jdbc:mysql://127.0.0.1:3306/examportal", "root", "1234");
Statement st = con.createStatement();
ResultSet rs=st.executeQuery("select * from candidate");
int flag=0;
int i=1;
while(rs.next())
{
	if(technology.equalsIgnoreCase(rs.getString("technology")))
	{
			out.println("<br>##"+i+" candidate ##<br>");
			out.println("grade="+rs.getString("grade")+"<br>");
			out.println("name="+rs.getString("name")+"<br>");
			out.println("technology="+rs.getString("technology")+"<br>");
			i++;
	}
}
%>
</body>
</html>