package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import connection.ConnectionDB;

public class KhachHangDAO {
	private static Connection connection = null;
	private static PreparedStatement pstmt = null;
	private static Statement st;
	private static ResultSet rs = null;
	private static int id;

	/*
	 * 
	 * @param sql
	 * 
	 * @return: statement.execute(sql) để đếm số dòng khi insert vào.....
	 */
	public static ResultSet query(String sql) {
		try {
			st = ConnectionDB.conn().createStatement();
			rs = st.executeQuery(sql);
			return rs;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public static void khachhangID() {
		String sql = "SELECT id FROM khachhang";
		query(sql);
		try {
			rs.last();
			id = rs.getInt(1) + 1;
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public static void insertKhachHang(String tenKH, String gioitinh,
			String sdt, String sdd, String ngaysinh, String quocgia,
			String tinh, String diachi) {
		khachhangID();
		try {
			String insert = "INSERT INTO khachhang(id,tenkhachhang,gioitinh,sdt,sdd,ngaysinh,quocgia,tinhthanh,diachi) VALUES("
					+ id
					+ ",'"
					+ tenKH
					+ "','"
					+ gioitinh
					+ "','"
					+ sdt
					+ "','"
					+ sdd
					+ "','"
					+ ngaysinh
					+ "','"
					+ quocgia
					+ "','"
					+ tinh
					+ "','" + diachi + "');";
			pstmt = ConnectionDB.getConnection().prepareStatement(insert);
			pstmt.executeUpdate();
			System.out.println("insert khachhang thành công...");
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public static void updateKhachHang(int idtk, String tendn, String tenKH,
			String gioitinh, String sdt, String sdd, String ngaysinh,
			String quocgia, String tinh, String diachi) {
		String search = "select khachhang.id FROM taikhoan,thanhvien,khachhang WHERE taikhoan.id = thanhvien.taikhoanID AND thanhvien.khachhangID = khachhang.id AND taikhoan.id = ?";
		String update = "UPDATE khachhang set tenkhachhang = '" + tenKH
				+ "',gioitinh = '" + gioitinh + "',sdt='" + sdt + "',sdd='"
				+ sdd + "',ngaysinh='" + ngaysinh + "',quocgia='" + quocgia
				+ "',tinhthanh='" + tinh + "' where id = ?";
		try {
			pstmt = ConnectionDB.getConnection().prepareStatement(search);
			pstmt.setInt(1, idtk);
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			int id = rs.getInt(1);

			pstmt = ConnectionDB.getConnection().prepareStatement(update);
			pstmt.setInt(1, id);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public static void delete(String tendn) {
		String delete = "DELETE FROM khachhang WHERE id = ?";
		String search = "SELECT khachhang.id FROM thanhvien ,taikhoan ,khachhang where taikhoan.id = thanhvien.taikhoanID AND thanhvien.khachhangID = khachhang.id AND taikhoan.username = ?;";
		try {
			pstmt = ConnectionDB.getConnection().prepareStatement(search);
			pstmt.setString(1, tendn);
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			int id = rs.getInt(1);
			pstmt = ConnectionDB.getConnection().prepareStatement(delete);
			pstmt.setInt(1, id);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public static void main(String[] args) {

	}

}
