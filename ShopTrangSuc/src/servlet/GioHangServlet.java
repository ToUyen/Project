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
import model.*;

/**
 * Servlet implementation class GioHang
 */
@WebServlet("/ShowCard")
public class GioHangServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public GioHangServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		init(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		init(request, response);
	}

	protected void init(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		List<GioHang> list = new ArrayList<GioHang>();
		int soLuong = 0;
		double tongcong = 0;
		TreeMap<Integer, GioHang> card = (TreeMap<Integer, GioHang>) session
				.getAttribute("card");
		if (card == null)
			card = new TreeMap<Integer, GioHang>();
		Iterator<GioHang> it = card.values().iterator();
		int i = 0;
		while (it.hasNext()) {
			GioHang pr = it.next();
			tongcong = pr.getSoLuong() * pr.getGia();
			soLuong += pr.getSoLuong();
			list.add(pr);
		}
		session.setAttribute("listGioHang", list);
		request.setAttribute("total", tongcong);
		session.setAttribute("soluong", soLuong);
		request.getRequestDispatcher("/giohang.jsp").forward(request, response);
	}
}
