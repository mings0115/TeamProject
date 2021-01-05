package group1.action;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import group1.dao.BoardDAO;
import group1.dto.BoardDTO;

public class BoardWriteAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int fileSize = 5 * 1024 * 1024;

		String uploadPath = request.getServletContext().getRealPath("/Upload");

		try {

			MultipartRequest multi = new MultipartRequest(request, uploadPath, fileSize, "UTF-8",
					new DefaultFileRenamePolicy());

			String fileName = "";

			Enumeration<String> names = multi.getFileNames();

			if (names.hasMoreElements()) {
				String name = names.nextElement();
				fileName = multi.getFilesystemName(name);
			}

			BoardDAO bDao = BoardDAO.getInstance();
			BoardDTO bDto = new BoardDTO();

			bDto.setBoard_num(bDao.getSeq());
			bDto.setBoard_id(multi.getParameter("board_id"));
			bDto.setBoard_subject(multi.getParameter("board_subject"));
			bDto.setBoard_content(multi.getParameter("board_content"));
			bDto.setBoard_file(fileName);

			boolean result = bDao.boardInsert(bDto);

			// if(result)

			response.sendRedirect("board_list.do");

			/*
			 * RequestDispatcher dispatcher = request.getRequestDispatcher("");
			 * dispatcher.forward(request, response);
			 */

		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

	}

}
