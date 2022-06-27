<%@page import="com.test.jsp.DBUtil"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    
    	//1. 데이터 가져오기
    	//2. DB작업 > select
    	//3.1 인증 티켓 발급
    	//3.2 없으면 X
    	//4. 피드백
    	
    	//1. 
    	String id = request.getParameter("id");
    	String pw = request.getParameter("pw");
    	
    	
    	//2.
    	Connection conn = null;
    	PreparedStatement stat = null;
    	ResultSet rs = null;
    	
    	conn = DBUtil.open();
    	
    	//로그인 sql
    	String sql = "select * from tblUser where id=? and pw=?";
    	//String sql = "select count(*) from tblUser where id=? and pw=?";
    	
    	stat = conn.prepareStatement(sql);
    	
    	stat.setString(1, id);
    	stat.setString(2, pw);
    	
    	
    	rs = stat.executeQuery();
    	
    	String name = "";
    	String lv = "";
    	
    	if(rs.next()){
    		//로그인 성공
    		System.out.println(rs.getString("name"));
    		System.out.println(rs.getString("lv"));
    		
    		
    		
    		//인증 티켓 발급 > 세션
    		session.setAttribute("auth", id);
    		session.setAttribute("name", rs.getString("name"));
    		session.setAttribute("lv", rs.getInt("lv"));
    		
    		
    		
    	} else {
    		//로그인 실패
    		
    		
    	}
    	
    	rs.close();
    	stat.close();
    	conn.close();
    
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
		<h1>로그인</h1>
		
		
	</div>
	
	<script>
		
		<%if(session.getAttribute("auth") != null) { %>
			
			location.href='index.jsp';
		
		<% } else if(session.getAttribute("auth") == null) {%>
			alert('인증 실패');
			history.back();
		<% }%>
	
		
	</script>
</body>
</html>