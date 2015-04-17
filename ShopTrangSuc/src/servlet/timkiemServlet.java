package servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.*;
import dao.*;

/**
 * Servlet implementation class TimKiemServelet
 */
@WebServlet("/TimKiemServelet")
public class timkiemServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public timkiemServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		try {
			doAction(request, response);
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		try {
			doAction(request, response);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	protected void doAction(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException, SQLException {
		String tentk = request.getParameter("timkiem");

		List<SanPham> listsp = new SanPhamDao().timKiem(tentk);
		if (tentk == null) {
			listsp = new SanPhamDao().getProduct();
		}
		request.setAttribute("listsp", listsp);
		getServletContext().getRequestDispatcher("/trangchu.jsp").forward(
				request, response);
	}

}
