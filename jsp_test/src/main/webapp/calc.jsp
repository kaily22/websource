<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="error.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%--사칙연산 --%>
	<%
	int a = 1, b = 0;
	out.print("<p>a와 b의 사칙연산</p>");
	%>
	<p> a+b = <%=a+b%></p>
	<p> a-b = <%=a-b%></p>
	<p> a*b = <%=a*b%></p>
	<p> a/b = <%=a/b%></p>
</body>
</html>