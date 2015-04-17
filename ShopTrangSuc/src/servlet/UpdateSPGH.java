package servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.TreeMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.SanPhamDao;

import model.GioHang;
import model.SanPhamGH;

/**
 * Servlet implementation class UpdateSPGH
 */
@WebServlet("/UpdateSPGHServlet")
public class UpdateSPGH extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UpdateSPGH() {
		super();
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
		try {
			doAction(request, response);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	protected void doAction(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException, SQLException {
//		try {
			request.setCharacterEncoding("utf-8");
			response.setCharacterEncoding("utf-8");
			int sl = Integer.parseInt(request.getParameter("soluong"));
		//	System.out.println("so luong moi: " + sl);
			int id = Integer.parseInt(request.getParameter("id"));
		//	System.out.println("id la: " + id);
			HttpSession session = request.getSession();
			GioHang pr = SanPhamDao.getSPGH(id);
			//System.out.println(pr);
			TreeMap<Integer, GioHang> card = (TreeMap<Integer, GioHang>) session
					.getAttribute("card");
			if (sl < 1) {
				request.getRequestDispatcher("/ShowCart").forward(request,
						response);
			} else {
				GioHang p = card.get(id);
				p.setSoLuong(sl);
				session.setAttribute("card", card);
			request.getRequestDispatcher("/ShowCard")
					.forward(request, response);
			}
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}
	}

}
