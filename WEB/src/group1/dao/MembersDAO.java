package group1.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import group1.dto.MembersDTO;
import util.DBManager;

public class MembersDAO {
	private Connection con = null;
	private PreparedStatement ps = null;
	private ResultSet rs = null;

	private MembersDAO() {
	}

	private static MembersDAO instance = null;

	public static MembersDAO getInstance() {
		if (instance == null)
			instance = new MembersDAO();

		return instance;
	}

	public boolean confirmID(String id) {
		boolean result = false;
		try {
			String sql = "SELECT id FROM members WHERE id=?";
			con = DBManager.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();

			if (rs.next())
				result = true;
			else
				result = false;

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(con, ps, rs);
		}
		return result;
	}

	public String getImage(String id) {
		String fileName = null;
		try {
			String sql = "SELECT image FROM members WHERE id=?";
			con = DBManager.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();

			if (rs.next()) {
				fileName = rs.getString("image");
			}

			
			System.out.println(fileName);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(con, ps, rs);
		}
		
		return fileName;
	}
	
	public void setImage(String imgno,String id) {
		
		String sql = "UPDATE members SET image=? WHERE id=?";

		
		try {
			
			con=DBManager.getConnection();
			ps = con.prepareStatement(sql);

			ps.setString(1, imgno);
			ps.setString(2, id);

			ps.executeUpdate();
			
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}finally {
			DBManager.close(con, ps);
		}
		
	}

	public ArrayList<MembersDTO> getAllMember(String id) {
		
		ArrayList<MembersDTO> list = new ArrayList<MembersDTO>();
		MembersDTO mDto = null;
		try {
			String sql = "SELECT * FROM members WHERE id=?";
			con = DBManager.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, id);

			rs = ps.executeQuery();
			

			if (rs.next()) {
				String email = rs.getString("email");
				int idx = email.indexOf("@");
				String email1 = email.substring(0,idx);
				String email2 = email.substring(idx+1);
				
				mDto = new MembersDTO();
				mDto.setNo(rs.getInt("no"));
				mDto.setId(rs.getString("id"));
				mDto.setPwd(rs.getString("pwd"));
				mDto.setName(rs.getString("name"));
				mDto.setEmail1(email1);
				mDto.setEmail2(email2);
				mDto.setPoint(rs.getString("point"));
				mDto.setImage(rs.getString("image"));
				mDto.setPhone(rs.getString("phone"));
				mDto.setIndate(rs.getTimestamp("indate"));
				
				list.add(mDto);

			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(con, ps, rs);
		}
		return list;
	}

	public int insetMember(MembersDTO memberDTO) {
		int result = 0;
		try {
			String sql = "insert into members(no,id,pwd,name,email,phone) values(NO_SEQ.nextval,?,?,?,?,?)";
			con = DBManager.getConnection();
			ps = con.prepareStatement(sql);

			System.out.println(memberDTO.getId());

			ps.setString(1, memberDTO.getId());
			ps.setString(2, memberDTO.getPwd());
			ps.setString(3, memberDTO.getName());
			ps.setString(4, memberDTO.getEmail1()+"@"+memberDTO.getEmail2());
			ps.setString(5, memberDTO.getPhone());

			ps.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(con, ps);
		}
		return result;
	}

	public int idCheck(String id, String pwd) {
		int result = -1;
		try {
			String sql = "select pwd from members where id=?";
			con = DBManager.getConnection();
			ps = con.prepareStatement(sql);

			ps.setString(1, id);

			rs = ps.executeQuery();

			if (rs.next()) {
				if (rs.getString("pwd") != null && rs.getString("pwd").equals(pwd)) {
					result = 1;
				} else {
					result = 0;
				}
			} else
				result = -1;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(con, ps, rs);
		}
		return result;
	}

	/*
	 * public void deleteData(String id) {
	 * 
	 * try { String sql="DELETE members WHERE id=?"; con=DBManager.getConnection();
	 * ps=con.prepareStatement(sql);
	 * 
	 * ps.setString(1, id);
	 * 
	 * ps.executeUpdate();
	 * 
	 * } catch (Exception e) { e.printStackTrace(); }finally { DBManager.close(con,
	 * ps); }
	 * 
	 * }
	 */

	public boolean deleteData(String id) {
		boolean bool = false;
		int result;
		try {
			String sql = "DELETE members WHERE id=?";
			con = DBManager.getConnection();
			ps = con.prepareStatement(sql);

			ps.setString(1, id);
			result = ps.executeUpdate();

			if (result > 0)
				bool = true;

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(con, ps);
		}
		return bool;
	}

	public int updateMember(MembersDTO dto) {
		int result = -1;
		try {
			System.out.println("dao");
			String sql = "UPDATE members SET name=?, eamil=?, phone=?  WHERE pwd=?";
			con = DBManager.getConnection();
			ps = con.prepareStatement(sql);
			System.out.println("dao2");

			/* ps.setString(1, dto.getPwd()); */
			ps.setString(1, dto.getName());
			ps.setString(2, dto.getEmail1()+"@"+dto.getEmail2());
			ps.setString(3, dto.getPhone());
			/* ps.setString(6, dto.getId()); */
			ps.setString(4, dto.getPwd());
			System.out.println("dao3");

			ps.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(con, ps);
		}
		System.out.println("dao4");

		return result;
	}
	
	public int getAdmin(String id) {
		
		int result=0;
		
		String sql = "select admin from members where admin > 0 and id = ?";
		
		
		try {
			
			con=DBManager.getConnection();
			ps=con.prepareStatement(sql);
			
			ps.setString(1, id);
			
			rs=ps.executeQuery();
			
			if(rs.next()) {
				result = 1;
			}else {
				result = 0;
			}
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			DBManager.close(con, ps, rs);
		}
		
		return result;
		
	}


	/*
	 * public boolean updateMember(MembersDTO dto) { boolean bool= false; try {
	 * String
	 * sql="UPDATE members SET id=?, pwd=?, name=?, email1=?, email2=?, phone=?";
	 * con=DBManager.getConnection(); ps=con.prepareStatement(sql);
	 * 
	 * ps.setString(1, dto.getId()); ps.setString(2, dto.getPwd()); ps.setString(3,
	 * dto.getName()); ps.setString(4, dto.getEmail1()); ps.setString(5,
	 * dto.getEmail2()); ps.setString(6, dto.getPhone());
	 * 
	 * if(ps.executeUpdate() >0) bool=true;
	 * 
	 * } catch (Exception e) { e.printStackTrace(); }finally { DBManager.close(con,
	 * ps); } return bool; }
	 */

}
