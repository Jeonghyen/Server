package com.test.memo;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/memo/delok.do")
public class DelOK extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String seq = req.getParameter("seq");
		String pw = req.getParameter("pw");
		
		DTO dto = new DTO();
		DAO dao = new DAO();
		
		dto.setSeq(seq);
		dto.setPw(pw);
		
		
		int result = 0;
		
		if(dao.check(dto)) {
			result = dao.del(seq);
		}
		
	
		req.setAttribute("result", result);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/memo/delok.jsp");

		dispatcher.forward(req, resp);

	}
}

