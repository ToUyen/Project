<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="database.*"%>
<%@page import="model.SanPham"%>
<%@page import="dao.SanPhamDao"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.Locale"%>



<%
	request.setCharacterEncoding("utf-8");
	response.setCharacterEncoding("utf-8");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<!--css metros-->
<link rel="stylesheet" type="text/css" href="css/styles.css" />
<link rel="stylesheet" type="text/css" href="css/sanpham.css" />
<link rel="stylesheet" type="text/css" href="css/iconFont.css" />
<link rel="stylesheet" type="text/css"
	href="css/metro-bootstrap-responsive.css" />
<link rel="stylesheet" type="text/css" href="css/metro-bootstrap.css" />
<link rel="stylesheet" type="text/css" href="css/meny.css" />
<!--js metro-->
<script type="text/javascript" src="js/metro/jquery.min.js"></script>
<script type="text/javascript" src="js/metro/jquery.mousewheel.js"></script>
<script type="text/javascript" src="js/metro/jquery.widget.min.js"></script>
<script type="text/javascript" src="js/metro/metro.min.js"></script>

<script type="text/javascript" src="js/check.js"></script>
<script type="text/javascript"
	src="http://www.trungtamtinhoc.edu.vn/api/snowstorm.js"></script>
<script src="js/meny.js"></script>


</head>
<body class="metro">
	<%
		int pages = 1;
		if (request.getParameter("page") != null) {
			pages = Integer.parseInt(request.getParameter("page"));
		}
		NumberFormat nf = NumberFormat.getInstance(Locale.ENGLISH);
		int i = -1;
	%>
	<script>
		(function(d, s, id) {
			var js, fjs = d.getElementsByTagName(s)[0];
			if (d.getElementById(id))
				return;
			js = d.createElement(s);
			js.id = id;
			js.src = "//connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v2.0";
			fjs.parentNode.insertBefore(js, fjs);
		}(document, 'script', 'facebook-jssdk'));
	</script>

	<script>
		$('#ajaxContent').load('http://www.example.com/paginated/data');

		$('.pagination a').on('click', function(event) {
			event.preventDefault();
			if ($(this).attr('href') != '#') {
				$("html, body").animate({
					scrollTop : 0
				}, "fast");
				$('#ajaxContent').load($(this).attr('href'));
			}
		});
	</script>

	<%@include file="../include/ContainerLeft.jsp"%>
	<div class="contents"">
		<%@include file="../include/TrangChuHeader.jsp"%>
		<div class="center">
			<div id="header_user">
				<ul id="header_nav">
					<li id="shopping_cart"><a href="/cart?lang=vi"
						title="Xem giỏ hàng" rel="nofollow" style="border-radius: 3px;">
							<span id="mini_cart" class="cart_quantity ">0</span> <span
							class="ajax_cart_product_txt ">Sản phẩm </span> <span
							class="ajax_cart_product_txt_s hidden">Items </span> <span
							style="" class="ajax_cart_total"> 0,00 VND </span>
					</a></li>
				</ul>
			</div>
			<form id="searchForm" name="searchForm" method="post"
				action="TimKiemServelet">
				<div class="search">
					<div class="input-control text">
						<input type="text" placeholder="Tìm kiếm..." id="timkiem"
							name="timkiem" />
						<button class="btn-search" type="submit" class="search">
							<img src="images/icon/search.png" />
						</button>
					</div>
				</div>
			</form>
			<div id="header">
				<img src="images/brsp.jpg" />
			</div>
			<!--form san pham-->
			<p class="title">Sản Phẩm Nhẫn</p>

			<p class="p">--------------------------------------------------</p>
			<p class="p"></p>
			<%--
				String s_page = request.getParameter("page");
					int n_page = 1;
					if (s_page != null) {
						n_page = Integer.parseInt(s_page);
					}
					int start = (n_page - 1) * 4;
					int end = (n_page) * 4 - 1;
			--%>
			<div id="formSP">
				<h1>Đặt hàng thành công !</h1>
				<br />
				<h3>- Cảm ơn bạn đã quan tâm tới sản phẩm của chúng tôi</h3>
				<h3 style="color: red;">- Chúng tôi sẽ liên hệ với bạn trong
					vòng 24h để hoàn tất đơn hàng</h3>
				<h3>- Mọi chi tiết xin vui lòng liên hệ qua tổng đài:
					1010.10.10</h3>
				<br />
				<br />
				<br />
				<br />
				<br />
				<br />
				<br />
				<br />
			</div>


			<%@include file="../include/ContainerFooter.jsp"%>

		</div>
	</div>
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