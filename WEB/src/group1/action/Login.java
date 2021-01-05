package group1.action;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import group1.dao.ImageDAO;
import group1.dao.MembersDAO;
import group1.dao.PointDAO;

public class Login implements Action {

	public void values() {
	}

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// String path="/login_fail.jsp";

		HttpSession session = request.getSession();

		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		//

		MembersDAO mDao = MembersDAO.getInstance();

		int check = mDao.idCheck(id, pwd);
		System.out.println("Login : id/pw -" + id + "/" + pwd);

		if (check == 0) {

			request.setAttribute("fail", "0");
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
			dispatcher.forward(request, response);

		} else if (check == -1) {

			request.setAttribute("fail", "-1");

			RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
			dispatcher.forward(request, response);
			
		} else {

			PointDAO pDao = PointDAO.getInstance();
			Calendar cal = Calendar.getInstance();

			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
			String temp = sdf.format(cal.getTime());

			int loginTime = Integer.parseInt(temp);
			System.out.println("loginTime : " + loginTime);
			int loggedTime = pDao.getLoggedTime(id);
			System.out.println("login.do LoggedTime : " + loggedTime);

			System.out.println("IF LOGGED");
			if (loggedTime == 0 || loginTime > loggedTime) {
				System.out.println("Add Point");
				pDao.AddPoint(id);
				System.out.println("Set Time");
				pDao.setLoginTime(loginTime, id);
			}

			int point = pDao.getPoint(id);
			System.out.println("USE POINT : " + point);
			
			int admin = mDao.getAdmin(id);
			System.out.println("관리자 : " + admin);
				
			String imgno = mDao.getImage(id);
			ImageDAO iDao = ImageDAO.getInstance();

			String imgFileName = iDao.getImgFile(imgno);
			
			if(admin == 1)
				session.setAttribute("admin", admin);
			
			request.setAttribute("point", point);
			session.setAttribute("sessionID", id);
			session.setAttribute("image", imgFileName);

			/*
			 * RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
			 * dispatcher.forward(request, response);
			 */

			response.sendRedirect("index.do");
			
		}

	}

}
