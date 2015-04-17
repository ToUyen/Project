package model;

import java.util.Date;

public class DonHang {
	private int maDH;
	private int maKH;
	private Date ngayDH;

	public DonHang(int maDH, int maKH, Date ngayDH) {
		super();
		this.maDH = maDH;
		this.maKH = maKH;
		this.ngayDH = ngayDH;
	}

	public int getMaDH() {
		return maDH;
	}

	public void setMaDH(int maDH) {
		this.maDH = maDH;
	}

	public int getMaKH() {
		return maKH;
	}

	public void setMaKH(int maKH) {
		this.maKH = maKH;
	}

	public Date getNgayDH() {
		return ngayDH;
	}

	public void setNgayDH(Date ngayDH) {
		this.ngayDH = ngayDH;
	}

}
