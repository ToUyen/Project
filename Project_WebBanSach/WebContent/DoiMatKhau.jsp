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
<link rel="stylesheet" type="text/css" href="TrangChu.css" />
</head>
<style type="text/css">
<!--
#doimk {
	height: 20px;
	padding-top: 10px;
	background-image: url(image_header/header_title.jpg);
	-webkit-border-radius: 10px;
	-moz-border-radius: 10px;
	border-radius: 10px;
	padding-bottom: 5px;
	margin-bottom: 2px;
	padding-left: 5px;
}

#doimk a {
	color: #CC6;
	padding-left: 10px;
	font-size: 16px;
}

#doimk_title {
	width: auto;
	height: auto;
	color: #63F;
	margin-top: -10px;
	padding-left: 15px;
	padding-right: 15px;
	color: #CCC;
	background-image: url(image_header/header_title.jpg);
	-webkit-border-radius: 10px;
	-moz-border-radius: 10px;
	border-radius: 5px;
}

#doimk img {
	float: right;
	margin-right: 10px;
}
-->
</style>
<body>
	<%@include file="Script.jsp"%>
	<%@include file="Header.jsp"%>
	<%@include file="After_header.jsp"%>
	<div id="content">
		<div id="main_content">
			<div id="content_left">
				<%@include file="Left.jsp"%>
			</div>
			<div id="content_right">
				<%@include file="QuangCao.jsp"%>
			</div>
			<div id="content_center">
				<div id="doimk">
					<a>Đổi thông tin tài khoản</a><img src="images_content/tim.gif" />
				</div>
				<%
					String tendn = (String) request.getAttribute("tendn");
					String matkhau = (String) request.getAttribute("matkhau");
					String matkhaumoi = (String) request.getAttribute("matkhaumoi");
					String tendn_err = (String) request.getAttribute("tendn_err");
					String matkhau_err = (String) request.getAttribute("matkhau_err");
					String matkhaumoi_err = (String) request
							.getAttribute("matkhaumoi_err");
					String doithangcong = (String) request.getAttribute("doithangcong");
					if (tendn == null)
						tendn = "";
					if (matkhau == null)
						matkhau = "";
					if (matkhaumoi == null)
						matkhaumoi = "";
					if (tendn_err == null)
						tendn_err = "";
					if (matkhau_err == null)
						matkhau_err = "";
					if (matkhaumoi_err == null)
						matkhaumoi_err = "";
					if (doithangcong == null)
						doithangcong = "";
				%>
				<div id="doimk_title">
					<%-- chưa biết cho gì vào đây --%>
					<%=doithangcong%>
				</div>
				<hr>
				<form action="DoiMatKhau" method="post">
					<table>
						<tr>
							<td colspan="2"><b>THÔNG TIN TÀI KHOẢN</b></td>
						</tr>
						<tr>
							<td>Tên tài khoản:</td>
							<td><input type="text" name="username" value="<%=tendn%>" /><font
								style="color: red;">*<%=tendn_err%></font></td>
						</tr>
						<tr>
							<td>Mật khẩu cũ:</td>
							<td><input type="password" name="password"
								value="<%=matkhau%>" /><font style="color: red;">*<%=matkhau_err%></font></td>
						</tr>
						<tr>
							<td>Mật khẩu mới:</td>
							<td><input type="password" name="passwordnew"
								value="<%=matkhaumoi%>" /><font style="color: red;">*<%=matkhaumoi_err%></font></td>
						</tr>
						<tr>
							<td colspan="2"><input type="submit" value="Hoàn Thành" />
								<input type="reset" value="Xóa form" /></td>
						</tr>
					</table>
				</form>
				<hr>
				<%@include file="GioiThieu.jsp"%>
			</div>
		</div>
		<%@include file="Footer.jsp"%>
	</div>
	<%--Quảng cáo trượt 2 bên --%>
</body>
</html>