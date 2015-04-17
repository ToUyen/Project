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
<title>left_sach</title>
<link rel="stylesheet" type="text/css" href="TrangChu.css" />
</head>
<body>
	<div id="quangcao_left">
		<hr />
		<p>&curren; Sách bình chọn</p>
		<%
			try {
				String leftsach = "SELECT sach.id, sach.tenSach, chitietsach.hinhsach, tacgia.tentacgia, sach.loaibia, sach.gia, sach.giaban, sach.giamgia, sach.luotbinhchon FROM sach, tacgia, chitietsach WHERE sach.tacgiaID = tacgia.matacgia AND sach.id = chitietsach.sachID AND sach.luotbinhchon > 2";
				PreparedStatement psleftsach = ConnectionDB.conn()
						.prepareStatement(leftsach);
				ResultSet rsleftsach = psleftsach.executeQuery();
				rsleftsach.beforeFirst();
				while (rsleftsach.next()) {
					int gg = rsleftsach.getInt(8);
					int g = rsleftsach.getInt(6);
					int gb = rsleftsach.getInt(7);
		%>
		<br /> <a href="ChiTietSach.jsp?MaSach=<%=rsleftsach.getInt(1)%>"><img
			src="<%=rsleftsach.getString(3)%>" /></a><br /> <img
			src="images_content/star_1.png" /><img
			src="images_content/star_1.png" /><img
			src="images_content/star_1.png" /><img
			src="images_content/star_1.png" /><img
			src="images_content/star_11.png" /> <br /> <b><a
			href="ChiTietSach.jsp?MaSach=<%=rsleftsach.getInt(1)%>"><%=rsleftsach.getString(2)%></a></b><br></br>

		<i><font style="color: white"><%=rsleftsach.getString(4)%>
				- </font></i><i><font style="color: white"><%=rsleftsach.getString(5)%></font></i>
		<div class="gia_1">
			<b>-Giá Bìa: <%=rsleftsach.getInt(6)%> ₫
			</b>
		</div>
		<div class="gia_2">
			<%
				if (g > gb) {
			%>
			<b>-Giá Gốc: <%=rsleftsach.getInt(7)%> ₫
			</b><br>
			<%
				} else {
			%>
			<%
				}
			%>
		</div>
		<div class="gia_3">
			<%
				if (gg > 0) {
			%>
			<a class="giamgia">-<%=rsleftsach.getInt(8)%>%
			</a>
			<%
				} else {
			%>
			<br> <br>
			<%
				}
			%>
			<a href="AddSachVaoGioHang?MaSach=<%=rsleftsach.getInt(1)%>"
				class="chonmua" title="Thêm vào giỏ hàng">Chọn mua</a>
		</div>
		<hr />
		<%
			}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		%>
	</div>
</body>
</html>