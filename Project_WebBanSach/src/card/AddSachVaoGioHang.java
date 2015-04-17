package card;

import java.io.IOException;
import java.util.TreeMap;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entity.Data;
import entity.GioHang;

/**
 * Servlet implementation class AddSachVaoGioHang
 */
public class AddSachVaoGioHang extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddSachVaoGioHang() {
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
	private void toDo(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		int id = Integer.parseInt(request.getParameter("MaSach"));
		GioHang g = Data.getGioHang(id);
		if(g != null){
			HttpSession session = request.getSession();
			TreeMap<Integer, GioHang> card = (TreeMap<Integer, GioHang>)session.getAttribute("card");
		if(card == null){
			card = new TreeMap<Integer, GioHang>();
			card.put(id, g);
		}else{
			GioHang g1 = card.get(id);
			if(g1 == null){
				card.put(id, g);
			}else{
				g1.plusCount();
			}
		}
		session.setAttribute("card", card);
		}
		response.sendRedirect("GioHang.jsp");
	}

}
