<%@page import="com.test.jsp.DBUtil"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%


	String seq = "";
	String todo ="";
	String regdate="";
	String priority = "";
	String complete ="";
	String temp="";
	
	Connection conn = null;
	Statement stat = null;
	PreparedStatement pstat = null;
	ResultSet rs = null;

	try{
	
	conn = DBUtil.open();
	
	String sql = "select * from tbltodo order by seq desc";
	
	stat = conn.createStatement();
	
	rs = stat.executeQuery(sql);
	

	
	
}catch(Exception e){
	
	System.out.println(e);
}



%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Todo</title>
<%@ include file="/todo/inc/asset.jsp" %>
<style>

</style>
</head>
<body>

	<main>
		<h1>Todo <small>List</small></h1>
		
		<table class="table table-bordered list">
			<tr>
				<th>★</th>
				<th>할일</th>
				<th>날짜</th>
			</tr>
			
			<% while(rs.next()) { %>
			
			<% if(rs.getString("complete").equals("y")) { %>
				
				<tr class="complete">
			
			<% } else {%>
				
				<tr>
				
			<% } %>
				
				<td><%= rs.getString("priority") %></td>
				<td onclick="change(<%= rs.getString("seq") %>)"><%= rs.getString("todo") %></td>
				<td><%= rs.getString("regdate") %></td>
			</tr>
				
			
			<% } %>
			
			<tr class="complete">
				<td>C</td>
				<td>마트 장보기</td>
				<td>2022-06-24 12:12:20</td>
			</tr>
			<tr>
				<td>C</td>
				<td>방청소하기</td>
				<td>2022-06-24 12:12:20</td>
			</tr>
		</table>
		
		<div class="btns">
			<input type="button" value="등록하기"
				class="btn btn-warning" onclick="location.href='add.jsp';">
		</div>
	</main>
	
	<script>
		//제목 클릭하면 완료 표시하기

		
		function change(seq){
			
			location.href = "change.jsp?seq=" + seq;
			
		}
		
	</script>

</body>
</html>
















