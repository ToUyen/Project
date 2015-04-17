<%@page import="entity.TaiKhoan"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Admin Page</title>
<link rel="stylesheet" type="text/css" href="../style.css" />
</head>
<body>
<%-- 	<% --%>
// 		String ten = (String) session.getAttribute("tendaydu");
// 		String nhom = (String) session.getAttribute("nhom");
// 		if (ten != null && nhom.equalsIgnoreCase("1")) {
<%-- 	%> --%>
	<%@include file="Script.jsp"%>
	<div id="wrap">
		<%@include file="Menu.jsp"%>
		<div class="center_content">
			<div class="left_content"></div>
			<!--end of left content-->

			<div class="right_content"></div>
			<!--end of right content-->

			<div class="clear"></div>
		</div>
		<!--end of center content-->
		<%@include file="Footer.jsp"%>
	</div>
<%-- 	<% --%>
// 		} else {
// 			response.sendRedirect("../DangNhap.jsp");
// 		}
<%-- 	%> --%>

</body>
</html>