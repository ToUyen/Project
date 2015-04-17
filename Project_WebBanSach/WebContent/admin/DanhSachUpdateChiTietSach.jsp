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
	<%
		String t = (String) session.getAttribute("tendaydu");
		String n = (String) session.getAttribute("nhom");
		if (t != null && n.equalsIgnoreCase("1")) {
	%>
	<br />
	<table align="center" bgcolor="#CCFFCC">
		<tr>
			<td><strong><font size="6" color="#3399CC">DANH
						SÁCH CHI TIẾT SÁCH</font></strong></td>
		</tr>
	</table>
	<br />
	<br />
	<table align="center" border="1" border-style="solid"
		bordercolor="#3399CC" cellpadding="0" cellspacing="0" width="850px">
		<tr height="40">
			<th>Mã Sách</th>
			<th>Hình Sách</th>
			<th>Trọng Lượng</th>
			<th>Khích Thước</th>
			<th>Dịch Giả</th>
			<th>Số Trang</th>
			<th>Ngày Xuất Bản</th>
			<th>Mã Thành Viên</th>
		</tr>
		<%
			
		%>
		<tr>
			<td width='50'></td>
			<td align='center' width='120'></td>
			<td width='70'></td>
			<td width='70'></td>
			<td width='70'></td>
			<td width='70'></td>
			<td width='70'></td>
			<td width='70'></td>
	</table>
	<%
		} else {
			response.sendRedirect("../DangNhap.jsp");
		}
	%>
</body>
</html>