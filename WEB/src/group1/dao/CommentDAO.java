package group1.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import group1.dto.CommentDTO;
import util.DBManager;

public class CommentDAO {
	private Connection con;
	private PreparedStatement ps;
	private ResultSet rs;

	private static CommentDAO instance;

	private CommentDAO() {
	}

	public static CommentDAO getInstance() {
		if (instance == null)
			instance = new CommentDAO();
		return instance;
	}

	public int getSeq() {
		int result = 1;
		try {
			con = DBManager.getConnection();

			StringBuffer sql = new StringBuffer();
			sql.append("SELECT COMMENT_SEQ.NEXTVAL FROM DUAL");

			ps = con.prepareStatement(sql.toString());
			rs = ps.executeQuery();

			if (rs.next())
				result = rs.getInt(1);

		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			DBManager.close(con, ps, rs);
		}

		return result;
	}

	public boolean insertComment(CommentDTO comment) {
		boolean result = false;

		try {
			con = DBManager.getConnection();

			StringBuffer sql = new StringBuffer();
			sql.append("INSERT INTO BOARD_COMMENT");
			sql.append(" (COMMENT_NUM, COMMENT_BOARD, COMMENT_ID, COMMENT_DATE");
			sql.append(" , COMMENT_PARENT, COMMENT_CONTENT)");
			sql.append(" VALUES(?,?,?,sysdate,?,?)");

			ps = con.prepareStatement(sql.toString());
			ps.setInt(1, comment.getComment_num());
			ps.setInt(2, comment.getComment_board());
			ps.setString(3, comment.getComment_id());
			ps.setInt(4, comment.getComment_parent());
			ps.setString(5, comment.getComment_content());

			int flag = ps.executeUpdate();
			if (flag > 0) {
				result = true;
			}

		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			DBManager.close(con, ps, rs);
		}
		return result;
	}

	public ArrayList<CommentDTO> getCommentList(int boardNum) {
		ArrayList<CommentDTO> list = new ArrayList<CommentDTO>();

		try {
			con = DBManager.getConnection();

			/*
			 * ����� ������ ó���� �ϰ�ʹٸ� �� ������ ����ϸ� �ȴ�. SELECT * FROM (SELECT ROWNUM
			 * AS rnum, data.* FROM (SELECT LEVEL, COMMENT_NUM, COMMENT_BOARD, COMMENT_ID,
			 * COMMENT_DATE, COMMENT_PARENT, COMMENT_CONTENT FROM BOARD_COMMENT WHERE
			 * COMMENT_BOARD = ? START WITH COMMENT_PARENT = 0 CONNECT BY PRIOR COMMENT_NUM
			 * = COMMENT_PARENT) data) WHERE rnum>=? and rnum<=? ;
			 */

			StringBuffer sql = new StringBuffer();
			sql.append("	SELECT LEVEL, COMMENT_NUM, COMMENT_BOARD,");
			sql.append("			COMMENT_ID, COMMENT_DATE,");
			sql.append("			COMMENT_PARENT, COMMENT_CONTENT");
			sql.append("	FROM BOARD_COMMENT");
			sql.append("	WHERE COMMENT_BOARD = ?");
			sql.append("	START WITH COMMENT_PARENT = 0");
			sql.append("	CONNECT BY PRIOR COMMENT_NUM = COMMENT_PARENT");

			ps = con.prepareStatement(sql.toString());
			ps.setInt(1, boardNum);

			rs = ps.executeQuery();
			while (rs.next()) {
				CommentDTO comment = new CommentDTO();
				comment.setComment_level(rs.getInt("LEVEL"));
				comment.setComment_num(rs.getInt("COMMENT_NUM"));
				comment.setComment_board(rs.getInt("COMMENT_BOARD"));
				comment.setComment_id(rs.getString("COMMENT_ID"));
				comment.setComment_date(rs.getDate("COMMENT_DATE"));
				comment.setComment_parent(rs.getInt("COMMENT_PARENT"));
				comment.setComment_content(rs.getString("COMMENT_CONTENT"));
				list.add(comment);
			}

		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			DBManager.close(con, ps, rs);
		}
		return list;
	}

	public CommentDTO getComment(int comment_num) {
		CommentDTO comment = null;

		try {
			con = DBManager.getConnection();

			StringBuffer sql = new StringBuffer();
			sql.append("SELECT * FROM BOARD_COMMENT WHERE COMMENT_NUM = ?");

			ps = con.prepareStatement(sql.toString());
			ps.setInt(1, comment_num);

			rs = ps.executeQuery();
			while (rs.next()) {
				comment = new CommentDTO();
				comment.setComment_num(rs.getInt("COMMENT_NUM"));
				comment.setComment_board(rs.getInt("COMMENT_BOARD"));
				comment.setComment_id(rs.getString("COMMENT_ID"));
				comment.setComment_date(rs.getDate("COMMENT_DATE"));
				comment.setComment_parent(rs.getInt("COMMENT_PARENT"));
				comment.setComment_content(rs.getString("COMMENT_CONTENT"));
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			DBManager.close(con, ps, rs);
		}
		return comment;
	}

	public boolean deleteComment(int comment_num) {
		boolean result = false;

		try {
			con = DBManager.getConnection();

			StringBuffer sql = new StringBuffer();
			sql.append("DELETE FROM BOARD_COMMENT");
			sql.append(" WHERE COMMENT_NUM IN");
			sql.append(" (SELECT COMMENT_NUM");
			sql.append(" FROM BOARD_COMMENT");
			sql.append(" START WITH COMMENT_NUM = ?");
			sql.append(" CONNECT BY PRIOR COMMENT_NUM = COMMENT_PARENT) ");

			ps = con.prepareStatement(sql.toString());
			ps.setInt(1, comment_num);

			int flag = ps.executeUpdate();
			if (flag > 0) {
				result = true;
			}

		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			DBManager.close(con, ps, rs);
		}
		return result;
	}

	public boolean updateComment(CommentDTO comment) {
		boolean result = false;

		try {
			con = DBManager.getConnection();

			StringBuffer sql = new StringBuffer();
			sql.append("UPDATE BOARD_COMMENT SET");
			sql.append(" COMMENT_CONTENT = ?");
			sql.append(" WHERE COMMENT_NUM = ?");

			ps = con.prepareStatement(sql.toString());
			ps.setString(1, comment.getComment_content());
			ps.setInt(2, comment.getComment_num());

			int flag = ps.executeUpdate();
			if (flag > 0) {
				result = true;
			}

		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			DBManager.close(con, ps, rs);
		}

		return result;
	}

}
