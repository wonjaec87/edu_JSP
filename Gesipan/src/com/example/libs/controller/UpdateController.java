package com.example.libs.controller;

import java.sql.SQLException;

import com.example.libs.model.GesipanDAO;
import com.example.libs.model.GesipanVO;

public class UpdateController {
	public void updateStep(int grp, int step) {
		try {
			GesipanDAO.updateStep(grp, step);
		} catch (SQLException e) {
			System.out.println(e);
		}
	}
	public int update(GesipanVO gesipan) {
		int row = 0;
		try {
			row = GesipanDAO.update(gesipan);
		} catch (SQLException e) {
			System.out.println(e);
		}
		return row;
	}
	public void readnumUpdate(int idx) {
		try {
			GesipanDAO.readnumUpdate(idx);
		}catch(SQLException ex) {
			System.out.println(ex);
		}
	}
}
