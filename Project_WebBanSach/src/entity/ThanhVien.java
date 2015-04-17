package entity;

public class ThanhVien {
	private int id;
	private String tenDangNhap;
	private String email;
	private String taikhoanID;

	public ThanhVien(int id, String tenDangNhap, String email, String taikhoanID) {
		super();
		this.id = id;
		this.tenDangNhap = tenDangNhap;
		this.email = email;
		this.taikhoanID = taikhoanID;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTenDangNhap() {
		return tenDangNhap;
	}

	public void setTenDangNhap(String tenDangNhap) {
		this.tenDangNhap = tenDangNhap;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTaikhoanID() {
		return taikhoanID;
	}

	public void setTaikhoanID(String taikhoanID) {
		this.taikhoanID = taikhoanID;
	}

}
