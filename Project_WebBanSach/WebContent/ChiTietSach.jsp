<%@page import="java.util.Locale"%>
<%@page import="java.text.NumberFormat"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="connection.ConnectionDB"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%
	request.setCharacterEncoding("utf-8");
	response.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="TrangChu.css" />
</head>
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

#thongtin {
	padding-right: 10px;
	
}
.like{
clear: left;
	float: right;
	margin-right: 10px;
	color: red;
	-moz-box-shadow: inset 0px 0px 0px 0px #ffffff;
	-webkit-box-shadow: inset 0px 0px 0px 0px #ffffff;
	box-shadow: inset 0px 0px 0px 0px #ffffff;
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0.05, #ededed
		), color-stop(1, #dfdfdf));
	background: -moz-linear-gradient(center top, #ededed 5%, #dfdfdf 100%);
	filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#ededed',
		endColorstr='#dfdfdf');
	background-color: #ededed;
	-webkit-border-top-left-radius: 31px;
	-moz-border-radius-topleft: 31px;
	border-top-left-radius: 31px;
	-webkit-border-top-right-radius: 31px;
	-moz-border-radius-topright: 31px;
	border-top-right-radius: 31px;
	-webkit-border-bottom-right-radius: 31px;
	-moz-border-radius-bottomright: 31px;
	border-bottom-right-radius: 31px;
	-webkit-border-bottom-left-radius: 31px;
	-moz-border-radius-bottomleft: 31px;
	border-bottom-left-radius: 31px;
	text-indent: 0px;
	display: inline-block;
	color: #423d42;
	font-family: Trebuchet MS;
	font-size: 13px;
	font-weight: normal;
	font-style: normal;
	height: 22px;
	line-height: 22px;
	width: 86px;
	text-decoration: none;
	text-align: center;
	text-shadow: 0px 0px 0px #ffffff;
	-moz-box-shadow: inset 0px 0px 0px 0px #ffffff;
	-moz-box-shadow: inset 0px 0px 0px 0px #ffffff;
}
.chonmua {
	clear: left;
	float: right;
	margin-right: 100px;
	color: red;
	-moz-box-shadow: inset 0px 0px 0px 0px #ffffff;
	-webkit-box-shadow: inset 0px 0px 0px 0px #ffffff;
	box-shadow: inset 0px 0px 0px 0px #ffffff;
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0.05, #ededed
		), color-stop(1, #dfdfdf));
	background: -moz-linear-gradient(center top, #ededed 5%, #dfdfdf 100%);
	filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#ededed',
		endColorstr='#dfdfdf');
	background-color: #ededed;
	-webkit-border-top-left-radius: 31px;
	-moz-border-radius-topleft: 31px;
	border-top-left-radius: 31px;
	-webkit-border-top-right-radius: 31px;
	-moz-border-radius-topright: 31px;
	border-top-right-radius: 31px;
	-webkit-border-bottom-right-radius: 31px;
	-moz-border-radius-bottomright: 31px;
	border-bottom-right-radius: 31px;
	-webkit-border-bottom-left-radius: 31px;
	-moz-border-radius-bottomleft: 31px;
	border-bottom-left-radius: 31px;
	text-indent: 0px;
	display: inline-block;
	color: #423d42;
	font-family: Trebuchet MS;
	font-size: 13px;
	font-weight: normal;
	font-style: normal;
	height: 22px;
	line-height: 22px;
	width: 86px;
	text-decoration: none;
	text-align: center;
	text-shadow: 0px 0px 0px #ffffff;
	-moz-box-shadow: inset 0px 0px 0px 0px #ffffff;
	-moz-box-shadow: inset 0px 0px 0px 0px #ffffff;
}
-->
</style>
<body>
	<%@include file="Script.jsp"%>
	<%@include file="Header.jsp"%>
	<%@include file="After_header.jsp"%>
	<div id="content">
		<div id="main_content">
			<div id="thongtin">
				<%
					String masach = request.getParameter("MaSach");
					if (masach == null) {
						masach = "1";
					}
				%>
				<form id="form1" name="form1" method="post" action="">
					<br /> <br />
					<table align="center">
						<tr>
							<td><strong><font size="6" color="#3399CC">THÔNG
										TIN SÁCH</font></strong></td>
						</tr>
					</table>
					<br /> <br />
					<table align="center" border="1" border-style="solid"
						bordercolor="#3399CC" cellpadding="0" cellspacing="0"
						width="850px">
						<tr height="40">
							<th>Tên Sách</th>
							<th>Loại Bìa</th>
							<th>Giá Bìa</th>
							<th>Giá Bán</th>
							<th>Giảm Giá</th>
							<th>Tên Thể Loại</th>
							<th>Tên Tác Giả</th>
							<th>Tên Nhà Xuất Bản</th>
							<th>Số Lần Bình Chọn</th>
						</tr>
						<%
							try {
								NumberFormat nf = NumberFormat.getInstance(Locale.ENGLISH);
								String sqlloadsach = "SELECT sach.tenSach,sach.loaibia,sach.gia,sach.giaban,sach.giamgia,loaisach.tenLoaiSach,tacgia.tentacgia,nhaxuatban.tenNhaXuatBan,sach.luotbinhchon FROM sach ,loaisach ,tacgia ,nhaxuatban	WHERE sach.loaisachID = loaisach.maLoaiSach AND sach.tacgiaID = tacgia.matacgia AND  sach.nhaxbID = nhaxuatban.maNhaXuatBan AND sach.id = ?";
								PreparedStatement pssqlloadsach = ConnectionDB.conn()
										.prepareStatement(sqlloadsach);
								pssqlloadsach.setInt(1, Integer.parseInt(masach));
								ResultSet rssqlloadsach = pssqlloadsach.executeQuery();
								while (rssqlloadsach.next()) {
									double gbia = Double.parseDouble(rssqlloadsach.getInt(3)
											+ "");
									double gban = Double.parseDouble(rssqlloadsach.getInt(4)
											+ "");
						%>
						<tr>
							<td align='center' width='100'><%=rssqlloadsach.getString(1)%></td>
							<td align='center' width='70'><%=rssqlloadsach.getString(2)%></td>
							<td align='center' width='70'><%=nf.format(gbia)%></td>
							<td align='center' width='70'><%=nf.format(gban)%></td>
							<td align='center' width='70'><%=rssqlloadsach.getInt(5)%></td>
							<td align='center' width='70'><%=rssqlloadsach.getString(6)%></td>
							<td align='center' width='70'><%=rssqlloadsach.getString(7)%></td>
							<td align='center' width='70'><%=rssqlloadsach.getString(8)%></td>
							<td align='center' width='70'><%=rssqlloadsach.getInt(9)%></td>
							<%
								}
								} catch (SQLException e) {
									e.printStackTrace();
								}
							%>
						
					</table>
					<br />
					<table align="center">
						<tr>
							<td><strong><font size="6" color="#3399CC">CHI
										TIẾT SÁCH</font></strong></td>
						</tr>
					</table>
					<br /> <br />
					<table align="center" border="1" border-style="solid"
						bordercolor="#3399CC" cellpadding="0" cellspacing="0"
						width="850px">
						<tr height="40">
							<th>Hình Sách</th>
							<th>Trọng Lượng</th>
							<th>Khích Thước</th>
							<th>Dịch Giả</th>
							<th>Số Trang</th>
							<th>Ngày Xuất Bản</th>
						</tr>
						<%
							try {
								String loadchitietsachtheoms = "SELECT chitietsach.hinhsach,chitietsach.trongluong,chitietsach.kichthuoc,chitietsach.dichgia,chitietsach.sotrang,chitietsach.ngayxuatban FROM chitietsach inner join sach on sach.id = chitietsach.sachID  WHERE sach.id = ?";
								PreparedStatement psloadchitietsach = ConnectionDB.conn()
										.prepareStatement(loadchitietsachtheoms);
								psloadchitietsach.setInt(1, Integer.parseInt(masach));
								ResultSet rscts = psloadchitietsach.executeQuery();
								while (rscts.next()) {
									String tem = rscts.getString(5);
									if (tem == null) {
										tem = "";
									}
									String dichgia = rscts.getString(4);
									if (dichgia == null) {
										dichgia = "";
									}
						%>
						<tr>
							<td align='center' width='120'><img alt=""
								src="<%=rscts.getString(1)%>"></td>
							<td align='center' width='70'><%=rscts.getString(2)%></td>
							<td align='center' width='70'><%=rscts.getShort(3)%></td>
							<td align='center' width='70'><%=dichgia%></td>
							<td align='center' width='70'><%=rscts.getInt(5)%></td>
							<td align='center' width='70'><%=rscts.getDate(6)%></td>
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
					<br /><a href="AddSachVaoGioHang?MaSach=<%=masach%>"
						class="chonmua" title="Thêm vào giỏ hàng">Chọn mua </a>
						<a href=""
						class="like" title="Like"><font color="red">Like Sách</font> </a>
						 <br /> <br />
				</form>
			</div>
			<div id="fb-root"></div>
			<script>
				(function(d, s, id) {
					var js, fjs = d.getElementsByTagName(s)[0];
					if (d.getElementById(id))
						return;
					js = d.createElement(s);
					js.id = id;
					js.src = "//connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v2.0";
					fjs.parentNode.insertBefore(js, fjs);
				}(document, 'script', 'facebook-jssdk'));
			</script>
			<div class="fb-like"
				data-href="https://www.facebook.com/websachonline" data-width="500"
				data-layout="standard" data-action="like" data-show-faces="true"
				data-share="true"></div>
			<div id="fb-root"></div>
			<script>
				(function(d, s, id) {
					var js, fjs = d.getElementsByTagName(s)[0];
					if (d.getElementById(id))
						return;
					js = d.createElement(s);
					js.id = id;
					js.src = "//connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v2.0";
					fjs.parentNode.insertBefore(js, fjs);
				}(document, 'script', 'facebook-jssdk'));
			</script>
			<div class="fb-comments"
				data-href="https://www.facebook.com/websachonline" data-width="900"
				data-numposts="10" data-colorscheme="light"></div>
		</div>
		<%@include file="Footer.jsp"%>
	</div>
</body>
</html>