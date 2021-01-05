package group1.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;

import group1.dto.BoardDTO;
import util.DBManager;

public class BoardDAO {

	private Connection con;
	private PreparedStatement ps;
	private ResultSet rs;

	private static BoardDAO instance;

	private BoardDAO() {
	}

	public static BoardDAO getInstance() {
		if (instance == null)
			instance = new BoardDAO();
		return instance;
	}

	public int getSeq() {
		int result = 1;

		try {
			con = DBManager.getConnection();

			StringBuffer sql = new StringBuffer();
			sql.append("SELECT BOARD_NUM.NEXTVAL FROM DUAL");

			ps = con.prepareStatement(sql.toString());

			rs = ps.executeQuery();

			if (rs.next())
				result = rs.getInt(1);

		} catch (Exception e) {
			throw new RuntimeException(e.getMessage());
		}

		DBManager.close(con,ps, rs);
		return result;
	}

	public boolean boardInsert(BoardDTO bDto) {
		boolean result = false;

		try {
			con = DBManager.getConnection();

			StringBuffer sql = new StringBuffer();
			sql.append("INSERT INTO BOARD");
			sql.append("(BOARD_NUM, BOARD_ID, BOARD_SUBJECT, BOARD_CONTENT, BOARD_FILE");
			sql.append(", BOARD_RE_REF, BOARD_COUNT, BOARD_DATE, BOARD_PARENT)");
			sql.append(" VALUES(?,?,?,?,?,?,?,sysdate,?)");

			int num = bDto.getBoard_num();
			int ref = bDto.getBoard_re_ref();
			int parent = bDto.getBoard_parent();

			if (parent == 0)
				ref = num;

			ps = con.prepareStatement(sql.toString());
			ps.setInt(1, num);
			ps.setString(2, bDto.getBoard_id());
			ps.setString(3, bDto.getBoard_subject());
			ps.setString(4, bDto.getBoard_content());
			ps.setString(5, bDto.getBoard_file());
			ps.setInt(6, ref);
			ps.setInt(7, bDto.getBoard_count());
			ps.setInt(8, parent);

			int flag = ps.executeUpdate();
			if (flag > 0) {
				result = true;
			}

		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			DBManager.close(con,ps, rs);
		}
		return result;
	}

