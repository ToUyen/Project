<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="connection.ConnectionDB"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="dao.GioHangDao"%>
<%@page import="java.util.Locale"%>
<%@page import="java.text.NumberFormat"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@page import="entity.*"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.TreeMap"%>
<%
	request.setCharacterEncoding("utf-8");
	response.setCharacterEncoding("utf-8");
	TreeMap<Integer, GioHang> card = (TreeMap<Integer, GioHang>) session
	.getAttribute("card");
	if (card == null)
		card = new TreeMap<Integer, GioHang>();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
<!--
#giohang {
	height: 20px;
	padding-top: 10px;
	background-image: url(image_header/header_title.jpg);
	padding-bottom: 5px;
	margin-bottom: 2px;
	padding-left: 5px;
}

#giohang a {
	color: #CC6;
	padding-left: 10px;
	font-size: 16px;
}

#giohang img {
	float: right;
	margin-right: 10px;
}

#giohang_title {
	width: auto;
	height: auto;
	color: #63F;
	padding-left: 15px;
	padding-bottom: 5px;
	padding-right: 15px;
	padding-top: 2px;
	color: #CCC;
	border-color: CCC;
	background-image: url(image_header/header_title.jpg);
}
-->
</style>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Gio Hang</title>
<link rel="stylesheet" type="text/css" href="TrangChu.css" />
</head>
<body>
	<%
		NumberFormat nf = NumberFormat.getInstance(Locale.ENGLISH);
		int i = -1;
			String tendd = (String) session.getAttribute("tendaydu");
			if(tendd != null){
	%>
	<%@include file="Script.jsp"%>
	<%@include file="Header.jsp"%>
	<%@include file="After_header.jsp"%>
	<div id="content">
		<div id="main_content">
			<div id="abc">
				<div id="giohang">
					<a>Giỏ Hàng</a><img src="images_content/tim.gif" />
				</div>
				<table border="1" align="center" cellpadding="0" cellspacing="0"
					width="100%">
					<tr valign="middle" bgcolor="#70AD47" style="height: 30px">
						<th>STT</th>
						<th align="center">Tên Sản Phẩm</th>
						<th align="center">Sỗ Lượng</th>
						<th align="center">Giá</th>
						<th align="center">Tổng Tiền</th>
						<th colspan="2" align="center">Thao Tác</th>
					</tr>
					<%
						try{
									String loadgiohang = "SELECT giohang.sachID,giohang.tensach,giohang.hinhsach,giohang.gia,giohang.soluong,giohang.tongtien,giohang.thanhtoan FROM giohang inner join khachhang on giohang.khachhangID = khachhang.id where khachhang.tenkhachhang = '"+tendaydu+"';";
									PreparedStatement pstmtloadgiohang = ConnectionDB.getConnection().prepareStatement(loadgiohang);
									ResultSet rsloadgiohang = pstmtloadgiohang.executeQuery();
									while(rsloadgiohang.next()){
										GioHang giohang = new GioHang(rsloadgiohang.getInt(1), rsloadgiohang.getString(2),rsloadgiohang.getString(3), rsloadgiohang.getInt(4),
												rsloadgiohang.getInt(5));
					%>
					<tr align="center" valign="middle"
						bgcolor="<%if (i++ % 2 == 0) {%>#D3E8C6 <%} else {%>#F7FBF4<%}%>">
						<td width='50'><p>
								<strong><%=i + 1%></strong>
							</p></td>
						<td width='100'><p><%=giohang.getTensach()%></p></td>
						<td width='100'><p><%=giohang.getSoluong()%></p></td>
						<td width='100'><p><%=nf.format(giohang.getGia())%></p></td>
						<td width='100'><p><%=nf.format(giohang.getSoluong()*giohang.getGia())%></p></td>
						<td height="40" colspan="2" align="center" valign="middle"><%=rsloadgiohang.getString(7) %></td>
					<%
						}
								}catch(SQLException e){
									e.printStackTrace();
								}
										Iterator<GioHang> it = card.values().iterator();
										while (it.hasNext()) {
											GioHang g = it.next();
											int tongtien = g.getSoluong() * g.getGia();
					%>
					<tr align="center" valign="middle"
						bgcolor="<%if (i++ % 2 == 0) {%>#D3E8C6 <%} else {%>#F7FBF4<%}%>">
						<td width='50'><p>
								<strong><%=i + 1%></strong>
							</p></td>
						<td width='100'><p><%=g.getTensach()%></p></td>
						<td width='50'><p><%=g.getSoluong()%></p></td>
						<td width='50'><p><%=nf.format(g.getGia())%></p></td>
						<td width='50'><p><%=nf.format(tongtien)%></p></td>
						<td width='50' align="center">
							<form action="UpdateProduct" method="post" name="formupdate">
								<table>
									<tr>
										<td><input name="count" type="text" id="count"
											style="width: 20px"> <input name="id" type="hidden"
											value="<%=g.getSachID()%>"></td>
										<td><input type="submit" value="Thêm"></td>
									</tr>
								</table>
							</form>

						</td>
						<td width='50' align="center">
							<form name="formdel" method="post" action="DeleteProduct">
								<input name="id" type="hidden" value="<%=g.getSachID()%>">
								<input type="submit" value="Xóa">
							</form>
						</td>
					</tr>
					<%
						}
					%>
					<tr bgcolor="#F7FBF4">
						<td height="40" colspan="5" align="center" valign="middle"><a
							href="TrangChu.jsp">Quay lại mua tiếp</a></td>

						<td height="40" colspan="2" align="center" valign="middle"><a
							href="HoaDon.jsp">Lập Hóa Đơn</a></td>
					</tr>
				</table>
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