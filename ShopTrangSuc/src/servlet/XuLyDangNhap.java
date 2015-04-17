package servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.tagext.TryCatchFinally;

import model.TaiKhoan;
import dao.KhachHangDao;
import dao.LoginDao;
import dao.TaiKhoanDao;
import database.Connec;
import database.ConnectionDB;

public class XuLyDangNhap extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public XuLyDangNhap() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		try {
			doAction(request, response);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		try {
			doAction(request, response);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	protected void doAction(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException,
			SQLException {
		// response.setContentType("text/html;charset=UTF-8");
		// request.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String name = request.getParameter("name");
		HttpSession session = request.getSession();

		String url = "";
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		if (LoginDao.checkLogin(username, password) == true) {
			String sql = "select NHOM from taikhoan where TENTK =? ";
			pstmt = Connec.getConnection().prepareStatement(sql);
			pstmt.setString(1, username);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				int nhom = rs.getInt("taikhoan.NHOM");
				if (nhom == 2) {
					url = "dangnhapthanhcong.jsp";

				} else
					url = "amindangnhaptcong.jsp";
			}
		} else {
			request.getSession().setAttribute("loi",
					"Tên đăng nhập hoặc mật khẩu không đúng");
			url = "dangnhap.jsp";
		}
		// tim ten
		String searchName = "SELECT khachhang.HOVATEN, taikhoan.NHOM FROM khachhang,taikhoan WHERE khachhang.MATK = taikhoan.MATK AND taikhoan.TENTK = ? AND taikhoan.MATKHAUTK = ?";
		System.out.println(searchName);
		pstmt = Connec.getConnection().prepareStatement(searchName);
		pstmt.setString(1, username);
		pstmt.setString(2, TaiKhoanDao.maHoaPass(password));
		rs = pstmt.executeQuery();
		rs.beforeFirst();
		String nhom;
		while (rs.next()) {
			name = rs.getString("khachhang.HOVATEN");
			nhom = rs.getString("taikhoan.NHOM");
			request.getSession(true).setAttribute("ten", name);
			request.getSession(true).setAttribute("nhom", nhom);

		}
		System.out.println("tìm kiếm thành công...tên khách hàng là: " + name);

		request.getSession(true).setAttribute("username", username);
		request.getSession(true).setAttribute("password", password);
		response.sendRedirect(url);

	}
}
