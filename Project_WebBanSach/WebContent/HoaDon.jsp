<%@page import="mail.Mail"%>
<%@page import="dao.GioHangDao"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="connection.ConnectionDB"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.util.LinkedList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@page import="entity.*"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.TreeMap"%>
<%@page import="java.util.Locale"%>
<%@page import="java.text.NumberFormat"%>
<%
	request.setCharacterEncoding("utf-8");
	response.setCharacterEncoding("utf-8");
	TreeMap<Integer, GioHang> card = (TreeMap<Integer, GioHang>) session
			.getAttribute("card");
	if (card == null)
		card = new TreeMap<Integer, GioHang>();
%>
<%
	request.setCharacterEncoding("utf-8");
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
<!--
#hoadon {
	height: auto;
	padding-top: 10px;
	background-image: url(image_header/header_title.jpg);
	padding-bottom: 5px;
	margin-bottom: 2px;
	padding-left: 5px;
}

#hoadon a {
	color: #CC6;
	font-size: 16px;
}

#hoadon img {
	float: right;
	margin-right: 10px;
}
-->
</style>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="TrangChu.css" />
</head>
<body>
	<%
		List<GioHang> list = new LinkedList<GioHang>();
		NumberFormat nf = NumberFormat.getInstance(Locale.ENGLISH);
		String tendd = (String) session.getAttribute("tendaydu");
		if(tendd != null){
	%>
	<%@include file="Script.jsp"%>
	<%@include file="Header.jsp"%>
	<%@include file="After_header.jsp"%>
	<div id="content">
		<div id="main_content">
			<div id="abc">
				<form action="ThanhToanHoaDon" method="post">
					<div id="hoadon">
						<a>Khách hàng: <select name="tenkhachhang"><option
									value="<%=name%>"><%=name%></option></select></a><img
							src="images_content/tim.gif" />
					</div>
					<%
						if (name != null) {
					%>
					<table border="1" align="center" cellpadding="0" cellspacing="0"
						width="100%">
						<tr valign="middle" bgcolor="#70AD47" style="height: 30px">
							<th>STT</th>
							<th align="center">Tên Sản Phẩm</th>
							<th align="center">Sỗ Lượng</th>
							<th align="center">Giá</th>
							<th align="center">Tổng Tiền</th>
						</tr>
						<%
									Iterator<GioHang> it = card.values().iterator();
									int i = -1;
									while (it.hasNext()) {
										GioHang g = it.next();
										list.add(g);
										int tongtien = g.getSoluong() * g.getGia();
										System.out.println(g.getHinhsach() + ":"
												+ g.getSoluong());
						%>
						<tr align="center" valign="middle"
							bgcolor="<%if (i++ % 2 == 0) {%>#D3E8C6 <%} else {%>#F7FBF4<%}%>">
							<td width='50'><p>
									<strong><%=i + 1%></strong>
								</p></td>
							<td width='50'><p><%=g.getTensach()%></p></td>
							<td width='50'><p><%=g.getSoluong()%></p></td>
							<td width='50'><p><%=nf.format(g.getGia())%></p></td>
							<td width='100'><p><%=nf.format(tongtien)%></p></td>
						</tr>
						<%
							}
						%>
						<tr bgcolor="#F7FBF4">
							<td height="40" colspan="5" align="center" valign="middle"><a
								href="GioHang.jsp">Quay lại giỏ hàng</a></td>
						</tr>
					</table>
					<%
						} else {
					%>
					<div id="giohang_title">
						<b><font size="4" color="red">Bạn không có giỏ hàng,
								hãy đăng ký tài khoản để có thể mua hàng</font></b>
					</div>
					<%
						}
					%>
				</form>
				<%
				int idKH = GioHangDao.getIDKH(tendaydu);
				String thongtin = "";
				int thanhtien = 0;
				for(GioHang gh : list){
				int tongtien = gh.getGia()*gh.getSoluong();
				thanhtien+=tongtien;
				thongtin += gh.getTensach()+", số lượng "+gh.getSoluong()+", thành tiền: "+nf.format(tongtien)+"\n";
				String searchgiohang = "SELECT count(giohang.stt),giohang.soluong FROM giohang inner join khachhang on giohang.khachhangID = khachhang.id WHERE khachhang.tenkhachhang = '"+tendaydu+"' AND giohang.tensach = '"+gh.getTensach()+"';";
				PreparedStatement pstmtSearchgh = ConnectionDB.getConnection().prepareStatement(searchgiohang);
				ResultSet rssearchgiohang = pstmtSearchgh.executeQuery();
				rssearchgiohang.next();
				int count = rssearchgiohang.getInt(1);
				if(count == 0){
					String insertgiohang = "INSERT INTO giohang(khachhangID,tensach,hinhsach,gia,soluong,tongtien,thanhtoan,sachID) values(?, ?, ?, ?, ?, ?, ?, ?)";
					PreparedStatement pstmtinsert = ConnectionDB.getConnection().prepareStatement(insertgiohang);
					pstmtinsert.setInt(1,idKH);
					pstmtinsert.setString(2, gh.getTensach());
					pstmtinsert.setString(3, gh.getHinhsach());
					pstmtinsert.setInt(4, gh.getGia());
					pstmtinsert.setInt(5, gh.getSoluong());
					pstmtinsert.setInt(6, tongtien);
					pstmtinsert.setString(7, "Chưa thanh toán");
					pstmtinsert.setInt(8, gh.getSachID());
					pstmtinsert.executeUpdate();
				}else{
					int soluong = rssearchgiohang.getInt(2)+gh.getSoluong();
					String update = "UPDATE giohang SET soluong = '"+soluong+"' WHERE khachhangID = "+idKH+" AND tensach = '"+gh.getTensach()+"';";
					PreparedStatement pstmtupdate = ConnectionDB.getConnection().prepareStatement(update);
					pstmtupdate.executeUpdate();
				}
				}
				String searchemial = "SELECT thanhvien.email FROM thanhvien WHERE thanhvien.tendangnhap ='"+tendaydu+"';";
				PreparedStatement pstmtsearchemail = ConnectionDB.getConnection().prepareStatement(searchemial);
				ResultSet rssearchemail = pstmtsearchemail.executeQuery();
				rssearchemail.next();
				Mail.sendMail("smtp.gmail.com", rssearchemail.getString(1) , "ntatvr@gmail.com", "01653164732", "<<Share.vn>> Thông Báo!","Chúc mừng bạn "+tendaydu+",bạn đã mua sách của Share.vn thành công.\n Chúng tôi sẽ trao sách tận nơi theo địa chỉ tài khoản của bạn.\n Thông tin sách đã mua: "+thongtin);
				%>
			</div>
		</div>
		<%@include file="Footer.jsp"%>
	</div>
	<% 
		} else {
			response.sendRedirect("DangNhap.jsp");
		}
	%>
</body>
</html>