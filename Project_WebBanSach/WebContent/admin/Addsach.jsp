<%@page import="java.sql.SQLException"%>
<%@page import="connection.ConnectionDB"%>
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
		String tend = (String) session.getAttribute("tendaydu");
		String nn = (String) session.getAttribute("nhom");
		if (tend != null && nn.equalsIgnoreCase("1")) {
	%>
	<div id="wrap">
		<%@include file="Menu.jsp"%>
		<div class="center_content">
			<br />
			<table align="center" bgcolor="#CCFFCC">
				<tr>
					<td><strong><font size="6" color="#3399CC">TRANG
								THÊM SÁCH VÀ CHI TIẾT SÁCH</font></strong></td>
				</tr>
			</table>
			<br /> <br />
			<%--Table thong tin nguoi dung--%>
			<%
				int iddm = 0;
					String tensach_err = (String) request
							.getAttribute("tensach_err");
					String giabia_err = (String) request.getAttribute("giabia_err");
					String giaban_err = (String) request.getAttribute("giaban_err");
					String giamgia_err = (String) request
							.getAttribute("giamgia_err");
					String sotrang_err = (String) request
							.getAttribute("sotrang_err");
					if (sotrang_err == null) {
						sotrang_err = "vd: 100";
					}
					if (tensach_err == null) {
						tensach_err = "";
					}
					if (giabia_err == null) {
						giabia_err = "";
					}
					if (giaban_err == null) {
						giaban_err = "";
					}
					if (giamgia_err == null) {
						giamgia_err = "";
					}

					String tensach = (String) request.getAttribute("tensach");
					String giabia = (String) request.getAttribute("giabia");
					String giaban = (String) request.getAttribute("giaban");
					String soluong = (String) request.getAttribute("soluong");
					String trongluong = (String) request.getAttribute("trongluong");
					String kichthuoc = (String) request.getAttribute("kichthuoc");
					String dichgia = (String) request.getAttribute("dichgia");
					String sotrang = (String) request.getAttribute("sotrang");
					if (tensach == null)
						tensach = "";
					if (giabia == null)
						giabia = "";
					if (giaban == null)
						giaban = "";
					if (soluong == null)
						soluong = "";
					if (trongluong == null)
						trongluong = "";
					if (kichthuoc == null)
						kichthuoc = "";
					if (dichgia == null)
						dichgia = "";
					if (sotrang == null)
						sotrang = "";
			%>
			<form id="form1" name="form1" method="post"
				action="<%=tenproject%>/AddSachServlet">

				<table width="571" border="0" align="center" cellpadding="0"
					cellspacing="0" bordercolor="#00CCFF">
					<tr>
						<td height="40" colspan="2" bgcolor="#33FF99"><div
								align="center" class="style1">THÊM SÁCH</div></td>
					</tr>
					<tr>
						<td height="30" bgcolor="#CCFFCC" class="thongtin"><div
								align="right">
								<strong>Tên Sách:</strong>
							</div></td>
						<td bgcolor="#66CC99"><label> <input name="tensach"
								value="<%=tensach%>" type="text" class="textbox" id="tensach"
								size="40" />
						</label><font color="red">*<%=tensach_err%></font></td>
					</tr>
					<tr>
						<td height="30" bgcolor="#CCFFCC" class="thongtin"><div
								align="right">
								<strong>Hình Thức Bìa:</strong>
							</div></td>
						<td bgcolor="#66CC99"><select name="hinhthucbia">
								<option value="Mềm">Bìa Mềm</option>
								<option value="Cứng">Bìa Cứng</option>
						</select></td>
					</tr>
					<tr>
						<td height="15" bgcolor="#CCFFCC" class="thongtin"><div
								align="right">
								<strong>Giá Bìa:</strong>
							</div></td>
						<td bgcolor="#66CC99"><label> <input name="giabia"
								value="<%=giabia%>" type="text" class="textbox" id="giabia" />
						</label><font color="red">*<%=giabia_err%></font></td>
					</tr>
					<tr>
						<td height="15" bgcolor="#CCFFCC" class="thongtin"><div
								align="right">
								<strong>Giá Bán:</strong>
							</div></td>
						<td bgcolor="#66CC99"><label> <input name="giaban"
								value="<%=giaban%>" type="text" class="textbox" id="giaban" />
						</label><font color="red">*<%=giaban_err%></font></td>
					</tr>
					<tr>
						<td height="30" bgcolor="#CCFFCC" class="thongtin"><div
								align="right">
								<strong>Giảm Giá:</strong>
							</div></td>
						<td bgcolor="#66CC99"><label> <select name="giamgia">
									<%
										int i;
											for (i = 0; i < 100; i++) {
									%>
									<option><%=i%></option>
									<%
										}
									%>
							</select>
						</label><font color="red">%<%=giamgia_err%></font></td>
					</tr>
					<tr>
						<td height="15" bgcolor="#CCFFCC" class="thongtin"><div
								align="right">
								<strong>Số Lượng:</strong>
							</div></td>
						<td bgcolor="#66CC99"><select name="soluong">
								<%
									for (int sl = 0; i < 1000; i++) {
											sl++;
								%>
								<option value="<%=sl%>"><%=sl%></option>
								<%
									}
								%>
						</select><font color="red"> Cuốn</font></td>
					</tr>
					<tr>
						<td height="15" bgcolor="#CCFFCC" class="thongtin"><div
								align="right">
								<strong>Tên Nhà Xuất Bản:</strong>
							</div></td>
						<td bgcolor="#66CC99"><select name="tennxb">
								<%
									try {
											String loadnxb = "SELECT tenNhaXuatBan FROM nhaxuatban";
											PreparedStatement pstmtloadnxb = ConnectionDB
													.getConnection().prepareStatement(loadnxb);
											ResultSet rsloadnxb = pstmtloadnxb.executeQuery();
											while (rsloadnxb.next()) {
												String tennxb = rsloadnxb.getString(1);
								%>
								<option value="<%=tennxb%>"><%=tennxb%></option>
								<%
									}
										} catch (SQLException e) {
											e.printStackTrace();
										}
								%>
						</select></td>
					</tr>
					<tr>
						<td height="30" bgcolor="#CCFFCC" class="thongtin"><div
								align="right">
								<strong>Tên Thể Loại:</strong>
							</div></td>
						<td bgcolor="#66CC99"><select name="tentl">
								<%
									try {
											String loadtl = "SELECT tenLoaiSach FROM loaisach";
											PreparedStatement pstmtloadtl = ConnectionDB
													.getConnection().prepareStatement(loadtl);
											ResultSet rsloadtl = pstmtloadtl.executeQuery();
											while (rsloadtl.next()) {
												String tendm = rsloadtl.getString(1);
								%>
								<option value="<%=tendm%>"><%=tendm%></option>
								<%
									}
										} catch (SQLException e) {
											e.printStackTrace();
										}
								%>
						</select></td>
					</tr>
					<tr>
						<td height="15" bgcolor="#CCFFCC" class="thongtin"><div
								align="right">
								<strong>Tên Tác Giả:</strong>
							</div></td>
						<td bgcolor="#66CC99"><select name="tentg">
								<%
									try {
											String loadtg = "SELECT tentacgia FROM tacgia";
											PreparedStatement pstmtloadtg = ConnectionDB
													.getConnection().prepareStatement(loadtg);
											ResultSet rsloadtg = pstmtloadtg.executeQuery();
											while (rsloadtg.next()) {
												String tentg = rsloadtg.getString(1);
								%>
								<option value="<%=tentg%>"><%=tentg%></option>
								<%
									}
										} catch (SQLException e) {
											e.printStackTrace();
										}
								%>
						</select></td>
					</tr>
					<tr>
						<td height="40" colspan="2" bgcolor="#33FF99"><div
								align="center" class="style1">THÊM CHI TIẾT SÁCH</div></td>
					</tr>
					<tr>
						<td height="30" bgcolor="#CCFFCC" class="thongtin"><div
								align="right">
								<strong>Hình:</strong>
							</div></td>
						<td bgcolor="#66CC99"><label> <input name="hinh"
								type="file" class="textbox" id="hinh" />

						</label></td>
					</tr>
					<tr>
						<td height="15" bgcolor="#CCFFCC" class="thongtin"><div
								align="right">
								<strong>Trọng Lượng:</strong>
							</div></td>
						<td bgcolor="#66CC99"><label> <input
								name="trongluong" type="text" class="textbox" id="trongluong" />
						</label><font color="red">vd: 544 grams</font></td>
					</tr>
					<tr>
						<td height="15" bgcolor="#CCFFCC" class="thongtin"><div
								align="right">
								<strong>Kích Thước:</strong>
							</div></td>
						<td bgcolor="#66CC99"><label> <input name="kichthuoc"
								value="<%=kichthuoc%>" type="text" class="textbox"
								id="kichthuoc" />
						</label><font color="red">vd: 9.1 x 6.3 x 1.3 inches</font></td>
					</tr>
					<tr>
						<td height="15" bgcolor="#CCFFCC" class="thongtin"><div
								align="right">
								<strong>Dịch Giả:</strong>
							</div></td>
						<td bgcolor="#66CC99"><label> <input name="dichgia"
								value="<%=dichgia%>" type="text" class="textbox" id="dichgia" />
						</label></td>
					</tr>
					<tr>
						<td height="15" bgcolor="#CCFFCC" class="thongtin"><div
								align="right">
								<strong>Số Trang:</strong>
							</div></td>
						<td bgcolor="#66CC99"><label> <input name="sotrang"
								value="0" type="text" class="textbox" id="sotrang" />
						</label><font color="red">*<%=sotrang_err%></font></td>
					</tr>
					<tr>
						<td height="30" bgcolor="#CCFFCC" class="thongtin"><div
								align="right">
								<strong>Ngày Xuất Bản: </strong>
							</div></td>
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
									for (int year = 1970; year <= 2014; year++) {
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
								<strong>Mã Thành Viên: </strong>
							</div></td>
						<td bgcolor="#66CC99"><label> <select name="matv">
									<%
										try {
												String loadmatv = "SELECT id FROM thanhvien";
												PreparedStatement pstmtloadmatv = ConnectionDB
														.getConnection().prepareStatement(loadmatv);
												ResultSet rsloadmatv = pstmtloadmatv.executeQuery();
												while (rsloadmatv.next()) {
													int matv = rsloadmatv.getInt(1);
									%>
									<option value="<%=matv%>"><%=matv%></option>
									<%
										}
											} catch (SQLException e) {
												e.printStackTrace();
											}
									%>
							</select>
						</label></td>
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
			<%--Ket thuc form thêm sách--%>

			<%@include file="DanhSachUpdateSach.jsp"%>
			<%@include file="DanhSachUpdateChiTietSach.jsp"%>
			<br />

			<table align="center" cellspacing="20">
				<tr>
					<td><a href="<%=tenproject%>/admin/Editsach.jsp"><img
							src="<%=tenproject%>/images_admin/edit.png" /></a></td>
					<td><a href="<%=tenproject%>/admin/Deletesach.jsp"> <img
							src="<%=tenproject%>/images_admin/delete.png" />
					</a></td>
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