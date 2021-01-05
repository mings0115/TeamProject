package group1.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import group1.dto.MembersDTO;
import util.DBManager;

public class PointDAO {

	MembersDTO mDto = new MembersDTO();

	private PointDAO() {
	}

	private static PointDAO instance = null;

	public static PointDAO getInstance() {
		if (instance == null)
			instance = new PointDAO();

		return instance;
	}

	public void AddPoint(String id) {

		String sql = "update members set point = point+100 where id=?";
		
		Connection con = null;
		PreparedStatement ps = null;
		
		try {

			con = DBManager.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, id);

			ps.executeUpdate();

		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			DBManager.close(con, ps);
		}

	}

	public void SubtractionPoint(int point, String id) {

		String sql = "update members set point=? where id=?";

		String value = Integer.toString(point);
		
		Connection con = null;
		PreparedStatement ps = null;

		try {

			con = DBManager.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, value);
			ps.setString(2, id);

			ps.executeUpdate();

		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			DBManager.close(con, ps);
		}

	}

	public void setLoginTime(int loginTime, String id) {

		String sql = "update members set loggeddate = ? where id = ?";
		
		Connection con = null;
		PreparedStatement ps = null;

		try {

			con = DBManager.getConnection();
			ps = con.prepareStatement(sql);

			String temp = Integer.toString(loginTime);

			ps.setString(1, temp);
			ps.setString(2, id);

			ps.executeUpdate();

		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			DBManager.close(con, ps);
		}

	}

	public int getLoggedTime(String id) {

		int result = 0;
		String sql = "select loggeddate from members where id=?";
		
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {

			con = DBManager.getConnection();
			ps = con.prepareStatement(sql);

			ps.setString(1, id);
			rs = ps.executeQuery();

			if (rs.next()) {
				String temp = rs.getString("loggeddate");

				result = Integer.parseInt(temp);
			}

			System.out.println("loggedDate : " + result);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			DBManager.close(con,ps ,rs);
		}

		return result;
	}

	public int getPoint(String id) {

		int result = 0;
		String sql = "select point from members where id=?";
		String date="";
		
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {

			con = DBManager.getConnection();
			ps = con.prepareStatement(sql);

			ps.setString(1, id);
			rs = ps.executeQuery();

			if (rs.next()) {
				date = rs.getString("point");
			}
			
			result = Integer.parseInt(date);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			DBManager.close(con, ps, rs);
		}

		return result;
	}

}
