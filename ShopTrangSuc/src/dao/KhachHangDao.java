package dao;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import model.KhachHang;
import database.Connec;

public class KhachHangDao {
	private static Connection connection = null;
	private static PreparedStatement pstmt = null;
	private static Statement st;
	private static ResultSet rs = null;
	private static int idtk = 0;

	public static boolean searchName(String username, String password) {
		try {
			String searchName = "SELECT khachhang.HOVATEN FROM khachhang,taikhoan WHERE khachhang.MATK = taikhoan.MATK AND taikhoan.TENTK = '"+username+"' AND taikhoan.MATKHAUTK = '"+password+"'";
			System.out.println(searchName);
			pstmt = Connec.getConnection().prepareStatement(searchName);
			pstmt.setString(1, username);
			pstmt.setString(2, password);
			rs = pstmt.executeQuery();
			rs.beforeFirst();
			String ten = null;
			while (rs.next()) {
				ten = rs.getString("khachhang.HOVATEN");
				
			}
			System.out.println("tìm kiếm thành công...tên khách hàng là: "
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

	public static int maxID() {
		int count = 0;
		String sql = "SELECT MAX(MAKH) as maxid FROM khachhang";
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

	public static boolean insertKhachHang(int id, int idtk, String tenKH,
			String ngaySinh, String gioiTinh, String diaChi, String soDT,
			String email, String avatar) {
		String insert = "INSERT INTO khachhang(MAKH,MATK,HOVATEN,NGAYSINH,GIOITINH,DIACHI,SODT,EMAIL,AVATAR) VALUES(?,?,?,?,?,?,?,?,?);";
		try {
			connection = Connec.getConnection();
			pstmt = connection.prepareStatement(insert);

			pstmt.setInt(1, id);
			pstmt.setInt(2, idtk);
			pstmt.setString(3, tenKH);
			pstmt.setString(4, ngaySinh);
			pstmt.setString(5, gioiTinh);
			pstmt.setString(6, diaChi);
			pstmt.setString(7, soDT);
			pstmt.setString(8, email);
			pstmt.setString(9, avatar);
			pstmt.executeUpdate();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;

	}

}
