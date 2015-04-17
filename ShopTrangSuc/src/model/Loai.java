package model;

public class Loai {
	private int maLoai;
	private String tenloai;
	private String moTa;

	public Loai(int maLoai, String tenloai, String moTa) {
		this.maLoai = maLoai;
		this.tenloai = tenloai;
		this.moTa = moTa;
	}

	public int getMaLoai() {
		return maLoai;
	}

	public void setMaLoai(int maLoai) {
		this.maLoai = maLoai;
	}

	public String getTenloai() {
		return tenloai;
	}

	public void setTenloai(String tenloai) {
		this.tenloai = tenloai;
	}

	public String getMoTa() {
		return moTa;
	}

	public void setMoTa(String moTa) {
		this.moTa = moTa;
	}

}
