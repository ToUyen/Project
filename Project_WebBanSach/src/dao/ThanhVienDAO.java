package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import connection.ConnectionDB;

public class ThanhVienDAO {
	private static Connection connection = null;
	private static Statement st = null;
	private static PreparedStatement pstmt;
	private static ResultSet rs = null;
	private static int id;
	private static int taikhoanID;
	private static int khachhangID;

	/*
	 * 
	 * @param sql
	 * 
	 * @return: statement.execute(sql) để đếm số dòng khi insert vào..... có thể
	 * gọi hàm conn() hoặc connect(), đối với hàm connect() thì không cần khai
	 * báo statement;
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

	/*
	 * hàm lấy ra số id của taikhoan để insert vào....+ thêm 1 để biết tài khoản
	 * tiếp theo
	 */
	public static void taikhoanID() {
		String sql = "SELECT id FROM taikhoan";
		query(sql);
		try {
			rs.last();
			taikhoanID = rs.getInt(1);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	/*
	 * hàm lấy ra mã khách hàng để insert vào.... + thêm 1 để biết khách hàng
	 * tiếp theo
	 */
	public static void khachhangID() {
		String sql = "SELECT id FROM khachhang";
		query(sql);
		try {
			rs.last();
			khachhangID = rs.getInt(1);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public static void thanhvienID() {
		String sql = "SELECT id FROM thanhvien";
		query(sql);
		try {
			rs.last();
			id = rs.getInt(1)+1;
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public static void insertThanhVien(String tendangnhap, String email) {
		try {
			khachhangID();
			taikhoanID();
			thanhvienID();
			String insert = "INSERT INTO thanhvien(id,tendangnhap,email,taikhoanID,khachhangID) VALUES("
					+ id
					+ ",'"
					+ tendangnhap
					+ "','"
					+ email
					+ "','"
					+ taikhoanID + "','" + khachhangID + "');";
			pstmt = ConnectionDB.getConnection().prepareStatement(insert);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public static void updateThanhVien(int idtk, String tendn,
			String tendangnhap, String email) {
		String update = "UPDATE thanhvien SET tendangnhap='" + tendangnhap
				+ "',email='" + email + "' where id =?";
		String search = "select thanhvien.id FROM taikhoan inner join thanhvien on taikhoan.id = thanhvien.taikhoanID AND taikhoan.id = ?;";
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
		try {
			String search = "SELECT thanhvien.id FROM taikhoan inner join thanhvien on taikhoan.id = thanhvien.taikhoanID where taikhoan.username = ?;";
			pstmt = ConnectionDB.getConnection().prepareStatement(search);
			pstmt.setString(1, tendn);
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			int id = rs.getInt(1);
			String delete = "DELETE FROM thanhvien WHERE id = ?";
			pstmt = ConnectionDB.getConnection().prepareStatement(delete);
			pstmt.setInt(1, id);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public static void main(String[] args) throws Exception {
		taikhoanID();
		delete("tuananh123");
	}
}
