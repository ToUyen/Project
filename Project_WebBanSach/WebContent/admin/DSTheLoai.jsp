<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="connection.ConnectionDB"%>
<%@page import="com.mysql.jdbc.Connection"%>
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
						SÁCH THỂ LOẠI</font></strong></td>
		</tr>
	</table>
	<br />
	<br />
	<table align="center" border="1" border-style="solid"
		bordercolor="#3399CC" cellpadding="0" cellspacing="0" width="850px">
		<tr height="40">
			<th>Mã Thể Loại</th>
			<th>Mã Danh Mục</th>
			<th>Tên Thể Loại</th>
		</tr>
		<%
			try {
					String loadTheLoai = "SELECT * FROM loaisach";
					PreparedStatement psloadtl = ConnectionDB.conn()
							.prepareStatement(loadTheLoai);
					ResultSet rstlt = psloadtl.executeQuery();
					int countrow = 0;
					while (rstlt.next()) {
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
			%><td width='10'><%=rstlt.getInt(1)%></td>
			<td width='30'><%=rstlt.getInt(2)%></td>
			<td width='10'><%=rstlt.getString(3)%></td>
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