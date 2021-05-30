<%@page import="book.domain.BookVO"%>
<%@page import="java.util.List"%>
<%@page import="book.persistence.BookDAO"%>
<%@page import="book.persistence.JDBCUtil"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
Connection con = JDBCUtil.getConnection();
BookDAO dao = new BookDAO(con);

List<BookVO> list = dao.getList();

JDBCUtil.close(con);

request.setAttribute("list", list);
pageContext.forward("list.jsp");

%>