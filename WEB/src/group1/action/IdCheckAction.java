package group1.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import group1.dao.MembersDAO;

public class IdCheckAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String id = request.getParameter("id");
		MembersDAO mDao = MembersDAO.getInstance();
		
		System.out.println("check..");
		boolean result = mDao.confirmID(id);
		System.out.println("check : "+result);
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();

			if(result)	out.println("0");
			else		out.println("1");
		
		out.close();
		
	}

}
