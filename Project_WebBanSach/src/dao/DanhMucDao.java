package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import connection.ConnectionDB;

public class DanhMucDao {
	public static PreparedStatement pstmt = null;
	public static ResultSet rs = null;

	public static void insertDanhMuc(String tendm) {
		String insert = "INSERT INTO danhmucsach(tenDanhMucSach) values('"
				+ tendm + "')";
		try {
			pstmt = ConnectionDB.getConnection().prepareStatement(insert);
			pstmt.executeUpdate();
			pstmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public static void updateDanhMuc(int madm, String tendm) {
		String update = "UPDATE danhmucsach SET tenDanhMucSach = '" + tendm
				+ "' WHERE maDanhMucSach = " + madm;
		try {
			pstmt = ConnectionDB.getConnection().prepareStatement(update);
			pstmt.executeUpdate();
			pstmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	public static void deleteDanhMuc(String tendm) {
		String delete = "DELETE FROM danhmucsach WHERE tenDanhMucSach ='"
				+ tendm + "'";
		try {
			pstmt = ConnectionDB.getConnection().prepareStatement(delete);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
