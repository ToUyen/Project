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

/**
 * Servlet implementation class AddDanhMuc
 */
public class AddDanhMuc extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddDanhMuc() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		toDo(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		toDo(request,response);
	}

	private void toDo(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String tendm = request.getParameter("tendm");
		
		boolean baoloi = false;
		String tendm_err = "";
		if (tendm == null || tendm == "") {
			tendm_err = "chưa nhập tên danh mục";
			baoloi = true;
		} else {
			tendm = tendm.trim();
		}
		if (tendm == "") {
			tendm_err = "chưa nhập tên danh mục";
			baoloi = true;
		} else {
			String sqlsearch = "SELECT count(maDanhMucSach) FROM danhmucsach WHERE tenDanhMucSach = '"
					+ tendm + "'";
			PreparedStatement pstmt;
			try {
				pstmt = ConnectionDB.getConnection()
						.prepareStatement(sqlsearch);
				ResultSet rs = pstmt.executeQuery();
				rs.next();
				int count = rs.getInt(1);
				if (count == 0) {
					DanhMucDao.insertDanhMuc(tendm);
				} else {
					tendm_err = "tên danh mục đã tồn tại";
					baoloi = true;
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}

		}
		String tenproject = request.getContextPath();
		if(baoloi == false){
			response.sendRedirect(tenproject+"/admin/Adddanhmuc.jsp");
		}else{
			request.setAttribute("tendm_err", tendm_err);
			RequestDispatcher rd = getServletContext().getRequestDispatcher("/admin/Adddanhmuc.jsp");
			rd.forward(request, response);
		}
	}

}
