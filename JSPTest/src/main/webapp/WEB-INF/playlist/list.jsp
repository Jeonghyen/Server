<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/example/inc/asset.jsp" %>
<style>
	.table {
		width: 300px;
	}
</style>
</head>
<body>
	<div class="container">
		<h1>PlayList</h1>
		
		
		
		<table class="table table-bordered">
		
			<tr>
				<th>노래</th>
				<th>가수</th>
			</tr>
			<c:forEach items="${list}" var="dto">
			
			<tr>
				<td>${dto.title}</td>
				<td>${dto.singer}</td>
			</tr>
			
			</c:forEach>
		</table>
		<div>
			<input type="button" value="추가" class="btn btn-primary" onclick="location.href='/jsp/playlist/addpl.do'"/>		
		</div>
		
	</div>
	
	<script>
	
	</script>
</body>
</html>