package entity;

public class TacGia {
	private String tenTG;

	public TacGia(String tenTG) {
		super();
		this.tenTG = tenTG;
	}

	public String getTenTG() {
		return tenTG;
	}

	public void setTenTG(String tenTG) {
		this.tenTG = tenTG;
	}

	@Override
	public String toString() {
		return "TacGia [tenTG=" + tenTG + "]";
	}

}
