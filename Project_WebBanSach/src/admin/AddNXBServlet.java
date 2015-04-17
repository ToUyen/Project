package admin;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import connection.ConnectionDB;
import dao.NhaXuatBanDao;

/**
 * Servlet implementation class AddNXBServlet
 */
public class AddNXBServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddNXBServlet() {
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
			throws IOException, ServletException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String tennxb = request.getParameter("tennxb");
		System.out.println("tennxb:" +tennxb);
		boolean baoloi = false;
		String tennxb_err = "";
		if (tennxb == null || tennxb == "") {
			tennxb_err = "Chưa nhập tên nhà xuất bản";
			baoloi = true;
		} else {
			tennxb = tennxb.trim();
		}
		if (tennxb.length() == 0) {
			tennxb_err = "Chưa nhập tên nhà xuất bản";
			baoloi = true;
		} else {
			String sqlsearch = "SELECT count(maNhaXuatBan) FROM nhaxuatban WHERE tenNhaXuatBan = '"
					+ tennxb + "';";
			try {
				PreparedStatement pstmtsearch = ConnectionDB.getConnection()
						.prepareStatement(sqlsearch);
				ResultSet rssearch = pstmtsearch.executeQuery();
				rssearch.next();
				int count = rssearch.getInt(1);
				if (count == 0) {
					NhaXuatBanDao.insertNXB(tennxb);
				} else {
					tennxb_err = "Tên nhà xuất bản đã tồn tại, id là: " + count;
					baoloi = true;
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}

		}
		String tenproject = request.getContextPath();
		if (baoloi == false) {
			response.sendRedirect(tenproject + "/admin/Addnxb.jsp");
		} else {
			request.setAttribute("tennxb_err", tennxb_err);
			RequestDispatcher rd = getServletContext().getRequestDispatcher(
					"/admin/Addnxb.jsp");
			rd.forward(request, response);
		}
	}

}
