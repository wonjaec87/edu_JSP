package com.example.libs.controller;

import java.sql.SQLException;

import com.example.libs.model.MemberDAO;
import com.example.libs.model.MemberVO;

public class SelectController {
	public MemberVO selectMember(String userid) {
		MemberVO member = null;
		try {
			member = MemberDAO.selectMember(userid);
		}catch(SQLException ex) {
			System.out.println(ex);
		}
		return member;
	}
	public int loginMember(String userid, String passwd) {
		int flag = -1;
		try {
			flag = MemberDAO.loginMember(userid, passwd);
			System.out.println(flag);
		}catch(SQLException ex) {
			System.out.println(ex);
		}
		return flag;
	}
}
