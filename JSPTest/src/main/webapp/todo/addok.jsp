<%@page import="com.test.jsp.DBUtil"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    
    	request.setCharacterEncoding("UTF-8");

    
    	String todo = request.getParameter("todo");
    	//System.out.println(todo);
    	String priority = request.getParameter("priority");
    	String sql = "";
    	int result = 0;
    	
    	try{
    		
    		Connection conn = null;
    		Statement stat = null;
    		PreparedStatement pstat = null;
    		
    		conn = DBUtil.open();
    		
    		sql = "insert into tblTodo (seq, todo, regdate, priority, complete) values (seqTodo.nextval, ?, default, ?, default)";
    		
			pstat = conn.prepareStatement(sql);
    		
    		pstat.setString(1,todo);
    		pstat.setString(2,priority);

    		
    		result = pstat.executeUpdate();
    		
    		
    		
    		
    	}catch(Exception e){
    		
    		System.out.println(e);
    	}
    	
    	
    	
    	
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/example/inc/asset.jsp" %>
<style>
</style>
</head>
<body>
	<div class="container">
	
	</div>
	
	<script>
		<% if(result> 0){ %>
			
			location.href="list.jsp";
		<% } else { %>
			
			alert("등록 실패");
			history.back();
			
		<% } %>
	</script>
</body>
</html>