package com.test.mvc;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Hello extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//주문 처리 > 비즈니스 코드
		
		//가상 주소 매핑 > web.xml
		
		//JSP 호출 하기
		// '/' > context root
		//resp.sendRedirect("/jsp/mvc/hello.jsp");
		
		//pageContext.forward();
		//사용중이던 request, response를 다음페이지에 전달 가능
		
		//'/' > webapp
		
		String name = "홍길동";
		
		req.setAttribute("name", name);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/hello.jsp");
		dispatcher.forward(req, resp);  //JSP호출
		
	
	}

}
