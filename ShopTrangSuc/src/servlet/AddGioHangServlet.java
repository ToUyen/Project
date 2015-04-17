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

import dao.Data;
import dao.SanPhamDao;

import model.GioHang;
import model.SanPhamGH;

/**
 * Servlet implementation class AddGioHangServlet
 */
@WebServlet("/AddGioHangServlet")
public class AddGioHangServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddGioHangServlet() {
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
			HttpServletResponse response) throws ServletException, IOException,
			SQLException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		int id = Integer.parseInt(request.getParameter("MASP"));
		System.out.println("masp: "+id);
		GioHang g = SanPhamDao.getSPGH(id);
		if(g != null){
			HttpSession session = request.getSession();
			TreeMap<Integer, GioHang> card = (TreeMap<Integer, GioHang>)session.getAttribute("card");
		if(card == null){
			card = new TreeMap<Integer, GioHang>();
			card.put(id, g);
		}else{
			GioHang g1 = card.get(id);
			if(g1 == null){
				card.put(id, g);
			}else{
				g1.plusCount();
			}
		}
		session.setAttribute("card", card);
		}
		request.getRequestDispatcher("/ShowCard").forward(request, response);	
		}
}
