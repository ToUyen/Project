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
<title>right-giohang</title>
<link rel="stylesheet" type="text/css" href="TrangChu.css" />
</head>
<body>
	<div id="content_right_top">
		<%
			String tendd = (String) session.getAttribute("tendaydu");
		%>
		<%
			if (tendd != null) {
				System.out.println(tendd);
		%>
		<%@include file="DangNhapThanhCong.jsp" %>
		<hr />
		<%
			}
		%>
		<div id="title">
			<a href="GioHang.jsp">Giỏ Hàng</a>
		</div>
		<div id="images"></div>
	</div>
	<hr />

</body>
</html>