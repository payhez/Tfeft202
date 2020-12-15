package com.intecon.sample.tfeft202.data;

import java.sql.*;

import com.intecon.sample.tfeft202.data.ConnectionBuilder;

public class ConnectionBuilder {
	private final String USERNAME = "root";
	private final String PASSWORD = "root";
	private final String DB_NAME ="trialdb";
	private final String DRIVER = "com.mysql.jdbc.Driver";
	private final String URL = "jdbc:mysql://localhost:3306/"+DB_NAME+"?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC&user="+USERNAME+ "&password=" +PASSWORD+"";
	private final Connection singleConn = connect();
	
	private Connection connect() {
		
		try {
			Class.forName(DRIVER);
		} catch (Exception e) {
			System.out.println(e);
		}
		
		Connection conn = null;
		
		try {
			conn= DriverManager.getConnection(URL);
		} catch (Exception e) {
			System.out.println(e);

		}
		if (conn == null) {
			System.out.println("No Connection!");
		}
		return conn;
	}
	
	public Connection getConnection() {
		return this.singleConn;
	}
}
