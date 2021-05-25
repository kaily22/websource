<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%-- page : 페이지 지시어 --%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>사용자가 입력한 값</h1>
	<ul>
		<li>아이디 : <%=request.getParameter("userid") %></li>
		<li>비밀번호 : <%=request.getParameter("password") %></li>
	</ul>
</body>
</html>