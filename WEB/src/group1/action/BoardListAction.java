package group1.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import group1.dao.BoardDAO;
import group1.dto.BoardDTO;

public class BoardListAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int spage = 1;
		String page = request.getParameter("page");

		if (page != null && !page.equals(""))
			spage = Integer.parseInt(page);

		String opt = request.getParameter("opt");
		String condition = request.getParameter("condition");

		HashMap<String, Object> listOpt = new HashMap<String, Object>();
		listOpt.put("opt", opt);
		listOpt.put("condition", condition);

		BoardDAO bDao = BoardDAO.getInstance();
		int listCount = bDao.getBoardListCount(listOpt);

		int maxPage = (int) (listCount / 10.0 + 0.9);

		if (spage > maxPage)
			spage = maxPage;
		listOpt.put("start", spage * 10 - 9);

		ArrayList<BoardDTO> list = bDao.getBoardList(listOpt);

		int startPage = (int) (spage / 5.0 + 0.8) * 5 - 4;

		int endPage = startPage + 4;
		if (endPage > maxPage)
			endPage = maxPage;

		request.setAttribute("spage", spage);
		request.setAttribute("maxPage", maxPage);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);

		request.setAttribute("list", list);
		
		
		System.out.println("startPage = " + startPage);
		System.out.println("endPage = " + endPage );
		System.out.println("maxPage = " + maxPage);

		RequestDispatcher dispatcher = request.getRequestDispatcher("board_list.jsp");
		dispatcher.forward(request, response);

	}

}
