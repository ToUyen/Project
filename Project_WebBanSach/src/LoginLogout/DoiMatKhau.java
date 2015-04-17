package LoginLogout;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.TaiKhoanDAO;

/**
 * Servlet implementation class DoiMatKhau
 */
public class DoiMatKhau extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DoiMatKhau() {
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

		String tendn = request.getParameter("username");
		String matkhau = request.getParameter("password");
		String matkhaumoi = request.getParameter("passwordnew");

		String tendn_err = "";
		if (tendn == null) {
			tendn_err = "chưa nhập tên đăng nhập";
		} else {
			tendn = tendn.trim();
		}
		if (tendn == "") {
			tendn_err = "chưa nhập tên đăng nhập";
		} else {
			if (TaiKhoanDAO.searchTaiKhoan(tendn) == false) {
				tendn_err = "tên đăng nhập không tồn tại";
			}
		}
		String matkhau_err = "";
		if (matkhau == null) {
			matkhau_err = "chưa nhập tên mật khẩu";
		} else {
			matkhau = matkhau.trim();
		}
		if (matkhau == "") {
			matkhau_err = "chưa nhập tên mật khẩu";
		} else {
			if (TaiKhoanDAO.checkMatKhau(tendn, matkhau) == false) {
				matkhau_err = "sai mật khẩu";
			}
		}
		String matkhaumoi_err = "";
		if (matkhaumoi == null) {
			matkhaumoi_err = "chưa nhập mật khẩu mới";
		} else {
			matkhaumoi = matkhaumoi.trim();
		}
		if(matkhaumoi.equalsIgnoreCase(matkhau)){
			matkhaumoi_err = "mật khẩu mới trùng mật khẩu cũ";
		}
		if(matkhaumoi == ""){
			matkhaumoi_err = "chưa nhập mật khẩu mới";
		}else{
			Pattern p = Pattern.compile("^[A-Z a-z 0-9]{8,100}$");
			Matcher m = p.matcher(matkhaumoi);
			if(!m.matches()){
				matkhaumoi_err = "mật khẩu phải trên 8 ký tự để đảm bảo độ an toàn";
			}
		}

		request.setAttribute("tendn", tendn);
		request.setAttribute("matkhau", matkhau);
		request.setAttribute("matkhaumoi", matkhaumoi);
		if (tendn_err.length() > 0 || matkhau_err.length() > 0
				|| matkhaumoi_err.length() > 0) {
			request.setAttribute("tendn_err", tendn_err);
			request.setAttribute("matkhau_err", matkhau_err);
			request.setAttribute("matkhaumoi_err", matkhaumoi_err);
			RequestDispatcher rd = getServletContext().getRequestDispatcher(
					"/DoiMatKhau.jsp");
			rd.forward(request, response);

		} else {
			response.sendRedirect("DangNhap.jsp");
		}

	}

}
