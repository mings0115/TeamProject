package group1.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import group1.dao.CommentDAO;
import group1.dto.CommentDTO;

public class CommentUpdateAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int comment_num = Integer.parseInt(request.getParameter("comment_num"));
		String comment_content = request.getParameter("comment_content");

		CommentDAO cDao = CommentDAO.getInstance();

		CommentDTO cDto = new CommentDTO();
		cDto.setComment_num(comment_num);
		cDto.setComment_content(comment_content);

		boolean result = cDao.updateComment(cDto);

		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();

		if (result)
			out.println("1");

		out.close();

	}

}
