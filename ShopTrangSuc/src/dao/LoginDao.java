package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import database.Connec;

public class LoginDao {
	public static Statement s = null;
	public static PreparedStatement pstmt = null;
	public static ResultSet rs = null;
	public static int nhom = 0;
	public static int idsp = 0;

	public static void searchNhom(String user) {
		String search = "SELECT NHOM FROM taikhoan WHERE TENTK=?";
		try {
			pstmt = Connec.getConnection().prepareStatement(search);
			pstmt.setString(1, user);
			rs = pstmt.executeQuery();
			rs.next();
			nhom = rs.getInt(1);

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public static boolean checkLogin(String user, String pass)
			throws SQLException {
		String sql = "Select * from taikhoan ";
		s = Connec.getConnection().createStatement();
		rs = s.executeQuery(sql);
		while (rs.next()) {
			String user1 = rs.getString(2);
			String pass1 = rs.getString(3);
			int nhom = rs.getInt("taikhoan.NHOM");
			if (nhom == 1) {
				if (user.equals(user1) && pass.equals(pass1))
					return true;
			} else if (nhom == 2) {
				if (user.equals(user1)
						&& TaiKhoanDao.maHoaPass(pass).equals(pass1)) {
					return true;
				}
			}
		}
		return false;
	}

	public static void main(String[] args) throws SQLException {
		System.out.println(checkLogin("khoingo", "1234567"));
		System.out.println(checkLogin("phamthitouyen", "touyen"));
	}
}
