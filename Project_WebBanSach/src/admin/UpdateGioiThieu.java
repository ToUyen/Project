package admin;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import connection.ConnectionDB;

/**
 * Servlet implementation class UpdateGioiThieu
 */
public class UpdateGioiThieu extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UpdateGioiThieu() {
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

		String gioithieu = request.getParameter("gioithieu");
		String loiich1 = request.getParameter("loiich1");
		String loiich2 = request.getParameter("loiich2");
		String loiich3 = request.getParameter("loiich3");
		String ketthuc = request.getParameter("ketthuc");

		String update = "UPDATE gioithieu SET gioithieu ='" + gioithieu
				+ "',gioithieu2='" + ketthuc + "',loiich1='" + loiich1
				+ "',loiich2='" + loiich2 + "',loiich3='" + loiich3
				+ "' WHERE id = 1";
		try {
			PreparedStatement pstmt = ConnectionDB.getConnection().prepareStatement(update);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		String tenproject = request.getContextPath();
		response.sendRedirect(tenproject+"/UpdateGioiThieu.jsp");
	}

}
