package model;

public class SanPhamGH {
	private int maSP;
	private String tenLoai;
	private String tenSP;
	private String hinh;
	private String moTa;
	private double donGia;
	private int count;
	private int soLuong;

	public SanPhamGH(int maSP, String tenLoai, String tenSP, String hinh,
			String moTa, double donGia, int count, int soLuong) {
		this.maSP = maSP;
		this.tenLoai = tenLoai;
		this.tenSP = tenSP;
		this.hinh = hinh;
		this.moTa = moTa;
		this.donGia = donGia;
		this.count = count;
		this.soLuong = soLuong;
	}

	public SanPhamGH(int maSP, String tenLoai, String tenSP, String hinh,
			double donGia, int soLuong) {
		this.maSP = maSP;
		this.tenLoai = tenLoai;
		this.tenSP = tenSP;
		this.hinh = hinh;
		this.donGia = donGia;
		this.soLuong = soLuong;
	}

	public int getMaSP() {
		return maSP;
	}

	public void setMaSP(int maSP) {
		this.maSP = maSP;
	}

	public String getTenLoai() {
		return tenLoai;
	}

	public void setTenLoai(String tenLoai) {
		this.tenLoai = tenLoai;
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

	public String getMoTa() {
		return moTa;
	}

	public void setMoTa(String moTa) {
		this.moTa = moTa;
	}

	public double getDonGia() {
		return donGia;
	}

	public void setDonGia(double donGia) {
		this.donGia = donGia;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public int getSoLuong() {
		return soLuong;
	}

	public void setSoLuong(int soLuong) {
		this.soLuong = soLuong;
	}

	public void plusCount() {
		soLuong++;
	}

	@Override
	public String toString() {
		return "SanPhamGH: " + maSP + "," + tenLoai + "," + tenSP + ", "
				+ donGia + "," + hinh + "," + moTa + "," + count + ","
				+ soLuong + "/n";
	}

}

