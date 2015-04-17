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
					<td><strong><font size="6" color="#3399CC">TRANG
								THÊM NGƯỜI DÙNG</font></strong></td>
				</tr>
			</table>
			<br /> <br />
			<%
				String tendn = request.getParameter("tendn");
					String matkhau = request.getParameter("matkhau");
					String hoten = request.getParameter("hoten");
					String s_ngay = request.getParameter("ngay");
					String s_thang = request.getParameter("thang");
					String s_nam = request.getParameter("nam");
					String dienthoai = request.getParameter("dienthoai");
					String dienthoaididong = request
							.getParameter("dienthoaididong");
					String email = request.getParameter("email");
					String gioitinh = request.getParameter("gioitinh");
					String idgroup = request.getParameter("idgroup");
					String idactive = request.getParameter("idactive");
					String quocgia = request.getParameter("quocgia");
					String tinhthanh = request.getParameter("tinhthanh");
					String diachis = request.getParameter("diachi");

					String tdn_err = (String) request.getAttribute("tdn_err");
					String mk_err = (String) request.getAttribute("mk_err");
					String ht_err = (String) request.getAttribute("ht_err");
					String sdt_err = (String) request.getAttribute("sdt_err");
					String email_err = (String) request.getAttribute("email_err");
					String dc_err = (String) request.getAttribute("dc_err");

					if (tendn == null) {
						tendn = "";
					}
					if (request.getAttribute("tendn") != null) {
						tendn = (String) request.getAttribute("tendn");
					}
					if (matkhau == null) {
						matkhau = "";
					}
					if (request.getAttribute("matkhau") != null) {
						matkhau = (String) request.getAttribute("matkhau");
					}
					if (hoten == null) {
						hoten = "";
					}
					if (request.getAttribute("hoten") != null) {
						hoten = (String) request.getAttribute("hoten");
					}
					if (dienthoai == null) {
						dienthoai = "";
					}
					if (request.getAttribute("dienthoai") != null) {
						dienthoai = (String) request.getAttribute("dienthoai");
					}
					if (dienthoaididong == null) {
						dienthoaididong = "";
					}
					if (email == null) {
						email = "";
					}
					if (request.getAttribute("email") != null) {
						email = (String) request.getAttribute("email");
					}
					if (diachis == null) {
						diachis = "";
					}
					if (request.getAttribute("diachi") != null) {
						diachis = (String) request.getAttribute("diachi");
					}

					if (tdn_err == null) {
						tdn_err = "";
					}
					if (mk_err == null) {
						mk_err = "";
					}
					if (ht_err == null) {
						ht_err = "";
					}
					if (sdt_err == null) {
						sdt_err = "";
					}
					if (email_err == null) {
						email_err = "";
					}
					String[] quocgias = new String[] { "Việt Nam", "Nước Khác" };
					String[] tinhthanhs = new String[] { "TP. HCM", "Trà Vinh",
							"Đồng Nai", "Khac" };
			%>
			<form id="form1" name="form1" method="post"
				action="<%=tenproject%>/AddUserServlet">

				<table width="571" border="0" align="center" cellpadding="0"
					cellspacing="0" bordercolor="#00CCFF">
					<tr>
						<td height="40" colspan="2" bgcolor="#33FF99"><div
								align="center" class="style1">
								<font size="6" color="red">THÊM NGƯỜI DÙNG</font>
							</div></td>
					</tr>
					<tr>
						<td width="121" height="30" bgcolor="#CCFFCC"><div
								align="right" class="thongtin">
								<strong>Tên Đăng Nhập:</strong>
							</div></td>
						<td width="444" bgcolor="#66CC99"><label> <input
								name="tendn" type="text" class="textbox" id="tendn"
								value="<%=tendn%>" />
						</label><font color="Red">*<%=tdn_err%></font></td>
					</tr>
					<tr>
						<td height="30" bgcolor="#CCFFCC" class="thongtin"><div
								align="right">
								<strong>Mật Khẩu:</strong>
							</div></td>
						<td bgcolor="#66CC99"><label> <input name="matkhau"
								type="password" class="textbox" id="matkhau"
								value="<%=matkhau%>" />
						</label><font color="Red">*<%=mk_err%></font></td>
					</tr>
					<tr>
						<td height="30" bgcolor="#CCFFCC" class="thongtin"><div
								align="right">
								<strong>Họ Tên:</strong>
							</div></td>
						<td bgcolor="#66CC99"><label> <input name="hoten"
								type="text" class="textbox" id="hoten" value="<%=hoten%>" />
						</label><font color="Red">*<%=ht_err%></font></td>
					</tr>
					<tr>
						<td height="30" bgcolor="#CCFFCC" class="thongtin"><div
								align="right">
								<strong>Ngày Sinh:</strong>
							</div>
						<td bgcolor="#66CC99"><select name="ngay">
								<%
									for (int day = 1; day <= 31; day++) {
								%>
								<option value="<%=day%>"><%=day%></option>
								<%
									}
								%>
						</select> <select name="thang">
								<%
									for (int mounth = 1; mounth <= 12; mounth++) {
								%>
								<option value="<%=mounth%>"><%=mounth%></option>
								<%
									}
								%>
						</select> <select name="nam">
								<%
									for (int year = 1970; year <= 2020; year++) {
								%>
								<option value="<%=year%>"><%=year%></option>
								<%
									}
								%>
						</select></td>
					</tr>
					<tr>
						<td height="30" bgcolor="#CCFFCC" class="thongtin"><div
								align="right">
								<strong>Điện Thoại:</strong>
							</div></td>
						<td bgcolor="#66CC99"><label> <input name="dienthoai"
								type="text" class="textbox" id="dienthoai"
								value="<%=dienthoai%>" />
						</label><font color="Red">*<%=sdt_err%></font></td>
					</tr>
					<tr>
						<td height="30" bgcolor="#CCFFCC" class="thongtin"><div
								align="right">
								<strong>Điện Thoại Di Động:</strong>
							</div></td>
						<td bgcolor="#66CC99"><label> <input
								name="dienthoaididong" type="text" class="textbox"
								id="dienthoaididong" value="<%=dienthoaididong%>" />
						</label></td>
					</tr>
					<tr>
						<td height="30" bgcolor="#CCFFCC" class="thongtin"><div
								align="right">
								<strong>Email:</strong>
							</div></td>
						<td bgcolor="#66CC99"><label> <input name="email"
								type="text" class="textbox" id="email" value="<%=email%>" />
						</label><font color="Red">*<%=email_err%></font></td>
					</tr>
					<tr>
						<td height="30" bgcolor="#CCFFCC" class="thongtin"><div
								align="right">
								<strong>Giới Tính:</strong>
							</div></td>
						<td bgcolor="#66CC99"><input type="radio" name="sex"
							value="0" checked="checked" />Nam <input type="radio" name="sex"
							value="1" />Nữ</td>
					</tr>
					<tr>
						<td height="30" bgcolor="#CCFFCC" class="thongtin"><div
								align="right">
								<strong>Group:</strong>
							</div></td>
						<td bgcolor="#66CC99"><select name="idgroup" class="textbox"
							id="idgroup">
								<option value="1">Admin</option>
								<option value="2" selected="selected">Người Dùng</option>
						</select></td>

					</tr>
					<tr>
						<td height="30" bgcolor="#CCFFCC" class="thongtin"><div
								align="right">
								<strong>Trạng Thái Hoạt Động:</strong>
							</div></td>
						<td bgcolor="#66CC99"><select name="idactive" class="textbox"
							id="idactive">
								<option value="1" selected="selected">Yes</option>
								<option value="0">No</option>
						</select></td>
					</tr>
					<tr>
						<td height="30" bgcolor="#CCFFCC" class="thongtin"><div
								align="right">
								<strong>Quốc Gia:</strong>
							</div></td>
						<td bgcolor="#66CC99"><select name="qg">
								<%
									for (String qg : quocgias) {
								%>
								<option value="<%=qg%>"><%=qg%></option>
								<%
									}
								%>
						</select></td>
					<tr>
						<td height="30" bgcolor="#CCFFCC" class="thongtin"><div
								align="right">
								<strong>Tỉnh Thành:</strong>
							</div></td>
						<td bgcolor="#66CC99"><select name="tt">
								<%
									for (String tt : tinhthanhs) {
								%>
								<option value="<%=tt%>"><%=tt%></option>
								<%
									}
								%>
						</select></td>
					</tr>
					<tr>
						<td height="30" bgcolor="#CCFFCC" class="thongtin"><div
								align="right">
								<strong>Địa Chỉ:</strong>
							</div></td>
						<td bgcolor="#66CC99"><textarea rows="2" cols="30"
								name="diachi" class="textbox" id="diachi">Đại Học Nông Lâm</textarea></td>

					</tr>
					<tr>
						<td bgcolor="#CCFFCC"></td>
						<td bgcolor="#66CC99"></td>
					</tr>
					<tr>
						<td bgcolor="#CCFFCC"></td>
						<td colspan="2" height="40" bgcolor="#66CC99">
							<div align="center">
								<input type="submit" name="them" id="them" value="Thêm" /> <input
									type="reset" name="lamlai" id="lamlai" value="Làm Lại" />
							</div>
						</td>
					</tr>
				</table>
			</form>
			<%--Ket thuc table thong tin nguoi dung--%>

			<%@include file="DSUser.jsp"%>
			<br />

			<table align="center" cellspacing="20">
				<tr>
					<td><a href="<%=tenproject%>/admin/EditUser.jsp"><img
							src="<%=tenproject%>/images_admin/edit.png" /></a></td>
					<td><a href="<%=tenproject%>/admin/DeleteUser.jsp"> <img
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