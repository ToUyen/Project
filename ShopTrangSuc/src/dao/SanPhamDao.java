package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import model.GioHang;
import model.SanPham;
import model.SanPhamGH;

import database.*;

public class SanPhamDao {
	public static PreparedStatement pstmt = null;
	public static ResultSet rs = null;
	public static int idloai = 0;
	public static int idsp = 0;

	public static void searchIDLoai(String loai) {
		String search = "SELECT MALOAI FROM loai WHERE TENLOAI =?;";
		try {
			pstmt = ConnectionDB.getConnection().prepareStatement(search);
			pstmt.setString(1, loai);
			rs = pstmt.executeQuery();
			rs.next();
			idloai = rs.getInt(1);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public static void updateSanPhamLoai(String tensp, String loai) {
		searchIDLoai(loai);
		String update = "UPDATE sanpham SET MALOAI=" + idloai + "WHERE TENSP='"
				+ tensp + "';";
		try {
			pstmt = ConnectionDB.getConnection().prepareStatement(update);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public static void searchIDSP(String tenSP) {
		String search = "SELECT MASP FROM sanpham WHERE TENSP=?";
		try {
			pstmt = ConnectionDB.getConnection().prepareStatement(search);
			pstmt.setString(1, tenSP);
			rs = pstmt.executeQuery();
			rs.next();
			idsp = rs.getInt(1);

		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	public static int counid() {
		int count = 0;
		String sql = "SELECT count(*) FROM sanpham";
		try {
			pstmt = ConnectionDB.getConnection().prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				count = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return count;
	}

	public static List<SanPham> getProduct() {
		List<SanPham> products = new ArrayList<SanPham>();
		String select = "SELECT  MASP,TENSP, GIA, SOLUONG, GIAMGIA, CHITIET FROM sanpham";

		try {

			pstmt = Connec.getConnection().prepareStatement(select);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				int masp = rs.getInt("MASP");
				String tensp = rs.getString("TENSP");
				double gia = rs.getDouble("GIA");
				String chitiet = rs.getString("CHITIET");
				int soluong = rs.getInt("SOLUONG");
				double giamgia = rs.getDouble("GIAMGIA");

				SanPham sp = new SanPham(masp, tensp, gia, soluong, giamgia,
						chitiet);
				products.add(sp);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return products;
	}

	public static SanPham getProduct(int idsp) {
		SanPham sp = null;
		String select = "SELECT TENSP, HINH, GIA, CHITIET FROM sanpham WHERE MASP=?";
		try {
			pstmt = ConnectionDB.getConnection().prepareStatement(select);
			pstmt.setInt(1, idsp);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				sp = new SanPham(rs.getInt(1), rs.getInt(2), rs.getString(3),
						rs.getString(4), rs.getDouble(5), rs.getInt(6),
						rs.getDouble(7), rs.getString(8), rs.getDate(9));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;

	}

	// public static List<SanPham> selectLimitProduct(String sql, int i, int j)
	// {
	// Connection conn = null;
	// ResultSet rs = null;
	// List<SanPham> proList = new ArrayList<SanPham>();
	//
	// try {
	// conn = ConnectionDB.getConnection();
	// // pre = conn
	// //
	// .prepareStatement("select sanpham.tensanpham, concat(format(sanpham.dongia,0),' VND') as dongia, hinh,sanpham.masanpham, "
	// // +
	// //
	// "sanpham.mota from sanpham, hangsanpham, loaisanpham where sanpham.mahang = hangsanpham.mahang "
	// // +
	// //
	// "and sanpham.maloai = loaisanpham.maloai and sanpham.mahang = hangsanpham.mahang LIMIT ?,?");
	// pstmt = conn
	// .prepareStatement("SELECT MASP, MALOAI, TENSP, HINH, GIA, SOLUONG, GIAMGIA, CHITIET, NGAYSP FROM sanpham LIMTIT ?,?");
	//
	// pstmt.setInt(1, i);
	// pstmt.setInt(2, j);
	//
	// rs = pstmt.executeQuery();
	//
	// while (rs.next()) {
	// SanPham sp = new SanPham(rs.getInt(1), rs.getInt(2),
	// rs.getString(3), rs.getString(4), rs.getDouble(5),
	// rs.getInt(6), rs.getDouble(7), rs.getString(8),
	// rs.getDate(9));
	// proList.add(sp);
	// }
	// } catch (SQLException e) {
	// e.printStackTrace();
	// } finally {
	// try {
	// rs.close();
	// pstmt.close();
	// conn.close();
	// } catch (SQLException e) {
	// e.printStackTrace();
	// }
	// }
	// return proList;
	// }

	// ===============================

	public static List<SanPham> getProductSP() {
		List<SanPham> products = new ArrayList<SanPham>();
		// String select = "SELECT * FROM sanpham";
		String select = "SELECT sanpham.MASP,sanpham.TENSP ,sanpham.HINH, sanpham.GIA,sanpham.CHITIET FROM sanpham;";

		try {
			pstmt = ConnectionDB.getConnection().prepareStatement(select);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				int masp = rs.getInt("MASP");
				String tensp = rs.getString("TENSP");
				String hinh = rs.getString("HINH");
				double gia = rs.getDouble("GIA");
				String chitiet = rs.getString("CHITIET");
				SanPham sp = new SanPham(masp, tensp, hinh, gia, chitiet);
				products.add(sp);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return products;

	}

	public static int getNumberPage() {
		String select = "SELECT count(MASP) FROM sanpham";
		try {
			pstmt = ConnectionDB.getConnection().prepareStatement(select);
			rs = pstmt.executeQuery();
			rs.next();
			int i = rs.getInt(1);
			if (i % 9 == 0) {
				return i / 9;
			} else {
				return i / 9 + 1;
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return 0;
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}

	public static List<SanPham> getProductAll(int page) {
		List<SanPham> products = new ArrayList<SanPham>();
		String select = "SELECT sanpham.MASP,sanpham.TENSP ,sanpham.HINH, sanpham.GIA,sanpham.CHITIET FROM sanpham;";

		try {
			pstmt = ConnectionDB.getConnection().prepareStatement(select);
			rs = pstmt.executeQuery();
			int news = page * 9 - 8;
			boolean check = false;
			while (rs.next()) {
				int i = rs.getRow();
				if (i == news) {
					check = true;
				}
				if (check == true) {
					int masp = rs.getInt("MASP");
					String tensp = rs.getString("TENSP");
					String hinh = rs.getString("HINH");
					double gia = rs.getDouble("GIA");
					String chitiet = rs.getString("CHITIET");
					SanPham sp = new SanPham(masp, tensp, hinh, gia, chitiet);
					products.add(sp);
					System.out.println(rs.getInt(1));
				}
				if (i == (9 + news - 1)) {
					check = false;
					break;
				}

			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return products;
	}

	public static List<SanPham> getProductDC(int page) {
		List<SanPham> products = new ArrayList<SanPham>();
		// String select = "SELECT * FROM sanpham";
		String selectsp = "SELECT sanpham.MASP,sanpham.TENSP ,sanpham.HINH, sanpham.GIA,sanpham.CHITIET FROM sanpham where sanpham.MALOAI=3;";

		try {
			pstmt = ConnectionDB.getConnection().prepareStatement(selectsp);
			rs = pstmt.executeQuery();
			int news = page * 9 - 8;
			boolean check = false;
			while (rs.next()) {
				int i = rs.getRow();
				if (i == news) {
					check = true;
				}
				if (check == true) {
					int masp = rs.getInt("MASP");
					String tensp = rs.getString("TENSP");
					String hinh = rs.getString("HINH");
					double gia = rs.getDouble("GIA");
					String chitiet = rs.getString("CHITIET");
					SanPham sp = new SanPham(masp, tensp, hinh, gia, chitiet);
					products.add(sp);
					System.out.println(rs.getInt(1));
				}
				if (i == (9 + news - 1)) {
					check = false;
					break;
				}

			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return products;
	}

	public static List<SanPham> getProductNhan(int page) {
		List<SanPham> products = new ArrayList<SanPham>();
		String selectsp = "SELECT sanpham.MASP,sanpham.TENSP ,sanpham.HINH, sanpham.GIA,sanpham.CHITIET FROM sanpham where sanpham.MALOAI=1;";

		try {
			pstmt = ConnectionDB.getConnection().prepareStatement(selectsp);
			rs = pstmt.executeQuery();
			int news = page * 9 - 8;
			boolean check = false;
			while (rs.next()) {
				int i = rs.getRow();
				if (i == news) {
					check = true;
				}
				if (check == true) {
					int masp = rs.getInt("MASP");
					String tensp = rs.getString("TENSP");
					String hinh = rs.getString("HINH");
					double gia = rs.getDouble("GIA");
					String chitiet = rs.getString("CHITIET");
					SanPham sp = new SanPham(masp, tensp, hinh, gia, chitiet);
					products.add(sp);
					System.out.println(rs.getInt(1));
				}
				if (i == (9 + news - 1)) {
					check = false;
					break;
				}

			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return products;
	}

	public static List<SanPham> getProductVong(int page) {
		List<SanPham> products = new ArrayList<SanPham>();
		String selectsp = "SELECT sanpham.MASP,sanpham.TENSP ,sanpham.HINH, sanpham.GIA,sanpham.CHITIET FROM sanpham where sanpham.MALOAI=2;";

		try {
			pstmt = ConnectionDB.getConnection().prepareStatement(selectsp);
			rs = pstmt.executeQuery();
			int news = page * 9 - 8;
			boolean check = false;
			while (rs.next()) {
				int i = rs.getRow();
				if (i == news) {
					check = true;
				}
				if (check == true) {
					int masp = rs.getInt("MASP");
					String tensp = rs.getString("TENSP");
					String hinh = rs.getString("HINH");
					double gia = rs.getDouble("GIA");
					String chitiet = rs.getString("CHITIET");
					SanPham sp = new SanPham(masp, tensp, hinh, gia, chitiet);
					products.add(sp);
					System.out.println(rs.getInt(1));
				}
				if (i == (9 + news - 1)) {
					check = false;
					break;
				}

			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return products;
	}

	public static GioHang getSPGH(int id) throws SQLException {
		GioHang gh = null;
		String spgh = "SELECT sanpham.MASP, loai.TENLOAI,sanpham.TENSP, sanpham.HINH, sanpham.GIA FROM loai, sanpham WHERE sanpham.MALOAI= loai.MALOAI AND MASP=?";

		pstmt = ConnectionDB.getConnection().prepareStatement(spgh);
		pstmt.setInt(1, id);
		rs = pstmt.executeQuery();
		int soluong = 1;
		if (rs.next()) {
			gh = new GioHang(rs.getInt(1), rs.getString(2), rs.getString(3),
					rs.getString(4), soluong, rs.getDouble(5));
		}

		return gh;

	}

	public static List<SanPham> timKiem(String ten) throws SQLException {
		List<SanPham> sanPham = new ArrayList<SanPham>();
		String sql = "SELECT MASP, TENSP, HINH, GIA, CHITIET FROM sanpham WHERE TENSP LIKE N'%"+ten+"%';";
		pstmt = ConnectionDB.getConnection().prepareStatement(sql);
		 rs = pstmt.executeQuery();
		while (rs.next()) {
			SanPham sp = new SanPham(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getDouble(4), rs.getString(5));
			sanPham.add(sp);
		}
		return sanPham;
	}

	public static void main(String[] args) throws Exception {
		System.out.println(getProduct());
	}
}