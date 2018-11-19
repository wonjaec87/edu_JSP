package com.example.libs.controller;

import java.sql.SQLException;
import java.util.Vector;

import com.example.libs.model.GesipanDAO;
import com.example.libs.model.GesipanVO;

public class SelectController {
	public String selectPassword(int idx) {
		String dbpasswd = null;
		try {
			dbpasswd = GesipanDAO.selectPassword(idx);
		} catch (SQLException e) {
			System.out.println(e);
		}
		return dbpasswd;
	}
	public GesipanVO select(int idx) {
		GesipanVO gesipan = null;
		try {
			gesipan = GesipanDAO.select(idx);
		} catch (SQLException e) {
			System.out.println(e);
		}
		return gesipan;
	}
	public Vector<GesipanVO> selectAll(){
		Vector<GesipanVO> vector = null;
		try {
			vector = GesipanDAO.selectAll();
		} catch (SQLException e) {
			System.out.println(e);
		}
		return vector;
	}
}
