<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="connection.ConnectionDB"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
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
<title>load sach theo loai sach</title>
<link rel="stylesheet" type="text/css" href="TrangChu.css" />
</head>
<body>
	<%@include file="Script.jsp"%>
	<%@include file="Header.jsp"%>
	<%@include file="After_header.jsp"%>
	<div id="content">
		<div id="main_content">
			<div id="content_left">
				<div id="centent_left_center">
					<%--show sách ra theo MaLS đã gán ở lớp LoadLoaiSachTheoDanhMucSach--%>
					<%
						String maloaisach = request.getParameter("MaLS");
						String madanhmuc = request.getParameter("MaDM");
						String matacgia = request.getParameter("MaTG");
						String masach = request.getParameter("MaS");
						String sqlTLS = "SELECT tenLoaiSach FROM loaisach WHERE maLoaiSach="
								+ maloaisach;
						String sqlLS = "SELECT loaisach.maLoaiSach,sach.id,sach.tenSach,chitietsach.hinhsach,tacgia.tentacgia,sach.loaibia,sach.gia,sach.giaban,sach.giamgia FROM loaisach ,sach ,tacgia ,chitietsach WHERE loaisach.maLoaiSach = sach.loaisachID AND sach.tacgiaID = tacgia.matacgia AND sach.id = chitietsach.sachID AND loaisach.maLoaiSach ="
								+ maloaisach;
						String sqlTG = "SELECT tacgia.matacgia,tacgia.tentacgia,sach.loaisachID,sach.id FROM tacgia,sach WHERE sach.tacgiaID = tacgia.matacgia AND sach.loaisachID = "
								+ maloaisach;
						String sqlTGS = "SELECT tacgia.matacgia,sach.id,sach.tenSach,chitietsach.hinhsach,tacgia.tentacgia,sach.loaibia,sach.gia, sach.giaban, sach.giamgia FROM sach ,tacgia ,chitietsach WHERE sach.id = chitietsach.sachID AND sach.tacgiaID = tacgia.matacgia AND tacgia.matacgia = "
								+ matacgia;
						String tenloaisach = null;
					%>
					<fieldset id="fieldset_danhmuc">
						<legend>
							<font size="3" color="#00FF00">Thể Loại</font>
						</legend>
						<%
							if (madanhmuc != null | madanhmuc != "") {
								try {
									String sqlDM = "SELECT * FROM loaisach WHERE danhmucsachID="
											+ madanhmuc;
									PreparedStatement pssqlDM = ConnectionDB.conn()
											.prepareStatement(sqlDM);
									ResultSet rssqlDM = pssqlDM.executeQuery();
									while (rssqlDM.next()) {
						%>
						<div id=" menu_loaisach">
							<a
								href="LoadSachTheoLoaiSach.jsp?MaLS=<%=rssqlDM.getInt(1)%>&MaDM=<%=madanhmuc%>"><%=rssqlDM.getString(3)%></a>
							<hr />
						</div>
						<%
							}
								} catch (SQLException e) {
									e.printStackTrace();
								}
							}
						%>
					</fieldset>
				</div>
				<%--phần liệt kê tác giả theo từng loại sách --%>
				<div id="centent_left_center">
					<fieldset id="fieldset_tacgia">
						<legend>
							<font size="3" color="#00FF00">TÁC GIẢ</font>
						</legend>
						<div id="menu_tacgia">
							<%
								try {
									PreparedStatement pssqlTG = ConnectionDB.conn()
											.prepareStatement(sqlTG);
									ResultSet rssqlTG = pssqlTG.executeQuery();
									while (rssqlTG.next()) {
							%>
							<a
								href="LoadSachTheoLoaiSach.jsp?MaTG=<%=rssqlTG.getInt(1)%>&MaS=<%=rssqlTG.getInt(4)%>&MaLS=<%=maloaisach%>&MaDM=<%=madanhmuc%>">-<%=rssqlTG.getString(2)%></a>
							<hr />
							<%
								}
								} catch (SQLException e) {
									e.printStackTrace();
								}
							%>
						</div>
					</fieldset>
					<jsp:include page="SachChenChoTrong.jsp"></jsp:include>
				</div>
			</div>

			<div id="content_right">
				<%@include file="Right.jsp"%>
				<%@include file="QuangCao_Right.jsp"%>
				<%@include file="QuangCao.jsp"%>
			</div>

			<%-- phần show sách ra --%>
			<div id="content_center">
				<%-- show sách theo tác giả --%>
				<div id="sachmoi">
					<%-- tên tác gia --%>
					<%
						String tentacgia = null;
						try {
							PreparedStatement pssqlTGS = ConnectionDB.conn()
									.prepareStatement(sqlTGS);
							ResultSet rssqlTGS = pssqlTGS.executeQuery();
							while (rssqlTGS.next()) {
								tentacgia = rssqlTGS.getString(5);
								if (tentacgia != null) {
					%>
					<div id="sachmoi_title">
						<a>Tác Giả: <%=rssqlTGS.getString(5)%></a><img
							src="images_content/tim.gif" />
					</div>
					<%
						}
							}
						} catch (SQLException e) {
							e.printStackTrace();
						}
					%>
					<%-- kết thúc phần tên tac gia --%>
					<%-- show sách và đặt MaSach theo tac gia --%>
					<div id="images_sachmoi">
						<table>
							<%
								if (matacgia != null | matacgia != "") {
									try {
										PreparedStatement pstgs = ConnectionDB.conn()
												.prepareStatement(sqlTGS);
										ResultSet rstgs = pstgs.executeQuery();
										while (rstgs.next()) {
											int gg = rstgs.getInt(9);
							%>
							<tr>
								<td width="249" height="227"><a
									href="ChiTietSach.jsp?MaSach=<%=rstgs.getInt(2)%>"><img
										src="<%=rstgs.getString(4)%>" width="145" height="209" /></a></td>
								<td width="288"><b><a
										href="ChiTietSach.jsp?MaSach=<%=rstgs.getInt(2)%>"><%=rstgs.getString(3)%></a></b>
									<p>
										Tác Giả:
										<%=rstgs.getString(5)%></p>
									<p>
										Loại Bìa:
										<%=rstgs.getString(6)%></p>
									<div class="gia">
										<a>Giá bìa: <%=rstgs.getInt(7)%> ₫
										</a>
									</div> <%
 	if (gg > 0) {
 %>
									<div class="giagoc">
										<a>Giá gốc : <%=rstgs.getInt(8)%> ₫
										</a>
									</div> <%
 	}
 %>
									<div class="giamgia">
										<a>-<%=rstgs.getInt(9)%>%
										</a> <br></br> <a
											href="AddSachVaoGioHang?MaSach=<%=rstgs.getInt(2)%>"
											class="chonmua" title="Thêm vào giỏ hàng">Chọn mua </a>
									</div></td>
							</tr>
							<tr>
								<td><br></td>
							</tr>
							<%
								}
									} catch (SQLException e) {
										e.printStackTrace();
									} catch (ClassCastException e) {
										e.printStackTrace();
									}
								}
							%>
						</table>
					</div>
				</div>
				<%-- kết thúc show sách theo tac gia --%>
				<%--show sách theo loại sách --%>
				<div id="sachmoi">
					<%-- tên loại sách --%>
					<%
						try {

							PreparedStatement pssqlTLS = ConnectionDB.conn()
									.prepareStatement(sqlTLS);
							ResultSet rssqltls = pssqlTLS.executeQuery();
							while (rssqltls.next()) {
					%>
					<div id="sachmoi_title">
						<a>Thể Loại: <%=rssqltls.getString(1)%></a><img
							src="images_content/tim.gif" />
					</div>
					<%
						}
						} catch (SQLException e) {
							e.printStackTrace();
						}
					%>
					<%-- kết thúc phần tên loại sách --%>

					<%-- show sách và đặt MaSach theo từng loại sách --%>
					<div id="images_sachmoi">
						<table>
							<%
								if (maloaisach != null | maloaisach != "") {
									try {
										PreparedStatement psTLS = ConnectionDB.conn()
												.prepareStatement(sqlLS);
										ResultSet rstls = psTLS.executeQuery();
										while (rstls.next()) {
											int gg = rstls.getInt(9);
							%>
							<tr>
								<td width="249" height="227"><a
									href="ChiTietSach.jsp?MaSach=<%=rstls.getInt(2)%>"><img
										src="<%=rstls.getString(4)%>" width="145" height="209" /></a></td>
								<td width="288"><b><a
										href="ChiTietSach.jsp?MaSach=<%=rstls.getInt(2)%>"><%=rstls.getString(3)%></a></b>
									<p>
										Tác Giả:
										<%=rstls.getString(5)%></p>
									<p>
										Loại Bìa:
										<%=rstls.getString(6)%></p>
									<div class="gia">
										<a>Giá bìa: <%=rstls.getInt(7)%> ₫
										</a>
									</div> <%
 	if (gg > 0) {
 %>
									<div class="giagoc">
										<a>Giá gốc : <%=rstls.getInt(8)%> ₫
										</a>
									</div> <%
 	}
 %>
									<div class="giamgia">
										<a>-<%=rstls.getInt(9)%>%
										</a> <br></br> <a
											href="AddSachVaoGioHang?MaSach=<%=rstls.getInt(2)%>"
											class="chonmua" title="Thêm vào giỏ hàng">Chọn mua </a>
									</div></td>
							</tr>
							<tr>
								<td><br></td>
								<td><i>------------------------------------------------------------------------</i></td>
							</tr>
							<%
								}
									} catch (SQLException e) {
										e.printStackTrace();
									} catch (ClassCastException e) {
										e.printStackTrace();
									}
								}
							%>
						</table>
					</div>
				</div>
				<%-- kết thúc show sách theo loai sach--%>
				<%--  phần xem thêm.....
				<div id="xemthem">
					<a href="#">xem thêm &raquo;</a>
				</div>
				--%>

			</div>
		</div>
		<%@include file="Footer.jsp"%>
	</div>
</body>
</html>