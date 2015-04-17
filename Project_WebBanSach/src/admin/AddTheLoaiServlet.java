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
import dao.TheLoaiDao;

/**
 * Servlet implementation class AddTheLoaiServlet
 */
public class AddTheLoaiServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddTheLoaiServlet() {
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
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String tentl = request.getParameter("tentl");
		String tendm = request.getParameter("tendm");
		System.out.println(tentl);
		System.out.println(tendm);
		boolean baoloi = false;
		String tentl_err = "";
		if (tentl == null) {
			tentl_err = "chưa nhập tên thể loại";
			baoloi = true;
		} else {
			tentl = tentl.trim();
		}
		if (tentl.length() <= 0) {
			tentl_err = "chưa nhập tên thể loại";
			baoloi = true;
		} else {
			String sqlsearch = "SELECT count(maLoaiSach),maLoaiSach FROM loaisach WHERE tenLoaiSach = ?";
			try {
				PreparedStatement pstmt = ConnectionDB.getConnection()
						.prepareStatement(sqlsearch);
				pstmt.setString(1, tentl);
				ResultSet rs = pstmt.executeQuery();
				rs.next();
				int count = rs.getInt(1);
				if (count == 0) {
					TheLoaiDao.insertTheLoai(tendm, tentl);
				} else {
					tentl_err = "tên thể loại đã tồn tại, mã thể loại là: "
							+ rs.getInt(2);
					baoloi = true;
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		String tenproject = request.getContextPath();
		if (baoloi = false) {
			response.sendRedirect(tenproject + "/admin/Addtheloai.jsp");
		} else {
			request.setAttribute("tentl_err", tentl_err);
			RequestDispatcher rd = getServletContext().getRequestDispatcher(
					"/admin/Addtheloai.jsp");
			rd.forward(request, response);
		}

	}

}
