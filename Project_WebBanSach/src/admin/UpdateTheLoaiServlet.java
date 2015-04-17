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
import dao.DanhMucDao;
import dao.TheLoaiDao;

/**
 * Servlet implementation class UpdateTheLoaiServlet
 */
public class UpdateTheLoaiServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UpdateTheLoaiServlet() {
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
		String tendm = request.getParameter("tendm");
		String matl = request.getParameter("matl");
		String tentl = request.getParameter("tentl");
		System.out.println(tendm);
		System.out.println(matl);
		System.out.println(tentl);
		boolean baoloi = false;
		String tentl_err = "";
		if (tentl == null) {
			tentl_err = "chưa nhập tên thể loại";
			baoloi = true;
		} else {
			tentl = tentl.trim();
		}
		if (tentl == "") {
			tentl_err = "chưa nhập tên thể loại";
			baoloi = true;
		} else {
			String sqlsearch = "SELECT count(maLoaiSach) FROM loaisach WHERE tenLoaiSach = '"
					+ tentl + "'";
			PreparedStatement pstmt;
			try {
				pstmt = ConnectionDB.getConnection()
						.prepareStatement(sqlsearch);
				ResultSet rs = pstmt.executeQuery();
				rs.next();
				int count = rs.getInt(1);
				if (count == 0) {
					TheLoaiDao.updateTheLoai(Integer.parseInt(matl), tendm,
							tentl);
				} else {
					tentl_err = "tên danh mục đã tồn tại";
					baoloi = true;
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		String tenproject = request.getContextPath();
		if (baoloi = false) {
			response.sendRedirect(tenproject + "/admin/UpdateTheLoai.jsp");
		} else {
			request.setAttribute("tentl_err", tentl_err);
			RequestDispatcher rd = getServletContext().getRequestDispatcher(
					"/admin/UpdateTheLoai.jsp");
			rd.forward(request, response);
		}
	}

}
