
<%@page import="servlet.XuLyDangKyTK"%>
<%@page import="servlet.XuLyDangNhap"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
	request.setCharacterEncoding("utf8");
	response.setCharacterEncoding("utf8");
%>
<%
String loi = "";
if(request.getAttribute("loi") != null){
	loi = (String) request.getAttribute("loi");
}

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Thành công</title>
<link rel="stylesheet" type="text/css" href="css/styles.css" />
<link rel="stylesheet" type="text/css" href="css/meny.css" />
<link rel="stylesheet" type="text/css" href="css/iconFont.css" />
<link rel="stylesheet" type="text/css"
	href="css/metro-bootstrap-responsive.css" />
<link rel="stylesheet" type="text/css" href="css/metro-bootstrap.css" />
<!--js metro-->
<script type="text/javascript" src="js/metro/jquery.min.js"></script>
<script type="text/javascript" src="js/metro/jquery.mousewheel.js"></script>
<script type="text/javascript" src="js/metro/jquery.widget.min.js"></script>
<script type="text/javascript" src="js/metro/metro.min.js"></script>

<script type="text/javascript" src="js/check.js"></script>

</head>

<body>

	<div class="meny">
		<h2 class="h2">Shop Trang Sức</h2>
		<ul>
			<li><a href="#">Home</a><img class="img" src="images/heart.jpg" /></li>
			<li><a href="#">Sản Phẩm</a></li>
			<li><a href="#">Tin Tức</a></li>
			<li><a href="#">Giỏ Hàng</a></li>
			<li><a href="#">Liên Hệ</a></li>
		</ul>
	</div>
	<div class="meny-arrow"></div>
	<div class="contents">
		<div class="center">
			<center>
				<form action="admin/TaiKhoan.jsp" method="post">
					<h1 align="center">ĐĂNG NHẬP THÀNH CÔNG</h1>
					<%= loi%>
					<br> Xin chào:
					<%=session.getAttribute("username")%><br>
					<br> <input type="submit" value="Chuyển trang">
				</form>
			</center>
		</div>
		<script src="js/meny.js"></script>
		<script>
			// Create an instance of Meny
			var meny = Meny.create({
				// The element that will be animated in from off screen
				menuElement : document.querySelector('.meny'),

				// The contents that gets pushed aside while Meny is active
				contentsElement : document.querySelector('.contents'),

				// [optional] The alignment of the menu (top/right/bottom/left)
				position : Meny.getQuery().p || 'left',

				// [optional] The height of the menu (when using top/bottom position)
				height : 200,

				// [optional] The width of the menu (when using left/right position)
				width : 260,

				// [optional] Distance from mouse (in pixels) when menu should open
				threshold : 40,

				// [optional] Use mouse movement to automatically open/close
				mouse : true,

				// [optional] Use touch swipe events to open/close
				touch : true
			});

			// API Methods:
			// meny.open();
			// meny.close();
			// meny.isOpen();

			// Events:
			// meny.addEventListener( 'open', function(){ console.log( 'open' ); } );
			// meny.addEventListener( 'close', function(){ console.log( 'close' ); } );

			// Embed an iframe if a URL is passed in
			if (Meny.getQuery().u && Meny.getQuery().u.match(/^http/gi)) {
				var contents = document.querySelector('.contents');
				contents.style.padding = '0px';
				contents.innerHTML = '<div class="cover"></div><iframe src="'
						+ Meny.getQuery().u
						+ '" style="width: 100%; height: 100%; border: 0; position: absolute;"></iframe>';
			}
		</script>
</body>
</html>