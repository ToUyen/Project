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
import dao.TaiKhoanDAO;

/**
 * Servlet implementation class UpdateNXBServlet
 */
public class UpdateNXBServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UpdateNXBServlet() {
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
		try {
			toDo(request, response);
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
		// TODO Auto-generated method stub
		try {
			toDo(request, response);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	private void toDo(HttpServletRequest request, HttpServletResponse response)
			throws IOException, SQLException, ServletException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String manxb = request.getParameter("manxb");
		String tennxb = request.getParameter("tennxb");
		System.out.println("manxb: "+manxb);
		System.out.println(tennxb);
		boolean baoloi = false;
		String tennxb_err = "";

		if (tennxb == null || tennxb == "") {
			tennxb_err = "chưa nhập tên nhà xuất bản";
			baoloi = true;
		} else {
			tennxb = tennxb.trim();
		}
		if (tennxb == "") {
			tennxb_err = "chưa nhập tên nhà xuất bản";
			baoloi = true;
		} else {
			String sqlsearch = "SELECT count(maNhaXuatBan) FROM nhaxuatban WHERE tenNhaXuatBan = '"
					+ tennxb + "'";
			PreparedStatement pstmt = ConnectionDB.getConnection()
					.prepareStatement(sqlsearch);
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			int count = rs.getInt(1);
			if (count == 0) {
				NhaXuatBanDao.updateNXB(Integer.parseInt(manxb), tennxb);
			} else {
				tennxb_err = "tên nhà xuất bản đã tồn tại, mã nhà xuất bản là: "
						+ manxb;
				baoloi = true;
			}
			pstmt.close();
			rs.close();
		}
		String tenproject = request.getContextPath();
		if (baoloi = false) {
			response.sendRedirect(tenproject + "/admin/UpdateNXB.jsp");
		} else {
			request.setAttribute("tennxb_err", tennxb_err);
			RequestDispatcher rd = getServletContext().getRequestDispatcher(
					"/admin/UpdateNXB.jsp");
			rd.forward(request, response);
		}
	}

}
