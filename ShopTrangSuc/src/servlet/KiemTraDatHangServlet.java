package servlet;

import java.io.IOException;
import java.util.TreeMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.KhachHang;
import model.SanPham;
import model.TaiKhoan;
import servlet.*;

/**
 * Servlet implementation class KiemTraDatHangSeverlet
 */
@WebServlet("/KiemTraDatHangServlet")
public class KiemTraDatHangServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public KiemTraDatHangServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doAction(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doAction(request, response);
	}

	protected void doAction(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		KhachHang user = (KhachHang) session.getAttribute("kh");
//		TaiKhoan tk = (TaiKhoan) session.getAttribute("username");
		TreeMap<String, SanPham> card = (TreeMap<String, SanPham>) session
				.getAttribute("card");
		System.out.println(card);
		if (user == null) {
			response.sendRedirect("dangnhap.jsp");
		} else {
			response.sendRedirect("giohang.jsp");
		}
	}

}
