package model;

public  class TaiKhoan {
	private int id;
	private String username;
	private String password;
	private int nhom;
	private int active;

	public TaiKhoan() {

	}

	public TaiKhoan(int id, String username, String password, int nhom,
			int active) {
		super();
		this.id = id;
		this.username = username;
		this.password = password;
		this.nhom = nhom;
		this.active = active;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
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

