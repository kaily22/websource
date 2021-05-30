<%@page import="java.net.URLEncoder"%>
<%@page import="java.io.BufferedOutputStream"%>
<%@page import="java.io.BufferedInputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%    


     String fileName = request.getParameter("fileName");
     String downPath="c:\\upload";
     
     //이 응답을 위해 getOutputStream()이 이미 호출되었습니다.=>해결방법
     out.clear();
     out = pageContext.pushBody();
     

     response.setContentType("application/octet-stream");
     
     //한글파일명 깨지는 거 처리
     //uuid 값 제거 후 파일명 붙이기
     int start = fileName.lastIndexOf("_");
     String attachName =  fileName.substring(start+1);
     response.setHeader("Content-Disposition",
    		 "attachment;filename="+URLEncoder.encode(attachName,"utf-8"));
     
     
     FileInputStream in = new FileInputStream(downPath+"\\"+fileName);
     BufferedOutputStream buf = new BufferedOutputStream(response.getOutputStream());
     
     int numRead = 0;
     byte b[] = new byte[4896];
     while((numRead = in.read(b))!=-1) {
    	 buf.write(b);
     }
     buf.flush();
     buf.close();
     in.close();
     
   

%>