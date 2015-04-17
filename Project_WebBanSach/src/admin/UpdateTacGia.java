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

import dao.TacGiaDao;
import dao.TaiKhoanDAO;

/**
 * Servlet implementation class UpdateTacGia
 */
public class UpdateTacGia extends HttpServlet {
	public static int id = 0;
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UpdateTacGia() {
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
		String matg = request.getParameter("matg");
		System.out.println(matg);
		String tentg = request.getParameter("tentg");
		System.out.println(tentg);
		String tentg_err = "";
		boolean baoloi = false;
		if (tentg == null) {
			tentg_err = "tên tác giả không được bỏ trống";
			baoloi = true;
		} else {
			tentg = tentg.trim();
		}
		if (tentg.length() <= 0) {
			tentg_err = "tên tác giả không được bỏ trống";
			baoloi = true;
		} else {
			String searchid = "SELECT count(matacgia) FROM tacgia WHERE tentacgia = '"+tentg+"'";
			try {
				PreparedStatement pstmt = ConnectionDB.getConnection().prepareStatement(searchid);
				ResultSet rs = pstmt.executeQuery();
				rs.next();
				int count = rs.getInt(1);
				if (count == 0) {
					TacGiaDao.updateTacGia(Integer.parseInt(matg), tentg);
				} else {
					tentg_err = "tên tác gỉa đã tồn tại";
					baoloi = true;
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		String tenproject = request.getContextPath();
		if (baoloi) {
			response.sendRedirect(tenproject + "/admin/UpdateTacGia.jsp");
		} else {
			request.setAttribute("tentg_err", tentg_err);
			RequestDispatcher rd = getServletContext().getRequestDispatcher(
					"/admin/UpdateTacGia.jsp");
			rd.forward(request, response);
		}
	}

}
