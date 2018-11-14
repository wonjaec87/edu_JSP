package com.example.libs.controller;

import java.sql.SQLException;

import com.example.libs.model.MemberDAO;

public class DeleteController {
	public int deleteMember(String userid) {
		int row = -1;
		try {
			row = MemberDAO.deleteMember(userid);
		} catch (SQLException e) {
			System.out.println(e);
		}
		return row;
	}
}
