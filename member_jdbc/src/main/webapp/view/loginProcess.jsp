<%@page import="member.domain.MemberVO"%>
<%@page import="member.persistence.MemberDAO"%>
<%@page import="java.sql.Connection"%>
<%@page import="member.persistence.JDBCUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
 String userid = request.getParameter("userid");
 String currentPassword = request.getParameter("current_password");

  Connection con = JDBCUtil.getConnection();
  MemberDAO dao = new MemberDAO(con);

  MemberVO loginVO = dao.isLogin(userid, currentPassword);

 if(loginVO != null) {
	session.setAttribute("loginVO", loginVO);
	response.sendRedirect("loginForm.jsp");
 } else {
	response.sendRedirect("loginForm.jsp");
 }
%>
