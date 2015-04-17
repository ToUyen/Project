package model;

import java.util.Date;

public class SanPham {

	private int maSP;
	private int maLoai;
	private String tenSP;
	private String hinh;
	private double gia;
	private int soLuong;
	private double giamGia;
	private String chiTiet;
	private Date ngaySP;

	public SanPham(int maSP, int maLoai, String tenSP, String hinh, double gia,
			int soLuong, double giamGia, String chiTiet, Date ngaySP) {
		this.maSP = maSP;
		this.maLoai = maLoai;
		this.tenSP = tenSP;
		this.hinh = hinh;
		this.gia = gia;
		this.soLuong = soLuong;
		this.giamGia = giamGia;
		this.chiTiet = chiTiet;
		this.ngaySP = ngaySP;
	}

	public SanPham(int maSP, String tenSP, String hinh, double gia,
			String chiTiet) {
		this.maSP = maSP;
		this.tenSP = tenSP;
		this.hinh = hinh;
		this.gia = gia;
		this.chiTiet = chiTiet;
	}

	public SanPham(int maSP, String tenSP, double gia, int soLuong,
			double giamGia, String chiTiet) {
		this.maSP = maSP;
		this.tenSP = tenSP;
		this.gia = gia;
		this.soLuong = soLuong;
		this.giamGia = giamGia;
		this.chiTiet = chiTiet;

	}

	public int getMaSP() {
		return maSP;
	}

	public void setMaSP(int maSP) {
		this.maSP = maSP;
	}

	public int getMaLoai() {
		return maLoai;
	}

	public void setMaLoai(int maLoai) {
		this.maLoai = maLoai;
	}

	public String getTenSP() {
		return tenSP;
	}

	public void setTenSP(String tenSP) {
		this.tenSP = tenSP;
	}

	public String getHinh() {
		return hinh;
	}

	public void setHinh(String hinh) {
		this.hinh = hinh;
	}

	public double getGia() {
		return gia;
	}

	public void setGia(double gia) {
		this.gia = gia;
	}

	public int getSoLuong() {
		return soLuong;
	}

	public void setSoLuong(int soLuong) {
		this.soLuong = soLuong;
	}

	public double getGiamGia() {
		return giamGia;
	}

	public void setGiamGia(double giamGia) {
		this.giamGia = giamGia;
	}

	public String getChiTiet() {
		return chiTiet;
	}

	public void setChiTiet(String chiTiet) {
		this.chiTiet = chiTiet;
	}

	public Date getNgaySP() {
		return ngaySP;
	}

	public void setNgaySP(Date ngaySP) {
		this.ngaySP = ngaySP;
	}

	@Override
	public String toString() {
		return "SanPham [maSP=" + maSP + ", maLoai=" + maLoai + ", tenSP="
				+ tenSP + ", hinh=" + hinh + ", gia=" + gia + ", soLuong="
				+ soLuong + ", giamGia=" + giamGia + ", chiTiet=" + chiTiet
				+ ", ngaySP=" + ngaySP + "]";
	}

}
