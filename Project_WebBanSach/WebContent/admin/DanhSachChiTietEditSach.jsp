<%@page import="java.sql.ResultSet"%>
<%@page import="connection.ConnectionDB"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.SQLException"%>
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
	<br />
	<br />
	<table align="center" border="1" border-style="solid"
		bordercolor="#3399CC" cellpadding="0" cellspacing="0" width="850px">
		<tr height="40">
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
				String chitietsachtheoms = "SELECT chitietsach.sachID,chitietsach.hinhsach,chitietsach.trongluong,chitietsach.kichthuoc,chitietsach.dichgia,chitietsach.sotrang,chitietsach.ngayxuatban,chitietsach.thanhvienid	FROM chitietsach,sach WHERE chitietsach.sachID = sach.id AND sach.tenSach = ?;";
				PreparedStatement loadchitietsach = ConnectionDB.conn()
						.prepareStatement(chitietsachtheoms);
				loadchitietsach.setString(1, ts);
				ResultSet rscts = loadchitietsach.executeQuery();
				while (rscts.next()) {
					String dichgia = rscts.getString(5);
					if(dichgia == null){
						dichgia = "";
					}
		%>
		<tr>
			<td align='center' width='120'><img alt=""
				src="../<%=rscts.getString(2)%>"></td>
			<td width='70'><%=rscts.getString(3)%></td>
			<td width='70'><%=rscts.getString(4)%></td>
			<td width='70'><%=dichgia%></td>
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
</body>
</html>