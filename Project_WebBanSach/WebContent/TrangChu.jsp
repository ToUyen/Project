
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
	request.setCharacterEncoding("utf-8");
	response.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Web-Bán-Sách</title>
<link rel="stylesheet" type="text/css" href="TrangChu.css" />
</head>
<body>
	<script src="ajax/ajax.js"></script>
	<%@include file="Script.jsp"%>
	<%@include file="Header.jsp"%>
	<%@include file="After_header.jsp"%>
	<div id="content">
		<div id="main_content">
			<div id="content_left">
				<%@include file="Left.jsp"%>
				<%@include file="Left_Sach.jsp"%>
			</div>
			<div id="content_right">
				<%@include file="Right.jsp"%>
				<%@include file="QuangCao_Right.jsp"%>
				<%@include file="QuangCao.jsp"%>
			</div>
			<div id="content_center">
				<%@include file="Logo.jsp"%>
				<hr />
				<%@include file="DanhMucNoiBat.jsp"%>
				<hr />
				<%@include file="SachMoi.jsp" %>
				<hr />
				<%@include file="SachGiamGia.jsp"%>
				<hr />
				<%@include file="GioiThieu.jsp"%>
			</div>
		</div>
		<%@include file="Footer.jsp"%>
	</div>
</body>
</html>
