package group1.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import group1.dao.CommentDAO;
import group1.dto.CommentDTO;

public class CommentReplyFormActon implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int comment_num = Integer.parseInt(request.getParameter("num"));

		CommentDAO dao = CommentDAO.getInstance();
		CommentDTO comment = dao.getComment(comment_num);

		request.setAttribute("comment", comment);

		RequestDispatcher dispatcher = request.getRequestDispatcher("comment_reply.jsp");
		dispatcher.forward(request, response);

	}

}
