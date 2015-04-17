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
		if (ten != null && nhom.equalsIgnoreCase("1")) {
	%>
	<form id="form1" name="form1" method="post" action="ChiTietSach.jsp">
		<center>
			Chọn Mã Sách cần xem: <label> <select name="tensach"
				id="tensach">
					<%
						try {
								String loadms = "SELECT tenSach FROM sach";
								PreparedStatement psloadms = ConnectionDB.conn()
										.prepareStatement(loadms);
								ResultSet rsloadms = psloadms.executeQuery();
								while (rsloadms.next()) {
									String tensach = rsloadms.getString(1);
					%>
					<option value="<%=tensach%>"><%=tensach%></option>
					<%
						}
							} catch (SQLException e) {
								e.printStackTrace();
							} catch (Exception e) {
								e.printStackTrace();
							}
					%>
			</select>
			</label> <label> <input type="submit" name="Submit"
				value="Xem chi tiết" />
			</label>
		</center>
	</form>
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
			try {
					String ts = request.getParameter("tensach");
					String temp = String.valueOf(ts);
					String loadchitietsachtheoms = "SELECT chitietsach.sachID,chitietsach.hinhsach,chitietsach.trongluong,chitietsach.kichthuoc,chitietsach.dichgia,chitietsach.sotrang,chitietsach.ngayxuatban,chitietsach.thanhvienid FROM chitietsach inner join sach on sach.id = chitietsach.sachID  WHERE sach.tenSach = ?";
					PreparedStatement psloadchitietsach = ConnectionDB.conn()
							.prepareStatement(loadchitietsachtheoms);
					psloadchitietsach.setString(1, ts);
					ResultSet rscts = psloadchitietsach.executeQuery();
					while (rscts.next()) {
						String tem = rscts.getString(5);
						if (tem == null) {
							tem = "";
						}
		%>
		<tr>
			<td width='50'><%=rscts.getInt(1)%></td>
			<td align='center' width='120'><img alt=""
				src="../<%=rscts.getString(2)%>"></td>
			<td width='70'><%=rscts.getString(3)%></td>
			<td width='70'><%=rscts.getString(4)%></td>
			<td width='70'><%=tem%></td>
			<td width='70'><%=rscts.getInt(6)%></td>
			<td width='70'><%=rscts.getDate(7)%></td>
			<td width='70'><%=rscts.getInt(8)%></td>
		</tr>
		<%
			}
					rscts.close();
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