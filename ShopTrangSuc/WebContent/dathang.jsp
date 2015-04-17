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
<script type="text/javascript">
	function CheckDiaDiem() {
		var s = document.formdathang;
		if (s.hoTen.value == '') {
			document.getElementById("tenkh_error").style.display = "block";
			document.getElementById("tenkh_error").innerHTML = "Bạn chưa nhập tên người nhận!";
			s.tenkh.focus();
			return false;
		} else
			document.getElementById("tenkh_error").style.display = "none";

		if (s.diaChi.value == '') {
			document.getElementById("diadiem_error").style.display = "block";
			document.getElementById("diadiem_error").innerHTML = "Bạn chưa nhập địa điểm giao hàng!";
			s.diadiem.focus();
			return false;
		} else
			document.getElementById("diadiem_error").style.display = "none";
		return true;
	}
</script>

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
			<p class="title">Đặt Hàng Sản Phẩm</p>

			<p class="p">--------------------------------------------------</p>
			<p class="p"></p>

			<div id="formSP">
				<c:set var="a" value=""></c:set>
				<c:set var="ten" value="${sessionScope.kh.hoTen}"></c:set>
				<c:set var="makh" value="${sessionScope.kh.maKH}"></c:set>

				<p style="font-size: 20px;">&nbsp;&nbsp;Xin chào: ${hoTen}</p>
				<p style="font-size: 20px;">&nbsp;&nbsp;Xin điền đầy đủ thông
					tin để mua hàng</p>

				<form id="formdathang" onSubmit="return CheckDiaDiem()"
					name="formdathang" method="post" action="DatHangServlet">
					<table width="100%" border="1" align="center" cellpadding="0"
						cellspacing="0" class="bang">
						<tr>
							<td height="40" colspan="2" align="center" bgcolor="#7EC0EE"><strong>THÔNG
									TIN ĐẶT HÀNG</strong></td>
						</tr>
						<tr>
							<td width="368" height="40" class="khoangcach" align="center"><strong>Mã
									khách hàng</strong></td>
							<td width="376" height="40" class="khoangcach"><label
								for="makh"></label> <input name="makh" type="text"
								class="onhaptim" id="makh" value="${maKH}" readonly /></td>
						</tr>
						<tr>
							<td height="40" class="khoangcach" align="center"><strong>Tên
									người nhận</strong></td>
							<td height="40" class="khoangcach"><label for="tenngnhan"></label>
								<input name="tenkh" type="text" class="onhaptim" id="tenkh"
								value="${hoTen}" /> <font color="#FF0000">(*) <span
									class="hide error" id="tenkh_error"> </span></font></td>
						</tr>
						<tr>
							<td height="40" class="khoangcach" align="center"><strong>Địa điểm
									giao hàng</strong></td>
							<td height="40" class="khoangcach"><input name="diadiem"
								type="text" class="onhaptim" id="diadiem"
								value="${sessionScope.kh.diaChi}" /> <font color="#FF0000">(*)
									<span class="hide error" id="diadiem_error"> </span>
							</font></td>
						</tr>
						<tr>
							<td height="40" colspan="2" align="center"><input name="sua"
								type="submit" class="nuttim" id="sua" value="Đặt hàng" /></td>
						</tr>
					</table>
				</form>
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