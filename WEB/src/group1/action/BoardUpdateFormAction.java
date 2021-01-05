package group1.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import group1.dao.BoardDAO;
import group1.dto.BoardDTO;

public class BoardUpdateFormAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		String pageNum = request.getParameter("page");
		System.out.println(pageNum);
		String num = request.getParameter("num");
		System.out.println(num);
		int boardNum = Integer.parseInt(num);

		BoardDAO bDao = BoardDAO.getInstance();
		BoardDTO bDto = bDao.getDetail(boardNum);

		request.setAttribute("board", bDto);
		request.setAttribute("pageNum", pageNum);

		RequestDispatcher dispatcher = request.getRequestDispatcher("board_update.jsp");
		dispatcher.forward(request, response);

	}

}
