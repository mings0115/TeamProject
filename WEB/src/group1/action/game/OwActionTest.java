package group1.action.game;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import group1.action.Action;
import group1.game.dao.LOLRecordDAO;
import group1.game.dao.OWRecordDAO;
import group1.game.dto.ChampionDTO;
import group1.game.dto.OW_DTO;
import group1.game.dto.ScoreDTO;
import group1.game.dto.gameProfileDTO;
import group1.game.dto.gameRecordDTO;

public class OwActionTest implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		OWRecordDAO owDao = OWRecordDAO.getInstance();
		
		LOLRecordDAO DAO = LOLRecordDAO.getInstance();
		
		gameProfileDTO profile = new gameProfileDTO();
		
		ArrayList<gameRecordDTO> list = new ArrayList<gameRecordDTO>();
		
		String nickname = request.getParameter("nickname");
		
		profile = DAO.getGameProfileList("OVERWATCH", nickname);
		list = DAO.getGameRecordList("OVERWATCH", nickname);

		ArrayList<OW_DTO> OW_List = new ArrayList<OW_DTO>();
		ArrayList<ChampionDTO> champ_List = new ArrayList<ChampionDTO>();
		ArrayList<ScoreDTO> score_List = new ArrayList<ScoreDTO>();
		
		OW_List = owDao.getOWRecord(nickname);
		champ_List = owDao.getOWChamp("OVERWATCH");
		score_List = owDao.getScoreList("OVERWATCH");
		
		ArrayList<String> champimg = null;
		
		champimg = owDao.getChampImg("OVERWATCH");
		
		System.out.println("n:"+ nickname);
		
		request.setAttribute("profile", profile);
		request.setAttribute("record", list);
		request.setAttribute("ow_record", OW_List);
		request.setAttribute("champ", champ_List);
		request.setAttribute("score", score_List);
		request.setAttribute("img", champimg);
		
		request.setAttribute("nickname", nickname);

	
		RequestDispatcher dispatcher = request.getRequestDispatcher("overwatch.jsp");
		dispatcher.forward(request, response);
	}
	
}
