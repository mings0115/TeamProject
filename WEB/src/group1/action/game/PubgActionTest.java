package group1.action.game;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import group1.action.Action;
import group1.game.dao.LOLRecordDAO;
import group1.game.dao.PUBGRecordDAO;
import group1.game.dto.ChampionDTO;
import group1.game.dto.PUBG_DTO;
import group1.game.dto.ScoreDTO;
import group1.game.dto.gameProfileDTO;
import group1.game.dto.gameRecordDTO;

public class PubgActionTest implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	PUBGRecordDAO puDao = PUBGRecordDAO.getInstance();
		
		LOLRecordDAO DAO = LOLRecordDAO.getInstance();
		
		gameProfileDTO profile = new gameProfileDTO();
		
		ArrayList<gameRecordDTO> list = new ArrayList<gameRecordDTO>();
		
		String nickname = request.getParameter("nickname");
		
		profile = DAO.getGameProfileList("PUBG", nickname);
		list = DAO.getGameRecordList("PUBG", nickname);

		ArrayList<PUBG_DTO> PUBG_List = new ArrayList<PUBG_DTO>();
		ArrayList<ChampionDTO> champ_List = new ArrayList<ChampionDTO>();
		ArrayList<ScoreDTO> score_List = new ArrayList<ScoreDTO>();
		
		PUBG_List = puDao.getPUBGRecord(nickname);
		champ_List = puDao.getPUBGChamp("PUBG");
		score_List = puDao.getScoreList("PUBG");
		
		ArrayList<String> champimg = null;
		
		champimg = puDao.getChampImg("PUBG");
		
		System.out.println("n:"+ nickname);
		
		request.setAttribute("profile", profile);
		request.setAttribute("record", list);
		request.setAttribute("pu_record", PUBG_List);
		request.setAttribute("champ", champ_List);
		request.setAttribute("score", score_List);
		request.setAttribute("img", champimg);
		
		request.setAttribute("nickname", nickname);

	
		RequestDispatcher dispatcher = request.getRequestDispatcher("pubg.jsp");
		dispatcher.forward(request, response);
	}
	

}
