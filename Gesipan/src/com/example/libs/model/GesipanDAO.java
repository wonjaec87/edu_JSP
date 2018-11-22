package com.example.libs.model;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Types;
import java.util.Vector;

public class GesipanDAO {
	public static String getFilename(int idx) throws SQLException{
		Connection conn = DBConnection.getConnection();
		String sql = "{call board_select_filename(?,?)}";
		CallableStatement cstmt = conn.prepareCall(sql);
		cstmt.setInt(1, idx);
		cstmt.registerOutParameter(2, Types.VARCHAR);
		cstmt.executeUpdate();
		String filename = cstmt.getString(2);
		if(cstmt != null) cstmt.close();
		DBClose.close(conn);
		return filename;
	}
	public static int getPageCount(int pageSize) throws SQLException{
		Connection conn = DBConnection.getConnection();
		String sql = "SELECT COUNT(idx) FROM Gesipan";
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		rs.next();
		int count = rs.getInt(1);   //총 레코드 갯수
		int pageCount = (count % pageSize == 0) ? count / pageSize : 
			                                    count / pageSize + 1;
		if(rs != null) rs.close();
		if(stmt != null) stmt.close();
		DBClose.close(conn);
		return pageCount;
	}
	//답 글 입력시 사용할 insert
	public static int insertReply(GesipanVO gesipan) throws SQLException{
		Connection conn = DBConnection.getConnection();
		String sql = "{ call board_insert(?,?,?,?,?,?,?,?,?) }";
		CallableStatement cstmt = conn.prepareCall(sql);
		cstmt.setString(1, gesipan.getName());
		cstmt.setString(2, gesipan.getPasswd());
		cstmt.setString(3, gesipan.getEmail());
		cstmt.setString(4, gesipan.getTitle());
		cstmt.setString(5, gesipan.getContents());
		cstmt.setString(6, gesipan.getFilename());
		cstmt.setInt(7, gesipan.getGrp());  
		cstmt.setInt(8, gesipan.getLev());  
		cstmt.setInt(9, gesipan.getStep());  
		int row = cstmt.executeUpdate();
		if(cstmt != null) cstmt.close();
		DBClose.close(conn);
		return row;
	}
	public static void updateStep(int grp, int  step) throws SQLException{
		Connection conn = DBConnection.getConnection();
		String sql = "{ call board_update_step(?, ?) }";
		CallableStatement cstmt = conn.prepareCall(sql);
		cstmt.setInt(1, grp);
		cstmt.setInt(2, step);
		cstmt.executeUpdate();
		if(cstmt != null) cstmt.close();
		DBClose.close(conn);
	}
	public static int update(GesipanVO gesipan) throws SQLException{
		Connection conn = DBConnection.getConnection();
		String sql = "{ call board_update(?, ?, ?, ?) }";
		CallableStatement cstmt = conn.prepareCall(sql);
		cstmt.setString(1, gesipan.getEmail());
		cstmt.setString(2, gesipan.getTitle());
		cstmt.setString(3, gesipan.getContents());
		cstmt.setInt(4, gesipan.getIdx());
		int row = cstmt.executeUpdate();
		if(cstmt != null) cstmt.close();
		DBClose.close(conn);
		return row;
	}
	
