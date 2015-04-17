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
<title>DSUser</title>
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
						SÁCH NGƯỜI DÙNG</font></strong></td>
		</tr>
	</table>
	<br />
	<br />
	<table align="center" border="1" border-style="solid"
		bordercolor="#3399CC" cellpadding="0" cellspacing="0" width="850px">
		<tr height="40">
			<th>Mã User</th>
			<th>Tên Đăng Nhập</th>
			<th>Mật Khẩu</th>
			<th>Họ Tên</th>
			<th>Ngày Sinh</th>
			<th>Địa Chỉ</th>
			<th>Điện Thoại</th>
			<th>Điện Thoại DĐ</th>
			<th>Email</th>
			<th>Giới Tính</th>
			<th>Nhóm</th>
			<th>Hoạt Động</th>
		</tr>
		<%
			String loadUser = "SELECT thanhvien.id, taikhoan.username,taikhoan.`password`,khachhang.tenkhachhang,khachhang.ngaysinh,khachhang.quocgia,khachhang.tinhthanh,khachhang.diachi,khachhang.`sdt`,khachhang.`sdd`,thanhvien.email,khachhang.gioitinh,taikhoan.`groups`,taikhoan.active FROM thanhvien ,taikhoan ,khachhang WHERE 1 = 1 AND thanhvien.taikhoanID = taikhoan.id AND thanhvien.khachhangID = khachhang.id;";
				try {
					PreparedStatement pstmt = ConnectionDB.conn()
							.prepareStatement(loadUser);
					ResultSet rs = pstmt.executeQuery();
					rs.beforeFirst();
					int countrow = 0;
					while (rs.next()) {
						countrow++;
						String diachi = rs.getString(8) + ", "
								+ rs.getString(7) + ", " + rs.getString(6);
						if (countrow % 2 == 0) {
		%>
		<tr>
			<%
				} else {
			%>
		
		<tr bgcolor="#33FF99">
			<%
				}
			%><td width='10'><%=rs.getInt(1)%></td>
			<td width='30'><%=rs.getString(2)%></td>
			<td width='10'><%=rs.getString(3)%></td>
			<td width='30'><%=rs.getString(4)%></td>
			<td width='30'><%=rs.getDate(5)%></td>
			<td width='120'><%=diachi%></td>
			<td width='30'><%=rs.getString(9)%></td>
			<td width='30'><%=rs.getString(10)%></td>
			<td width='30'><%=rs.getString(11)%></td>
			<td width='30'><%=rs.getString(12)%></td>
			<td width='30'><%=rs.getInt(13)%></td>
			<td width='30'><%=rs.getInt(14)%></td>
		</tr>

		<%
			}
				} catch (SQLException e) {
					e.printStackTrace();
					System.out.println("Danh sach User: " + "SQLException");
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