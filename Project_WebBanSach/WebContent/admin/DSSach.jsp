<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="connection.ConnectionDB"%>
<%@page import="java.sql.PreparedStatement"%>
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
<link rel="stylesheet" type="text/css" href="style.css" />
</head>
<body>
	<%
		String ten = (String) session.getAttribute("tendaydu");
		String nhom = (String) session.getAttribute("nhom");
		if (ten != null &&  nhom.equalsIgnoreCase("1")) {
	%>
	<br />
	<table align="center" bgcolor="#CCFFCC">
		<tr>
			<td><strong><font size="6" color="#3399CC">DANH
						SÁCH SÁCH</font></strong></td>
		</tr>
	</table>
	<br />
	<br />
	<table align="center" border="1" border-style="solid"
		bordercolor="#3399CC" cellpadding="0" cellspacing="0" width="850px">
		<tr height="40">
			<th>Mã Sách</th>
			<th>Tên Sách</th>
			<th>Loại Bìa</th>
			<th>Giá Bìa</th>
			<th>Giá Bán</th>
			<th>Giảm Giá</th>
			<th>Số Lượng</th>
			<th>Tên Thể Loại</th>
			<th>Tên Tác Giả</th>
			<th>Tên Nhà Xuất Bản</th>
			<th>Số Lần Bình Chọn</th>
		</tr>
		<%
			try {
					String loadsach = "SELECT sach.id,sach.tenSach,sach.loaibia,sach.gia,sach.giaban,sach.giamgia,sach.soLuong,loaisach.tenLoaiSach,tacgia.tentacgia,nhaxuatban.tenNhaXuatBan,sach.luotbinhchon FROM sach ,loaisach ,tacgia ,nhaxuatban	WHERE sach.loaisachID = loaisach.maLoaiSach AND sach.tacgiaID = tacgia.matacgia AND  sach.nhaxbID = nhaxuatban.maNhaXuatBan ORDER BY sach.id;";
					PreparedStatement psloadsach = ConnectionDB.conn()
							.prepareStatement(loadsach);
					ResultSet rsloadsach = psloadsach.executeQuery();
					int countrow = 0;
					while (rsloadsach.next()) {
						countrow++;
						if (countrow % 2 == 0) {
		%>
		<tr>
			<%
				} else {
			%>
		
		<tr bgcolor="#33FF99">
			<%
				}
			%>
			<td width='10'><%=rsloadsach.getInt(1)%></td>
			<td width='100'><%=rsloadsach.getString(2)%></td>
			<td width='70'><%=rsloadsach.getString(3)%></td>
			<td width='70'><%=rsloadsach.getInt(4)%></td>
			<td width='70'><%=rsloadsach.getInt(5)%></td>
			<td width='70'><%=rsloadsach.getInt(6)%>%</td>
			<td width='70'><%=rsloadsach.getInt(7)%></td>
			<td width='70'><%=rsloadsach.getString(8)%></td>
			<td width='70'><%=rsloadsach.getString(9)%></td>
			<td width='70'><%=rsloadsach.getString(10)%></td>
			<td width='70'><%=rsloadsach.getInt(11)%></td>
		</tr>
		<%
			}
				} catch (SQLException e) {
					e.printStackTrace();
				} catch (Exception e) {
					e.printStackTrace();
				}
		%>
	</table>
	<%
		} else {
			response.sendRedirect("../DangNhap.jsp");
		}
	%>
</body>
</html>