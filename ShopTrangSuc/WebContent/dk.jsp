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
<title>Đăng ký</title>
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

	<div class="contents" onclick="checkTaiKhoan();">
		<div class="center">
			<h2 class="title" style="color: #FCFCFC;">Đăng Kí</h2>
			<p class="p">--------------------------------------------------</p>
			<p class="p" style="color: #FCFCFC;">Bạn phải điền đầy đủ các thông tin dưới đây</p>
			<div id="formDangKi">
				<%
					//username
					String username = "";
					if (session.getAttribute("username") != null) {
						username = (String) session.getAttribute("username");
					}
					String err_username = "";
					if (request.getAttribute("err_username") != null) {
						err_username = (String) request.getAttribute("err_username");
					}
					//password
					String password = "";
					if (request.getAttribute("password") != null) {
						password = (String) request.getAttribute("password");
					}
					String re_password = "";
					if (request.getAttribute("re_password") != null) {
						re_password = (String) request.getAttribute("re_password");
					}
					String err_password = "";
					if (request.getAttribute("err_password") != null) {
						err_password = (String) request.getAttribute("err_password");
					}
					String err_re_password = "";
					if (request.getAttribute("err_re_password") != null) {
						err_re_password = (String) request
								.getAttribute("err_re_password");
					}
					//name
					String name = "";
					if (session.getAttribute("name") != null) {
						name = (String) session.getAttribute("name");
					}
					String err_name = "";
					if (request.getAttribute("err_name") != null) {
						err_name = (String) request.getAttribute("err_name");
					}

					//sex
					String sex = "";
					if (request.getAttribute("sex") != null) {
						sex = (String) request.getAttribute("sex");
					}
					//ngày sinh
					String birthday = "";
					if (request.getAttribute("birthday") != null) {
						birthday = (String) request.getAttribute("birthday");
					}
					// avatar
					String avatar = "";
					if (request.getAttribute("avatar") != null) {
						avatar = (String) request.getAttribute("avatar");
					}
					//phone
					String phone = "";
					if (session.getAttribute("phone") != null) {
						phone = (String) session.getAttribute("phone");
					}
					String err_phone = "";
					if (request.getAttribute("err_phone") != null) {
						err_phone = (String) request.getAttribute("err_phone");
					}
					//email
					String email = "";
					if (session.getAttribute("email") != null) {
						email = (String) session.getAttribute("email");
					}
					String err_email = "";
					if (request.getAttribute("err_email") != null) {
						err_email = (String) request.getAttribute("err_email");
					}
				%>
				<form method="post" action="XuLyDangKyTK">
					<table width="100%" class="tbdangki" align="center">
						<tr>
							<td width="287" style="padding-left: 10px; font-size: 18px;"><label
								class="title" style="color: #FCFCFC;">Tên đăng nhập</label></td>
							<td width="445">
								<div class="input-control text">
									<input type="text" value="" placeholder="username"
										id="username" name="username"
										style="width: 65%; height: 32px;" <%=username%> /> <font
										style="color: red;">*<%=err_username%></font>
								</div>
							</td>
						</tr>
						<tr>
							<td style="padding-left: 10px; font-size: 18px;"><label
								class="title" style="color: #FCFCFC;">Mật khẩu</label></td>
							<td>
								<div class="input-control password">
									<input type="password" value="" placeholder="password"
										id="password" name="password"
										style="width: 65%; height: 32px;" <%=password%> /> <font
										style="color: red;">*<%=err_password%></font>
								</div>
							</td>
						</tr>
						<tr>
							<td style="padding-left: 10px; font-size: 18px;"><label
								class="title" style="color: #FCFCFC;">Nhập lại mật khẩu</label></td>
							<td>
								<div class="input-control password">
									<input type="password" value="" placeholder="password"
										style="width: 65%; height: 32px;" id="re_password"
										name="re_password" <%=re_password%> /> <font
										style="color: red;">*<%=err_re_password%></font>
								</div>
							</td>
						</tr>
						<tr>
							<td style="padding-left: 10px; font-size: 18px;"><label
								class="title" style="color: #FCFCFC;">Họ và tên</label></td>
							<td>
								<div class="input-control text">
									<input type="text" value="" placeholder="name" id="name"
										name="name" style="width: 65%; height: 32px;" <%=name%> /> <font
										style="color: red;">*<%=err_name%></font>
								</div>
							</td>
						</tr>
						<tr>
							<td style="padding-left: 10px; font-size: 18px;"><label
								class="title" style="color: #FCFCFC;">Ngày tháng năm sinh</label></td>
							<td><input type="date" name="ngaysinh" value="<%=birthday %>"
								style="height: 32px; width: 356px;; font-size: 16px;" ></td>
						</tr>
						<tr>
							<td style="padding-left: 10px; font-size: 18px;"><label
								class="title" style="color: #FCFCFC;">Giới tính</label></td>
							<td>
								<div class="input-control radio">
									<label class="tile" style="color: #FCFCFC;"> <input type="radio"
										style="width: 18px; height: 18px;" name="sex" value="nam"
										checked="checked" <%=sex%> /> <span class="check"></span> Nam
									</label> <label class="tile" style="color: #FCFCFC;"> <input type="radio"
										style="width: 18px; height: 18px;" name="sex" value="nữ"
										checked="checked" <%=sex%> /> <span class="check"></span> Nữ
									</label>
								</div>

							</td>
						</tr>
						<tr>
							<td style="padding-left: 10px; font-size: 18px;"><label
								class="title" style="color: #FCFCFC;">Số điện thoại</label></td>
							<td>
								<div class="input-control text">
									<input type="text" value="" placeholder="phone" id="phone"
										name="phone" style="width: 65%; height: 32px;" <%=phone%> />
									<font style="color: red;">*<%=err_phone%></font>
								</div>
							</td>
						</tr>
						<tr>
							<td style="padding-left: 10px; font-size: 18px;"><label
								class="title" style="color: #FCFCFC;">Email</label></td>
							<td>
								<div class="input-control text">
									<input type="text" value="" placeholder="abc@gmail.com"
										id="email" name="email" style="width: 65%; height: 32px;"
										<%=email%> /> <font style="color: red;">*<%=err_email%></font>
								</div>
							</td>
						</tr>
						<tr>
							<td style="padding-left: 10px; font-size: 18px;"><label
								class="title" style="color: #FCFCFC;">Ảnh đại diện</label></td>
							<td><input type="file" name="avatar"></td>
						</tr>
						<tr>
							<td style="padding-left: 10px; font-size: 24px;"><label
								class="title" style="color: #FCFCFC;">Địa chỉ</label></td>
							<td>
								<div class="input-control textarea">
									<textarea class="diachi" name="address"></textarea>
								</div>
							</td>
						</tr>
						<tr>
							<td colspan="2" align="center"><input type="submit"
								name="action" id="submit" value="Đăng ký" /></td>
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