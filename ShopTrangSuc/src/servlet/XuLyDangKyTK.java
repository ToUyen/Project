package servlet;

import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mail.Mail;
import model.TaiKhoan;
import dao.KhachHangDao;
import dao.TaiKhoanDao;
import database.Connec;

public class XuLyDangKyTK extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public XuLyDangKyTK() {
		super();
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doAction(request, response);
	}

	protected void doAction(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
//		request.setCharacterEncoding("utf-8");
//		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		String url = " ";
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String re_password = request.getParameter("re_password");
		String name = request.getParameter("name");
		String birthday = request.getParameter("birthday");
		String sex = request.getParameter("sex");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		String avatar = request.getParameter("avatar");
		String address = request.getParameter("address");
		HttpSession session = request.getSession();
		request.getSession(true).setAttribute("username", username);
		request.getSession(true).setAttribute("name", name);
		request.getSession().setAttribute("phone", phone);
		request.getSession().setAttribute("email", email);
		request.setAttribute("birthday", birthday);
		

		boolean check = false;
		// Kiểm tra lỗi username
		String err_username = " ";
		if (username == null) {
			err_username += "Bạn chưa nhập tên đăng nhập";
			check = true;
		} else {
			username = username.trim();
		}
		if (username == "") {
			err_username += "Bạn chưa nhập tên đăng nhập";
			check = true;
		} else {
			Pattern userpattern = Pattern.compile("^[A-Z a-z 0-9]{6,}$");
			Matcher usermatcher = userpattern.matcher(username);
			if (!usermatcher.matches()) {
				err_username += "Tên đăng nhập phải từ 6 ký tự trở lên.";
				check = true;
			} else {
				String sql = "SELECT * FROM taikhoan";
				ResultSet rs = null;
				try {
					rs = Connec.connect().executeQuery(sql);
					rs.beforeFirst();
					while (rs.next()) {
						if (rs.getString(2).equals(username)) {
							err_username = "Tên đăng nhập đã tồn tại, vui lòng chọn tên khác";
							check = true;
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
		// Kiểm tra password
		Pattern passwordpattern = Pattern.compile("^[A-Z a-z 0-9]{6,100}$");
		Matcher passwordmatcher = passwordpattern.matcher(password);
		String err_password = "";
		if (password == null) {
			err_password = "Bạn chưa nhập mật khẩu!";
			check = true;
		} else {
			password = password.trim();
		}
		if (password == "") {
			err_password = "Bạn chưa nhập mật khẩu!";
			check = true;
		} else if (!passwordmatcher.matches()) {
			err_password += "Password phải từ 6 ký tự trở lên";
			check = true;
		}
		String err_re_password = "";
		if (re_password == null) {
			err_re_password = "Bạn chưa nhập re_password!";
			check = true;
		} else {
			re_password = re_password.trim();
			if (re_password.equals("")) {
				re_password = null;
				err_re_password = "Bạn chưa nhập re_password!";
				check = true;
			} else if (!passwordmatcher.matches()) {
				err_re_password = "Password phải từ 6 ký tự trở lên";
				check = true;
			} else if (password.equals(re_password) == false) {
				err_re_password = "Password của bạn không giống nhau!";
				check = true;
			}
		}
		// Kiểm tra lỗi name
		String err_name = "";
		if (name == null) {
			err_name += "Bạn chưa nhập tên.";
			check = true;
		} else {
			name = name.trim();
		}
		if (name == "") {
			err_name += "Bạn chưa nhập tên.";
			check = true;
		}
//	
		// Kiểm tra lỗi phone
		String err_phone = "";
		if (phone == null) {
			err_phone += "Bạn chưa số điện thoại";
			check = true;
		} else {
			phone = phone.trim();
		}
		if (phone == "") {
			err_phone += "Bạn chưa nhập số điện thoại";
			check = true;
		} else {
			Pattern phonepattern = Pattern.compile("^[0-9]{10,13}$");
			Matcher phonematcher = phonepattern.matcher(phone);
			if (!phonematcher.matches()) {
				err_phone += "Số điện thoại phải là số và từ 10 đến 13 chữ số";
				check = true;
			}
		}
		// Kiểm tra lỗi email
		String err_email = "";
		if (email == null) {
			err_email += "Bạn chưa nhập email";
			check = true;
		} else {
			email = email.trim();
		}
		if (email == "") {
			err_email += "Bạn chưa nhập email";
			check = true;
		} else {
			Pattern emailpattern = Pattern
					.compile("^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@"
							+ "[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$");
			Matcher emailmatcher = emailpattern.matcher(email);
			if (!emailmatcher.matches()) {
				err_email += "Email không hợp lệ (ví dụ: abc@gmail.com)";
				check = true;
			} else {
				String sql = "select * from khachhang";
				ResultSet rs = null;
				try {
					rs = Connec.connect().executeQuery(sql);
					rs.beforeFirst();
					while (rs.next()) {
						if (rs.getString(8).equals(email)) {
							err_email = "Email đã tồn tại, hãy xài email khác...";
							check = true;
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
		

		// Lưu database
		if (!check) {
			try {
				if (avatar == null)
					avatar = "";
				if (address == null)
					address = "";
				if (birthday == null) {
					birthday = "1990-01-01";
				}
				int idTK = TaiKhoanDao.taikhoanID();
				int idTKNew = idTK + 1;
				int idKH = KhachHangDao.maxID();
				int idnew = idKH + 1;
				String pass = TaiKhoanDao.maHoaPass(password);
				TaiKhoanDao.insertTaiKhoan(idTKNew, username, pass, 2, 1);
				KhachHangDao.insertKhachHang(idnew, idTKNew, name, birthday, sex,
						address, phone, email, avatar);
				System.out.println(KhachHangDao.insertKhachHang(idnew, idTKNew, name, birthday, sex,
						address, phone, email, avatar));
				System.out.println(TaiKhoanDao.insertTaiKhoan(idTKNew, username, pass, 2, 1));

			} catch (Exception e) {
				e.printStackTrace();
			}
			/*
			 * Đănh ký thành công thì gửi mail.....
			 */
			try {
				Mail.sendMail(
						"smtp.gmail.com",
						email,
						"12130234@st.hcmuaf.edu.vn",
						"touyen93",
						"Thông Báo!",
						"Chúc mừng bạn "
								+ name
								+ " đã đăng kỳ thành công \n\n username của bạn là: "
								+ username + ",password: " + password);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			url = "/home.jsp";
			
		
		} else {
			url = "/dk.jsp";
			request.setAttribute("err_username", err_username);
			request.setAttribute("err_password", err_password);
			request.setAttribute("err_re_password", err_re_password);
			request.setAttribute("err_name", err_name);
			request.setAttribute("err_phone", err_phone);
			request.setAttribute("err_email", err_email);

		}

		RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
		rd.forward(request, response);
	}

}
