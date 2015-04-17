package admin;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class UpdateSach
 */
public class UpdateSach extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UpdateSach() {
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

		String id = request.getParameter("id");
		String tensach = request.getParameter("tensach");
		String loaibia = request.getParameter("hinhthucbia");
		String giabia = request.getParameter("giabia");
		String giaban = request.getParameter("giaban");
		String giamgia = request.getParameter("giamgia");
		String soluong = request.getParameter("soluong");
		String tennxb = request.getParameter("tennxb");
		String tenls = request.getParameter("tentl");
		String tentg = request.getParameter("tentg");

		String trongluong = request.getParameter("trongluong");
		String kichthuong = request.getParameter("kichthuoc");
		String dichgia = request.getParameter("dichgia");
		String sotrang = request.getParameter("sotrang");
		String ngay = request.getParameter("ngay");
		String thang = request.getParameter("thang");
		String nam = request.getParameter("nam");

		System.out.println(id);
		System.out.println(tennxb);
		System.out.println(tenls);
		System.out.println(tentg);
		System.out.println(ngay);
		System.out.println(thang);
		System.out.println(nam);
		
		String tenproject = request.getContextPath();
		response.sendRedirect(tenproject+"/admin/Updatesach.jsp");

	}

}
