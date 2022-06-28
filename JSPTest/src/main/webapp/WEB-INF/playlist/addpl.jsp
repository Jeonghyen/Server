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

</style>
</head>
<body>
	<div class="container">
	
			<form action="/jsp/playlist/addplok.do" method="post">
			<table class="table table-bordered">
			<tr>
				<th>노래</th>
				<th>가수</th>
			</tr>
			<tr>
				<td><input type="text" name="title" class="form-control" /></td>
				<td><input type="text" name="singer" class="form-control" /></td>
			</tr>
		</table>
		<div>
			<input type="button" value="돌아가기" class="btn btn-secondary" onclick="location.href='/jsp/list.do';"/>
			<input type="submit" value="등록" class="btn btn-primary"/>
		</div>
		</form>
	
	</div>
	
	<script>
	
	</script>
</body>
</html>