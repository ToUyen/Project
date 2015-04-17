package model;

public class LienHe {
	private int maLH;
	private int maKH;
	private String tenND;
	private String tieuDe;
	private String noiDung;

	public LienHe(int maLH, int maKH, String tenND, String tieuDe,
			String noiDung) {
		this.maLH = maLH;
		this.maKH = maKH;
		this.tenND = tenND;
		this.tieuDe = tieuDe;
		this.noiDung = noiDung;
	}

	public int getMaLH() {
		return maLH;
	}

	public void setMaLH(int maLH) {
		this.maLH = maLH;
	}

	public int getMaKH() {
		return maKH;
	}

	public void setMaKH(int maKH) {
		this.maKH = maKH;
	}

	public String getTenND() {
		return tenND;
	}

	public void setTenND(String tenND) {
		this.tenND = tenND;
	}

	public String getTieuDe() {
		return tieuDe;
	}

	public void setTieuDe(String tieuDe) {
		this.tieuDe = tieuDe;
	}

	public String getNoiDung() {
		return noiDung;
	}

	public void setNoiDung(String noiDung) {
		this.noiDung = noiDung;
	}

}
