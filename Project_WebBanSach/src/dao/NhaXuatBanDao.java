package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import connection.ConnectionDB;

public class NhaXuatBanDao {
	public static PreparedStatement pstmt = null;
	public static ResultSet rs = null;

	public static void insertNXB(String tennxb) {
		String insert = "INSERT INTO nhaxuatban(tenNhaXuatBan) values('"
				+ tennxb + "');";
		try {
			pstmt = ConnectionDB.getConnection().prepareStatement(insert);
			pstmt.executeUpdate();
			pstmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	public static void updateNXB(int manxb, String tennxb) {
		String update = "UPDATE  nhaxuatban SET tenNhaXuatBan ='" + tennxb
				+ "' WHERE maNhaXuatBan = " + manxb;
		try {
			pstmt = ConnectionDB.getConnection().prepareStatement(update);
			pstmt.executeUpdate();
			pstmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public static void deleteNXB(String tennxb) {
		String insert = "DELETE FROM nhaxuatban WHERE tenNhaXuatBan = '"
				+ tennxb + "';";
		try {
			pstmt = ConnectionDB.getConnection().prepareStatement(insert);
			pstmt.executeUpdate();
			pstmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}
}
