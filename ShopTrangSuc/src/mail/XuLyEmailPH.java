package mail;

import java.io.IOException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class XuLyEmailPhanHoi
 */
public class XuLyEmailPH extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public XuLyEmailPH() {
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
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String email = request.getParameter("emailfb");
		String password = request.getParameter("passwordfb");
		String tieude = request.getParameter("tieude");
		String thongtin = request.getParameter("area1");


		boolean baoloi = false;

		String emailerr = "";
		if (email.equalsIgnoreCase(null)) {
			emailerr = "Bạn chưa nhập email";
			baoloi = true;
		} else {
			email = email.trim();
		}
		if (email.equalsIgnoreCase("")) {
			emailerr = "Bạn chưa nhập email";
			baoloi = true;
		} else {
			Pattern emailpt = Pattern
					.compile("^([A-Za-z0-9])*@[A-Za-z0-9]+(.[A-Za-z0-9]+)*(.[A-Za-z]{2,})$");
			Matcher emailmc = emailpt.matcher(email);
			if (!emailmc.matches()) {
				emailerr = "email sai định dạng";
				baoloi = true;
			}
		}
		// } else {
		// Pattern emailpattern = Pattern
		// .compile("^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@"
		// + "[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$");
		// Matcher emailmatcher = emailpattern.matcher(email);
		// if (!emailmatcher.matches()) {
		// emailerr = "Email sai định dạng^^!";
		// baoloi = true;
		// }
		// }
		String passworderr = "";
		if (password == null || password == "") {
			passworderr = "Bạn chưa nhập mật khẩu email của bạn";
		} else {
			password = password.trim();
		}
		//
		// bắt lỗi
		String tieudeerr = "";
		if (tieude == null || tieude == "") {
			tieudeerr += "Bạn chưa nhập tiêu đề cho email";
			baoloi = true;
		} else {
			tieude = tieude.trim();
		}

		request.setAttribute("emailfb", email);
		request.setAttribute("passwordfb", password);
		request.setAttribute("tieude", tieude);
		String thongbao = "";
		if (baoloi == false) {
			thongbao = "Đã gửi email";
			try {
				Mail.sendMail("smtp.gmail.com", "12130234@st.hcmuaf.edu.vn", email, password, tieude, thongtin);
				System.out.println("Đã gửi mail");
				request.setAttribute("thongbao", thongbao);
			} catch (Exception e) {
				e.printStackTrace();
				thongbao = "Gửi mail lỗi";
				request.setAttribute("thongbao", thongbao);
			}
		} else {
			thongbao = "Gửi mail thất bại";
			request.setAttribute("emailerr", emailerr);
			request.setAttribute("passworderr", passworderr);
			request.setAttribute("tieudeerr", tieudeerr);
		}
		RequestDispatcher rd = getServletContext().getRequestDispatcher(
				"/emailphanhoi.jsp");
		rd.forward(request, response);

	}

}
