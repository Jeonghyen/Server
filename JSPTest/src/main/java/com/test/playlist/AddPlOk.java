package com.test.playlist;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/playlist/addplok.do")
public class AddPlOk extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		
		//값 받아오기
		
		//인코딩
		req.setCharacterEncoding("UTF-8");
		
		//값 수신
		String title = req.getParameter("title");
		String singer = req.getParameter("singer");
		
		//DTO에 세팅
		DTO dto = new DTO();
		dto.setTitle(title);
		dto.setSinger(singer);
		
		//DAO 호출
		DAO dao = new DAO();
		
		int result = dao.add(dto);
		
		//결과 보내기
		req.setAttribute("result", result);
		
		
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/playlist/addplok.jsp");

		dispatcher.forward(req, resp);

	}
}


