<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% //session 유효시간 설정
    session.setMaxInactiveInterval(10);
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<ul>
	<li>isNew(): <%=session.isNew() %></li>
	<li>생서시간 : <%=session.getCreationTime() %></li>
	<li>최종접속시간: <%=session.getLastAccessedTime() %></li>
	<li>세션ID: <%=session.getId()%></li>
	
</ul>
</body>
</html>