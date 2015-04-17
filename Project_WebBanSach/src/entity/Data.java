package entity;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import connection.ConnectionDB;

public class Data {
	static ArrayList<GioHang> list = new ArrayList<GioHang>();
	static Statement st = null;
	static ResultSet rs = null;
	static void list(){
		String sql = "SELECT chitietsach.sachID,sach.tenSach,chitietsach.hinhsach,sach.soLuong,sach.giaban FROM sach ,chitietsach Where sach.id = chitietsach.sachID";
		try {
			st = ConnectionDB.connect();
			rs = st.executeQuery(sql);
			rs.beforeFirst();
			while (rs.next()) {
				GioHang g = new GioHang(rs.getInt(1), rs.getString(2),rs
						.getString(3), rs.getInt(5), 1);
				list.add(g);
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				st.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

	}

	public static GioHang getGioHang(int maSach) {
		list();
		for (GioHang i : list) {
			if (i.getSachID() == maSach) {
				GioHang g = new GioHang(i);
				return g;
			}
		}
		return null;
	}

	public static void main(String[] args) {
		getGioHang(1);
	}

}
