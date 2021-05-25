<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
//보여주는 페이지에 대한 구조/인코딩 설정
//서블릿에서 => request.setContentType("text/html;charset=utf-8");

//가져오는 값에 대한 인코딩
request.setCharacterEncoding("utf-8");
//request.jsp에서 사용자 입력값 가져오기
String userid = request.getParameter("userid");
String password = request.getParameter("password");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<ul>
		<li>사용자 아이디 : <%=userid%></li>
		<li>사용자 비밀번호 : <%=password%></li>
	</ul>
</body>
</html>