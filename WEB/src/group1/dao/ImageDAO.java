package group1.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import group1.dto.ImageDTO;
import util.DBManager;

public class ImageDAO {

	private static ImageDAO instance = null;

	private ImageDAO() {
	}

	public static ImageDAO getInstance() {

		if (instance == null)
			instance = new ImageDAO();

		return instance;
	}

	public ArrayList<ImageDTO> getAllImage() {

		String sql = "select * from image";
		ArrayList<ImageDTO> list = new ArrayList<ImageDTO>();
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;


		try {
			con = DBManager.getConnection();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();

			while (rs.next()) {

				ImageDTO iDto = new ImageDTO();

				iDto.setImgno(rs.getString("imgno"));
				iDto.setImgfile(rs.getString("imgfile"));
				iDto.setImgname(rs.getString("imgname"));
				iDto.setImgcontent(rs.getString("imgcontent"));
				iDto.setImgpoint(rs.getString("imgpoint"));

				list.add(iDto);
			}

			System.out.println("img list ON");

		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			DBManager.close(con, ps, rs);
		}

		return list;

	}

	public String getImgFile(String imgno) {

		String sql = "select imgfile from image where imgno = ?";
		String imgfile = "";
		
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {

			con = DBManager.getConnection();
			ps = con.prepareStatement(sql);

			ps.setString(1, imgno);

			rs = ps.executeQuery();

			if (rs.next())
				imgfile = rs.getString("imgfile");

			System.out.println("imgFile :" + imgfile);

		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			DBManager.close(con, ps, rs);
		}

		return imgfile;
	}

	public String getImgPoint(String imgno) {

		String sql = "select imgpoint from image where imgno = ?";
		String point = "";
		
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {

			con = DBManager.getConnection();
			ps = con.prepareStatement(sql);

			ps.setString(1, imgno);

			rs = ps.executeQuery();

			if (rs.next()) {
				point = rs.getString("imgpoint");
			}

			System.out.println("imgPoint :" + point);

		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			DBManager.close(con, ps, rs);
		}

		return point;
	}
}
