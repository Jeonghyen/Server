<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    
    	//select..where id = session.getAttribute("id"); > 비용 많이 듦
    	
    	
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/auth/inc/asset.jsp" %>
<style>
</style>
</head>
<body>
	
	<div class="container">
		<h1>인증, 허가</h1>
		
		<!-- 
		
			- Register, Login, Logout
			- Singup, Singin, Singout
			
		 -->
		 
		
		<% if(session.getAttribute("auth") == null){ %>
		<fieldset>
			<input type="button" value="로그인(Sign in)" class="btn btn-primary" onclick="location.href='login.jsp';"/>
		</fieldset>
		
		<% } else { %>
		<fieldset>
			<input type="button" value="로그아웃(Sign out)" class="btn btn-primary" onclick="location.href='logout.jsp';"/>
			
			<hr />
			
			<div>
				<%= session.getAttribute("name") %>(<%= session.getAttribute("auth") %>) <%= session.getAttribute("lv") %>
				
			</div>
		</fieldset>
		
		 
		
		<% } %>
	</div>
	
	<hr />
	
	<!-- 등급 허가 -->
	
	<!-- 비노출 방식 > 로그인해야 버튼 보임-->
	<% if(session.getAttribute("auth") != null && (int)session.getAttribute("lv") < 3){ %>
	<a href="member.jsp" class="btn btn-success">회원 전용 페이지</a>
	<% } %>
	 
	
	
	<!-- 노출 방식 > 로그인성공해야 이동 가능-->
	<% if(session.getAttribute("auth") == null || (int)session.getAttribute("lv") == 3){ %>
		<a href="#!" class="btn btn-success" onclick="alert('로그인하세요.');">회원 전용 페이지</a>
	<% } else {%>
	
		<a href="member.jsp" class="btn btn-success">회원 전용 페이지</a>
	<% } %>
	
	<hr />
	
	<!-- 노출 방식 > 로그인성공해야 이동 가능-->
	<% if(session.getAttribute("auth") == null || (int)session.getAttribute("lv") != 1){ %>
		<a href="#!" class="btn btn-success" onclick="alert('관리자 페이지입니다..');">관리자 전용 페이지</a>
	<% } else {%>
	
		<a href="admin.jsp" class="btn btn-success">회원 전용 페이지</a>
	<% } %>
	<script>
	
	</script>
</body>
</html>