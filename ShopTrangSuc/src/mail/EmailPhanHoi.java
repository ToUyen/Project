package mail;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class EmailPhanHoi
 */
public class EmailPhanHoi extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EmailPhanHoi() {
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
		String email = request.getParameter("emailfb");
		String password = request.getParameter("passwordfb");
		String tieude = request.getParameter("tieude");
		String thongtin = request.getParameter("thongtin");
		String thongbao = "";
		try {
			thongbao = "Gửi mail thành công";
			Mail.sendMail("smtp.gmail.com", "panda281194@gmail.com", email, password, tieude, thongtin);
		} catch (Exception e) {
			e.printStackTrace();
			thongbao = "Gửi mail lỗi";
		}
		request.setAttribute("thongbao", thongbao);
		RequestDispatcher rd = getServletContext().getRequestDispatcher("/Feedback.jsp");
		rd.forward(request, response);
	}

}
