<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%--forwardTest2.jsp --%>
<jsp:forward page='<%=request.getParameter("forwardPage")%>'>
<jsp:param value="tel" name="031-1234-5486"/>
</jsp:forward>
</body>
</html>