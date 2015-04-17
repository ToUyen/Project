<%@page import="com.mysql.jdbc.EscapeTokenizer"%>
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
		String t1 = (String) session.getAttribute("tendaydu");
		String nn = (String) session.getAttribute("nhom");
		if (t1 != null && nn.equalsIgnoreCase("1")) {
	%>
	<%
		String tsach = request.getParameter("tensach");
			String loadsachvachitiet = "SELECT sach.id,sach.tenSach,sach.loaibia,sach.gia,sach.giaban,sach.giamgia,sach.soLuong,loaisach.tenLoaiSach,tacgia.tentacgia, "
					+ "nhaxuatban.tenNhaXuatBan,sach.luotbinhchon,chitietsach.hinhsach,chitietsach.trongluong,chitietsach.kichthuoc, "
					+ "chitietsach.dichgia,chitietsach.sotrang,chitietsach.ngayxuatban, chitietsach.thanhvienid "
					+ "FROM sach ,chitietsach ,loaisach ,tacgia ,nhaxuatban "
					+ "WHERE 1=1 "
					+ "AND sach.tacgiaID = tacgia.matacgia "
					+ "AND sach.nhaxbID = nhaxuatban.maNhaXuatBan "
					+ "AND sach.loaisachID = loaisach.maLoaiSach "
					+ "AND sach.id = chitietsach.sachID "
					+ "AND sach.tenSach =?";
			PreparedStatement psloadsachvachitiet = ConnectionDB.conn()
					.prepareStatement(loadsachvachitiet);
			psloadsachvachitiet.setString(1, tsach);
			ResultSet rsloadsachvachitiet = psloadsachvachitiet
					.executeQuery();
	%>
	<div id="wrap">
		<%@include file="Menu.jsp"%>
		<div class="center_content">
			<br />
			<table align="center" bgcolor="#CCFFCC">
				<tr>
					<td><strong><font size="6" color="#3399CC">TRANG
								SỬA THÔNG TIN SÁCH</font></strong></td>
				</tr>
			</table>
			<br /> <br />
			<%--Table thong tin nguoi dung--%>
			<%--Table thong tin nguoi dung--%>
			<form id="form1" name="form1" method="post" action="<%=tenproject%>/UpdateSach"
				enctype="multipart/form-data">

				<table width="571" border="0" align="center" cellpadding="0"
					cellspacing="0" bordercolor="#00CCFF">
					<tr>
						<td height="40" colspan="2" bgcolor="#33FF99"><div
								align="center" class="style1">SUA SÁCH</div></td>
					</tr>
						<%
							while (rsloadsachvachitiet.next()) {
									String loaibia = rsloadsachvachitiet.getString(3);
									int ngay = Integer.valueOf(rsloadsachvachitiet.getDate(17)
											.getDay());
									int thang = Integer.valueOf(rsloadsachvachitiet.getDate(17)
											.getMonth());
									int nam = Integer.valueOf(rsloadsachvachitiet.getDate(17)
											.getYear());
									if (nam > 20) {
										nam += 1900;
									} else {
										nam += 2000;
									}
						%>
					<tr>
						<td width="121" height="30" bgcolor="#CCFFCC"><div
								align="right" class="thongtin">
								<strong>Mã Sách:</strong>
							</div></td>
						<td width="444" bgcolor="#66CC99"><select name="id"><option
									value="<%=rsloadsachvachitiet.getInt(1)%>"><%=rsloadsachvachitiet.getInt(1)%></option>
						</select></td>
					</tr>
					<tr>
						<td height="30" bgcolor="#CCFFCC" class="thongtin"><div
								align="right">
								<strong>Tên Sách:</strong>
							</div></td>
						<td bgcolor="#66CC99"><input name="tensach"
								type="text" class="textbox" id="tensach" size="70"
								value="<%=rsloadsachvachitiet.getString(2)%>" />
						</td>
					</tr>
					<tr>
						<td height="30" bgcolor="#CCFFCC" class="thongtin"><div
								align="right">
								<strong>Hình Thức Bìa:</strong>
							</div></td>
						<td bgcolor="#66CC99"><label> <select
								name="hinhthucbia">
									<%
										if (loaibia.equalsIgnoreCase("Bìa Cứng")) {
									%>
									<option value="Cứng">Bìa Cứng</option>
									<option value="Mềm">Bìa Mềm</option>
									<%
										} else {
									%>
									<option value="Mềm">Bìa Mềm</option>
									<option value="Cứng">Bìa Cứng</option>
									<%
										}
									%>

							</select>
						</label></td>
					</tr>
					<tr>
						<td height="15" bgcolor="#CCFFCC" class="thongtin"><div
								align="right">
								<strong>Giá Bìa:</strong>
							</div></td>
						<td bgcolor="#66CC99"><label> <input name="giabia"
								type="text" class="textbox" id="giabia"
								value="<%=rsloadsachvachitiet.getInt(4)%>" />
						</label><font color="red">VNĐ</font></td>
					</tr>
					<tr>
						<td height="15" bgcolor="#CCFFCC" class="thongtin"><div
								align="right">
								<strong>Giá Bán:</strong>
							</div></td>
						<td bgcolor="#66CC99"><label> <input name="giaban"
								type="text" class="textbox" id="giaban"
								value="<%=rsloadsachvachitiet.getInt(5)%>" />
						</label><font color="red">VNĐ</font></td>
					</tr>
					<tr>
						<td height="30" bgcolor="#CCFFCC" class="thongtin"><div
								align="right">
								<strong>Giảm Giá:</strong>
							</div></td>
						<td bgcolor="#66CC99"><label> <select name="giamgia">
									<%
										int giamgia = rsloadsachvachitiet.getInt(6);
									%>
									<option value="<%=giamgia%>"><%=giamgia%></option>
									<%
										int i;
												for (i = 0; i < 100; i++) {
									%>
									<option><%=i%></option>
									<%
										}
									%>
							</select>
						</label><font color="red">%</font></td>
					</tr>
					<tr>
						<td height="15" bgcolor="#CCFFCC" class="thongtin"><div
								align="right">
								<strong>Số Lượng:</strong>
							</div></td>
						<td bgcolor="#66CC99"><label> <input name="soluong"
								type="text" class="textbox" id="soluong"
								value="<%=rsloadsachvachitiet.getInt(7)%>" />
						</label><font color="red"> cuốn</font></td>
					</tr>
					<tr>
						<td height="30" bgcolor="#CCFFCC" class="thongtin"><div
								align="right">
								<strong>Tên Nhà Xuất Bản:</strong>
							</div></td>
						<td bgcolor="#66CC99"><label> <select name="tennxb">
						<option value="<%=rsloadsachvachitiet.getString(8)%>"><%=rsloadsachvachitiet.getString(8)%></option>
									<%
										try {
													String tennxb = "SELECT tenNhaXuatBan FROM nhaxuatban";
													PreparedStatement pstennxb = ConnectionDB.conn()
															.prepareStatement(tennxb);
													ResultSet rstennxb = pstennxb.executeQuery();
													while (rstennxb.next()) {
														String tennhaxuatban = rstennxb.getString(1);
									%>
									<option value="<%=tennhaxuatban%>"><%=tennhaxuatban%></option>
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
						<td height="30" bgcolor="#CCFFCC" class="thongtin"><div
								align="right">
								<strong>Tên Thể Loại:</strong>
							</div></td>
						<td bgcolor="#66CC99"><label> <select name="tentl">
						<option value="<%=rsloadsachvachitiet.getString(9)%>"><%=rsloadsachvachitiet.getString(9)%></option>
									<%
										try {
													String tenntl = "SELECT tenLoaiSach FROM loaisach";
													PreparedStatement pstentl = ConnectionDB.conn()
															.prepareStatement(tenntl);
													ResultSet rstentl = pstentl.executeQuery();
													while (rstentl.next()) {
														String tenloaisach = rstentl.getString(1);
									%>
									<option value="<%=tenloaisach%>"><%=tenloaisach%></option>
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
						<td height="30" bgcolor="#CCFFCC" class="thongtin"><div
								align="right">
								<strong>Tên Tác Giả:</strong>
							</div></td>
						<td bgcolor="#66CC99"><label> <select name="tentg">
						<option value="<%=rsloadsachvachitiet.getString(10)%>"><%=rsloadsachvachitiet.getString(10)%></option>
									<%
										try {
													String tentg = "SELECT tenTacGia FROM tacgia order by matacgia";
													PreparedStatement pstentg = ConnectionDB.conn()
															.prepareStatement(tentg);
													ResultSet rstentg = pstentg.executeQuery();
													while (rstentg.next()) {
														String tentacgia = rstentg.getString(1);
									%>
									<option value="<%=tentacgia%>"><%=tentacgia%></option>
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
						<td height="40" colspan="2" bgcolor="#33FF99"><div
								align="center" class="style1">SUA CHI TIẾT SÁCH</div></td>
					</tr>
					<%--
					<tr>
						<td height="30" bgcolor="#CCFFCC" class="thongtin"><div
								align="right">
								<strong>Hình:</strong>
							</div></td>
							<%
							String hinhsach = rsloadsachvachitiet.getString(12);
							String temp = hinhsach.substring(hinhsach.lastIndexOf("/"), hinhsach.length());
							%>
						<td bgcolor="#66CC99"><label> <input name="hinh"
								type="file" class="textbox" id="hinh"
								value="<%=temp%>" />
						</label></td>
					</tr>
					 --%>
					<tr>
						<td height="15" bgcolor="#CCFFCC" class="thongtin"><div
								align="right">
								<strong>Trọng Lượng:</strong>
							</div></td>
						<td bgcolor="#66CC99"><label> <input
								name="trongluong" type="text" class="textbox" id="trongluong"
								value="<%=rsloadsachvachitiet.getString(13)%>" />
						</label><font color="red">grams</font></td>
					</tr>
					<tr>
						<td height="15" bgcolor="#CCFFCC" class="thongtin"><div
								align="right">
								<strong>Kích Thước:</strong>
							</div></td>
						<td bgcolor="#66CC99"><label> <input name="kichthuoc"
								type="text" class="textbox" id="kichthuoc"
								value="<%=rsloadsachvachitiet.getString(14)%>" />
						</label><font color="red">inches</font></td>
					</tr>
					<tr>
						<td height="15" bgcolor="#CCFFCC" class="thongtin"><div
								align="right">
								<strong>Dịch Giả:</strong>
							</div></td>
							<%
							String dichgia = rsloadsachvachitiet.getString(15);
							if(dichgia == null){
								dichgia = "";
							}
							%>
						<td bgcolor="#66CC99"><label> <input name="dichgia"
								type="text" class="textbox" id="dichgia"
								value="<%=dichgia%>" />
						</label></td>
					</tr>
					<tr>
						<td height="15" bgcolor="#CCFFCC" class="thongtin"><div
								align="right">
								<strong>Số Trang:</strong>
							</div></td>
						<td bgcolor="#66CC99"><label> <input name="sotrang"
								type="text" class="textbox" id="sotrang"
								value="<%=rsloadsachvachitiet.getInt(16)%>" />
						</label><font color="red"> trang</font></td>
					</tr>
					<tr>
						<td height="30" bgcolor="#CCFFCC" class="thongtin"><div
								align="right">
								<strong>Ngày Xuất Bản: </strong>
							</div></td>
						<td bgcolor="#66CC99"><label> <select name="ngay">

									<%!int i;%><option><%=ngay%></option>
									<%
										for (i = 1; i <= 31; i++) {
									%><option><%=i%></option>
									<%
										}
									%>
							</select> / <select name="thang">
									<option><%=thang%></option>
									<%
										for (i = 1; i <= 12; i++) {
									%>
									<option><%=i%></option>
									<%
										}
									%>

							</select> / <select name="nam">
									<option><%=nam%></option>
									<%
										for (i = 1931; i <= 2014; i++) {
									%>
									<option><%=i%></option>
									<%
										}
									%>

							</select>
						</label></td>
					</tr>
					<tr>
						<td height="30" bgcolor="#CCFFCC" class="thongtin"><div
								align="right">
								<strong>Ten Thành Viên: </strong>
							</div></td>
						<td bgcolor="#66CC99"><label> <select name="tentv">
									<%
										try {
													String tentv = "SELECT thanhvien.tendangnhap FROM taikhoan ,thanhvien	WHERE 1=1 AND taikhoan.id = thanhvien.taikhoanID AND taikhoan.`groups` = ?;";
													PreparedStatement pstentv = ConnectionDB.conn()
															.prepareStatement(tentv);
													pstentv.setInt(1, 1);
													ResultSet rstentv = pstentv.executeQuery();
													while (rstentv.next()) {
														String tenthanhvien = rstentv.getString(1);
									%>
									<option value="<%=tenthanhvien%>"><%=tenthanhvien%></option>
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
								<input type="submit" name="sua" id="sua" value="Sửa" /> <input
									type="reset" name="lamlai" id="lamlai" value="Làm Lại" />
							</div>
						</td>
					</tr>
				</table>
			</form>
			<%
				}
			%>
			<%--Ket thuc form thêm sách--%>
			<%@include file="DanhSachEditSach.jsp"%>
			<%@include file="DanhSachChiTietEditSach.jsp"%>
			<br />

			<table align="center" cellspacing="20">
				<tr>
					<td><a href="<%=tenproject%>/admin/Addsach.jsp"><img
							src="../images_admin/add.png" /></a></td>
					<td><a href="<%=tenproject%>/admin/Deletesach.jsp"> <img
							src="../images_admin/delete.png" /></a></td>
				</tr>
			</table>

			<div class="clear"></div>
		</div>
		<!--end of center content-->
		<%@include file="Footer.jsp"%>
		<%
			} else {
				response.sendRedirect("../DangNhap.jsp");
			}
		%>
	</div>
</body>
</html>