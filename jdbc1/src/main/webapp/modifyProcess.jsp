<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
//modify.jsp 넘긴 값 가져오기
request.setCharacterEncoding("utf-8");
int no = Integer.parseInt(request.getParameter("no"));
String addr = request.getParameter("addr");
String mobile = request.getParameter("mobile");

//db작업
Connection con = null;
PreparedStatement pstmt = null;

try {
	Class.forName("oracle.jdbc.OracleDriver");

	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "javaDB";
	String password = "12345";

	con = DriverManager.getConnection(url, user, password);
	String sql = "update usertbl set addr=?,mobile=? where no=?";
	pstmt = con.prepareStatement(sql);
	pstmt.setString(1, addr);
	pstmt.setString(2, mobile);
	pstmt.setInt(3, no);

	//작업 결과에 따라 페이지 이동
	int result = pstmt.executeUpdate();
	if (result > 0) {
		//수정 성공 => 전체조회
		response.sendRedirect("selectone.jsp?no="+no);
		//수정 실패 => add.jsp
	} else {
		response.sendRedirect("modify.jsp?no="+no);
	}
} catch (Exception e) {
	e.printStackTrace();
} finally {
	try {
		pstmt.close();
		con.close();
	} catch (Exception e) {
		e.printStackTrace();
	}
}
%>