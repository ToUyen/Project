<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="database.*"%>
<%@page import="model.SanPham"%>
<%@page import="dao.*"%>
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
<link rel="stylesheet" type="text/css" href="css/gioithieu.css" />
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

			<div class="search">
				<div class="input-control text">
					<input type="text" placeholder="Tìm kiếm..." id="search"
						name="search" />
					<button class="btn-search">
						<img src="images/icon/search.png" />
					</button>
				</div>
			</div>

			<p class="title">Giới Thiệu</p>

			<p class="p">--------------------------------------------------</p>
			
			<div id="header">
				<img src="images/brsp.jpg" />
			</div>
			<!--form san pham-->
			<div id="gt">
				<div class="imggt">
					<img src="images/gioithieu/GT1.jpg" />
				</div>
				<div class="itempg">
					<p class="pg">
						&nbsp; &nbsp; Xuất hiện vào 10/ 2008 , Shop Trang Sức chuyên các
						mẫu trang sức đơn giản. <br /> Cho đến ngày nay, Shop Trang Sức
						được nhiều khách hàng lựa chọn vì đã trao cho họ khả năng tự thiết
						kế trang sức, để tạo ra những món đồ phù hợp với sở thích, tâm
						trạng, tuổi tác, thể hiện được cá tính riêng, phù hợp với điều
						kiện tài chính. Hơn hết, với mỗi món trang sức của Shop Trang Sức
						đều là sự gắn kết về mặt cảm xúc mãnh liệt đối với người đeo nó.
					</p>
				</div>
				<div id="gt">
					<div class="imggt">
						<img src="images/gioithieu/GT2.jpg"width="250px" />
					</div>
					<div class="itempg">
						<p class="pg">&nbsp; &nbsp; Sản phẩm của Shop Trang Sức bao
							gồm dây chuyền, vòng đeo tay, nhẫn... Tuy nhiên, nét độc đáo và
							đặc sắc của Opal nằm trong hàng trăm mẫu mã phong phú và được làm
							từ những chất liệu quý hiếm như vàng, bạc,bạc sterling 92.5…
							chúng được hoàn thiện thủ công bởi các thợ kim hoàn lành nghề với
							nhiều thiết kế độc đáo và có giá cả hợp lý.</p>
					</div>
					<div id="gt">
						<div class="imggt">
							<img src="images/gioithieu/GT3.jpg" width="250px" height="250px" />
						</div>
						<div class="itempg">
							<p class="pg">&nbsp; &nbsp;Shop Trang Sức - tôn lên nét nữ
								tính của bạn</p>
						</div>

					</div>

				</div>
			</div>

			</div>
			<%@include file="../include/ContainerFooter.jsp"%>
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