<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.test.jsp.DBUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	//2. 데이터 가져오기
	//3. DB 작업
	//	3.1 DB 연결
	//	3.2 SQL
	//	3.3 종료
	//4. 마무리(feedback)
	
	//2.
	String seq = request.getParameter("seq");
	
	
	int result = 0;
	
	try {
		//3.
		
		
		Connection conn = null;
		Statement stat = null;
		PreparedStatement pstat = null;
		
		conn = DBUtil.open();
		
		
		String sql = "delete from tblGallery where seq = ?";
		
		pstat = conn.prepareStatement(sql);

		pstat.setString(1, seq);
		
		result = pstat.executeUpdate();
		

	
	} catch (Exception e) {
		System.out.println(e);
	}
	
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주소록</title>
<%@ include file="/address/inc/asset.jsp" %>
<style>

</style>
</head>
<body>
	<main>
		<header>
			<%@ include file="inc/header.jsp" %>
		</header>
		<section>
			<div class="section content">
				
			</div>
		</section>	
	</main>
	
	<script>
	
		
		<% if (result > 0) { %>
		
		location.href = 'list.jsp'; 
		
		<% } else { %>
		
		alert('삭제 실패;;');
		history.back();
		
		<% } %> 
	
	</script>

</body>
</html>














