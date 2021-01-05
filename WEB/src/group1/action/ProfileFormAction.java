package group1.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import group1.dao.ImageDAO;
import group1.dao.MembersDAO;
import group1.dto.MembersDTO;

public class ProfileFormAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		ArrayList<MembersDTO> list = new ArrayList<MembersDTO>();
		MembersDAO mDao = MembersDAO.getInstance();
		ImageDAO iDao = ImageDAO.getInstance();

		HttpSession session = request.getSession();

		String id = (String) session.getAttribute("sessionID");
		System.out.println("id = " + id);

		list = mDao.getAllMember(id);
		
		String temp = mDao.getImage(id);
		String imgFileName = iDao.getImgFile(temp);
		
		
		
		request.setAttribute("img", imgFileName);
		request.setAttribute("list", list);

		RequestDispatcher dispatcher = request.getRequestDispatcher("form/ProfileForm.jsp");
		dispatcher.forward(request, response);

	}

}
