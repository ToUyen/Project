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
						SÁCH TÁC GIẢ</font></strong></td>
		</tr>
	</table>
	<br />
	<br />
	<table align="center" border="1" border-style="solid"
		bordercolor="#3399CC" cellpadding="0" cellspacing="0" width="850px">
		<tr height="40">
			<th>STT</th>
			<th>Mã Tác Giả</th>
			<th>Tên Tác Giả</th>
		</tr>
		<%
			String matacgia = request.getParameter("matg");
				try {
					String loadtacgia = "SELECT * FROM tacgia WHERE maTacGia = ?";
					PreparedStatement pstmtloadtacgia = ConnectionDB.conn()
							.prepareStatement(loadtacgia);
					pstmtloadtacgia.setString(1, matacgia);
					ResultSet rsloadtacgia = pstmtloadtacgia.executeQuery();
					int counttg = 0;
					while (rsloadtacgia.next()) {
						counttg++;
		%>
		<tr>
			<td width='10'><%=counttg%></td>
			<td width='30'><%=rsloadtacgia.getInt(1)%></td>
			<td width='10'><%=rsloadtacgia.getString(2)%></td>
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