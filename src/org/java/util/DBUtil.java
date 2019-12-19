package org.java.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DBUtil {
	
	public DBUtil() {
	}
	public static Connection getConnection() {
		String url="jdbc:mysql://localhost:3306/lovewall?useSSL=true&useLegacyDatetimeCode=false&serverTimezone=America/New_York&useUnicode=true&characterEncoding=utf-8";
		Connection con=null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (java.lang.ClassNotFoundException e) {		}
		try {
			
			con=DriverManager.getConnection(url, "root", "root");
			
		} catch (Exception e) {		}
		return con;
	}
	public static void close(Connection connection) {
		try {
			if (connection != null) {
				connection.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public static void close(PreparedStatement preparedStatement) {
		try {
			if (preparedStatement != null) {
				preparedStatement.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public static void close(ResultSet resultSet) {
		try {
			if (resultSet != null) {
				resultSet.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
