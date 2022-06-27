<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    
    	//1. 인증티켓 삭제
    	// 로그아웃은 세션 초기화가 아니다.
    	// 로그인 정보를 없앤다고 초기화를 하면 안 됨 > 모든 계정 정보 사라짐(ex.방문자수 카운트)
    	// 그렇기때문에 첫번쨰 방법 더 많이씀
    	
    	/* session.removeAttribute("auth"); //로그 아웃
    	session.removeAttribute("name"); //로그 아웃
    	session.removeAttribute("lv"); //로그 아웃 */
    	
    	//세션 초기화
    	session.invalidate();
    	
    
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
		

	</div>
	
	<script>
		location.href='index.jsp';
	</script>
</body>
</html>