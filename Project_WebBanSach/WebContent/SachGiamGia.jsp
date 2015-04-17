<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="connection.ConnectionDB"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
	request.setCharacterEncoding("utf-8");
	response.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>sach gian gia</title>
<link rel="stylesheet" type="text/css" href="TrangChu.css" />
</head>
<body>
	<div id="sachgiamgia">
		<div id="giamgia_title">
			<a>SÁCH GIẢM GIÁ</a><img src="images_content/tim.gif" />
		</div>
		<div id="sachgiamgia_title">
			<table width="549">
				<%
					try {
						String err_dn = null;
						String sachgiamgia = "SELECT sach.id,sach.tenSach, chitietsach.hinhsach, tacgia.tentacgia, sach.loaibia, sach.gia, sach.giaban, sach.giamgia FROM chitietsach,	sach, tacgia where chitietsach.sachID = sach.id and sach.tacgiaID = tacgia.matacgia and sach.giamgia >= 30";
						PreparedStatement pssachgiamgia = ConnectionDB.conn()
								.prepareStatement(sachgiamgia);
						ResultSet rssachgiamgia = pssachgiamgia.executeQuery();
						int count = 0;
						while (rssachgiamgia.next()) {
							count++;
							if(count == 16){
								break;
							}
				%>
				<tr>
					<td width="249" height="227"><a
						href="ChiTietSach.jsp?MaSach=<%=rssachgiamgia.getInt(1)%>"><img
							src="<%=rssachgiamgia.getString("hinhsach")%>" width="145"
							height="209" /></a></td>
					<td width="288"><b><a
							href="ChiTietSach.jsp?MaSach=<%=rssachgiamgia.getInt("id")%>"
							title="<%=rssachgiamgia.getString("tensach")%>"><%=rssachgiamgia.getString("tensach")%></a></b>
						<p>
							Tác giả:
							<%=rssachgiamgia.getString("tentacgia")%></p>
						<p>
							Loại Bìa:
							<%=rssachgiamgia.getString("loaibia")%></p>
						<div class="gia">
							<a>giá gốc: <%=rssachgiamgia.getInt("gia")%> ₫
							</a>
						</div>
						<div class="giagoc">
							<a>giá bìa: <%=rssachgiamgia.getInt("giaban")%> ₫
							</a>
						</div>
						<div class="giamgia">
							<a>-<%=rssachgiamgia.getInt("giamgia")%>%
							</a><br></br> <a
								href="AddSachVaoGioHang?MaSach=<%=rssachgiamgia.getInt(1)%>"
								class="chonmua" title="Thêm vào giỏ hàng">Chọn mua </a>
						</div></td>
				</tr>
				<%
					}
					} catch (SQLException e) {
						e.printStackTrace();
					}
				%>
			</table>
		</div>
		<div id="xemthem">
			<a href="#">xem thêm &raquo;</a>
		</div>
	</div>
</body>
</html>