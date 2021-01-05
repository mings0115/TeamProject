package group1.game.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import group1.game.dto.ChampionDTO;
import group1.game.dto.PUBG_DTO;
import group1.game.dto.ScoreDTO;
import util.DBManager;

public class PUBGRecordDAO {
	
	private static PUBGRecordDAO instance = null;

	private PUBGRecordDAO() {}

	public static PUBGRecordDAO getInstance() {

		if (instance == null) {
			instance = new PUBGRecordDAO();
		}
		return instance;
	}
	
	public ArrayList<PUBG_DTO> getPUBGRecord(String nickname) {

		PUBG_DTO puDto = null;
		ArrayList<PUBG_DTO> list = new ArrayList<PUBG_DTO>();

		String sql = "SELECT * FROM PUBG WHERE RECORDNO IN (SELECT RECORDNO FROM GAME_RECORD WHERE NICKNAME=?) ";

		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {

			con = DBManager.getConnection();
			ps = con.prepareStatement(sql);

			ps.setString(1, nickname);

			rs = ps.executeQuery();

			while (rs.next()) {
				
				puDto = new PUBG_DTO();
					
				puDto.setAccuracyrate(rs.getString("accuracyrate"));
				puDto.setDrive(rs.getString("drive"));
				puDto.setWalking(rs.getString("walking"));
				puDto.setRanking(rs.getString("ranking"));
					
				list.add(puDto);
				 
			}

		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			DBManager.close(con, ps, rs);
		}

		return list;
	}

	
	
	public ArrayList<ChampionDTO> getPUBGChamp(String gamename) {
		

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
				cDto.setChamptype2(rs.getString("champtype2"));
				cDto.setChampimg(rs.getInt("champimg"));
					System.out.println(rs.getString("champimg"));

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

		}  catch (Exception e) {
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
				System.out.println("kill :"+rs.getInt("kill"));
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
