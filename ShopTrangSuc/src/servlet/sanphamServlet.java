package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.SanPham;

import dao.SanPhamDao;

/**
 * Servlet implementation class SanPhamServlet
 */
@WebServlet("/SanPhamServlet")
public class sanphamServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static int DEFAULT_SIZE = 9;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public sanphamServlet() {
		super();
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
//
//		int size = DEFAULT_SIZE;
//
//		size = Integer.parseInt(request.getParameter("s"));
//		if (size <= 0)
//			size = DEFAULT_SIZE;
//		int sumProduct = SanPhamDao.counid();
//		if (sumProduct < 0) {
//			return;
//			// error sql return -1
//		}
//		int sumPage = sumProduct / size;
//		if (sumPage % size != 0) {
//			sumPage++;
//		}
//		int currentPage = 1;
//		currentPage = Integer.parseInt("p");
//		if (currentPage <= 0) {
//			currentPage = 1;
//		} else if (currentPage > sumPage - 1) {
//			currentPage = sumPage;
//		}
//		String sql = "SELECT * FROM sanpham LIMIT ?,?";
//		List<SanPham> list = SanPhamDao.selectLimitProduct(sql,
//				(currentPage - 1) * size, size);
//		request.setAttribute("page", currentPage);
//		request.setAttribute("sumpage", sumPage);
//		request.setAttribute("listsp", list);
//		getServletContext().getRequestDispatcher("/sanphamdaychuyen.jsp")
//				.forward(request, response);
	}
}
