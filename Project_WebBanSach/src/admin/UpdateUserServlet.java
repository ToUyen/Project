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

import org.omg.PortableServer.ID_ASSIGNMENT_POLICY_ID;

import connection.ConnectionDB;
import dao.KhachHangDAO;
import dao.TaiKhoanDAO;
import dao.ThanhVienDAO;
import entity.KhachHang;

/**
 * Servlet implementation class UpdateUserServlet
 */
public class UpdateUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UpdateUserServlet() {
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
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		int idtk = Integer.parseInt(request.getParameter("idtk"));
		String tendn = request.getParameter("tendn");
		String matkhau = request.getParameter("matkhau");
		String hoten = request.getParameter("hoten");
		String dienthoai = request.getParameter("dienthoai");
		String email = request.getParameter("email");
		int ngay = Integer.parseInt(request.getParameter("ngay"));
		int thang = Integer.parseInt(request.getParameter("thang"));
		int nam = Integer.parseInt(request.getParameter("nam"));
		String dienthoaididong = request.getParameter("dienthoaididong");
		String gioitinh = request.getParameter("gioitinh");
		String idgroup = request.getParameter("idgroup");
		String idactive = request.getParameter("idactive");
		String quocgia = request.getParameter("qg");
		String tinhthanh = request.getParameter("tt");
		String diachi = request.getParameter("diachi");
		boolean baoloi = false;
		System.out.println("dienthoaididong: "+dienthoaididong);
		String tdn_err = "";
		if (tendn == null || tendn == "") {
			tdn_err = "Chưa nhập tên đăng nhập";
			baoloi = true;
		} else {
			tendn = tendn.trim();
		}

		String mk_err = "";
		if (matkhau == null || matkhau == "") {
			mk_err = "mật khẩu không thể trống";
			baoloi = true;
		} else {
			matkhau = matkhau.trim();
		}

		String ht_err = "";
		if (hoten == null || hoten == "") {
			ht_err = "họ tên không thể trống";
			baoloi = true;
		} else {
			hoten = hoten.trim();
		}
		String sdt_err = "";
		if (dienthoai == null || dienthoai == "") {
			sdt_err = "số điện thoại không thể trống";
			baoloi = true;
		} else {
			dienthoai.trim();
		}

		String email_err = "";
		if (email == null || email == "") {
			email_err = "email không thể trống";
			baoloi = true;
		} else {
			email = email.trim();
		}
		if (email == "") {
			email_err += "email không thể trống";
			baoloi = true;
		} else {
			Pattern emailpattern = Pattern
					.compile("^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@"
							+ "[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$");
			Matcher emailmatcher = emailpattern.matcher(email);
			if (!emailmatcher.matches()) {
				email_err += "sai định dạng email";
				baoloi = true;
			}
		}

		String tenproject = request.getContextPath();
		if (baoloi == false) {
			String ngaysinh = "";
			if (ngay < 10 && thang < 10) {
				ngaysinh = nam + "-0" + thang + "-0" + ngay;
				System.out.println("Ngày sinh: " + ngaysinh);
			} else if (ngay < 10 && thang >= 10) {
				ngaysinh = nam + "-" + thang + "-0" + ngay;
				System.out.println("Ngày sinh: " + ngaysinh);
			} else if (ngay >= 10 && thang < 10) {
				ngaysinh = nam + "-0" + thang + "-" + ngay;
				System.out.println("Ngày sinh: " + ngaysinh);
			} else {
				ngaysinh = nam + "-" + thang + "-" + ngay;
				System.out.println("Ngày sinh: " + ngaysinh);
			}

			if (dienthoaididong == null) {
				dienthoaididong = "";
			}
			String gt = "";
			System.out.println("gioitinh: " + gioitinh);
			switch (gioitinh) {
			case "0":
				gt = "nam";
				break;
			case "1":
				gt = "nữ";
				break;
			}
			System.out.println("giới tính:" + gt);
			KhachHangDAO.updateKhachHang(idtk, tendn, hoten, gt, dienthoai,
					dienthoaididong, ngaysinh, quocgia, tinhthanh, diachi);
			TaiKhoanDAO.updateTaiKhoan(idtk, tendn, matkhau,
					Integer.parseInt(idgroup), Integer.parseInt(idactive));
			ThanhVienDAO.updateThanhVien(idtk, tendn, hoten, email);
			response.sendRedirect(tenproject + "/admin/UpdateUser.jsp?tendn="
					+ tendn);
		} else {
			request.setAttribute("tdn_err", tdn_err);
			request.setAttribute("mk_err", mk_err);
			request.setAttribute("ht_err", ht_err);
			request.setAttribute("email_err", email_err);
			request.setAttribute("sdt_err", sdt_err);
			RequestDispatcher rd = getServletContext().getRequestDispatcher(
					"/admin/UpdateUser.jsp");
			rd.forward(request, response);
		}
	}
}
