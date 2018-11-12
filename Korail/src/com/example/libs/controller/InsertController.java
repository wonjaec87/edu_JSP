package com.example.libs.controller;

import java.sql.SQLException;

import com.example.libs.model.KorailDAO;
import com.example.libs.model.KorailDTO;

public class InsertController { 
	public int insert(KorailDTO ko) { //이거 useBean에서 사용 할거야. 그래서 static안씀
		int row = 0;
		try {
			row = KorailDAO.insert(ko);
		} catch (SQLException e) {
			System.out.println(e);
		}
		return row;
	}
}
