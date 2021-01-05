package group1.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import group1.dao.MembersDAO;
import group1.dto.MembersDTO;

public class Account implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path = "/login.jsp";

		MembersDTO memberDTO = new MembersDTO();
		// System.out.println("request : "+request.getParameter("id"));
		memberDTO.setId(request.getParameter("id"));
		// System.out.println(memberDTO.getId());
		memberDTO.setPwd(request.getParameter("pwd"));
		memberDTO.setName(request.getParameter("name"));
		memberDTO.setEmail1(request.getParameter("email1"));
		memberDTO.setEmail2(request.getParameterValues("email2")[0]);
		memberDTO.setPhone(request.getParameter("phone"));

		MembersDAO memberDAO = MembersDAO.getInstance();
		memberDAO.insetMember(memberDTO);

		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		dispatcher.forward(request, response);
	}

}
