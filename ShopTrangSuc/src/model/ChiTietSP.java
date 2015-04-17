package model;

public class ChiTietSP {
	private int maDH;
	private int maSP;
	private double gia;
	private int soLuong;

	public ChiTietSP(int maDH, int maSP, double gia, int soLuong) {
		this.maDH = maDH;
		this.maSP = maSP;
		this.gia = gia;
		this.soLuong = soLuong;
	}

	public int getMaDH() {
		return maDH;
	}

	public void setMaDH(int maDH) {
		this.maDH = maDH;
	}

	public int getMaSP() {
		return maSP;
	}

	public void setMaSP(int maSP) {
		this.maSP = maSP;
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

}
