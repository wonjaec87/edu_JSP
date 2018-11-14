package com.example.libs.model;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

public class MemberDAO {
	
	public static int updateMember(MemberVO member) throws SQLException{
		Connection conn = DBConnection.getConnection("member");
		String sql = "{ call member_update(?,?,?,?,?) }";
		CallableStatement cstmt = conn.prepareCall(sql);
		cstmt.setString(1, member.getUserid());
		cstmt.setString(2, member.getEmail());
		cstmt.setString(3, member.getZipcode());
		cstmt.setString(4, member.getAddress1());
		cstmt.setString(5, member.getAddress2());
		int row = cstmt.executeUpdate();
		if(cstmt != null) cstmt.close();
		DBClose.close(conn);
		return row;
	}
		
	public static int deleteMember(String userid) throws SQLException{
		Connection conn = DBConnection.getConnection("member");
		String sql = "{ call member_delete(?) }";
		CallableStatement cstmt = conn.prepareCall(sql);
		cstmt.setString(1, userid);
		int row = cstmt.executeUpdate();
		if(cstmt != null) cstmt.close();
		DBClose.close(conn);
		return row;
	}
	public static MemberVO selectMember(String userid) throws SQLException{
		Connection conn = DBConnection.getConnection("member");
		String sql = "{ call member_select(?,?) }";
		CallableStatement cstmt = conn.prepareCall(sql);
		cstmt.setString(1, userid);
		cstmt.registerOutParameter(2, oracle.jdbc.OracleTypes.CURSOR);
		cstmt.executeUpdate();
		ResultSet rs = (ResultSet)cstmt.getObject(2);
		rs.next();
		MemberVO member = new MemberVO(rs.getString("username"), 
				rs.getString("userid"), rs.getString("passwd"), 
				rs.getString("email"), rs.getString("zipcode"),
				rs.getString("address1"), rs.getString("address2"));
		if(rs != null)  rs.close();
		if(cstmt != null) cstmt.close();
		DBClose.close(conn);
		return member;
	}
	//-1:No Account, 0 : Not Equals Password, 1 : All Success
	public static int loginMember(String userid, String passwd) throws SQLException{
		Connection conn = DBConnection.getConnection("member");
		String sql = "{ call member_login(?,?) }";
		CallableStatement cstmt = conn.prepareCall(sql);
		cstmt.setString(1, userid);
		cstmt.registerOutParameter(2, oracle.jdbc.OracleTypes.CURSOR);
		cstmt.executeUpdate();
		ResultSet rs = (ResultSet)cstmt.getObject(2);
		int row = -1;
		if(!rs.next())  row = -1;  //계정 없음.
		else {   //일단 계정은 있다.
			if(passwd.trim().equals(rs.getString("passwd").trim())) {
				row = 1;  //모두 일치
			}else row = 0;   //비밀번호 불일치
		}
		if(rs != null)  rs.close();
		if(cstmt != null) cstmt.close();
		DBClose.close(conn);
		return row;
	}
	public static int insertMember(MemberVO member) throws SQLException{
		Connection conn = DBConnection.getConnection("member"); //member.jocl
		String sql = "{ call member_insert(?,?,?,?,?,?,?) }";
		CallableStatement cstmt = conn.prepareCall(sql);
		cstmt.setString(1, member.getUserid());
		cstmt.setString(2, member.getPasswd());
		cstmt.setString(3, member.getUsername());
		cstmt.setString(4, member.getEmail());
		cstmt.setString(5, member.getZipcode());
		cstmt.setString(6, member.getAddress1());
		cstmt.setString(7, member.getAddress2());
		int row = cstmt.executeUpdate();
		if(cstmt != null) cstmt.close();
		DBClose.close(conn);
		return row;
	}
}
