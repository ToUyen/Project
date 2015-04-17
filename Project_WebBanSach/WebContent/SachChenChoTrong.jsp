<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="connection.ConnectionDB"%>
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
<title>Insert title here</title>
</head>
<body>
	<div id="quangcao_left">
		<hr />
		<%
			try {
		String sachchenchotrong = "SELECT loaisach.maLoaiSach,sach.id,sach.tenSach,chitietsach.hinhsach,tacgia.tentacgia,sach.loaibia,sach.gia,sach.giaban,sach.giamgia FROM loaisach ,sach ,tacgia ,chitietsach WHERE loaisach.maLoaiSach = sach.loaisachID AND sach.tacgiaID = tacgia.matacgia AND sach.id = chitietsach.sachID AND sach.giaban > 800000";
		PreparedStatement pssachchenchotrong = ConnectionDB.conn().prepareStatement(sachchenchotrong);
		ResultSet rsscct = pssachchenchotrong.executeQuery();
		rsscct.beforeFirst();
				while (rsscct.next()) {
					int giamgia = rsscct.getInt(9);
		%>
		<br /> <a href="ChiTietSach.jsp?MaSach=<%=rsscct.getInt(2)%>"><img
			src="<%=rsscct.getString(4)%>" /></a><br /> <b><a
			href="ChiTietSach.jsp?MaSach=<%=rsscct.getInt(2)%>"><%=rsscct.getString(3)%></a></b><br></br>
		<font style="color: white">Tác giả: <%=rsscct.getString(5)%>
		</font><br>
		<font style="color: white">Loại bìa: <%=rsscct.getString(6)%></font>
		<div class="gia_1">
			<b>-Giá Bìa: <%=rsscct.getInt(7)%> ₫
			</b>
		</div>
		<%
			if (giamgia > 0) {
		%>
		<div class="gia_2">
			<b>-Giá Gốc: <%=rsscct.getInt(8)%> ₫
			</b><br>
		</div>
		<%
			}
		%>
		<div class="gia_3">
			<%
				if (giamgia > 0) {
			%>
			<a class="giamgia">-<%=rsscct.getInt(9)%>%
			</a>
			<%
				}
			%><a href="AddSachVaoGioHang?MaSach=<%=rsscct.getInt(2)%>" class="chonmua"
				title="Thêm vào giỏ hàng">Chọn mua</a>
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