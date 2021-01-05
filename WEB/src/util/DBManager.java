package util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


public class DBManager {
	public static Connection getConnection() {
		Connection conn=null;
		try {
			Context iniContext = (Context) new InitialContext();
			Context envContext=(Context) iniContext.lookup("java:/comp/env");
			DataSource ds=(DataSource) envContext.lookup("jdbc/myoracle");
			conn=ds.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
		
	}
	//select 수행
	public static void close(Connection con,PreparedStatement ps,ResultSet rs) {
		try {
			if(rs!=null)rs.close();
			if(ps!=null)ps.close();
			if(con!=null)con.close();
		} catch (Exception e) {
			
		}
	}
	//insert, update, delete 수행 
	public static void close(Connection con, PreparedStatement st) {
		try {
			if(st!=null)st.close();
			if(con!=null)con.close();
		} catch (Exception e) {
			
		}
	}
	/*
	 * public static void close(Connection con, PreparedStatement ps) { try {
	 * if(ps!=null)ps.close(); if(con!=null)con.close(); } catch (Exception e) {
	 * 
	 * } }
	 * 
	 * public static void close(Connection con, PreparedStatement ps, ResultSet rs)
	 * { try { if(rs!=null)rs.close(); if(ps!=null)ps.close();
	 * if(con!=null)con.close(); } catch (Exception e) {
	 * 
	 * } }
	 */
	}
