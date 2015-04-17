<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="connection.ConnectionDB"%>
<%@page import="java.sql.PreparedStatement"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
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
						SÁCH DANH MỤC</font></strong></td>
		</tr>
	</table>
	<br />
	<br />
	<table align="center" border="1" border-style="solid"
		bordercolor="#3399CC" cellpadding="0" cellspacing="0" width="850px">
		<tr height="40">
			<th>STT</th>
			<th>Mã Danh Mục Sách</th>
			<th>Tên Danh Mục Sách</th>
		</tr>
		<%
			try {
					String madanhmuc = request.getParameter("madm");
					String loaddms = "SELECT * FROM danhmucsach WHERE maDanhMucSach = '"
							+ madanhmuc + "'";
					PreparedStatement pstmtloaddanhmuc = ConnectionDB.conn()
							.prepareStatement(loaddms);
					ResultSet rsloaddanhmuc = pstmtloaddanhmuc.executeQuery();
					int i = 0;
					while (rsloaddanhmuc.next()) {
						i++;
		%>
		<tr>
			<td width='10'><%=i%></td>
			<td width='30'><%=rsloaddanhmuc.getInt(1)%></td>
			<td width='10'><%=rsloaddanhmuc.getString(2)%></td>
		</tr>
		<%
			}
				} catch (SQLException e) {
					throw e;
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