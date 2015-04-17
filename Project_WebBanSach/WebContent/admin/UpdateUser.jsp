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
	<%@include file="Script.jsp"%>
	<%
		String tdn_err = (String) request.getAttribute("tdn_err");
			String mk_err = (String) request.getAttribute("mk_err");
			String ht_err = (String) request.getAttribute("ht_err");
			String sdt_err = (String) request.getAttribute("sdt_err");
			String email_err = (String) request.getAttribute("email_err");
			String dc_err = (String) request.getAttribute("dc_err");
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
			if (dc_err == null) {
				dc_err = "";
			}
			String[] quocgias = new String[] { "Việt Nam", "Nước Khác" };
			String[] tinhthanhs = new String[] { "TP. HCM", "Trà Vinh",
					"Đồng Nai", "Khac" };

			String tendn = request.getParameter("tendn");
			System.out.println(tendn);
			String searchUser = "SELECT thanhvien.id, taikhoan.username,taikhoan.`password`,khachhang.tenkhachhang,khachhang.ngaysinh,khachhang.quocgia,khachhang.tinhthanh,khachhang.diachi,khachhang.`sdt`,khachhang.`sdd`,thanhvien.email,khachhang.gioitinh,taikhoan.`groups`,taikhoan.active,taikhoan.id FROM thanhvien ,taikhoan ,khachhang WHERE 1 = 1 AND thanhvien.taikhoanID = taikhoan.id AND thanhvien.khachhangID = khachhang.id AND taikhoan.username =?";
			PreparedStatement pst = ConnectionDB.conn().prepareStatement(
					searchUser);
			pst.setString(1, tendn);
			ResultSet result = pst.executeQuery();
	%>
	<div id="wrap">
		<%@include file="Menu.jsp"%>
		<div class="center_content">
			<br />
			<table align="center" bgcolor="#CCFFCC">
				<tr>
					<td><strong><font size="6" color="#3399CC">TRANG
								SỬA THÔNG TIN NGƯỜI DÙNG</font></strong></td>
				</tr>
			</table>
			<br /> <br />
			<%--Table thong tin nguoi dung--%>
			<form id="form1" name="form1" method="post"
				action="<%=tenproject%>/UpdateUserServlet">

				<table width="571" border="0" align="center" cellpadding="0"
					cellspacing="0" bordercolor="#00CCFF">
					<tr>
						<td height="40" colspan="2" bgcolor="#33FF99"><div
								align="center" class="style1">
								<font size="6" color="red">SỬA THÔNG TIN NGƯỜI DÙNG</font>
							</div></td>
					</tr>
					<%
						if (result != null) {
								while (result.next()) {
									int id = result.getInt(1);
									String tendangnhap = result.getString(2);
									String matkhau = result.getString(3);
									String hoten = result.getString(4);
									int ngay = Integer.valueOf(result.getDate(5).getDay());
									int thang = Integer.valueOf(result.getDate(5)
											.getMonth()) + 1;
									int nam = Integer.valueOf(result.getDate(5).getYear());
									if (nam > 20) {
										nam += 1900;
									} else {
										nam += 2000;
									}
									String qgs = result.getString(6);
									String tts = result.getString(7);
									String diachi = result.getString(8);
									String dienthoai = result.getString(9);
									String dienthoaididong = result.getString(10);
									String email = result.getString(11);
									String gioitinh = result.getString(12);
									int nhom = result.getInt(13);
									int active = result.getInt(14);
									int idtk = result.getInt(15);
					%>
					<tr>
						<td width="121" height="30" bgcolor="#CCFFCC"><div
								align="right" class="thongtin">
								<strong>ID tài khoản:</strong>
							</div></td>
						<td bgcolor="#66CC99"><select name="idtk"><option
									value="<%=idtk%>"><%=idtk%></option>
						</select></td>
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
								type="text" class="textbox" id="matkhau" value="<%=matkhau%>" />
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
							</div></td>
						<td bgcolor="#66CC99"><select name="ngay">
								<option value="<%=ngay%>"><%=ngay%></option>
								<%
									for (int day = 1; day <= 31; day++) {
								%>
								<option value="<%=day%>"><%=day%></option>
								<%
									}
								%>
						</select> <select name="thang">
								<option value="<%=thang%>"><%=thang%></option>
								<%
									for (int mounth = 1; mounth <= 12; mounth++) {
								%>
								<option value="<%=mounth%>"><%=mounth%></option>
								<%
									}
								%>
						</select> <select name="nam">
								<option value="<%=nam%>"><%=nam%></option>
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
						<td bgcolor="#66CC99"><input name="dienthoaididong"
							type="text" class="textbox" id="dienthoaididong"
							value="<%=dienthoaididong%>" /></td>
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
						<%
							if (gioitinh.equalsIgnoreCase("nam")) {
						%>
						<td bgcolor="#66CC99"><select name="gioitinh" class="textbox"
							id="gioitinh">
								<option value="0" selected="selected">Nam</option>
								<option value="1">Nữ</option>
						</select></td>
						<%
							} else {
						%>
						<td bgcolor="#66CC99"><select name="gioitinh" class="textbox"
							id="gioitinh">
								<option value="0">Nam</option>
								<option value="1" selected="selected">Nữ</option>
						</select></td>
						<%
							}
						%>
					</tr>
					<tr>
						<td height="30" bgcolor="#CCFFCC" class="thongtin"><div
								align="right">
								<strong>Group:</strong>
							</div></td>
						<%
							System.out.print("nhom " + nhom);
										if (nhom == 1) {
						%>
						<td bgcolor="#66CC99"><select name="idgroup" class="textbox"
							id="idgroup">
								<option value="1" selected="selected">Admin</option>
								<option value="2">Người Dùng</option>
						</select></td>
						<%
							}
										if (nhom == 2) {
						%>
						<td bgcolor="#66CC99"><select name="idgroup" class="textbox"
							id="idgroup">
								<option value="1">Admin</option>
								<option value="2" selected="selected">Người Dùng</option>
						</select></td>
						<%
							}
						%>


					</tr>
					<tr>
						<td height="30" bgcolor="#CCFFCC" class="thongtin"><div
								align="right">
								<strong>Trạng Thái Hoạt Động:</strong>
							</div></td>
						<td bgcolor="#66CC99"><select name="idactive" class="textbox"
							id="idactive">
								<%
									if (active == 0) {
								%>
								<option value="0" selected="selected">No</option>
								<option value="1">Yes</option>
								<%
									} else {
								%>
								<option value="1" selected="selected">Yes</option>
								<option value="0">No</option>
								<%
									}
								%>
						</select></td>
					</tr>
					<tr>
						<td height="30" bgcolor="#CCFFCC" class="thongtin"><div
								align="right">
								<strong>Quốc Gia:</strong>
							</div></td>
						<td bgcolor="#66CC99"><select name="qg">
								<option value="<%=qgs%>"><%=qgs%></option>
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
								<option value="<%=tts%>"><%=tts%></option>
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
						<td bgcolor="#66CC99"><label><textarea rows="2"
									cols="30" name="diachi" class="textbox" id="diachi"><%=diachi%></textarea>
						</label><font color="Red">*<%=dc_err%></font></td>

					</tr>
					<tr>
						<td bgcolor="#CCFFCC"></td>
						<td bgcolor="#66CC99"></td>
					</tr>
					<tr>
						<td bgcolor="#CCFFCC"></td>
						<td colspan="2" height="40" bgcolor="#66CC99">
							<div align="center">
								<input type="submit" name="sua" id="sua" value="Sửa" /> <input
									type="reset" name="lamlai" id="lamlai" value="Làm Lại" />
							</div>
						</td>
					</tr>
					<%
						}
							}
					%>
				</table>
			</form>
			<%--Ket thuc table thong tin nguoi dung--%>

			<%@include file="DSUser.jsp"%>
			<br />

			<table align="center" cellspacing="20">
				<tr>
					<td><a href="<%=tenproject%>/admin/AddUser.jsp"><img
							src="<%=tenproject%>/images_admin/add.png" /></a></td>
					<td><a href="<%=tenproject%>/admin/DeleteUser.jsp"> <img
							src="<%=tenproject%>/images_admin/delete.png" /></a></td>
				</tr>
			</table>

			<div class="clear"></div>
		</div>
		<!--end of center content-->

		<div>
			<%@include file="Footer.jsp"%>


		</div>


	</div>
	<%
		} else {
			response.sendRedirect("../DangNhap.jsp");
		}
	%>
</body>
</html>