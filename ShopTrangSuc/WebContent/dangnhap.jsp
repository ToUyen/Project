<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Đăng nhập</title>
<link rel="stylesheet" type="text/css" href="css/meny.css" />
<link rel="stylesheet" type="text/css" href="css/styles.css" />

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

<body class="metro">
	<div class="meny">
		<h2 class="h2">Shop Trang Sức</h2>
		<ul>
			<li><a href="#">Home</a><img class="img" src="images/heart.jpg" /></li>
			<li><a href="#">Sản Phẩm</a></li>
		</ul>
	</div>

	<div class="meny-arrow"></div>

	<div class="contents" onclick="checkTaiKhoan();">
		<div class="header">
			
			
		</div>
		<div class="center">
			<h2 class="title"  style="color: #FCFCFC;" >Đăng Nhập</h2>
			<p class="p">--------------------------------------------------</p>
			<p class="p" style="color: #FCFCFC;">Bạn phải điền đầy đủ các thông tin dưới đây</p>
			<div id="formDangNhap">

				<form action="XuLyDangNhap" method="post">
					<table class="table">
						<%
							request.setCharacterEncoding("utf8");
							response.setCharacterEncoding("utf8");
						%>
						<%
							String loi = "";
							if (session.getAttribute("loi") != null) {
								loi = (String) session.getAttribute("loi");
							}
// 							String ten = "";
// 							if (session.getAttribute("ten") != null) {
// 								ten = (String) session.getAttribute("ten");
// 							}
						%>
						<tr>
							<td><label class="title" style="color: #FCFCFC;">Tên đăng nhập</label></td>
							<td>
								<div class="input-control text">
									<input type="text" name="username" value="" placeholder="input text" /><font
										color="red"> *</font>
									<button class="btn-clear"></button>
								</div>
							</td>
						</tr>
						<tr>
							<td><label class="title" style="color: #FCFCFC;">Mật Khẩu</label></td>
							<td>
								<div class="input-control password">
									<input type="password" name="password" value=""
										placeholder="input password" /><font color="red"> *</font>
									<button class="btn-reveal"></button>
								</div>
							</td>
						</tr>
						<tr>
							<td colspan="3" align="center" style="color: red;"><%=loi%></td>
						</tr>
						<tr>
							<td colspan="3">
								<div class="input-control checkbox" style="margin-left: 275px;">
									<label style="color: #FCFCFC;"> <input type="checkbox" /> <span class="check"></span>
										Ghi nhớ mật khẩu.
									</label>
								</div>
							</td>
						</tr>
						<tr>
							<td colspan="3" style="text-align: center;">
								<button class="large">Đăng nhập</button> <font color="red"></font>
							</td>
						</tr>
					</table>

				</form>
			</div>
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