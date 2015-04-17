<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
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
<title>Menu AdminPage</title>
<%
	String tenproject = request.getContextPath();
%>
<link rel="stylesheet" type="text/css" href="<%=tenproject%>/style.css" />
</head>
<body>
	<div class="header">
		<div class="logo">
			<a href="<%=tenproject%>/TrangChu.jsp"><img
				src="<%=tenproject%>/images_admin/logo.gif" alt="" title=""
				border="0" /></a>
		</div>
		<div id="menu">
			<ul>
				<li class="selected"><a href="<%=tenproject%>/TrangChu.jsp">Trang
						Chủ</a></li>
				<li><a href="<%=tenproject%>/admin/User.jsp">QL User</a></li>
				<li><a href="<%=tenproject%>/admin/TacGia.jsp">QL Tác Giả</a></li>
				<li><a href="<%=tenproject%>/admin/NXB.jsp">QL NXB</a></li>
				<li><a href="<%=tenproject%>/admin/TheLoai.jsp">QL Thể Loại</a></li>
				<li><a href="<%=tenproject%>/admin/DanhMuc.jsp">QL Danh Mục</a></li>
				<li><a href="<%=tenproject%>/admin/Sach.jsp">QL Sách</a></li>
				<li><a href="<%=tenproject%>/admin/ChiTietSach.jsp?masach=1">Xem
						Chi Tiết Sach</a></li>
				<li><a href="<%=tenproject%>/admin/DonDH.jsp">QL Đơn ĐH</a></li>
			</ul>
		</div>
	</div>
</body>
</html>