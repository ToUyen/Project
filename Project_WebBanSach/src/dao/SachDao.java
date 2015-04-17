package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

import connection.ConnectionDB;
import entity.Sach;

public class SachDao {
	public static PreparedStatement pstmt = null;
	public static ResultSet rs = null;
	public static int idtg = 0;
	public static int ids = 0;

	public static void searchIDTacGia(String tentg) {
		String search = "SELECT matacgia FROM tacgia WHERE tentacgia = ?";
		try {
			pstmt = ConnectionDB.getConnection().prepareStatement(search);
			pstmt.setString(1, tentg);
			rs = pstmt.executeQuery();
			rs.next();
			idtg = rs.getInt(1);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public static void updateSachTacGia(String tensach, String tentg) {
		searchIDTacGia(tentg);
		String update = "UPDATE sach SET tacgiaID = " + idtg
				+ " WHERE tenSach = '" + tensach + "';";
		try {
			pstmt = ConnectionDB.getConnection().prepareStatement(update);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	public static void searchIDSach(String tenSach) {
		String search = "SELECT id FROM sach WHERE tenSach = ?";
		try {
			pstmt = ConnectionDB.getConnection().prepareStatement(search);
			pstmt.setString(1, tenSach);
			rs = pstmt.executeQuery();
			rs.next();
			ids = rs.getInt(1);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public static void updateSachDichGia(String tenSach, String tenDichGia) {
		searchIDSach(tenSach);
		String update = "UPDATE chitietsach SET dichgia = '" + tenDichGia
				+ "' WHERE sachID = " + ids;
		try {
			pstmt = ConnectionDB.getConnection().prepareStatement(update);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public static int countID() {
		String sql = "SELECT count(id) FROM sach";
		try {
			pstmt = ConnectionDB.getConnection().prepareStatement(sql);
			rs = pstmt.executeQuery();
			rs.next();
			int ids = rs.getInt(1);
			return ids;
		} catch (SQLException e) {
			e.printStackTrace();
			return 0;
		}
	}

	public static int getIDTacGia(String tentg) {
		String search = "SELECT matacgia FROM tacgia WHERE tentacgia = ?";
		try {
			pstmt = ConnectionDB.getConnection().prepareStatement(search);
			pstmt.setString(1, tentg);
			rs = pstmt.executeQuery();
			rs.next();
			int idtg = rs.getInt(1);
			return idtg;
		} catch (SQLException e) {
			e.printStackTrace();
			return 0;
		}
	}

	public static int getIDLoaiSach(String tenls) {
		String search = "SELECT maLoaiSach FROM loaisach WHERE tenLoaiSach = ?";
		try {
			pstmt = ConnectionDB.getConnection().prepareStatement(search);
			pstmt.setString(1, tenls);
			rs = pstmt.executeQuery();
			rs.next();
			int idls = rs.getInt(1);
			return idls;
		} catch (SQLException e) {
			e.printStackTrace();
			return 0;
		}
	}

	public static int getIDNhaXuatBan(String tennxb) {
		String search = "SELECT maNhaXuatBan FROM nhaxuatban WHERE tenNhaXuatBan = ?";
		try {
			pstmt = ConnectionDB.getConnection().prepareStatement(search);
			pstmt.setString(1, tennxb);
			rs = pstmt.executeQuery();
			rs.next();
			int idnxb = rs.getInt(1);
			return idnxb;
		} catch (SQLException e) {
			e.printStackTrace();
			return 0;
		}
	}

	public static void insertSach(String tensach, String loaibia, int giabia,
			int giaban, int giamgia, int soluong, String tenls, String tentg,
			String tennxb) {
		int ids = countID() + 1;
		int idls = getIDLoaiSach(tenls);
		int idtg = getIDTacGia(tentg);
		int idnxb = getIDNhaXuatBan(tennxb);
		String insert = "INSERT INTO sach(id,tenSach,loaibia,gia,giaban,giamgia,soLuong,loaisachID,luotbinhchon,tacgiaID,nhaxbID) VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
		try {
			pstmt = ConnectionDB.getConnection().prepareStatement(insert);
			pstmt.setInt(1, ids);
			pstmt.setString(2, tensach);
			pstmt.setString(3, loaibia);
			pstmt.setInt(4, giabia);
			pstmt.setInt(5, giaban);
			pstmt.setInt(6, giamgia);
			pstmt.setInt(7, soluong);
			pstmt.setInt(8, idls);
			pstmt.setInt(9, 0);
			pstmt.setInt(10, idtg);
			pstmt.setInt(11, idnxb);

			pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	public static void updateSach(int maSach, String tensach, String loaibia,
			int giabia, int giaban, int giamgia, int soluong, String tenls,
			String tentg, String tennxb) {
		int idls = getIDLoaiSach(tenls);
		int idtg = getIDTacGia(tentg);
		int idnxb = getIDNhaXuatBan(tennxb);
		String update = "UPDATE sach SET tenSach ='" + tensach + "',loaibia='"
				+ loaibia + "',gia=" + giabia + ",giaban=" + giaban
				+ ",giamgia=" + giamgia + ",soLuong=" + soluong
				+ ",loaisachID=" + idls + ",tacgiaID=" + idtg + ",nhaxbID="
				+ idnxb + " WHERE id = " + maSach;
		try {
			pstmt = ConnectionDB.getConnection().prepareStatement(update);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	public static void updateChiTietSach(int maSach, String trongluong,
			String kichthuoc, String dichgia, int sotrang, String ngayxuatban) {
		String update = "UPDATE chitietsach SET trongluong = '" + trongluong
				+ "',kichthuoc='" + kichthuoc + "',dichgia='" + dichgia
				+ "',sotrang=" + sotrang + ",ngayxuatban='" + ngayxuatban
				+ "' WHERE sachID = " + maSach + ";";
		try {
			pstmt = ConnectionDB.getConnection().prepareStatement(update);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public static int getIDSach(String tensach) {
		String search = "SELECT id FROM sach WHERE tenSach = ?";
		try {
			pstmt = ConnectionDB.getConnection().prepareStatement(search);
			pstmt.setString(1, tensach);
			rs = pstmt.executeQuery();
			rs.next();
			int temp = rs.getInt(1);
			return temp;
		} catch (SQLException e) {
			e.printStackTrace();
			return 0;
		}
	}

	public static int countIDChiTietSach() {
		String sql = "SELECT count(id) FROM chitietsach";
		try {
			pstmt = ConnectionDB.getConnection().prepareStatement(sql);
			rs = pstmt.executeQuery();
			rs.next();
			int idcts = rs.getInt(1);
			return idcts;
		} catch (SQLException e) {
			e.printStackTrace();
			return 0;
		}
	}

	public static void insertChiTietSach(String tensach, String trongluong,
			String kichthuoc, String dichgia, String hinhsach, int sotrang,
			String ngayxuatban, int idtv) {
		int idcts = countIDChiTietSach() + 1;
		int ids = getIDSach(tensach);

		String insert = "INSERT INTO chitietsach(id,SachID,trongluong,kichthuoc,dichgia,hinhsach,sotrang,ngayxuatban,thanhvienid) VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?);";
		try {
			pstmt = ConnectionDB.getConnection().prepareStatement(insert);
			pstmt.setInt(1, idcts);
			pstmt.setInt(2, ids);
			pstmt.setString(3, trongluong);
			pstmt.setString(4, kichthuoc);
			pstmt.setString(5, dichgia);
			pstmt.setString(6, hinhsach);
			pstmt.setInt(7, sotrang);
			pstmt.setString(8, ngayxuatban);
			pstmt.setInt(9, idtv);
			pstmt.executeUpdate();
			System.out.println("insert chitietsach");
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public static boolean searchTenSach(String tensach) {
		String sql = "SELECT count(id) FROM sach WHERE tensach = ?";
		try {
			pstmt = ConnectionDB.getConnection().prepareStatement(sql);
			pstmt.setString(1, tensach);
			rs = pstmt.executeQuery();
			rs.next();
			int count = rs.getInt(1);
			if (count == 0) {
				return false;
			} else {
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}

	public static void deleteSach(String tensach) {
		String delete = "DELETE FROM sach WHERE tenSach = ?";
		try {
			pstmt = ConnectionDB.getConnection().prepareStatement(delete);
			pstmt.setString(1, tensach);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	public static void deleteChiTietSach(String tensach) {
		int idsach = getIDSach(tensach);
		String delete = "DELETE FROM chitietsach WHERE sachID = ?";
		try {
			pstmt = ConnectionDB.getConnection().prepareStatement(delete);
			pstmt.setInt(1, idsach);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
