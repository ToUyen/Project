package entity;

public class TaiKhoan {

	private int maTK;
	private String username;
	private String password;
	private int nhom;
	private int active;

	public TaiKhoan() {

	}

	public TaiKhoan(int maTK, String username, String password, int nhom,
			int active) {
		super();
		this.maTK = maTK;
		this.username = username;
		this.password = password;
		this.nhom = nhom;
		this.active = active;
	}

	public int getMaTK() {
		return maTK;
	}

	public void setMaTK(int maTK) {
		this.maTK = maTK;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public int getNhom() {
		return nhom;
	}

	public void setNhom(int nhom) {
		this.nhom = nhom;
	}

	public int getActive() {
		return active;
	}

	public void setActive(int active) {
		this.active = active;
	}

}