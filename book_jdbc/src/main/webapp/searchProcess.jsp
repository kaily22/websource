<%@page import="java.util.List"%>
<%@page import="book.domain.BookVO"%>
<%@page import="book.persistence.BookDAO"%>
<%@page import="java.sql.Connection"%>
<%@page import="book.persistence.JDBCUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

String criteria = request.getParameter("criteria");
String keyword = request.getParameter("keyword");

Connection con = JDBCUtil.getConnection();
BookDAO dao = new BookDAO(con);

List<BookVO> searchList = dao.searchList(criteria, keyword);

//결과 존재하지 않으면 index로 이동
if(searchList.isEmpty()) {
	response.sendRedirect("index.jsp");
//검색 결과가 존재하면 forward(search)
}else {
	request.setAttribute("searchList", searchList);
	pageContext.forward("search.jsp");
}

JDBCUtil.close(con);
%>