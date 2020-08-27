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
<form method="post" action="candidate.jsp">
<%
	String str[]=new String[20];
for(int i=0;i<str.length;i++){
		int j=i+1;
	 str[i]=request.getParameter("radio"+j);
}
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection
		("jdbc:mysql://127.0.0.1:3306/examportal", "root", "1234");
Statement st = con.createStatement();
ResultSet rs1=st.executeQuery("select * from answer");
String ans="";
while(rs1.next())
{
ans+=rs1.getString("ans")+"  ";
}
int count=0;
String answers[]=ans.split("  ");
for(int i=0;i<answers.length;i++){
		if(answers[i].equals(str[i]))
					count=count+1;
}
String grade=null;
int p=5*count;
if(p>=90)
	 grade="A+";
if(p>=80 && p<90)
	grade="A";
if(p>=70 && p<80)
	 grade="B+";
if(p>=60 && p<70)
	grade="C";
else
	grade="D";
out.println("## your report card ##<br>");
%>
correct answers:<%=count%><br>
for submission please enter your name and password again:<br>
<input type="text" value="<%=grade%>" name="grade"/><br>
<input type="text" value="<%=count%>"name="count"/><br><br>
<input type="text" size="30" name="name" placeholder="submit name" required><br>
<input type="password" size="30" name="pass" placeholder="submit password" required><br>
<input type="submit" value="submit my details:">
</form>
</body>
</html>