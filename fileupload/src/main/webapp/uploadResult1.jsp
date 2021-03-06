<%@page import="java.util.UUID"%>
<%@page import="java.io.File"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 
   
   //file upload 요청이 있는지 확인
   boolean isMultipart = ServletFileUpload.isMultipartContent(request);

    if(isMultipart){
    	
    	//서버 디스크 부분에 저장 작업 준비(객체 생성)
    	DiskFileItemFactory factory = new DiskFileItemFactory();
    	//upload handler 생성
    	ServletFileUpload upload = new ServletFileUpload(factory);
    	
    	//request가지고 parsing(fileitem 구조로)
    	List<FileItem> fileItems =  upload.parseRequest(request);
    	String fieldName = null, fileName = null, value = null;
    	
    	Iterator<FileItem> iter = fileItems.iterator();
    	
    	while(iter.hasNext()){
    		FileItem item = iter.next(); //현재 요소 갖고 나옴
    		
    		if(item.isFormField()){ //input type=file 아닌 것 
    			fieldName = item.getFieldName();
    			value = item.getString("utf-8"); //request set encoding과 같은 개념
    			out.print("<h3>일반 데이터</h3>");
    			out.print(fieldName+" : "+value+"<br>");
    		}else{
    			fieldName = item.getFieldName();
    			fileName  = item.getName();
    			long size = item.getSize();
    			
    			out.print("<h3>파일 데이터</h3>");
    			out.print(fieldName+" : "+fileName+"<br>");
    			out.print("파일 크기 : "+size);
    			
    			//저장
    			if(!fileName.isEmpty()){
    				String path = "c:\\upload";
    				
    				//동일한 파일명이 들어올 경우를 위해
    				//128-bit 고유의 값 추출
    				UUID uuid = UUID.randomUUID();
    				
    				//file은 디폴트 생성자 x
    				File file = new File(path+"\\"+uuid.toString()+"_"+fileName);
    				item.write(file);
    				
    				//다운로드
    				out.print("<p>");
    				out.print("<a href='download.jsp?fileName="+file.getName()+"'>"+fileName+"</a>");
    			}
    		}
    	}
    	
    }

%>
</body>
</html>