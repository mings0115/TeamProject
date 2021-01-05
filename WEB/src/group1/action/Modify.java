package group1.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import group1.dao.MembersDAO;
import group1.dto.MembersDTO;

public class Modify implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String path = "/index.jsp";

		MembersDTO memberDTO = new MembersDTO();

		memberDTO.setId(request.getParameter("id"));
		memberDTO.setPwd(request.getParameter("pwd"));
		memberDTO.setName(request.getParameter("name"));
		memberDTO.setEmail1(request.getParameter("email1"));
		memberDTO.setEmail2(request.getParameter("email2"));
		memberDTO.setPhone(request.getParameter("phone"));

		MembersDAO memberDAO = MembersDAO.getInstance();
		System.out.println("modify");
		memberDAO.updateMember(memberDTO);

		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		dispatcher.forward(request, response);

	}

}
