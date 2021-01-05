package group1.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import group1.dao.ImageDAO;
import group1.dao.PointDAO;
import group1.dto.ImageDTO;

public class ShopFormAction implements Action{

	@SuppressWarnings("unused")
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session=null;
		ArrayList<ImageDTO> list = new ArrayList<ImageDTO>();
		ImageDAO iDao = ImageDAO.getInstance();
		
		if(session==null)
		session = request.getSession();
		
		String id = (String) session.getAttribute("sessionID");
		String useimg = (String) session.getAttribute("image");
		PointDAO pDao = PointDAO.getInstance();
		int memberPoint = pDao.getPoint(id);
		
		
	
		list = iDao.getAllImage();
		System.out.println("imglist");
		
		request.setAttribute("memberPoint", memberPoint);
		request.setAttribute("useImg", useimg);
		request.setAttribute("list", list);

		
		RequestDispatcher dispatcher = request.getRequestDispatcher("shop.jsp");
		dispatcher.forward(request, response);
		
		
	}

}