	public ArrayList<BoardDTO> getBoardList(HashMap<String, Object> listOpt) {

		ArrayList<BoardDTO> list = new ArrayList<BoardDTO>();

		String opt = (String) listOpt.get("opt");
		String condition = (String) listOpt.get("condition");

		int start = (Integer) listOpt.get("start");

		try {

			con = DBManager.getConnection();
			StringBuffer sql = new StringBuffer();

			if (opt == null) {

				sql.append("SELECT * FROM");
				sql.append(" (SELECT  ROWNUM AS rnum, data.* FROM ");
				sql.append("	(SELECT LEVEL, BOARD_NUM, BOARD_ID,	BOARD_SUBJECT,");
				sql.append("			BOARD_CONTENT, BOARD_FILE,BOARD_COUNT,");
				sql.append("			BOARD_RE_REF, BOARD_PARENT, BOARD_DATE");
				sql.append("	FROM BOARD");
				sql.append("	START WITH BOARD_PARENT = 0");
				sql.append("	CONNECT BY PRIOR BOARD_NUM = BOARD_PARENT");
				sql.append("	ORDER SIBLINGS BY BOARD_RE_REF desc)");
				sql.append(" data) ");
				sql.append("WHERE rnum>=? and rnum<=?");

				ps = con.prepareStatement(sql.toString());
				ps.setInt(1, start);
				ps.setInt(2, start + 9);

				sql.delete(0, sql.toString().length());

			} else if (opt.equals("0")) // 제목
			{
				sql.append("SELECT * FROM");
				sql.append(" (SELECT  ROWNUM AS rnum, data.* FROM ");
				sql.append("	(SELECT LEVEL, BOARD_NUM, BOARD_ID,	BOARD_SUBJECT,");
				sql.append("			BOARD_CONTENT, BOARD_FILE,BOARD_COUNT,");
				sql.append("			BOARD_RE_REF, BOARD_PARENT, BOARD_DATE");
				sql.append("	FROM BOARD");
				sql.append(" 	WHERE BOARD_SUBJECT like ?");
				sql.append("	START WITH BOARD_PARENT = 0");
				sql.append("	CONNECT BY PRIOR BOARD_NUM = BOARD_PARENT");
				sql.append("	ORDER SIBLINGS BY BOARD_RE_REF desc)");
				sql.append(" data) ");
				sql.append("WHERE rnum>=? and rnum<=?");

				ps = con.prepareStatement(sql.toString());
				ps.setString(1, "%" + condition + "%");
				ps.setInt(2, start);
				ps.setInt(3, start + 9);

				sql.delete(0, sql.toString().length());
			} else if (opt.equals("1")) // 내용
			{
				sql.append("SELECT * FROM");
				sql.append(" (SELECT  ROWNUM AS rnum, data.* FROM ");
				sql.append("	(SELECT LEVEL, BOARD_NUM, BOARD_ID,	BOARD_SUBJECT,");
				sql.append("			BOARD_CONTENT, BOARD_FILE,BOARD_COUNT,");
				sql.append("			BOARD_RE_REF, BOARD_PARENT, BOARD_DATE");
				sql.append("	FROM BOARD");
				sql.append(" 	WHERE BOARD_CONTENT like ?");
				sql.append("	START WITH BOARD_PARENT = 0");
				sql.append("	CONNECT BY PRIOR BOARD_NUM = BOARD_PARENT");
				sql.append("	ORDER SIBLINGS BY BOARD_RE_REF desc)");
				sql.append(" data) ");
				sql.append("WHERE rnum>=? and rnum<=?");

				ps = con.prepareStatement(sql.toString());
				ps.setString(1, "%" + condition + "%");
				ps.setInt(2, start);
				ps.setInt(3, start + 9);

				sql.delete(0, sql.toString().length());
			} else if (opt.equals("2")) // 글쓴이
			{
				sql.append("SELECT * FROM");
				sql.append(" (SELECT  ROWNUM AS rnum, data.* FROM ");
				sql.append("	(SELECT LEVEL, BOARD_NUM, BOARD_ID,	BOARD_SUBJECT,");
				sql.append("			BOARD_CONTENT, BOARD_FILE,BOARD_COUNT,");
				sql.append("			BOARD_RE_REF, BOARD_PARENT, BOARD_DATE");
				sql.append("	FROM BOARD");
				sql.append(" 	WHERE BOARD_ID like ?");
				sql.append("	START WITH BOARD_PARENT = 0");
				sql.append("	CONNECT BY PRIOR BOARD_NUM = BOARD_PARENT");
				sql.append("	ORDER SIBLINGS BY BOARD_RE_REF desc)");
				sql.append(" data) ");
				sql.append("WHERE rnum>=? and rnum<=?");

				ps = con.prepareStatement(sql.toString());
				ps.setString(1, "%" + condition + "%");
				ps.setInt(2, start);
				ps.setInt(3, start + 9);

				sql.delete(0, sql.toString().length());
			}

			rs = ps.executeQuery();

			while (rs.next()) {

				BoardDTO bDto = new BoardDTO();
				bDto.setBoard_re_lev(rs.getInt("LEVEL"));
				bDto.setBoard_num(rs.getInt("BOARD_NUM"));
				bDto.setBoard_id(rs.getString("BOARD_ID"));
				bDto.setBoard_subject(rs.getString("BOARD_SUBJECT"));
				bDto.setBoard_content(rs.getString("BOARD_CONTENT"));
				bDto.setBoard_file(rs.getString("BOARD_FILE"));
				bDto.setBoard_count(rs.getInt("BOARD_COUNT"));
				bDto.setBoard_re_ref(rs.getInt("BOARD_RE_REF"));
				bDto.setBoard_parent(rs.getInt("BOARD_PARENT"));
				bDto.setBoard_date(rs.getDate("BOARD_DATE"));
				list.add(bDto);

			}

		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			DBManager.close(con,ps, rs);
		}

		return list;
	}

	public int getBoardListCount(HashMap<String, Object> listOpt) {
		int result = 0;
		String opt = (String) listOpt.get("opt");
		String condition = (String) listOpt.get("condition");

		try {
			con = DBManager.getConnection();
			StringBuffer sql = new StringBuffer();

			if (opt == null) {
				sql.append("select count(*) from BOARD");
				ps = con.prepareStatement(sql.toString());

				sql.delete(0, sql.toString().length());
			} else if (opt.equals("0")) {
				sql.append("select count(*) from BOARD where BOARD_SUBJECT like ?");
				ps = con.prepareStatement(sql.toString());
				ps.setString(1, '%' + condition + '%');

				sql.delete(0, sql.toString().length());
			} else if (opt.equals("1")) {
				sql.append("select count(*) from BOARD where BOARD_CONTENT like ?");
				ps = con.prepareStatement(sql.toString());
				ps.setString(1, '%' + condition + '%');

				sql.delete(0, sql.toString().length());
			} else if (opt.equals("2")) {
				sql.append("select count(*) from BOARD where BOARD_ID like ?");
				ps = con.prepareStatement(sql.toString());
				ps.setString(1, '%' + condition + '%');

				sql.delete(0, sql.toString().length());
			}

			rs = ps.executeQuery();
			if (rs.next())
				result = rs.getInt(1);

		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			DBManager.close(con,ps, rs);
		}

		return result;
	}

