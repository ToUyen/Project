package database;

import java.sql.DriverManager;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

public class Connec {
	private static Connection connection = null;
	private static final String HOST = "localhost:3306";
	private static final String DB = "shtrangsuc";
	private static final String USER = "root";
	private static final String PASS = "";

	public static Connection conn() throws Exception {
		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			return DriverManager.getConnection("jdbc:mysql://" + HOST + "/"
					+ DB, USER, PASS);
		} catch (ClassNotFoundException e) {
			System.out.println("Liên kết thất bại");
			throw e;
		} catch (SQLException e) {
			System.out.println("Liên kết thất bại");
			throw e;
		}
	}

	public static Connection getConnection() {
		try {
			if ((connection == null) || connection.isClosed()) {
				connection = conn();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return connection;
	}

	public static Statement connect() throws ClassNotFoundException,
			SQLException {
		if (connection == null || connection.isClosed()) {
			Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/shtrangsuc", "root", "");
			System.out.println("Liên kết Thành công");
			return connection.createStatement();
		} else {
			System.out.println("Liên kết Thành công");
			return connection.createStatement();
		}

	}

	public static void closeConnection(Connection con) {
		if (con != null) {
			try {
				con.close();
				System.out.println("Close Connection...");
			} catch (SQLException ex) {
				ex.printStackTrace();
			}
		}
	}

	public static void main(String[] args) throws Exception {
		try {
			getConnection();
			connect();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
