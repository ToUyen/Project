package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import connection.ConnectionDB;

public class TheLoaiDao {
	public static int iddm = 0;
	public static int idtl = 0;
	public static PreparedStatement pstmt = null;
	public static ResultSet rs = null;

	public static void getIDDM(String tendm) {
		String search = "SELECT maDanhMucSach FROM danhmucsach WHERE tenDanhMucSach = '"
				+ tendm + "'";
		try {
			pstmt = ConnectionDB.getConnection().prepareStatement(search);
			rs = pstmt.executeQuery();
			rs.next();
			iddm = rs.getInt(1);
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	public static void getIDTL() {
		String search = "SELECT maLoaiSach FROM loaisach";
		try {
			pstmt = ConnectionDB.getConnection().prepareStatement(search);
			rs = pstmt.executeQuery();
			rs.last();
			idtl = rs.getInt(1) + 1;
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	public static void insertTheLoai(String tendm, String tentl) {
		getIDTL();
		getIDDM(tendm);
		String insert = "INSERT INTO loaisach(maLoaiSach,danhmucsachID,tenLoaiSach) values( ?, ?, ?);";
		try {
			pstmt = ConnectionDB.getConnection().prepareStatement(insert);
			pstmt.setInt(1, idtl);
			pstmt.setInt(2, iddm);
			pstmt.setString(3, tentl);
			pstmt.executeUpdate();
			System.out.println("insert" + iddm + "," + idtl);
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	public static void searchIDDM(String tendm) {
		iddm = 0;
		String search = "SELECT maDanhMucSach FROM danhmucsach WHERE tenDanhMucSach = '"
				+ tendm + "'";
		try {
			pstmt = ConnectionDB.getConnection().prepareStatement(search);
			rs = pstmt.executeQuery();
			rs.next();
			iddm = rs.getInt(1);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public static void updateTheLoai(int matl, String tendm, String tentl) {
		searchIDDM(tendm);
		System.out.println("iddm: "+iddm);
		String update = "UPDATE loaisach SET danhmucsachID = " + iddm
				+ ",tenLoaiSach = '" + tentl + "' WHERE maLoaiSach = " + matl;
		try {
			pstmt = ConnectionDB.getConnection().prepareStatement(update);
			pstmt.executeUpdate();
			System.out.println("update");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

	public static void deleteTheLoai(String tentl) {
		String delete = "DELETE FROM loaisach WHERE tenLoaiSach = '" + tentl
				+ "'";
		try {
			pstmt = ConnectionDB.getConnection().prepareStatement(delete);
			pstmt.executeUpdate();
			pstmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}
}
