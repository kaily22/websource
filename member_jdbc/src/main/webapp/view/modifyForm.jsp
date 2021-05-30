<%@page import="member.domain.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp" %>
<%  MemberVO loginVO = (MemberVO)session.getAttribute("loginVO"); %>

<form id="modifyform" action="modifyProcess.jsp" method="post">
	<div class="card"  style="width: 40rem;margin:40px auto;">	
		<div class="card-header">
	    	<h4>비밀번호 변경</h4>
	  	</div>
	 	<div class="card-body">	
			<div class="form-group row justify-content-center">		
				<div class="col-sm-10">	
					<input type="password" name="current_password" id="current_password" class="form-control" placeholder="현재 비밀번호" autofocus="autofocus"/>
					<small id="current_password" class="text-info"></small>	
				</div>
			</div>	
			<div class="form-group row justify-content-center">		
				<div class="col-sm-10">	
					<input type="password" name="new_password" id = "new_password" class="form-control" placeholder="새 비밀번호"/>
					<small id="new_password" class="text-info"></small>
				</div>	
			</div>	
			<div class="form-group row justify-content-center">		
				<div class="col-sm-10">	
					<input type="password" name="confirm_password" id = "confirm_password" class="form-control" placeholder="새 비밀번호 확인"/>
					<small id="confirm_password" class="text-info"></small>
				</div>	
			</div>	
			<div class="form-group text-center">		
				<button type="submit" class="btn btn-primary">수정</button>
			    <button type="reset" class="btn btn-secondary" id="modifycancel">취소</button>		
			</div>
		</div>
	</div>		
</form>
<script>
let name = '<%=loginVO.getName()%>';
</script>
<%--로그인 후 메뉴 --%>
<script src="../js/menu.js"></script>
<%-- 정보수정 들어왔으니 정보수정 버튼 없애기 --%>
<script>
$(function() {
	$("#modify").remove();
})
</script>
<%--폼 검증 --%>
<script> 
 $(function(){ 
 	$("#confirm_password").change(function(){
 	var new_password = $("#new_password").val(); 
	var confirm_password = $("#confirm_password").val();
	if(new_password !== confirm_password){ 
		alert("비밀번호가 다릅니다."); 
	$("#confirm_password").focus(); } 
  }) 
 })
</script>
<%-- 버튼 이벤트 --%>
<script src="../js/command.js"></script>
<%@ include file="../layout/footer.jsp" %>