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
		String tendd = (String) session.getAttribute("tendaydu");
		String n = (String) session.getAttribute("nhom");
		if (tendd != null && n.equalsIgnoreCase("1")) {
	%>
	<div id="wrap">
		<%@include file="Menu.jsp"%>
		<div class="center_content">
			<br />
			<table align="center" bgcolor="#CCFFCC">
				<tr>
					<td><strong><font size="6" color="#3399CC">XÓA
								NHÀ XUẤT BẢN</font></strong></td>
				</tr>
			</table>
			<br /> <br />
			<%--Table thong tin nguoi dung--%>
			<form id="form1" name="form1" method="post"
				action="<%=tenproject%>/DeleteNXBServlet">
				<center>
					Chọn tên nhà xuất bản cần xóa: <label> <select
						name="tennxb">
							<%
								try {
										String searchnxb = "SELECT tenNhaXuatBan FROM nhaxuatban order by maNhaXuatBan";
										PreparedStatement psttsearchxb = ConnectionDB
												.getConnection().prepareStatement(searchnxb);
										ResultSet rssearcjnxb = psttsearchxb.executeQuery();
										while (rssearcjnxb.next()) {
							%>
							<option value="<%=rssearcjnxb.getString(1)%>"><%=rssearcjnxb.getString(1)%></option>
							<%
								}
									} catch (SQLException e) {
										e.printStackTrace();
									}
							%>
					</select>
					</label><input type="submit" name="Submit" value="Xóa thông tin" />

				</center>
			</form>
			<%--Ket thuc table thong tin dịch giả--%>

			<%@include file="DSNXB.jsp"%>
			<br />

			<table align="center" cellspacing="20">
				<tr>
					<td><a href="<%=tenproject%>/admin/Addnxb.jsp"><img
							src="<%=tenproject%>/images_admin/add.png" /></a></td>
					<td><a href="<%=tenproject%>/admin/Editnxb.jsp"> <img
							src="<%=tenproject%>/images_admin/edit.png" /></a></td>
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