package servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.TreeMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.*;
import model.*;

/**
 * Servlet implementation class DatHangServlet
 */
@WebServlet("/DatHangServlet")
public class DatHangServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DatHangServlet() {
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

		if (user == null) {
			response.sendRedirect("SanPhamServlet");
		}
		String diaDiem = request.getParameter("diadiem");
		String maKH = request.getParameter("makh");
		String tenKh = request.getParameter("tenkh");
		System.out.println("tenkh " + tenKh);
		System.out.println("makh " + maKH);
		// System.out.println("ng�y dh: " + ngayDH);
		// System.out.println("ng�y ht: " + tght);
		DatHangDao dhd = new DatHangDao();
		boolean dh = dhd.themDH(maKH, diaDiem, tenKh);

		if (dh) {
			List<SanPham> list = new ArrayList<SanPham>();
			// List<> list = new ArrayList<SanPhamGH>();
			int tongcong = 0;
			int soLuong = 0;
			TreeMap<String, SanPham> card = (TreeMap<String, SanPham>) session
					.getAttribute("card");
			if (card == null) {
				response.sendRedirect("GioHangKhongSP.jsp");
				return;
			}

			Iterator<SanPham> it = card.values().iterator();
			int i = 0;
			String idDH = dhd.getDH(maKH);
			while (it.hasNext()) {
				SanPham pr = it.next();
				tongcong += pr.getSoLuong() * pr.getGia();
				soLuong += pr.getSoLuong();
				int soluong = pr.getSoLuong();
				int maSP = pr.getMaSP();
				double donGia = pr.getGia();

				list.add(pr);
				dhd.themDHCT(maSP, soluong, donGia, idDH);
			}
		}

		response.sendRedirect("dathangthanhcong.jsp");
		session.removeAttribute("card");
		session.removeAttribute("soluong");
	}

}
