package model;

public class GioHang {
	private int maCard;
	private int maTK;
	private int maSP;
	private String loai;
	private String tenSP;
	private String hinh;
	private int soLuong;
	private double gia;
	private double tong;

	public GioHang(GioHang i) {
		this.maSP = i.maSP;
		this.tenSP = i.tenSP;
		this.soLuong = i.soLuong;
		this.gia = i.gia;
	}

	public GioHang(int maSP, String loai, String tenSP, String hinh,
			int soLuong, double gia) {
		super();
		this.maSP = maSP;
		this.loai = loai;
		this.tenSP = tenSP;
		this.hinh = hinh;
		this.soLuong = soLuong;
		this.gia = gia;
	}

	public GioHang(int maCard, int maTK, int maSP, String tenSP, String hinh,
			int soLuong, double gia, double tong) {
		this.maCard = maCard;
		this.maTK = maTK;
		this.maSP = maSP;
		this.tenSP = tenSP;
		this.hinh = hinh;
		this.soLuong = soLuong;
		this.gia = gia;
		this.tong = tong;
	}

	public GioHang(int maSP, String tenSP, String hinh, int soLuong, double gia) {
		this.maSP = maSP;
		this.tenSP = tenSP;
		this.hinh = hinh;
		this.soLuong = soLuong;
		this.gia = gia;

	}

	public String getLoai() {
		return loai;
	}

	public void setLoai(String loai) {
		this.loai = loai;
	}

	public int getMaCard() {
		return maCard;
	}

	public void setMaCard(int maCard) {
		this.maCard = maCard;
	}

	public int getMaTK() {
		return maTK;
	}

	public void setMaTK(int maTK) {
		this.maTK = maTK;
	}

	public int getMaSP() {
		return maSP;
	}

	public void setMaSP(int maSP) {
		this.maSP = maSP;
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

	public int getSoLuong() {
		return soLuong;
	}

	public void setSoLuong(int soLuong) {
		this.soLuong = soLuong;
	}

	public double getGia() {
		return gia;
	}

	public void setGia(double gia) {
		this.gia = gia;
	}

	public double getTong() {
		return tong;
	}

	public void setTong(double tong) {
		this.tong = tong;
	}

	public void plusCount() {
		soLuong++;
	}

	public void plusCount(int plus) {
		soLuong += plus;
	}

	@Override
	public String toString() {
		return "GioHang [maCard=" + maCard + ", maTK=" + maTK + ", maSP="
				+ maSP + ", tenSP=" + tenSP + ", hinh=" + hinh + ", soLuong="
				+ soLuong + ", gia=" + gia + ", tong=" + tong + "]";
	}

}
