package admin;

import java.io.IOException;

import java.io.UnsupportedEncodingException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mail.Mail;

import connection.ConnectionDB;

/**
 * Servlet implementation class LienHe
 */
public class LienHe extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LienHe() {
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
			throws IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");

		String tieude = request.getParameter("tieude");
		String thongtin = request.getParameter("thongtin");

		String sql = "SELECT thanhvien.email FROM taikhoan inner join thanhvien on taikhoan.id = thanhvien.taikhoanID WHERE taikhoan.groups = 2;";
		PreparedStatement pstmt;
		try {
			pstmt = ConnectionDB.getConnection().prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				String email = rs.getString(1);
				try {
					Mail.sendMail("smtp.gmail.com", email, "ntatvr@gmail.com",
							"01653164732", tieude, thongtin);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			String tenproject = request.getContextPath();
			response.sendRedirect(tenproject + "/LienHe.jsp");
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

}
