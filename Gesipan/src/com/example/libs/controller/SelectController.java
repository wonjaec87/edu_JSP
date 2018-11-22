package com.example.libs.controller;

import java.sql.SQLException;
import java.util.Vector;

import com.example.libs.model.GesipanDAO;
import com.example.libs.model.GesipanVO;

public class SelectController {
	public String getFilename(int idx) {
		String filename = null;
		try {
			filename = GesipanDAO.getFilename(idx);
		} catch (SQLException e) {
			System.out.println(e);
		}
		return filename;
	}
	public int getPageCount(int pageSize) {
		int pageCount = 0;
		try {
			pageCount = GesipanDAO.getPageCount(pageSize);
		} catch (SQLException e) {
			System.out.println(e);
		}
		return pageCount;
	}
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
	public Vector<GesipanVO> selectAll(int currentPage, int pageSize){
		Vector<GesipanVO> vector = null;
		try {
			vector = GesipanDAO.selectAll(currentPage, pageSize);
		} catch (SQLException e) {
			System.out.println(e);
		}
		return vector;
	}
}
