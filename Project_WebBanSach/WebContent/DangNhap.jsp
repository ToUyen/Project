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
<link rel="stylesheet" type="text/css" href="TrangChu.css" />
<title>Web-Chia-Se-Sach</title>
</head>
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
				<div id="dangnhap">
					<a>Đăng Nhập</a><img src="images_content/tim.gif" />
				</div>
				<%
					String err_dn = (String) session.getAttribute("err_dn");
					String err = (String) request.getAttribute("err");
					if (err == null | err == "") {
						if (err_dn == null) {
							err_dn = "Bạn phải đăng nhập mới mua hàng được.";
						}
					} else {
						if (err_dn == null) {
							err_dn = "";
						}
					}
				%>
				<div id="dangnhap_title">
					<p>
						* Để đăng nhập, bạn phải khai báo đầy đủ các ô trống dưới đây. Hệ
						thống sẽ kiểm tra tính hợp lệ của dữ liệu khai báo . <a><font
							color="red">${requestScope['err']}<%=err_dn%></font></a>
					</p>
				</div>
				<form action="Login" method="post">
					<table class="table1">
						<tr>
							<td><a>Username :</a></td>
							<td><input type="text" name="username"
								value="${cookie['username'].value}" /><font color="red">
									*${requestScope.err_user}</font></td>
						</tr>
						<tr>
							<td><a>Password :</a></td>
							<td><input type="password" name="password"
								value="${cookie['password'].value}" /><font color="red">
									*${requestScope.err_pass}</font></td>
						</tr>
					</table>
					<table class="table2">
						<tr>
							<td><b><input type="checkbox" name="ghinhomk" /></b></td>
							<td><p>ghi nhớ tên truy cập và mật khẩu ?</p></td>
						</tr>
						<tr>
							<td><b><input type="submit" value="Đăng Nhập" /></b></td>
							<td><input type="reset" name="huybo" value="Hủy Bỏ" /></td>
						</tr>
					</table>
				</form>
				<div class="quenmatkhau">
					<a href="DoiMatKhau.jsp">quên mật khẩu ?</a><br></br>
				</div>
				<hr />
				<%@include file="GioiThieu.jsp"%>
			</div>
		</div>
		<%@include file="Footer.jsp"%>
	</div>
	<%--Quảng cáo trượt 2 bên --%>
</body>
</html>