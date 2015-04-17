package model;

public class TinTuc {
	private int maTT;
	private String tieuDeTT;
	private String noiDungTT;
	private String hinhTT;

	public TinTuc(int maTT, String tieuDeTT, String noiDungTT, String hinhTT) {
		this.maTT = maTT;
		this.tieuDeTT = tieuDeTT;
		this.noiDungTT = noiDungTT;
		this.hinhTT = hinhTT;
	}

	public int getMaTT() {
		return maTT;
	}

	public void setMaTT(int maTT) {
		this.maTT = maTT;
	}

	public String getTieuDeTT() {
		return tieuDeTT;
	}

	public void setTieuDeTT(String tieuDeTT) {
		this.tieuDeTT = tieuDeTT;
	}

	public String getNoiDungTT() {
		return noiDungTT;
	}

	public void setNoiDungTT(String noiDungTT) {
		this.noiDungTT = noiDungTT;
	}

	public String getHinhTT() {
		return hinhTT;
	}

	public void setHinhTT(String hinhTT) {
		this.hinhTT = hinhTT;
	}

}
