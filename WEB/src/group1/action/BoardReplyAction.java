package group1.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import group1.dao.BoardDAO;
import group1.dto.BoardDTO;

public class BoardReplyAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		BoardDAO bDao = BoardDAO.getInstance();
		BoardDTO bDto = new BoardDTO();

		String pageNum = request.getParameter("page");

		int num = Integer.parseInt(request.getParameter("board_num"));
		String id = request.getParameter("board_id");
		String subject = request.getParameter("board_subject");
		String content = request.getParameter("board_content");
		int ref = Integer.parseInt(request.getParameter("board_re_ref"));

		bDto.setBoard_num(bDao.getSeq());
		bDto.setBoard_id(id);
		bDto.setBoard_subject(subject);
		bDto.setBoard_content(content);
		bDto.setBoard_re_ref(ref);
		bDto.setBoard_parent(num);

		boolean result = bDao.boardInsert(bDto);

		RequestDispatcher dispatcher = request.getRequestDispatcher("board_list.do?page=" + pageNum);
		dispatcher.forward(request, response);

	}
}
