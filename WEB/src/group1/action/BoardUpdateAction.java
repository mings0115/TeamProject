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

public class BoardUpdateAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String pageNum = request.getParameter("page");

		int fileSize = 5 * 1024 * 1024;

		String uploadPath = request.getServletContext().getRealPath("/Upload");

		try {
			MultipartRequest multi = new MultipartRequest(request, uploadPath, fileSize, "UTF-8",
					new DefaultFileRenamePolicy());

			int num = Integer.parseInt(multi.getParameter("board_num"));
			System.out.println("Update:" + num);
			String subject = multi.getParameter("board_subject");
			String content = multi.getParameter("board_content");
			String existFile = multi.getParameter("existing_file");

			BoardDTO bDto = new BoardDTO();
			bDto.setBoard_num(num);
			bDto.setBoard_subject(subject);
			bDto.setBoard_content(content);

			Enumeration<String> fileNames = multi.getFileNames();
			if (fileNames.hasMoreElements()) {
				String fileName = fileNames.nextElement();
				String updateFile = multi.getFilesystemName(fileName);

				if (updateFile == null)
					bDto.setBoard_file(existFile);
				else
					bDto.setBoard_file(updateFile);
			}

			BoardDAO dao = BoardDAO.getInstance();
			boolean result = dao.updateBoard(bDto);

			if (result) {
				response.setCharacterEncoding("UTF-8");
				response.setContentType("text/html; charset=UTF-8");
				response.sendRedirect("BoardDetailAction.do?num=" + num + "&pageNum=" + pageNum);
			}

		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
	}
}
