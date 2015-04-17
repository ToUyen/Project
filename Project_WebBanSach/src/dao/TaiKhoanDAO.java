package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import connection.ConnectionDB;

public class TaiKhoanDAO {
	private static Connection connection = null;
	private static Statement st = null;
	private static PreparedStatement pstmt = null;
	private static PreparedStatement pst = null;
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

	/*
	 * hàm tìm kiếm tên theo tên đăng nhập và mật khẩu
	 */
	public static boolean searchName(String username, String password) {
		try {
			String searchName = "SELECT thanhvien.tendangnhap FROM taikhoan, thanhvien WHERE taikhoan.id = thanhvien.taikhoanID AND taikhoan.username =? AND taikhoan.`password`=?;";
			System.out.println(searchName);
			pst = ConnectionDB.conn().prepareStatement(searchName);
			pst.setString(1, username);
			pst.setString(2, password);
			rs = pst.executeQuery();
			rs.beforeFirst();
			String ten = null;
			while (rs.next()) {
				ten = rs.getString("thanhvien.tendangnhap");
			}
			System.out.println("tìm kiếm thành công...Tền đã đăng ký là: "
					+ ten);
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	/*
	 * Hàm insert tài khoản......... Group trả về 2 là khách hàng.....admin
	 * không có quyền đăng ký...... Active trả về 1 là được đăng nhập......0 là
	 * không được đăng nhập..... Nếu đăng nhập thành công mới lưu nên active =
	 * 1;
	 */
	public static void taikhoanID() {
		String sql = "SELECT id FROM taikhoan";
		query(sql);
		try {
			rs.last();
			id = rs.getInt(1)+1;
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public static void insertTaiKhoan(String username, String password,
			int group, int active) {
		try {
			taikhoanID();
			String sql = "select * from taikhoan";
			query(sql);
			rs.last();
			System.out.println(rs.getRow());
			String insert = "INSERT INTO taikhoan(id,username, password, groups, active) VALUES ("
					+ id
					+ ",'"
					+ username
					+ "','"
					+ password
					+ "' , "
					+ group
					+ " , " + active + " );";
			pstmt = ConnectionDB.getConnection().prepareStatement(insert);
			pstmt.executeUpdate();
			System.out.println("insert thành công...");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static void updateTaiKhoan(int id, String username, String password,
			int group, int active) {
		String update = "UPDATE taikhoan SET username ='" + username
				+ "',password ='" + password + "',groups = " + group
				+ " ,active = " + active + " where  id = " + id;
		try {
			pstmt = ConnectionDB.getConnection().prepareStatement(update);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public static void delete(String tendn) {
		String delete = "DELETE FROM taikhoan WHERE username = ?";
		try {
			pstmt = ConnectionDB.getConnection().prepareStatement(delete);
			pstmt.setString(1, tendn);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public static void updateTaiKhoan(String tendn, String matkhau) {
		String update = "UPDATE taikhoan SET password = '" + matkhau
				+ "' WHERE username = ?";
		try {
			pstmt = ConnectionDB.getConnection().prepareStatement(update);
			pstmt.setString(1, tendn);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public static boolean searchTaiKhoan(String tendn) {
		String search = "SELECT count(id) FROM taikhoan WHERE username = '"
				+ tendn + "'";
		try {
			pstmt = ConnectionDB.getConnection().prepareStatement(search);
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

	public static boolean checkMatKhau(String tendn, String matkhau) {
		String search = "SELECT password FROM taikhoan WHERE username = '"
				+ tendn + "'";
		try {
			pstmt = ConnectionDB.getConnection().prepareStatement(search);
			rs = pstmt.executeQuery();
			rs.next();
			String mk = rs.getString(1);
			if (matkhau.equalsIgnoreCase(mk)) {
				return true;
			} else {
				return false;
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}

	}

	/*
	 * Test...
	 */
	public static void main(String[] args) throws Exception {
		System.out.println(checkMatKhau("tuananh", "123456788"));

	}

}
