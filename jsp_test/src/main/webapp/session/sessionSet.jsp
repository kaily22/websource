<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>세션 저장</h3>
<% 
session.setAttribute("name","session Test!!"); //담고 싶은 값 뒤에 온다(객체)
session.setAttribute("age", "25");
response.sendRedirect("sessionForm.jsp");
%>
</body>
</html>