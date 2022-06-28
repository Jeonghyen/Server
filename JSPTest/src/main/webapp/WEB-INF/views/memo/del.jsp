<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/WEB-INF/views/memo/inc/asset.jsp" %>
<style>

</style>
</head>
<body>
	<div class="container">
		<%@ include file="/WEB-INF/views/memo/inc/header.jsp" %>
		<section>
			<!-- 서블릿 주소 > 가상 주소 -->
			<form method="POST" action="/jsp/memo/delok.do">
			<table class="table table-bordered add">
			
				<tr>
					<th>암호</th>
					<td><input type="password" name="pw" class="form-control" required /></td>
				</tr>
			</table>
			
			<div class="btns">
				<input type="button" value="돌아가기" class="btn btn-secondary" onclick="location.href='/jsp/memo/list.do';"/>
				<input type="submit" value="삭제하기" class="btn btn-primary" />
			</div>
			<input type="hidden" name="seq" value="${seq}" />
			
			</form>
		</section>
	
	</div>
	
	<script>
	
	</script>
</body>
</html>