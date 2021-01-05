package group1.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import group1.dao.BoardDAO;
import group1.dao.CommentDAO;
import group1.dto.BoardDTO;
import group1.dto.CommentDTO;

public class BoardDetailAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String num = request.getParameter("num");
		System.out.println("num:" + num);
		int boardNum = Integer.parseInt(num);

		System.out.println("boardNum" + boardNum);

		String pageNum = request.getParameter("pageNum");

		BoardDAO bDao = BoardDAO.getInstance();
		BoardDTO bDto = bDao.getDetail(boardNum);
		boolean result = bDao.updateCount(boardNum);

		CommentDAO cDto = CommentDAO.getInstance();
		ArrayList<CommentDTO> commentList = cDto.getCommentList(boardNum);

		if (commentList.size() > 0)
			request.setAttribute("commentList", commentList);

		request.setAttribute("board", bDto);
		request.setAttribute("pageNum", pageNum);

		RequestDispatcher dispatcher = request.getRequestDispatcher("board_detail.do");
		dispatcher.forward(request, response);

	}

}
