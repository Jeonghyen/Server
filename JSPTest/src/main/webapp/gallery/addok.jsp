<%@page import="java.util.Calendar"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.test.jsp.DBUtil"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	//파일 저장 경로 지정
    	String path = application.getRealPath("/gallery/images");
    	
    
    	//업로드 파일 크기 지정
    	int size = 1024 * 1024 * 100;
    	
    	//변수 선언
    	
    	String subject = "";
    	String attach = "";
    	String filename = "";
    	int result = 0;
    	
    	//객체 생성
    		try {
    		
    		//request > MultipartRequest
    		//MultipartRequest 객체를 만든 순산 첨부파일은 files 폴더에 업로드 완료
    		
				MultipartRequest multi = new MultipartRequest(
    				
    					request, //원래 request 객체
    					path, //업로드 위치
    					size, //최대 크기
    					"UTF-8", //인코딩,
    					new DefaultFileRenamePolicy() 
						//파일명 관리 객체 > 중복파일이 있다면 이름 바꿔서 저장
    				);
    		
    		subject = multi.getParameter("subject");
    		filename = multi.getFilesystemName("attach");
    		
    		
    		//DB에 추가
    		//DBUtil util = new DBUtil();
    		
    		Connection conn = null;
    		Statement stat = null;
    		PreparedStatement pstat = null;
    		
    		conn = DBUtil.open();
    		
    		//System.out.println(conn.isClosed()); //false
 
    		
    		String sql = "insert into tblgallery (seq, filename, subject) values (seqGallery.nextVal,?,?)";
    		
    		pstat = conn.prepareStatement(sql);
    		
    		pstat.setString(1,filename);
    		pstat.setString(2,subject);

    		
    		result = pstat.executeUpdate();
    		
    		
    		
    	}catch(Exception e) {
    		System.out.println(e);
    	}
    	
    	
    	
    	response.sendRedirect("list.jsp");
    
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
	
	</script>
</body>
</html>