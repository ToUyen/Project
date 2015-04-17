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
<style type="text/css">
<!--
#sachmoi {
	background-color: #CCC;
	width: 100;
	height: auto;
}

#images_search   img {
	float: left;
	margin-right: 20px;
	margin-left: 10px;
	padding-top: 10px;
}

#images_search b a {
	text-decoration: none;
	color: #306;
	font-size: 18px;
}

#images_search b a:hover {
	color: #F00;
	text-decoration: underline;
}

#images_sachmoi p {
	color: #396;
}

.gia a {
	color: #F00;
	font-size: 16px;
}

.giagoc a {
	text-decoration: line-through;
}

.giamgia a {
	color: #CF0;
	text-align: center;
}

.giamgia .chonmua {
	-moz-box-shadow: inset 0px 0px 0px 0px #ffffff;
	-webkit-box-shadow: inset 0px 0px 0px 0px #ffffff;
	box-shadow: inset 0px 0px 0px 0px #ffffff;
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0.05, #ededed
		), color-stop(1, #dfdfdf));
	background: -moz-linear-gradient(center top, #ededed 5%, #dfdfdf 100%);
	filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#ededed',
		endColorstr='#dfdfdf');
	background-color: red;
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
}

.chonmua:hover {
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0.05, #dfdfdf
		), color-stop(1, #ededed));
	background: -moz-linear-gradient(center top, #dfdfdf 5%, #ededed 100%);
	filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#dfdfdf',
		endColorstr='#ededed');
	background-color: #dfdfdf;
	color: blue;
}

.chonmua:active {
	position: relative;
	top: 1px;
}

.giamgia {
	text-align: center;
	width: 50px;
	height: 20px;
	background-image: url(image_header/header_title.jpg);
	background-repeat: no-repeat;
	-webkit-border-radius: 10px;
	-moz-border-radius: 10px;
	border-radius: 5px;
}
-->
</style>
</head>
<body>
	<script src="ajax/ajax.js"></script>
	<%@include file="Script.jsp"%>
	<%@include file="Header.jsp"%>
	<%@include file="After_header.jsp"%>
	<div id="content">
		<div id="main_content">
			<div id="sachmoi">
				<div id="images_search">
					<table>
						<tr>
							<%
								String search = request.getParameter("search");
								if (search == null) {
									search = "";
								}
								try {
									String searchsach = "SELECT sach.id,sach.tenSach,chitietsach.hinhsach,tacgia.tentacgia,sach.loaibia,sach.gia,sach.giaban,sach.giamgia FROM sach ,tacgia ,chitietsach WHERE sach.id = chitietsach.sachID AND tacgia.matacgia = sach.tacgiaID AND sach.tenSach like '"
											+ search + "%';";
									PreparedStatement pstmtsearch = ConnectionDB.conn()
											.prepareStatement(searchsach);
									ResultSet rssachmoi = pstmtsearch.executeQuery();
									int count = 0;
									while (rssachmoi.next()) {
										count++;
							%>
							<td width="249" height="227"><a
								href="ChiTietSach.jsp?MaSach=<%=rssachmoi.getInt(1)%>"><img
									src="<%=rssachmoi.getString(3)%>" width="145" height="209" /></a></td>
							<td width="288"><b><a
									href="ChiTietSach.jsp?MaSach=<%=rssachmoi.getInt(1)%>"><%=rssachmoi.getString(2)%></a></b>
								<p>
									Tác Giả:
									<%=rssachmoi.getString(4)%></p>
								<p>
									Loại Bìa:
									<%=rssachmoi.getString(5)%></p>
								<div class="gia">
									<a>giá đang bán: <%=rssachmoi.getInt(6)%> ₫
									</a>
								</div>
								<div class="giagoc">
									<a>giá cũ : <%=rssachmoi.getInt(7)%> ₫
									</a>
								</div>
								<div class="giamgia">
									<a>-<%=rssachmoi.getInt(8)%>%
									</a> <br></br> <a
										href="AddSachVaoGioHang?MaSach=<%=rssachmoi.getInt(1)%>"
										class="chonmua" title="Thêm vào giỏ hàng">Chọn mua </a>
								</div></td>
							<%
								if (count % 2 == 0) {
							%>
						</tr>
						<%
							}
								}
							} catch (SQLException e) {
								e.printStackTrace();
							}
						%>
					</table>
					<br>
					<br>
				</div>
			</div>
		</div>
		<%@include file="Footer.jsp"%>
	</div>
</body>
</html>