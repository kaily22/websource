<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% 
//세션 해제(제거)
session.removeAttribute("login");
//페이지 이동=>loginForm
response.sendRedirect("loginForm.jsp");
%>