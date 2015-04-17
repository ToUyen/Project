package database;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectionDB {
	public static Connection getConnection() {
		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			Connection connection = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/ShopTrangSuc", "root", "");
			 System.out.println("Liên kết thành công!");
			return connection;
		} catch (Exception ex) {
			System.out.println("Database.getConnection() Error -->"
					+ ex.getMessage());
			return null;
		}
	}

	public static void close(Connection con) {
		try {
			con.close();
			System.out.println("Close Connection...");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static void main(String[] args) {
		System.out.println(getConnection());
	}
}
