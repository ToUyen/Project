package entity;

public class Manager {
	private int id;
	private String name;
	private String avatar;
	private String facebook;
	private String university;
	private String department;
	private String class1;
	private int group;

	public Manager(int id, String name, String avatar, String facebook,
			String university, String department) {
		super();
		this.id = id;
		this.name = name;
		this.avatar = avatar;
		this.facebook = facebook;
		this.university = university;
		this.department = department;
	}

	public Manager(int id, String name, String avatar, String facebook,
			String university, String department, String class1) {
		super();
		this.id = id;
		this.name = name;
		this.avatar = avatar;
		this.facebook = facebook;
		this.university = university;
		this.department = department;
		this.class1 = class1;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAvatar() {
		return avatar;
	}

	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}

	public String getFacebook() {
		return facebook;
	}

	public void setFacebook(String facebook) {
		this.facebook = facebook;
	}

	public String getUniversity() {
		return university;
	}

	public void setUniversity(String university) {
		this.university = university;
	}

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	public String getClass1() {
		return class1;
	}

	public void setClass1(String class1) {
		this.class1 = class1;
	}

	public int getGroup() {
		return group;
	}

	public void setGroup(int group) {
		this.group = group;
	}

}
