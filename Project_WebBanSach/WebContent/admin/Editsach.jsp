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
<%--Style table thong tin--%>
<style type="text/css">
<!--
.style1 {
	font-size: 24px;
	color: #3366FF;
	font-weight: bold;
}

.textbox {
	border: 1px solid #3399FF;
}

.thongtin {
	padding-right: 10px;
}
-->
</style>
<%--Ket thuc style table thong tin--%>
</head>
<body>
	<%
		String t = (String) session.getAttribute("tendaydu");
		String n = (String) session.getAttribute("nhom");
		if (t != null && n.equalsIgnoreCase("1")) {
	%>
	<div id="wrap">
		<%@include file="Menu.jsp"%>
		<div class="center_content">
			<br />
			<table align="center" bgcolor="#CCFFCC">
				<tr>
					<td><strong><font size="6" color="#3399CC">SỬA
								THÔNG TIN SÁCH VÀ CHI TIẾT SÁCH</font></strong></td>
				</tr>
			</table>
			<br /> <br />
			<%--Table thong tin nguoi dung--%>
			<form id="form1" name="form1" method="post" action="UpdateSach.jsp">
				<center>
					Chọn ten sách cần sửa: <label> <select name="tensach">
							<%
								try {
										String loadts = "SELECT tenSach FROM sach order by id";
										PreparedStatement psts = ConnectionDB.conn()
												.prepareStatement(loadts);
										ResultSet rsts = psts.executeQuery();
										while (rsts.next()) {
											String tensach = rsts.getString(1);
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
						value="Đến trang sửa" />
					</label>

				</center>
			</form>
			<%--Ket thuc table thong tin nguoi dung--%>

			<%@include file="DSSach.jsp"%>
			<br />

			<table align="center" cellspacing="20">
				<tr>
					<td><a href="<%=tenproject%>/admin/Addsach.jsp"><img
							src="<%=tenproject%>/images_admin/add.png" /></a></td>
					<td><a href="<%=tenproject%>/admin/Deletesach.jsp"> <img
							src="<%=tenproject%>/images_admin/delete.png" /></a></td>
				</tr>
			</table>



			<div class="clear"></div>
		</div>
		<!--end of center content-->


		<%@include file="Footer.jsp"%>


	</div>
	<%
		} else {
			response.sendRedirect("../DangNhap.jsp");
		}
	%>
</body>
</html>