package entity;

public class Sach {
	private int id;
	private String tenSach;
	private String loaiBia;
	private int giaBia;
	private int giaBan;
	private int giamGia;
	private int soLuong;
	private int loaiSachID;
	private int luotBinhChon;
	private int tacgiaID;
	private int nxbID;

	public Sach(int id, String tenSach, String loaiBia, int giaBia, int giaBan,
			int giamGia, int soLuong, int loaiSachID, int luotBinhChon,
			int tacgiaID, int nxbID) {
		super();
		this.id = id;
		this.tenSach = tenSach;
		this.loaiBia = loaiBia;
		this.giaBia = giaBia;
		this.giaBan = giaBan;
		this.giamGia = giamGia;
		this.soLuong = soLuong;
		this.loaiSachID = loaiSachID;
		this.luotBinhChon = luotBinhChon;
		this.tacgiaID = tacgiaID;
		this.nxbID = nxbID;
	}

	public Sach(int id, String tenSach, String loaiBia, int giaBia, int giaBan,
			int giamGia, int soLuong, int loaiSachID, int tacgiaID, int nxbID) {
		super();
		this.id = id;
		this.tenSach = tenSach;
		this.loaiBia = loaiBia;
		this.giaBia = giaBia;
		this.giaBan = giaBan;
		this.giamGia = giamGia;
		this.soLuong = soLuong;
		this.loaiSachID = loaiSachID;
		this.tacgiaID = tacgiaID;
		this.nxbID = nxbID;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTenSach() {
		return tenSach;
	}

	public void setTenSach(String tenSach) {
		this.tenSach = tenSach;
	}

	public String getLoaiBia() {
		return loaiBia;
	}

	public void setLoaiBia(String loaiBia) {
		this.loaiBia = loaiBia;
	}

	public int getGiaBia() {
		return giaBia;
	}

	public void setGiaBia(int giaBia) {
		this.giaBia = giaBia;
	}

	public int getGiaBan() {
		return giaBan;
	}

	public void setGiaBan(int giaBan) {
		this.giaBan = giaBan;
	}

	public int getGiamGia() {
		return giamGia;
	}

	public void setGiamGia(int giamGia) {
		this.giamGia = giamGia;
	}

	public int getSoLuong() {
		return soLuong;
	}

	public void setSoLuong(int soLuong) {
		this.soLuong = soLuong;
	}

	public int getLoaiSachID() {
		return loaiSachID;
	}

	public void setLoaiSachID(int loaiSachID) {
		this.loaiSachID = loaiSachID;
	}

	public int getLuotBinhChon() {
		return luotBinhChon;
	}

	public void setLuotBinhChon(int luotBinhChon) {
		this.luotBinhChon = luotBinhChon;
	}

	public int getTacgiaID() {
		return tacgiaID;
	}

	public void setTacgiaID(int tacgiaID) {
		this.tacgiaID = tacgiaID;
	}

	public int getNxbID() {
		return nxbID;
	}

	public void setNxbID(int nxbID) {
		this.nxbID = nxbID;
	}

	@Override
	public String toString() {
		return "Sach [id=" + id + ", tenSach=" + tenSach + ", loaiBia="
				+ loaiBia + ", giaBia=" + giaBia + ", giaBan=" + giaBan
				+ ", giamGia=" + giamGia + ", soLuong=" + soLuong
				+ ", loaiSachID=" + loaiSachID + ", luotBinhChon="
				+ luotBinhChon + ", tacgiaID=" + tacgiaID + ", nxbID=" + nxbID
				+ "]";
	}

}
