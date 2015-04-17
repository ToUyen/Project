<%@page import="java.util.Locale"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="connection.ConnectionDB"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
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
		if (ten != null && nhom.equalsIgnoreCase("1")) {
	%>
	<br />
	<table align="center" bgcolor="#CCFFCC">
		<tr>
			<td><strong><font size="6" color="#3399CC">DANH
						SÁCH ĐƠN HÀNG</font></strong></td>
		</tr>
	</table>
	<br />
	<br />
	<table align="center" border="1" border-style="solid"
		bordercolor="#3399CC" cellpadding="0" cellspacing="0" width="850px">
		<tr height="40">
			<th>STT</th>
			<th>Tên Khách Hàng</th>
			<th>Tên Sách</th>
			<th>Số Lượng</th>
			<th>Tổng Tiền</th>
			<th>Số Điện Thoại</th>
			<th>Địa Chỉ</th>
			<th>Thanh Toán</th>
			<%
				try {
						String tenkhachhang = request.getParameter("tenKH");
						NumberFormat nf = NumberFormat.getInstance(Locale.ENGLISH);
						String loadgiohang = "SELECT khachhang.tenkhachhang,giohang.tensach,giohang.soluong,giohang.tongtien,khachhang.sdt,khachhang.quocgia,khachhang.tinhthanh,khachhang.diachi,giohang.thanhtoan FROM khachhang inner join giohang on khachhang.id = giohang.khachhangID WHERE giohang.thanhtoan = 'Chưa thanh toán' AND khachhang.tenkhachhang = '"
								+ tenkhachhang + "';";
						PreparedStatement pstmtloadgiohang = ConnectionDB
								.getConnection().prepareStatement(loadgiohang);
						ResultSet rsloadgiohang = pstmtloadgiohang.executeQuery();
						int i = 0;
						while (rsloadgiohang.next()) {
			%>
		
		<tr>
			<td width='10'><%=i++%></td>
			<td width='10'><%=rsloadgiohang.getString(1)%></td>
			<td width='10'><%=rsloadgiohang.getString(2)%></td>
			<td width='10'><%=rsloadgiohang.getInt(3)%></td>
			<td width='10'><%=nf.format(rsloadgiohang.getInt(4))%></td>
			<td width='10'><%=rsloadgiohang.getString(5)%></td>
			<td width='10'><%=rsloadgiohang.getString(6) + ","
								+ rsloadgiohang.getString(7) + ","
								+ rsloadgiohang.getString(8)%></td>
			<td width='10'><%=rsloadgiohang.getString(9)%></td>
		</tr>
		<%
			}
				} catch (SQLException e) {
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