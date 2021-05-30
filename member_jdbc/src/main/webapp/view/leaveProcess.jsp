<%@page import="member.persistence.MemberDAO"%>
<%@page import="member.persistence.JDBCUtil"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
String userid = request.getParameter("userid");
String currentPassword = request.getParameter("current_password");

Connection con = JDBCUtil.getConnection();
MemberDAO dao = new MemberDAO(con);
int result = dao.remove(userid, currentPassword);

if (result > 0) {
	session.removeAttribute("loginVO");
	JDBCUtil.commit(con);
	response.sendRedirect("../index.jsp");

} else {
	JDBCUtil.rollback(con);
	response.sendRedirect("leaveForm.jsp");
}
%>