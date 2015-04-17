package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import database.*;

public class DatHangDao {
	static Connection con = ConnectionDB.getConnection();
	static PreparedStatement pstmt;
	static ResultSet rs;

	public static int maxID() {
		int count = 0;
		String sql = "SELECT MAX(MAKH) as maxid FROM khachhang";
		try {
			con = ConnectionDB.getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				count = rs.getInt("maxid");

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}

	public boolean themDH(String maKH, String diaDiem, String tenNgNhan) {
		try {
			String sql = "INSERT INTO donhang(MAKH, ĐIAIEMGH, TENNGUOINHAN) "
					+ "values(?,?,?)";

			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, maKH);
			pstmt.setString(2, diaDiem);
			pstmt.setString(3, tenNgNhan);
			pstmt.executeUpdate();
			pstmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return true;

	}

	public boolean themDHCT(int maSP, int soLuong, double donGia, String idDH) {
		try {
			String sql = "INSERT INTO ctdonhang (MASP, TENSP, SOLUONG, DONGIA)"
					+ "values(?,?,?,?)";

			PreparedStatement pre = con.prepareStatement(sql);
			pre.setInt(1, maSP);
			pre.setInt(2, soLuong);
			pre.setDouble(3, donGia);
			pre.setString(4, idDH);
			pre.executeUpdate();
			pre.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return true;

	}

	public String getDH(String maKH) {
		String id = "";
		List<String> list = new ArrayList<String>();
		try {
			String sql = "Select MADH from donhang where MAKH =?";

			PreparedStatement pre = con.prepareStatement(sql);
			pre.setString(1, maKH);
			ResultSet rs = pre.executeQuery();
			while (rs.next()) {
				id = rs.getString(1);
				list.add(id);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return list.get(list.size() + 1); // lay idDH cuoi cung trong list
		// 1 khach hang co the co nh don hang, moi lan them don hang thi trong
		// csdl them vao sau,
		// do do don hang hien tai la lay don hang cuoi cung trong db

	}
}
