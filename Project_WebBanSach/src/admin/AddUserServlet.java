package admin;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.PreparedStatement;
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
import dao.KhachHangDAO;
import dao.TaiKhoanDAO;
import dao.ThanhVienDAO;

/**
 * Servlet implementation class AddUser
 */
public class AddUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddUserServlet() {
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
		try {
			toDo(request, response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			toDo(request, response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	private void toDo(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, Exception {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");

		String tendn = request.getParameter("tendn");
		String matkhau = request.getParameter("matkhau");
		String hoten = request.getParameter("hoten");
		String dienthoai = request.getParameter("dienthoai");
		String email = request.getParameter("email");
		String dienthoaididong = request.getParameter("dienthoaididong");
		String gioitinh = request.getParameter("gioitinh");
		String idgroup = request.getParameter("idgroup");
		String idactive = request.getParameter("idactive");
		String quocgia = request.getParameter("qg");
		String tinhthanh = request.getParameter("tt");
		String diachi = request.getParameter("diachi");
		boolean baoloi = false;
		int ngay = Integer.valueOf(request.getParameter("ngay"));
		int thang = Integer.valueOf(request.getParameter("thang"));
		int nam = Integer.valueOf(request.getParameter("nam"));
		System.out.println(ngay + "/" + thang + "/" + nam);
		System.out.println("tinh: "+tinhthanh);
		System.out.println("quocgia: "+quocgia);
		String tdn_err = "";
		if (tendn == null) {
			tdn_err = "Chưa nhập tên đăng nhập";
			baoloi = true;
		} else {
			tendn = tendn.trim();
		}
		if (tendn == "") {
			tdn_err = "Chưa nhập tên đăng nhập";
			baoloi = true;
		} else {
			String sql = "SELECT * FROM taikhoan";
			PreparedStatement pstmt = ConnectionDB.conn().prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			rs.beforeFirst();
			while (rs.next()) {
				if (rs.getString(2).equals(tendn)) {
					tdn_err = "Tên đăng nhập đã tồn tại";
					baoloi = true;
				}
			}
		}

		String mk_err = "";
		if (matkhau == null) {
			mk_err = "Chưa nhập mật khẩu";
			baoloi = true;
		} else {
			matkhau = matkhau.trim();
		}
		if (matkhau == "") {
			mk_err = "Chưa nhập mật khẩu";
			baoloi = true;
		} else {
			Pattern ptmk = Pattern.compile("^[A-Z a-z 0-9]{8,100}$");
			Matcher mtmk = ptmk.matcher(matkhau);
			if (!mtmk.matches()) {
				mk_err = "Mật khẩu phải từ 8 ký tự trở lên sẽ an toàn hơn.";
				baoloi = true;
			}
		}

		String ht_err = "";
		if (hoten == null || hoten == "") {
			ht_err = "Chưa nhập họ tên";
			baoloi = true;
		} else {
			hoten = hoten.trim();
		}
		String sdt_err = "";
		if (dienthoai == null) {
			sdt_err = "Chưa nhập số điện thoại";
			baoloi = true;
		} else {
			dienthoai.trim();
		}
		if (dienthoai == "") {
			sdt_err = "Chưa nhập số điện thoại";
			baoloi = true;
		} else {
			Pattern ptsdt = Pattern.compile("^[0-9]{10,13}$");
			Matcher mtsdt = ptsdt.matcher(dienthoai);
			if (!mtsdt.matches()) {
				sdt_err = "Sai định dạng sdt";
				baoloi = true;
			}
		}

		String email_err = "";
		if (email == null) {
			email_err = "Chưa nhập email";
			baoloi = true;
		} else {
			email = email.trim();
		}
		if (email == "") {
			email_err = "Chưa nhập email";
			baoloi = true;
		} else {
			Pattern ptemail = Pattern
					.compile("^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@"
							+ "[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$");
			Matcher mcemail = ptemail.matcher(email);
			if (!mcemail.matches()) {
				email_err = "Sai định dạng email";
				baoloi = true;
			} else {
				String sql = "SELECT * FROM thanhvien";
				PreparedStatement pstmt = ConnectionDB.conn().prepareStatement(
						sql);
				ResultSet rs = pstmt.executeQuery();
				rs.beforeFirst();
				while (rs.next()) {
					if (rs.getString(3).equals(email)) {
						email_err = "email đã tồn tại";
						baoloi = true;
					}
				}
			}
		}
		String tenproject = request.getContextPath();
		if (baoloi == false) {
			String ngaysinh = "";
			if (ngay < 10 && thang < 10) {
				ngaysinh =  nam +"-0"+thang+"-0"+ngay;
				System.out.println("Ngày sinh: " + ngaysinh);
			} else if (ngay < 10 && thang >= 10) {
				ngaysinh =  nam +"-"+thang+"-0"+ngay;
				System.out.println("Ngày sinh: " + ngaysinh);
			} else if (ngay >= 10 && thang < 10) {
				ngaysinh =  nam +"-0"+thang+"-"+ngay;
				System.out.println("Ngày sinh: " + ngaysinh);
			} else {
				ngaysinh =  nam +"-"+thang+"-"+ngay;
				System.out.println("Ngày sinh: " + ngaysinh);
			}

			if (dienthoaididong == null) {
				dienthoaididong = "";
			}
			String gt = "";
			if (gioitinh == "0") {
				gt = "nam";
			} else {
				gt = "nữ";
			}
			try {
				TaiKhoanDAO.insertTaiKhoan(tendn, matkhau,
						Integer.parseInt(idgroup), Integer.parseInt(idactive));
				KhachHangDAO.insertKhachHang(hoten, gt, dienthoai,
						dienthoaididong, ngaysinh, quocgia, tinhthanh, diachi);
				ThanhVienDAO.insertThanhVien(hoten, email);
			} catch (Exception e1) {
				e1.printStackTrace();
			}

			response.sendRedirect(tenproject + "/admin/AddUser.jsp");
		} else {
			System.out.println("có lỗi");
			request.setAttribute("tdn_err", tdn_err);
			request.setAttribute("mk_err", mk_err);
			request.setAttribute("ht_err", ht_err);
			request.setAttribute("email_err", email_err);
			request.setAttribute("sdt_err", sdt_err);
			RequestDispatcher rs = getServletContext().getRequestDispatcher(
					"/admin/AddUser.jsp");
			rs.forward(request, response);
		}
	}
}
