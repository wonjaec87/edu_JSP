package com.example.libs.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
	public static Connection getConnection(String poolName) throws SQLException {
		return DriverManager.getConnection(
			"jdbc:apache:commons:dbcp:/"+poolName);
	}
}
