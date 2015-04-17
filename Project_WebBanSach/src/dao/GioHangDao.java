package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.LinkedList;
import java.util.List;

import connection.ConnectionDB;

import entity.GioHang;

public class GioHangDao {
	public static List<GioHang> listproduct;
	static PreparedStatement pstmt = null;
	static ResultSet rs = null;

	public GioHangDao() {
		listproduct = new ArrayList<GioHang>();
	}

	public static List<GioHang> getListproduct() {
		return listproduct;
	}

	public static int getIDKH(String tenKH) throws SQLException {
		String search = "SELECT id FROM khachhang WHERE tenkhachhang = ?";
		pstmt = ConnectionDB.getConnection().prepareStatement(search);
		pstmt.setString(1, tenKH);
		rs = pstmt.executeQuery();
		rs.next();
		int id = rs.getInt(1);
		return id;

	}

	public static void insertProductToGioHang(String tenKH) {
		try {
			int id = getIDKH(tenKH);
			for (GioHang g : listproduct) {
				String tensach = g.getTensach();
				String hinhsach = g.getHinhsach();
				int gia = g.getGia();
				int soluong = g.getSoluong();
				int tongtien = gia * soluong;
				String check = "SELECT count(*) FROM giohang WHERE khachhangID = '"
						+ id + "' AND tensach = '" + tensach + "'";
				String insert = "INSERT INTO giohang(khachhangID,tensach,hinhsach,gia,soluong,tongtien) VALUES(?, ?, ?, ?, ?, ?)";
				String update = "UPDATE giohang SET soluong =" + soluong
						+ ",tongtien = " + tongtien + " WHERE khachhangID = "
						+ id;
				PreparedStatement pstmtcheck = ConnectionDB.getConnection()
						.prepareStatement(check);
				ResultSet rscheck = pstmtcheck.executeQuery();
				rscheck.next();
				int count = rscheck.getInt(1);
				if (count == 0) {
					pstmt = ConnectionDB.getConnection().prepareStatement(
							insert);
					pstmt.executeUpdate();
				} else {
					pstmt = ConnectionDB.getConnection().prepareStatement(
							update);
					pstmt.executeUpdate();
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
