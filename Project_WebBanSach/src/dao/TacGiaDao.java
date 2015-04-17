package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import connection.ConnectionDB;

public class TacGiaDao {
	public static Connection con = null;
	public static PreparedStatement pstmt = null;
	public static ResultSet rs = null;

	public static void insertTacGia(String tentg) {
		String search = "SELECT count(id) FROM tacgia where tentacgia =?";
		try {
			pstmt = ConnectionDB.getConnection().prepareStatement(search);
			rs = pstmt.executeQuery();
			rs.next();
			int count = rs.getInt(1);
			if (count == 0) {

			} else {

			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public static void updateTacGia(int matacgia,String tentg) {
		String update = "UPDATE tacgia SET tentacgia = '" + tentg
				+ "' WHERE matacgia= ?";
		try {
			pstmt = ConnectionDB.getConnection().prepareStatement(update);
			pstmt.setInt(1, matacgia);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public static void deleteTacGia(String tentg) {
		String delete = "DELETE FROM tacgia WHERE tentacgia = ?";
		try {
			pstmt = ConnectionDB.getConnection().prepareStatement(delete);
			pstmt.setString(1, tentg);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

}
