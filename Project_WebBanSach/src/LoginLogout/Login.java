package LoginLogout;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.jni.User;

import entity.TaiKhoan;

import connection.ConnectionDB;
import dao.TaiKhoanDAO;

/**
 * Servlet implementation class Login
 */
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Login() {
		super();
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
			throws IOException, ServletException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String ghinhomk = request.getParameter("ghinhomk");
		boolean baoloi = false;
		if (username.trim().length() == 0) {
			request.setAttribute("err_user", "chưa nhập tên đăng nhập");
			baoloi = true;
		} else {
			request.setAttribute("username", username);
		}
		if (password.trim().length() == 0) {
			request.setAttribute("err_pass", "chưa nhập mật khẩu");
			baoloi = true;
		} else {
			request.setAttribute("password", password);
		}
		if (baoloi) {
			request.setAttribute("username", username);
			request.setAttribute("password", password);
		}
		Connection con = null;
		PreparedStatement stm = null;
		ResultSet rs = null;
		try {
			String sql = "Select * from taikhoan where username=? and password=? and active=?;";
			System.out.println(sql);
			try {

				// kiểm tra tên đăng nhập với mật khẩu
				stm = ConnectionDB.conn().prepareStatement(sql);
				stm.setString(1, username);
				stm.setString(2, password);
				stm.setInt(3, 1);
				rs = stm.executeQuery();
				rs.last();
				int i = rs.getRow();
				if (rs != null && i == 1) {
					TaiKhoan taiKhoan = new TaiKhoan();
					rs.first();
					taiKhoan.setMaTK(rs.getInt(1));
					taiKhoan.setUsername(rs.getString(2));
					taiKhoan.setPassword(rs.getString(3));
					taiKhoan.setNhom(rs.getInt(4));
					taiKhoan.setActive(rs.getInt(5));
					int group = rs.getInt(4);
					HttpSession session = request.getSession();
					session.setAttribute("taiKhoan", taiKhoan);
					session.setAttribute("isLogin", "1");
					if (group == 2) {
						response.sendRedirect("TrangChu.jsp");
					} else {
						response.sendRedirect("admin/AdminPage.jsp");
					}
					request.setAttribute("username", username);
					request.setAttribute("password", password);
					Cookie ckuser = new Cookie("ckuser", username);
					Cookie ckpass = new Cookie("ckpass", password);
					if (ghinhomk != null) {
						ckuser.setMaxAge(30 * 24 * 60 * 60);
						ckpass.setMaxAge(30 * 24 * 60 * 60);
					} else {
						ckuser.setMaxAge(0);
						ckpass.setMaxAge(0);
					}
					response.addCookie(ckuser);
					response.addCookie(ckpass);
					// tìm kiếm tên
					String searchName = "SELECT thanhvien.tendangnhap,taikhoan.groups FROM taikhoan, thanhvien WHERE taikhoan.id = thanhvien.taikhoanID AND taikhoan.username =? AND taikhoan.`password`=?;";
					stm = ConnectionDB.conn().prepareStatement(searchName);
					stm.setString(1, username);
					stm.setString(2, password);
					rs = stm.executeQuery();
					rs.beforeFirst();
					String ten = null;
					String nhom;
					while (rs.next()) {
						ten = rs.getString("thanhvien.tendangnhap");
						nhom = rs.getString("taikhoan.groups");
						request.getSession(true).setAttribute("tendaydu", ten);
						request.getSession(true).setAttribute("nhom", nhom);
					}
					System.out
							.println("Tìm kiếm thành công...tên đã đăng ký là: "
									+ ten);
				} else {
					request.setAttribute(
							"err",
							"Bạn "
									+ " đã nhấp sai tên đăng nhập hoặc mật khẩu....yêu cầu nhập lại để được đăng nhập");
					request.getRequestDispatcher("DangNhap.jsp").forward(
							request, response);
				}
			} catch (ClassNotFoundException | SQLException e) {
				e.printStackTrace();
				System.out.println("Lỗi liên kết qua csdl");
				request.setAttribute(
						"err",
						"Bạn đã nhấp sai tên đang nhập hoặc mật khẩu....yêu cầu nhập lại để được đăng nhập");
				response.sendRedirect("DangNhap.jsp");
			} catch (Exception e) {
				e.printStackTrace();
			}
		} finally {
			try {
				rs.close();
				stm.close();
				ConnectionDB.closeConnection(con);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

	}

}
