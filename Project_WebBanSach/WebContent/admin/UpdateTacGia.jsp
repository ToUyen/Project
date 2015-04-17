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
		if (tendd != null &&  n.equalsIgnoreCase("1")) {
	%>
	<div id="wrap">
		<%@include file="Menu.jsp"%>
		<div class="center_content">
			<br />
			<table align="center" bgcolor="#CCFFCC">
				<tr>
					<td><strong><font size="6" color="#3399CC">TRANG
								THÊM TÁC GIẢ</font></strong></td>
				</tr>
			</table>
			<br /> <br />
			<%--onsubmit="return kiemtranhap();"--%>
			<%--Table thong tin nguoi dung--%>
			<form id="form1" name="form1" method="post"
				action="<%=tenproject%>/UpdateTacGia">

				<table width="571" border="0" align="center" cellpadding="0"
					cellspacing="0" bordercolor="#00CCFF">
					<tr>
						<td height="40" colspan="2" bgcolor="#33FF99"><div
								align="center" class="style1">SỬA TÁC GIẢ</div></td>
					</tr>
					<%
						String matg = request.getParameter("matg");
							String sqlsearchmatg = "SELECT * FROM tacgia WHERE matacgia = '"
									+ matg + "'";
							try {
								PreparedStatement pssqlsearchmatg = ConnectionDB.conn()
										.prepareStatement(sqlsearchmatg);
								ResultSet rssqlsearchmatg = pssqlsearchmatg.executeQuery();
								rssqlsearchmatg.next();
								String tentg_err = (String) request
										.getAttribute("tentg_err");
								if (tentg_err == null) {
									tentg_err = "";
								}
					%>
					<tr>
						<td width="121" height="30" bgcolor="#CCFFCC"><div
								align="right" class="thongtin">
								<strong>Mã Tác Giả:</strong>
							</div>
						<td bgcolor="#66CC99"><select name="matg"><option
									value="<%=rssqlsearchmatg.getInt(1)%>"><%=rssqlsearchmatg.getInt(1)%></option></select></td>

					</tr>
					<tr>
						<td height="30" bgcolor="#CCFFCC" class="thongtin"><div
								align="right">
								<strong>Tên Tác Giả:</strong>
							</div></td>
						<td bgcolor="#66CC99"><input name="tentg" type="text"
							class="textbox" id="tentg"
							value="<%=rssqlsearchmatg.getString(2)%>" /> <font color="red">*<%=tentg_err%></font></td>
					</tr>
					<%
						} catch (SQLException e) {
								e.printStackTrace();
							}
					%>
					<tr>
						<td bgcolor="#CCFFCC"></td>
						<td colspan="2" height="40" bgcolor="#66CC99">
							<div align="center">
								<input type="submit" name="sua" id="sua" value="Sửa" /> <input
									type="reset" name="lamlai" id="lamlai" value="Làm Lại" />
							</div>
						</td>
					</tr>
				</table>
			</form>
			<%--Ket thuc table thong tin nguoi dung --%>

			<%@include file="DanhSachUpdateTacGia.jsp"%>
			<br />

			<table align="center" cellspacing="20">
				<tr>
					<td><a href="<%=tenproject%>/admin/EditTacGia.jsp"><img
							src="<%=tenproject%>/images_admin/edit.png" /></a></td>
					<td><a href="<%=tenproject%>/admin/DeleteTacGia.jsp"> <img
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