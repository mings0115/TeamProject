package group1.action;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import group1.dao.BoardDAO;

public class BoardDeleteAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		BoardDAO bDao = BoardDAO.getInstance();

		String num = request.getParameter("num");
		int boardNum = Integer.parseInt(num);

		String fileName = bDao.getFileName(boardNum);

		boolean result = bDao.deleteBoard(boardNum);

		if (fileName != null) {
			String folder = request.getServletContext().getRealPath("Upload");
			String filePath = folder + "/" + fileName;

			File file = new File(filePath);
			if (file.exists())
				file.delete();
		}

		if (result) {
			response.sendRedirect("board_list.do");
		}

	}

}
