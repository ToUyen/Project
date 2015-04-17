package entity;

import java.util.Date;

public class KhachHang {
	private int id;
	private String tenKH;
	private String sodienthoai;
	private String sodidong;
	private Date ngaysinh;
	private String quocgia;
	private String tinh;
	private int taikhoanID;

	public KhachHang(int id, String tenKH, String sodienthoai, String sodidong,
			Date ngaysinh, String quocgia, String tinh, int taikhoanID,
			String diachi) {
		super();
		this.id = id;
		this.tenKH = tenKH;
		this.sodienthoai = sodienthoai;
		this.sodidong = sodidong;
		this.ngaysinh = ngaysinh;
		this.quocgia = quocgia;
		this.tinh = tinh;
		this.taikhoanID = taikhoanID;
		this.diachi = diachi;
	}

	public int getTaikhoanID() {
		return taikhoanID;
	}

	public void setTaikhoanID(int taikhoanID) {
		this.taikhoanID = taikhoanID;
	}

	public String getQuocgia() {
		return quocgia;
	}

	public void setQuocgia(String quocgia) {
		this.quocgia = quocgia;
	}

	public String getTinh() {
		return tinh;
	}

	public void setTinh(String tinh) {
		this.tinh = tinh;
	}

	private String diachi;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTenKH() {
		return tenKH;
	}

	public void setTenKH(String tenKH) {
		this.tenKH = tenKH;
	}

	public String getSodienthoai() {
		return sodienthoai;
	}

	public void setSodienthoai(String sodienthoai) {
		this.sodienthoai = sodienthoai;
	}

	public String getSodidong() {
		return sodidong;
	}

	public void setSodidong(String sodidong) {
		this.sodidong = sodidong;
	}

	public Date getNgaysinh() {
		return ngaysinh;
	}

	public void setNgaysinh(Date ngaysinh) {
		this.ngaysinh = ngaysinh;
	}

	public String getDiachi() {
		return diachi;
	}

	public void setDiachi(String diachi) {
		this.diachi = diachi;
	}

}
