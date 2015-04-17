package admin;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.SachDao;

/**
 * Servlet implementation class AddSachServlet
 */
public class AddSachServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddSachServlet() {
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

		String tenSach = request.getParameter("tensach");
		String hinhthucbia = request.getParameter("hinhthucbia");
		String giabia = request.getParameter("giabia");
		String giaban = request.getParameter("giaban");
		String giamgia = request.getParameter("giamgia");
		String soluong = request.getParameter("soluong");
		String tennxb = request.getParameter("tennxb");
		String tentl = request.getParameter("tentl");
		String tentg = request.getParameter("tentg");
		String hinh = request.getParameter("hinh");
		String trongluong = request.getParameter("trongluong");
		String kichthuoc = request.getParameter("kichthuoc");
		String dichgia = request.getParameter("dichgia");
		String sotrang = request.getParameter("sotrang");
		int ngay = Integer.parseInt(request.getParameter("ngay"));
		int thang = Integer.parseInt(request.getParameter("thang"));
		int nam = Integer.parseInt(request.getParameter("nam"));
		int matv = Integer.parseInt(request.getParameter("matv"));
		
		
		String duongdan = getServletContext().getRealPath("/res/"+hinh);
		System.out.println("đường dẫn của hình: "+duongdan);
		boolean baoloi = false;
		String sotrang_err = "";
		if (sotrang == null || sotrang == "") {
			sotrang_err = "chưa nhập số trang";
		} else {
			Pattern ptsotrang = Pattern.compile("^[0-9]{1,6}$");
			Matcher mcsotrang = ptsotrang.matcher(sotrang);
			if (!mcsotrang.matches()) {
				sotrang_err = "sai định dạng số trang";
				baoloi = true;
			}

		}
		if (hinh == null || hinh == "") {
			hinh = "đang cập nhật";
		}
		if (trongluong == null || trongluong == "") {
			trongluong = "đang cập nhật";
		}
		if (kichthuoc == null || kichthuoc == "") {
			kichthuoc = "đang cập nhật";
		}
		if (dichgia == null || dichgia == "") {
			dichgia = "";
		}

		String tensach_err = "";
		if (tenSach == null) {
			tensach_err = "chưa nhập tên sách";
			baoloi = true;
		} else {
			tenSach = tenSach.trim();
		}
		if (tenSach == "") {
			tensach_err = "chưa nhập tên sách";
			baoloi = true;
		} else {
			if (SachDao.searchTenSach(tenSach) == false) {
				tensach_err = "tên sách đã tồn tại";
			}
		}
		String giaban_err = "";
		if (giaban == null) {
			giaban_err = "chưa nhập giá bán";
			baoloi = true;
		} else {
			giaban = giaban.trim();
		}
		if (giaban == "") {
			giaban_err = "chưa nhập giá bán";
			baoloi = true;
		} else {
			Pattern ptgiaban = Pattern.compile("^[0-9]{3,10}$");
			Matcher mcgiaban = ptgiaban.matcher(giaban);
			if (!mcgiaban.matches()) {
				giaban_err = "sai định dạng giá";
				baoloi = true;
			}
		}

		String giabia_err = "";
		if (giabia == null) {
			giabia_err = "chưa nhập giá bìa";
			baoloi = true;
		} else {
			giabia = giabia.trim();
		}
		if (giabia == "") {
			giabia_err = "chưa nhập giá bìa";
			baoloi = true;
		} else {
			Pattern ptgiabia = Pattern.compile("^[0-9]{3,10}$");
			Matcher mcgiabia = ptgiabia.matcher(giabia);
			if (!mcgiabia.matches()) {
				giabia_err = "sai định dạng giá";
				baoloi = true;
			}
		}

		String giamgia_err = "";
		if (giamgia == null) {
			giamgia_err = "chưa nhập giá bìa";
			baoloi = true;
		} else {
			giabia = giabia.trim();
		}
		if (giamgia == "") {
			giamgia_err = "chưa nhập giá bìa";
			baoloi = true;
		} else {
			Pattern ptgiamgia = Pattern.compile("^[0-9]{1,3}$");
			Matcher mcgiamgia = ptgiamgia.matcher(giamgia);
			if (!mcgiamgia.matches()) {
				giamgia_err = "sai định dạng giảm giá";
				baoloi = true;
			} else {
				double temp = Double.parseDouble(giamgia);
				double temp2 = (Double.parseDouble(giabia) - Double
						.parseDouble(giaban))
						/ (Double.parseDouble(giabia) / 100);
//				double temp3 = Double.parseDouble(giabia)-(Double.parseDouble(giabia) / 100) % temp;
				if (temp != temp2) {
					giamgia_err = "giảm giá sai.Số % giảm giá là: " + temp2
							+ ", giá bán phải là: ";// + temp3;
					baoloi = true;
				}
			}
		}

		String tenproject = request.getContextPath();
		if (baoloi == false) {
			String ngayxuatban = "";
			if (ngay < 10 && thang < 10) {
				ngayxuatban = nam + "-0" + thang + "-0" + ngay;
				System.out.println("Ngày sinh: " + ngayxuatban);
			} else if (ngay < 10 && thang >= 10) {
				ngayxuatban = nam + "-" + thang + "-0" + ngay;
				System.out.println("Ngày sinh: " + ngayxuatban);
			} else if (ngay >= 10 && thang < 10) {
				ngayxuatban = nam + "-0" + thang + "-" + ngay;
				System.out.println("Ngày sinh: " + ngayxuatban);
			} else {
				ngayxuatban = nam + "-" + thang + "-" + ngay;
				System.out.println("Ngày sinh: " + ngayxuatban);
			}
			if (sotrang == null) {
				sotrang = "100";
			}
			SachDao.insertSach(tenSach, hinhthucbia, Integer.parseInt(giabia),
					Integer.parseInt(giaban), Integer.parseInt(giamgia),
					Integer.parseInt(soluong), tentl, tentg, tennxb);
			SachDao.insertChiTietSach(tenSach, trongluong, kichthuoc, dichgia,
					hinh, Integer.parseInt(sotrang), ngayxuatban, matv);
			response.sendRedirect(tenproject + "/admin/Addsach.jsp");
		} else {
			request.setAttribute("tensach", tenSach);
			request.setAttribute("giabia", giabia);
			request.setAttribute("giaban", giaban);
			request.setAttribute("soluong", soluong);
			request.setAttribute("trongluong", trongluong);
			request.setAttribute("kichthuoc", kichthuoc);
			request.setAttribute("dichgia", dichgia);
			request.setAttribute("tensach_err", tensach_err);
			request.setAttribute("giabia_err", giabia_err);
			request.setAttribute("giaban_err", giaban_err);
			request.setAttribute("giamgia_err", giamgia_err);
			request.setAttribute("sotrang", sotrang_err);
			RequestDispatcher rd = getServletContext().getRequestDispatcher(
					"/admin/Addsach.jsp");
			rd.forward(request, response);
		}
	}
}
