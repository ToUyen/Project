package dao;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import model.KhachHang;
import model.TaiKhoan;
import database.Connec;

public class TaiKhoanDao {
	private static Connection connection = null;
	private static Statement st = null;
	private static PreparedStatement pstmt = null;
	private static ResultSet rs = null;

	public static void insert(TaiKhoan taikhoan) throws Exception {
		String load = "insert into taikhoan(IDTK,NAMETK,PASSTK,GROUP,ACTIVE) values(?, ?, ?, ?, ?)";
		try {
			pstmt = Connec.getConnection().prepareStatement(load);
			pstmt.setInt(1, taikhoan.getId());
			pstmt.setString(2, taikhoan.getUsername());
			pstmt.setString(3, taikhoan.getPassword());
			pstmt.setInt(4, taikhoan.getNhom());
			pstmt.setInt(5, taikhoan.getActive());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	public static List<KhachHang> getTaiKhoan() {
		List<KhachHang> listkh = new ArrayList<KhachHang>();
		String select = "SELECT MATK, HOVATEN, GIOITINH, DIACHI, SODT, EMAIL FROM khachhang";

		try {

			pstmt = Connec.getConnection().prepareStatement(select);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				int matk = rs.getInt("MATK");
				String hoten = rs.getString("HOVATEN");

				String gioitinh = rs.getString("GIOITINH");
				String diachi = rs.getString("DIACHI");
				String sodt = rs.getString("SODT");
				String email = rs.getString("EMAIL");

				KhachHang kh = new KhachHang(matk, hoten, gioitinh, diachi,
						sodt, email);
				listkh.add(kh);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return listkh;

	}
	public static String MD5(String input) {
		try {
			MessageDigest md = MessageDigest.getInstance("MD5");
			md.update(input.getBytes());
			byte byteData[] = md.digest();
			// convert the byte to hex format method 1(chuyển đổi các byte từ hex để định dạng phương pháp 1)
			StringBuffer sb = new StringBuffer();
			for (int i = 0; i < byteData.length; i++) {
				sb.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16)
						.substring(1));
			}
			return sb.toString();
		} catch (NoSuchAlgorithmException e) {
			throw new RuntimeException(e);
		}
	}
	public static String maHoaPass(String str) {
		String kq = str;
		kq = kq + kq.substring(1);
		kq = TaiKhoanDao.MD5(kq);
		return kq;
	}
	public static int taikhoanID() {
		int count = 0;
		String sql = "SELECT MAX(MATK) as maxid FROM taikhoan";
		try {
			connection = Connec.getConnection();
			pstmt = connection.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				count = rs.getInt("maxid");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}

	public static boolean insertTaiKhoan(int id, String username,
			String password, int group, int active) {
		String insert = "INSERT INTO taikhoan(MATK,TENTK,MATKHAUTK,NHOM,TRANGTHAI) VALUES (?,?,?,?,?)";

		try {
			connection = Connec.getConnection();
			pstmt = connection.prepareStatement(insert);
			pstmt.setInt(1, id);
			pstmt.setString(2, username);
			pstmt.setString(3, password);
			pstmt.setInt(4, group);
			pstmt.setInt(5, active);
			pstmt.executeUpdate();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
}
