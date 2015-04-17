package connection;

import java.sql.Connection;

import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.naming.InitialContext;

public class ConnectionDB {
	private static Connection connection = null;
	private static final String HOST = "localhost";
	private static final String DB = "webbansach?useUnicode=true&characterEncoding=utf-8";
	private static final String USER = "root";
	private static final String PASS = "";//123456789";

	//hàm liên kết database, connection
	public static Connection conn() throws Exception {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			return DriverManager.getConnection("jdbc:mysql://" + HOST +"/" + DB, USER, PASS);
		} catch (ClassNotFoundException e) {
			System.out.println("Liên kết thất bại");
			throw e;
		} catch (SQLException e) {
			System.out.println("Liên kết thất bại");
			throw e;
		}
	}
	
	// hàm lấy ra đối tượng connection
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

	// hàm gọi connect với statement....tương tự hàm conn().....chỉ thêm cái statement
	public static Statement connect() throws ClassNotFoundException,
			SQLException {
		if (connection == null || connection.isClosed()) {
			Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager
					.getConnection(
							"jdbc:mysql://localhost:3306/webbansach?useUnicode=true&characterEncoding=utf-8",
							"root", "");
			System.out.println("Liên kết thành công");
			return connection.createStatement();
		} else {
			System.out.println("Liên kết thất bại");
			return connection.createStatement();
		}

	}
	// hàm đóng connection
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
		conn();
	}

}
