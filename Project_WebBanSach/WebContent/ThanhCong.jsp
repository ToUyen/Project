<%@page import="java.sql.ResultSet"%>
<%@page import="connection.ConnectionDB"%>
<%@page import="java.sql.Statement"%>
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
	<jsp:include page="Script.jsp" />
	<jsp:include page="Header.jsp" />
	<jsp:include page="After_header.jsp" />
	<div id="content">
		<div id="main_content">
			<div id="content_left">
				<jsp:include page="Left.jsp" />
			</div>
			<div id="content_right">
				<jsp:include page="Right.jsp" />
				<jsp:include page="QuangCao.jsp" />
			</div>
			<div id="content_center">
				<div id="dangky">
					<a>Đăng Ký</a><img src="images_content/tim.gif" />
				</div>
				<div id="dangky_title">
					<%
						String name = request.getParameter("name");
						String email = request.getParameter("email");
					%>
					<b>- Chúc mừng bạn <%=name%> đã đăng ký thành công. Mọi thông
						tin chi tiết sẽ được hệ thống gửi về địa chỉ email: <%=email%> của
						bạn .
					</b><br /> <b>- nhấp vào <a href="DangNhap.jsp"><font size="2"
							color="red">đây</font></a> để được đăng nhập.
					</b>
				</div>
			</div>
			<jsp:include page="GioiThieu.jsp" />
		</div>
		<hr />
		<jsp:include page="Footer.jsp" />
	</div>
</body>
</html>