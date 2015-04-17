package entity;

public class GioHang {
	private int sachID;
	private String tensach;
	private String hinhsach;
	private int gia;
	private int soluong;

	public GioHang(GioHang i) {
		this.sachID = i.sachID;
		this.tensach = i.tensach;
		this.soluong = i.soluong;
		this.gia = i.gia;
	}

	public GioHang(int sachID, String tensach, String hinhsach, int gia,
			int soluong) {
		super();
		this.sachID = sachID;
		this.tensach = tensach;
		this.hinhsach = hinhsach;
		this.gia = gia;
		this.soluong = soluong;
	}

	public int getSachID() {
		return sachID;
	}

	public void setSachID(int sachID) {
		this.sachID = sachID;
	}

	public String getTensach() {
		return tensach;
	}

	public void setTensach(String tensach) {
		this.tensach = tensach;
	}

	public String getHinhsach() {
		return hinhsach;
	}

	public void setHinhsach(String hinhsach) {
		this.hinhsach = hinhsach;
	}

	public int getGia() {
		return gia;
	}

	public void setGia(int gia) {
		this.gia = gia;
	}

	public int getSoluong() {
		return soluong;
	}
	public void plusCount() {
	       soluong++;
	    }
	    public void plusCount(int plus) {
	    	soluong+=plus;
	    }

	public void setSoluong(int soluong) {
		this.soluong = soluong;
	}

	@Override
	public String toString() {
		return "GioHang [sachID=" + sachID + ", tensach=" + tensach
				+ ", hinhsach=" + hinhsach + ", gia=" + gia + ", soluong="
				+ soluong + "]";
	}

}
