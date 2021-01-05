package group1.game.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import group1.game.dto.ChampionDTO;
import group1.game.dto.LOL_DTO;
import group1.game.dto.ScoreDTO;
import group1.game.dto.gameProfileDTO;
import group1.game.dto.gameRecordDTO;
import util.DBManager;

public class LOLRecordDAO {
	private static LOLRecordDAO instance = null;

	private LOLRecordDAO() {
	}

	public static LOLRecordDAO getInstance() {

		if (instance == null) {
			instance = new LOLRecordDAO();
		}
		return instance;
	}

	public gameProfileDTO getGameProfileList(String gamename, String nickname) {

		gameProfileDTO gpDto = new gameProfileDTO();
		String sql = "select * from GAME_PROFILE WHERE GAMENAME=? AND NICKNAME=?";

		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {

			con = DBManager.getConnection();
			ps = con.prepareStatement(sql);

			ps.setString(1, gamename);
			ps.setString(2, nickname);

			rs = ps.executeQuery();

			if (rs.next()) {
				gpDto.setGamename(rs.getString("gamename"));
				gpDto.setProfileno(rs.getInt("profileno"));
				gpDto.setRecordno(rs.getInt("recordno"));
				gpDto.setP_rank(rs.getString("p_rank"));
				gpDto.setP_level(rs.getString("p_level"));
				gpDto.setNickname(rs.getString("nickname"));
				gpDto.setRankname(rs.getString("rankname"));
				gpDto.setScore1(rs.getString("score1"));
				gpDto.setScore2(rs.getString("score2"));
				gpDto.setScore3(rs.getString("score3"));
			}

		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			DBManager.close(con, ps, rs);
		}

		return gpDto;
	}

	public ArrayList<gameRecordDTO> getGameRecordList(String gamename, String nickname) {

		gameRecordDTO grDto = null;
		ArrayList<gameRecordDTO> list = new ArrayList<gameRecordDTO>();
		String sql = "select * from GAME_RECORD WHERE GAMENAME=? AND NICKNAME=?";

		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {

			con = DBManager.getConnection();
			ps = con.prepareStatement(sql);

			ps.setString(1, gamename);
			ps.setString(2, nickname);

			rs = ps.executeQuery();

			while (rs.next()) {

				grDto = new gameRecordDTO();
				grDto.setRecordno(rs.getInt("recordno"));
				grDto.setStartdate(rs.getDate("startdate"));
				grDto.setDamage(rs.getInt("damage"));
				grDto.setScore(rs.getInt("score"));
				grDto.setResult(rs.getInt("result"));
				grDto.setMvp(rs.getInt("mvp"));
				grDto.setGametype(rs.getString("gametype"));
				grDto.setChamp(rs.getString("champion"));

				list.add(grDto);
			}

		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			DBManager.close(con, ps, rs);
		}

		return list;
	}

	public ArrayList<LOL_DTO> getLOLRecord(String nickname) {

		LOL_DTO lolDto = null;
		ArrayList<LOL_DTO> list = new ArrayList<LOL_DTO>();

		String sql = "SELECT * FROM LOL WHERE RECORDNO IN (SELECT RECORDNO FROM GAME_RECORD WHERE NICKNAME=?) ";

		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {

			con = DBManager.getConnection();
			ps = con.prepareStatement(sql);

			ps.setString(1, nickname);

			rs = ps.executeQuery();
			
			while (rs.next()) {

				lolDto = new LOL_DTO();
				lolDto.setChampname(rs.getString("champname"));
				lolDto.setCs(rs.getInt("cs"));
				lolDto.setSpell1(rs.getString("spell1"));
				System.out.println(rs.getString("spell1"));
				lolDto.setSpell2(rs.getString("spell2"));
				lolDto.setProperty1(rs.getString("property1"));
				lolDto.setProperty2(rs.getString("property2"));

				list.add(lolDto);
			}

		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			DBManager.close(con, ps, rs);
		}

		return list;

	}

	public ArrayList<ChampionDTO> getLOLChamp(String gamename) {

		ArrayList<ChampionDTO> list = new ArrayList<ChampionDTO>();
		String sql = "SELECT * FROM CHAMPION WHERE CHAMPNAME IN (SELECT CHAMPION FROM GAME_RECORD WHERE GAMENAME=?)";

		ChampionDTO cDto = null;

		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {

			con = DBManager.getConnection();
			ps = con.prepareStatement(sql);

			ps.setString(1, gamename);

			rs = ps.executeQuery();

			while (rs.next()) {
				cDto = new ChampionDTO();

				cDto.setChampname(rs.getString("champname"));
				System.out.println(rs.getString("champname"));
				cDto.setChamptype1(rs.getString("champtype1"));
				System.out.println(rs.getString("champtype1"));
				cDto.setChamptype2(rs.getString("champtype2"));
				System.out.println(rs.getString("champimg"));
				cDto.setChampimg(rs.getInt("champimg"));

				list.add(cDto);

			}

		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			DBManager.close(con, ps, rs);
		}

		return list;

	}

	public ArrayList<String> getChampImg(String gamename) {

		String sql = "SELECT CHAMPIMG FROM CHAMPIMG WHERE CHAMPIMGNO IN"
				+ "(SELECT CHAMPIMG FROM CHAMPION WHERE CHAMPNAME IN"
				+ "(SELECT CHAMPION FROM GAME_RECORD WHERE GAMENAME=?))";
		ArrayList<String> list = new ArrayList<String>();

		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		String champimg = "";

		try {
			con = DBManager.getConnection();
			ps = con.prepareStatement(sql);

			ps.setString(1, gamename);

			rs = ps.executeQuery();

			while (rs.next()) {
				champimg = rs.getString("champimg");
				System.out.println(champimg);
				list.add(champimg);
			}

		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			DBManager.close(con, ps, rs);
		}

		return list;

	}

	public ArrayList<ScoreDTO> getScoreList(String gamename) {

		ArrayList<ScoreDTO> list = new ArrayList<ScoreDTO>();
		ScoreDTO sDto = null;

		String sql = "SELECT * FROM SCORE WHERE SCORENO IN"
				+ " (SELECT SCORE FROM GAME_RECORD WHERE GAMENAME=?)";

		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {

			con = DBManager.getConnection();
			ps = con.prepareStatement(sql);

			ps.setString(1, gamename);

			rs = ps.executeQuery();

			while (rs.next()) {

				sDto = new ScoreDTO();

				sDto.setKill(rs.getInt("kill"));
				sDto.setDeath(rs.getInt("death"));
				sDto.setAssist(rs.getInt("assist"));

				list.add(sDto);
			}

		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			DBManager.close(con, ps, rs);
		}

		return list;

	}

}
