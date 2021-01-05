package group1.action.game;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import group1.action.Action;
import group1.game.dao.LOLRecordDAO;
import group1.game.dto.ChampionDTO;
import group1.game.dto.LOL_DTO;
import group1.game.dto.ScoreDTO;
import group1.game.dto.gameProfileDTO;
import group1.game.dto.gameRecordDTO;

public class LOLRecordAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		LOLRecordDAO grDao = LOLRecordDAO.getInstance();

		gameProfileDTO profile = new gameProfileDTO();

		ArrayList<gameRecordDTO> list = new ArrayList<gameRecordDTO>();

		String nickname = request.getParameter("nickname");

		profile = grDao.getGameProfileList("LOL", nickname);
		list = grDao.getGameRecordList("LOL", nickname);

		ArrayList<LOL_DTO> LOL_List = new ArrayList<LOL_DTO>();
		ArrayList<ChampionDTO> champ_List = new ArrayList<ChampionDTO>();
		ArrayList<ScoreDTO> score_List = new ArrayList<ScoreDTO>();

		LOL_List = grDao.getLOLRecord(nickname);
		champ_List = grDao.getLOLChamp("LOL");
		score_List = grDao.getScoreList("LOL");
		
		ArrayList<String> champimg = null;

		champimg = grDao.getChampImg("LOL");

		request.setAttribute("profile", profile);
		request.setAttribute("record", list);
		request.setAttribute("lol_record", LOL_List);
		request.setAttribute("champ", champ_List);
		request.setAttribute("score", score_List);
		request.setAttribute("img", champimg);
		
		request.setAttribute("nickname", nickname);

		RequestDispatcher dis = request.getRequestDispatcher("lol.jsp");
		dis.forward(request, response);

	}

}
