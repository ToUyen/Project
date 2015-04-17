package admin;

import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mail.Mail;
import database.Connec;
import servlet.*;
public class LienHeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public LienHeServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doAction(request, response);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doAction(request, response);
	}

	protected void doAction(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");

		String tieude = request.getParameter("tieude");
		String thongtin = request.getParameter("thongtin");
		String ten = request.getParameter("ten");
		String thongbao = "";
		String sql = "SELECT khachhang.EMAIL FROM khachhang inner join taikhoan ON khachhang.MATK = taikhoan.MATK WHERE khachhang.EMAIL = '"+ten+"' and taikhoan.NHOM = 2";
		PreparedStatement pstmt;
		try {
			pstmt = Connec.getConnection().prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				String email = rs.getString(1);
				try {
					Mail.sendMail("smtp.gmail.com", email, "12130234@st.hcmuaf.edu.vn",
							"touyen93", tieude, thongtin);
					thongbao = "Gửi mail thành công";
					request.setAttribute("thongbao", thongbao);
					System.out.println("tìm kiếm thành công...email khách hàng là: " + email);
				} catch (Exception e) {
					e.printStackTrace();
					
				}
				
			}
			String tenproject = request.getContextPath();
			response.sendRedirect(tenproject + "/lienhe.jsp");
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}
}
