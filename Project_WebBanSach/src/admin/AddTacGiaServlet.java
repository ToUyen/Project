package admin;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import connection.ConnectionDB;

/**
 * Servlet implementation class AddTacGiaServlet
 */
public class AddTacGiaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddTacGiaServlet() {
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
		String tentg = request.getParameter("tentg");
		boolean baoloi = false;
		System.out.println(tentg);
		String tentg_err = "";
		if (tentg == null) {
			tentg_err = "chưa nhập tên tác giả";
			baoloi = true;
		} else {
			tentg = tentg.trim();
		}
		if (tentg.length() <=0) {
			tentg_err = "chưa nhập tên tác giả";
			baoloi = true;
		} else {
			try {
				String search = "SELECT matacgia FROM tacgia where tentacgia = ?";
				PreparedStatement searchpstmt = ConnectionDB.getConnection()
						.prepareStatement(search);
				searchpstmt.setString(1, tentg);
				ResultSet searchrs = searchpstmt.executeQuery();
				searchrs.next();
				String count = String.valueOf(searchrs.getInt(1));
				System.out.println(count);
				if (!count.equalsIgnoreCase(null) || count.equalsIgnoreCase("") || count.equalsIgnoreCase("0")) {
					tentg_err = "tên tác giả đã tồn tại, mã tác giả là: "
							+ count;
					baoloi = true;
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}

		}
		String tenproject = request.getContextPath();
		try {
			if (baoloi == false) {
				String insert = "INSERT INTO tacgia(tentacgia) values('"
						+ tentg + "');";
				PreparedStatement insertpstmt = ConnectionDB.getConnection()
						.prepareStatement(insert);
				insertpstmt.executeUpdate();
				response.sendRedirect(tenproject + "/admin/AddTacGia.jsp");
			} else {
				request.setAttribute("tentg_err", tentg_err);
				RequestDispatcher rd = getServletContext()
						.getRequestDispatcher("/admin/AddTacGia.jsp");
				rd.forward(request, response);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
