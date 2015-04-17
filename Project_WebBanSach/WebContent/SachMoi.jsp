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
<title>Sach moi</title>
<link rel="stylesheet" type="text/css" href="TrangChu.css" />
</head>
<body>
	<div id="sachmoi">
		<div id="sachmoi_title">
			<a>SÁCH MỚI</a><img src="images_content/tim.gif" />
		</div>
		<div id="images_sachmoi">
			<table>
				<%
					try {
						String sachmoi = "SELECT sach.id,sach.tenSach,chitietsach.hinhsach,tacgia.tentacgia,sach.loaibia,sach.gia,sach.giaban,sach.giamgia,chitietsach.ngayxuatban, DATE(NOW())-DATE(ngayxuatban) as songay	FROM sach ,tacgia ,chitietsach WHERE sach.id = chitietsach.sachID AND tacgia.matacgia = sach.tacgiaID AND (DATE(NOW())-DATE(ngayxuatban)) < 5";
						PreparedStatement pstmtsachmoi = ConnectionDB.conn()
								.prepareStatement(sachmoi);
						ResultSet rssachmoi = pstmtsachmoi.executeQuery();
						int count = 0;
						while (rssachmoi.next()) {
							count++;
							if(count == 11){
								break;
							}
				%>
				<tr>
					<td width="249" height="227"><a
						href="ChiTietSach.jsp?MaSach=<%=rssachmoi.getInt(1)%>"><img
							src="<%=rssachmoi.getString(3)%>" width="145" height="209" /></a></td>
					<td width="288"><b><a
							href="ChiTietSach.jsp?MaSach=<%=rssachmoi.getInt(1)%>"><%=rssachmoi.getString(2)%></a></b>
						<p>
							Tác Giả:
							<%=rssachmoi.getString(4)%></p>
						<p>
							Loại Bìa:
							<%=rssachmoi.getString(5)%></p>
						<div class="gia">
							<a>giá đang bán: <%=rssachmoi.getInt(6)%> ₫
							</a>
						</div>
						<div class="giagoc">
							<a>giá cũ : <%=rssachmoi.getInt(7)%> ₫
							</a>
						</div>
						<div class="giamgia">
							<a>-<%=rssachmoi.getInt(8)%>%
							</a> <br></br> <a
								href="AddSachVaoGioHang?MaSach=<%=rssachmoi.getInt(1)%>"
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