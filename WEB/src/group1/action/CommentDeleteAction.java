package group1.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import group1.dao.CommentDAO;

public class CommentDeleteAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int comment_num = Integer.parseInt(request.getParameter("comment_num"));

		CommentDAO cDao = CommentDAO.getInstance();
		boolean result = cDao.deleteComment(comment_num);

		response.setContentType("text/html;charset=UTF-8");

	}

}
