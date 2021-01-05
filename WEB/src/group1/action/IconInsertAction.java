package group1.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import group1.dao.ImageDAO;
import group1.dao.MembersDAO;
import group1.dao.PointDAO;

public class IconInsertAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session=null;
		if(session == null)
		session = request.getSession(false);

		String sessionID = (String) session.getAttribute("sessionID");

		MembersDAO mDao = MembersDAO.getInstance();
		ImageDAO iDao = ImageDAO.getInstance(); // 객체호출
		PointDAO pDao = PointDAO.getInstance();

		String ShopImgno = request.getParameter("imgno"); // 이미지번호 호출

		int point = pDao.getPoint(sessionID);	// 보유 포인트 호출
		int imgPoint = Integer.parseInt(iDao.getImgPoint(ShopImgno)); // 스트링(varchar2) 타입으로 지정해둔 값 형변환
											// 상품 포인트값 호출부분

		point -= imgPoint;
		System.out.println("resultPoint : " + point);
		pDao.SubtractionPoint(point, sessionID);
		mDao.setImage(ShopImgno, sessionID);
		
		
		session.removeAttribute("image"); // 기존 세션 제거
		String imgFileName = iDao.getImgFile(ShopImgno); // 지정해줄 이미지 파일 이름 호출
		session.setAttribute("image", imgFileName); // 제거 후 새로운 세션값 지정

	
		RequestDispatcher dispatcher = request.getRequestDispatcher("Shop.do");
		dispatcher.forward(request, response);
	}

}