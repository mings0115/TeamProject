package group1.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import group1.dao.CommentDAO;
import group1.dto.CommentDTO;

public class CommentReplyAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int comment_num = Integer.parseInt(request.getParameter("comment_num"));
		int comment_board = Integer.parseInt(request.getParameter("comment_board"));
		String comment_id = request.getParameter("comment_id");
		String comment_content = request.getParameter("comment_content");

		CommentDAO cDao = CommentDAO.getInstance();

		CommentDTO cDto = new CommentDTO();
		cDto.setComment_num(cDao.getSeq());
		cDto.setComment_board(comment_board);
		cDto.setComment_id(comment_id);
		cDto.setComment_content(comment_content);
		cDto.setComment_parent(comment_num);

		boolean result = cDao.insertComment(cDto);

		response.setContentType("text/html;charset=UTF-8");

		PrintWriter out = response.getWriter();

		if (result)
			out.println("1");
		else
			out.println("0");

		out.close();
	}

}
