package model;

import java.util.Date;

import model.TaiKhoan;

public class KhachHang {
	public int id,taikhoanID;
	public String tenKH,gioiTinh,ngaySinh,diaChi,soDT,email,avatar;
	public KhachHang(int id) {
		this.id = id;
	}
	
	public KhachHang(int maTK, String hoTen, String gioiTinh,
			String diaChi, String soDT, String email) {

		this.id = maTK;
		this.tenKH = hoTen;
	
		this.gioiTinh = gioiTinh;
		this.diaChi = diaChi;
		this.soDT = soDT;
		this.email = email;

	}
	public KhachHang(int id, int taikhoanID, String tenKH, String gioiTinh,
			String diaChi, String soDT, String email, String avatar,
			String ngaySinh) {
		super();
		this.id = id;
		this.taikhoanID = taikhoanID;
		this.tenKH = tenKH;
		this.gioiTinh = gioiTinh;
		this.diaChi = diaChi;
		this.soDT = soDT;
		this.email = email;
		this.avatar = avatar;
		this.ngaySinh = ngaySinh;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getTaikhoanID() {
		return taikhoanID;
	}
	public void setTaikhoanID(int taikhoanID) {
		this.taikhoanID = taikhoanID;
	}
	public String getTenKH() {
		return tenKH;
	}
	public void setTenKH(String tenKH) {
		this.tenKH = tenKH;
	}
	public String getGioiTinh() {
		return gioiTinh;
	}
	public void setGioiTinh(String gioiTinh) {
		this.gioiTinh = gioiTinh;
	}
	public String getDiaChi() {
		return diaChi;
	}
	public void setDiaChi(String diaChi) {
		this.diaChi = diaChi;
	}
	public String getSoDT() {
		return soDT;
	}
	public void setSoDT(String soDT) {
		this.soDT = soDT;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAvatar() {
		return avatar;
	}
	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}
	public String getNgaySinh() {
		return ngaySinh;
	}
	public void setNgaySinh(String ngaySinh) {
		this.ngaySinh = ngaySinh;
	}
	
	
}