	public BoardDTO getDetail(int boardNum) {
		BoardDTO bDto = null;

		try {
			con = DBManager.getConnection();

			StringBuffer sql = new StringBuffer();
			sql.append("select * from BOARD where BOARD_NUM = ?");

			ps = con.prepareStatement(sql.toString());
			ps.setInt(1, boardNum);

			rs = ps.executeQuery();

			if (rs.next()) {
				bDto = new BoardDTO();
				bDto.setBoard_num(boardNum);
				bDto.setBoard_id(rs.getString("BOARD_ID"));
				bDto.setBoard_subject(rs.getString("BOARD_SUBJECT"));
				bDto.setBoard_content(rs.getString("BOARD_CONTENT"));
				bDto.setBoard_file(rs.getString("BOARD_FILE"));
				bDto.setBoard_count(rs.getInt("BOARD_COUNT"));
				bDto.setBoard_re_ref(rs.getInt("BOARD_RE_REF"));
				bDto.setBoard_date(rs.getDate("BOARD_DATE"));
				bDto.setBoard_parent(rs.getInt("BOARD_PARENT"));
			}

		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			DBManager.close(con,ps, rs);
		}

		return bDto;
	}

	public boolean updateCount(int boardNum) {
		boolean result = false;

		try {
			con = DBManager.getConnection();

			StringBuffer sql = new StringBuffer();
			sql.append("update BOARD set BOARD_COUNT = BOARD_COUNT+1 ");
			sql.append("where BOARD_NUM = ?");

			ps = con.prepareStatement(sql.toString());
			ps.setInt(1, boardNum);

			int flag = ps.executeUpdate();
			if (flag > 0) {
				result = true;
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			DBManager.close(con,ps, rs);
		}

		return result;
	}

	public String getFileName(int boardNum) {
		String fileName = null;

		try {
			con = DBManager.getConnection();

			StringBuffer sql = new StringBuffer();
			sql.append("SELECT BOARD_FILE from BOARD where BOARD_NUM=?");

			ps = con.prepareStatement(sql.toString());
			ps.setInt(1, boardNum);

			rs = ps.executeQuery();
			if (rs.next())
				fileName = rs.getString("BOARD_FILE");

		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			DBManager.close(con,ps, rs);
		}

		return fileName;
	}

	public boolean deleteBoard(int boardNum) {
		boolean result = false;

		try {
			con = DBManager.getConnection();

			StringBuffer sql = new StringBuffer();
			sql.append("DELETE FROM BOARD");
			sql.append(" WHERE BOARD_NUM IN");
			sql.append(" (SELECT BOARD_NUM");
			sql.append(" FROM BOARD");
			sql.append(" START WITH BOARD_NUM = ?");
			sql.append(" CONNECT BY PRIOR BOARD_NUM = BOARD_PARENT) ");

			ps = con.prepareStatement(sql.toString());
			ps.setInt(1, boardNum);

			int flag = ps.executeUpdate();
			if (flag > 0) {
				result = true;
			}

		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			DBManager.close(con,ps, rs);
		}

		return result;
	}

	public boolean updateBoard(BoardDTO bDto) {
		boolean result = false;

		try {
			con = DBManager.getConnection();

			StringBuffer sql = new StringBuffer();
			sql.append("UPDATE BOARD SET");
			sql.append(" BOARD_SUBJECT=?");
			sql.append(" ,BOARD_CONTENT=?");
			sql.append(" ,BOARD_FILE=?");
			sql.append(" ,BOARD_DATE=SYSDATE ");
			sql.append("WHERE BOARD_NUM=?");

			ps = con.prepareStatement(sql.toString());
			ps.setString(1, bDto.getBoard_subject());
			ps.setString(2, bDto.getBoard_content());
			ps.setString(3, bDto.getBoard_file());
			ps.setInt(4, bDto.getBoard_num());

			int flag = ps.executeUpdate();
			if (flag > 0) {
				result = true;
			}

		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			DBManager.close(con,ps, rs);
		}

		return result;
	}

}
