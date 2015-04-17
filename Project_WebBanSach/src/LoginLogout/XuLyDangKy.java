package LoginLogout;

import java.io.IOException;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import connection.ConnectionDB;

import mail.Mail;

import dao.KhachHangDAO;
import dao.TaiKhoanDAO;
import dao.ThanhVienDAO;

/**
 * Servlet implementation class XuLyDangKy
 */
public class XuLyDangKy extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String username, password, re_password, name, sex, s_day, s_month,
			s_year, email, phone, mb_phone, avatar, country, province,
			district, homeadd;
	private int day, month, year;
	private String err_user, err_email, err_password, err_re_password,
			err_name, err_phone, err_homeadd, err_birthday;
	private String url;
	public Pattern userpattern, emailpattern, passwordpattern,
			re_passwordpattern, namepattern, phonepattern, mb_phonepattern;
	public Matcher usermatcher, emailmatcher, passwordmatcher,
			re_passwordmatcher, namematcher, phonematcher, mb_phonematcher;

	/**
	 * Default constructor.
	 */
	public XuLyDangKy() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		toDo(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		toDo(request, response);
	}

	private void toDo(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");

		username = request.getParameter("username");
		password = request.getParameter("password");
		re_password = request.getParameter("re_password");
		name = request.getParameter("name");
		sex = request.getParameter("sex");
		s_day = request.getParameter("day");
		s_month = request.getParameter("month");
		s_year = request.getParameter("year");
		email = request.getParameter("email");
		phone = request.getParameter("phone");
		mb_phone = request.getParameter("mb_phone");
		avatar = request.getParameter("avatar");
		country = request.getParameter("country");
		province = request.getParameter("province");
		district = request.getParameter("district");
		homeadd = request.getParameter("homeadd");
		day = Integer.parseInt(request.getParameter("day"));
		month = Integer.parseInt(request.getParameter("month"));
		year = Integer.parseInt(request.getParameter("year"));

		boolean baoloi = false;

		err_user = "";
		err_password = "";
		if (username == null) {
			err_user += "Bạn chưa nhập tên đăng nhập";
			baoloi = true;
		} else {
			username = username.trim();
		}
		if (username == "") {
			err_user += "Bạn chưa nhập tên đăng nhập";
			baoloi = true;
		} else {
			userpattern = Pattern.compile("^[A-Z a-z 0-9]{8,}$");
			usermatcher = userpattern.matcher(username);
			if (!usermatcher.matches()) {
				err_user += "Tên đăng nhập phải từ 8 ký tự trở lên.";
				baoloi = true;
			} else {
				String sql = "SELECT * FROM taikhoan";
				ResultSet rs = null;
				try {
					rs = ConnectionDB.connect().executeQuery(sql);
					rs.beforeFirst();
					while (rs.next()) {
						if (rs.getString(2).equals(username)) {
							err_user = "Tên đăng nhập đã tồn tại, vui lòng chọn tên khác";
							baoloi = true;
						}
					}
				} catch (ClassNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} finally {
					try {
						rs.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
			}
		}
		if (password == null) {
			err_password += "Bạn chưa nhập mật khẩu";
			baoloi = true;
		} else {
			password = password.trim();
		}
		if (password == "") {
			err_password += "Bạn chưa nhập mật khẩu";
			baoloi = true;
		} else {
			passwordpattern = Pattern.compile("^[A-Z a-z 0-9]{8,100}$");
			passwordmatcher = passwordpattern.matcher(password);
			if (!passwordmatcher.matches()) {
				err_password += "Mật khẩu phải từ 8 ký tự trở lên";
				baoloi = true;
			}
		}

		err_re_password = "";
		if (re_password == null) {
			err_re_password += "Bạn chưa nhập re_password";
			baoloi = true;
		} else {
			re_password = re_password.trim();
		}
		if (re_password == "") {
			err_re_password += "Bạn chưa nhập re_password";
			baoloi = true;
		} else {
			re_passwordpattern = Pattern.compile("^[A-Z a-z 0-9]{8,100}$");
			re_passwordmatcher = passwordpattern.matcher(password);
			if (!passwordmatcher.matches()) {
				err_re_password = "Password phải từ 8 ký tự trở lên";
				baoloi = true;
			}

		}
		if (!re_password.equals(password)) {
			err_re_password = "password và re_password phải giống nhau";
			baoloi = true;
		}

		err_name = "";
		if (name == null) {
			err_name += "Bạn chưa nhập tên.";
			baoloi = true;
		} else {
			name = name.trim();
		}
		if (name == "") {
			err_name += "Bạn chưa nhập tên.";
			baoloi = true;
		} else {
			String sql = "SELECT * FROM thanhvien";
			ResultSet rs = null;
			try {
				rs = ConnectionDB.connect().executeQuery(sql);
				rs.beforeFirst();
				while (rs.next()) {
					if (rs.getString(2).equals(name)) {
						err_name = "Tên này đã có người sử dụng, vui lòng chọn tên khác.";
						baoloi = true;
					}
				}
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}

		}
		err_email = "";
		if (email == null) {
			err_email += "Bạn chưa nhập email";
			baoloi = true;
		} else {
			email = email.trim();
		}
		if (email == "") {
			err_email += "Bạn chưa nhập email";
			baoloi = true;
		} else {
			emailpattern = Pattern
					.compile("^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@"
							+ "[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$");
			emailmatcher = emailpattern.matcher(email);
			if (!emailmatcher.matches()) {
				err_email += "Bạn chưa nhập email";
				baoloi = true;
			} else {
				String sql = "select * from thanhvien";
				ResultSet rs = null;
				try {
					rs = ConnectionDB.connect().executeQuery(sql);
					rs.beforeFirst();
					while (rs.next()) {
						if (rs.getString(3).equals(email)) {
							err_email = "Email đã tồn tại, hãy xài email khác...";
							baoloi = true;
						}
					}
				} catch (ClassNotFoundException e) {
					e.printStackTrace();
				} catch (SQLException e) {
					e.printStackTrace();
				} finally {
					try {
						rs.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
			}
		}
		err_phone = "";
		if (phone == null) {
			err_phone += "Bạn chưa số điện thoại";
			baoloi = true;
		} else {
			phone = phone.trim();
		}
		if (phone == "") {
			err_phone += "Bạn chưa nhập số điện thoại";
			baoloi = true;
		} else {
			phonepattern = Pattern.compile("^[0-9]{10,13}$");
			phonematcher = phonepattern.matcher(phone);
			if (!phonematcher.matches()) {
				err_phone += "Số điện thoại phải là số và từ 10 đến 13 chữ số";
				baoloi = true;
			}
		}

		err_birthday = "";
		if (year >= 1997) {
			err_birthday = "Phải trên 16 tuổi mới được đăng ký !!......";
			baoloi = true;
		}
		err_homeadd = "";
		if (homeadd == null) {
			err_homeadd += "Bạn chưa nhập địa chỉ";
			baoloi = true;
		} else {
			homeadd = homeadd.trim();
		}
		if (homeadd == "") {
			err_homeadd += "Bạn chưa nhập đĩa chỉ";
			baoloi = true;
		}
		// ----------------------
		/*
		 * lưu database;
		 */
		if (!baoloi) {
			String s_day = String.valueOf(day);
			String s_month = String.valueOf(month);
			String s_year = String.valueOf(year);
			String ngaysinh = "";
			if (day >= 10 && month >= 10) {
				ngaysinh = s_year + s_month + s_day;
				System.out.println("Ngày sinh: " + ngaysinh);
			} else if (day >= 10 && month < 10) {
				ngaysinh = s_year + "0" + s_month + s_day;
				System.out.println("Ngày sinh: " + ngaysinh);
			} else if (day < 10 && month >= 10) {
				ngaysinh = s_year + s_month + "0" + s_day;
				System.out.println("Ngày sinh: " + ngaysinh);
			} else {
				ngaysinh = s_year + "0" + s_month + "0" + s_day;
				System.out.println("Ngày sinh: " + ngaysinh);
			}
			try {
				KhachHangDAO.insertKhachHang(name, sex, phone, mb_phone,
						ngaysinh, country, province, homeadd);
				TaiKhoanDAO.insertTaiKhoan(username, password, 2, 1);
				ThanhVienDAO.insertThanhVien(name, email);
			} catch (Exception e1) {
				e1.printStackTrace();
			}
			/*
			 * Đănh ký thành công thì gửi mail.....
			 */
			try {
				Mail.sendMail(
						"smtp.gmail.com",
						email,
						"ntatvr@gmail.com",
						"01653164732",
						"Thông Báo!",
						"Chúc mừng bạn "
								+ name
								+ " đã đăng kỳ thành công \n\n username của bạn là: "
								+ username + ",password: " + password);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}
		// ----------------------
		// Ket thuc kiem tra loi.

		url = "/ThanhCong.jsp";
		request.setAttribute("username", username);
		request.setAttribute("email", email);
		request.setAttribute("password", password);
		request.setAttribute("re_password", re_password);
		request.setAttribute("name", name);
		request.setAttribute("phone", phone);
		request.setAttribute("mb_phone", mb_phone);
		request.setAttribute("homeadd", homeadd);
		request.setAttribute("year", year);
		if (err_user.length() > 0 || err_email.length() > 0
				|| err_password.length() > 0 || err_re_password.length() > 0
				|| err_name.length() > 0 || err_phone.length() > 0
				|| err_homeadd.length() > 0) {
			url = "/dangky.jsp";
			request.setAttribute("err_user", err_user);
			request.setAttribute("err_email", err_email);
			request.setAttribute("err_password", err_password);
			request.setAttribute("err_re_password", err_re_password);
			request.setAttribute("err_name", err_name);
			request.setAttribute("err_phone", err_phone);
			request.setAttribute("err_homeadd", err_homeadd);
			request.setAttribute("err_birthday", err_birthday);
		}
		RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
		rd.forward(request, response);

	}

}