	public static String selectPassword(int idx) throws SQLException {
		Connection conn = DBConnection.getConnection();
		String sql = "{ call board_select_passwd(?, ?) }";
		CallableStatement cstmt = conn.prepareCall(sql);
		cstmt.setInt(1, idx);
		cstmt.registerOutParameter(2, Types.VARCHAR);
		cstmt.executeUpdate();
		String dbpasswd = cstmt.getString(2);
		if(cstmt != null) cstmt.close();
		DBClose.close(conn);
		return dbpasswd;
	}
	public static int delete(int idx) throws SQLException{
		Connection conn = DBConnection.getConnection();
		String sql = "{ call board_delete(?) }";
		CallableStatement cstmt = conn.prepareCall(sql);
		cstmt.setInt(1, idx);
		int row = cstmt.executeUpdate();
		if(cstmt != null) cstmt.close();
		DBClose.close(conn);
		return row;
	}
	
	
	//조회수 증가
	public static void readnumUpdate(int idx) throws SQLException{
		Connection conn = DBConnection.getConnection();
		String sql = "{ call board_readnum_update(?) }";
		CallableStatement cstmt = conn.prepareCall(sql);
		cstmt.setInt(1, idx);
		cstmt.executeUpdate();
		if(cstmt != null) cstmt.close();
		DBClose.close(conn);
	}
	public static GesipanVO select(int idx) throws SQLException{
		Connection conn = DBConnection.getConnection();
		String sql = "{ call board_select(?, ?) }";
		CallableStatement cstmt = conn.prepareCall(sql);
		cstmt.setInt(1, idx);
		cstmt.registerOutParameter(2, oracle.jdbc.OracleTypes.CURSOR);
		cstmt.executeUpdate();   //매우 중요.
		ResultSet rs = (ResultSet)cstmt.getObject(2);
		rs.next();
		GesipanVO gesipan = new GesipanVO();
		gesipan.setName(rs.getString("name"));
		gesipan.setEmail(rs.getString("email"));
		gesipan.setTitle(rs.getString("title"));
		gesipan.setContents(rs.getString("contents"));
		gesipan.setWritedate(rs.getDate("writedate"));
		gesipan.setReadnum(rs.getInt("readnum"));
		gesipan.setFilename(rs.getString("filename"));
		gesipan.setGrp(rs.getInt("grp"));
		gesipan.setLev(rs.getInt("lev"));
		gesipan.setStep(rs.getInt("step"));
		if(rs != null) rs.close();
		if(cstmt != null) cstmt.close();
		DBClose.close(conn);
		return gesipan;
	}
	public static Vector<GesipanVO> selectAll(int currentPage, int pageSize) throws SQLException{
		Connection conn = DBConnection.getConnection();
		String sql = "{ call board_selectAll(?) }";
		CallableStatement cstmt = conn.prepareCall(sql);
		cstmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR);
		cstmt.executeUpdate();   //매우 중요
		ResultSet rs = (ResultSet)cstmt.getObject(1);
		Vector<GesipanVO> vector = new Vector<GesipanVO>(1,1);
		int start = (currentPage - 1) * pageSize;
		if(!rs.next() && start == 0) {   //현재 한 개의 글이라도 없다면
			vector = null;
		}else {
			for(int i = 0 ; i < start ; i++) rs.next();
			int count = 0;
			do {
				GesipanVO gesipan = new GesipanVO();
				gesipan.setIdx(rs.getInt("idx"));
				gesipan.setName(rs.getString("name"));
				gesipan.setEmail(rs.getString("email"));
				gesipan.setTitle(rs.getString("title"));
				gesipan.setWritedate(rs.getDate("writedate"));
				gesipan.setReadnum(rs.getInt("readnum"));
				gesipan.setFilename(rs.getString("filename"));
				gesipan.setGrp(rs.getInt("grp"));
				gesipan.setLev(rs.getInt("lev"));
				gesipan.setStep(rs.getInt("step"));
				vector.addElement(gesipan);
				count++;
			}while(rs.next() && count < pageSize);
		}
		if(rs != null) rs.close();
		if(cstmt != null) cstmt.close();
		DBClose.close(conn);
		return vector;
	}
	//새로운 글 입력시 사용할 insert
	public static int insert(GesipanVO gesipan) throws SQLException{
		Connection conn = DBConnection.getConnection();
		String sql = "{ call board_insert(?,?,?,?,?,?,?,?,?) }";
		CallableStatement cstmt = conn.prepareCall(sql);
		cstmt.setString(1, gesipan.getName());
		cstmt.setString(2, gesipan.getPasswd());
		cstmt.setString(3, gesipan.getEmail());
		cstmt.setString(4, gesipan.getTitle());
		cstmt.setString(5, gesipan.getContents());
		cstmt.setString(6, gesipan.getFilename());
		cstmt.setInt(7, 0);  //0
		cstmt.setInt(8, 0);  //0
		cstmt.setInt(9, 0);  //0
		cstmt.executeUpdate();
		sql = "SELECT MAX(idx) FROM Gesipan";
		ResultSet rs = cstmt.executeQuery(sql);
		rs.next();
		int max = rs.getInt(1);  //방금 입력한 idx값
		sql = "UPDATE Gesipan SET grp = " + max + " WHERE idx = " + max;
		int row = cstmt.executeUpdate(sql);
		if(cstmt != null) cstmt.close();
		DBClose.close(conn);
		return row;
	}
}

