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
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
					<button class="btn-search" onclick="">
						<img src="images/icon/search.png" />
					</button>
				</div>
			</div>

			<div id="header">
				<img src="images/brsp.jpg" />
			</div>
			<!--form san pham-->
			<p class="title">Giỏ Hàng Của Bạn</p>

			<p class="p">--------------------------------------------------</p>
			<p class="p"></p>

			<div id="formSP">
				<table border="1" align="center" cellpadding="0" cellspacing="0"
					width="100%">
					<tr valign="middle" bgcolor="#79CDCD" style="height: 30px">
						<th>STT</th>
						<th align="center">Mã Sản Phẩm</th>
						<th align="center">Tên Sản Phẩm</th>
						<th align="center">Hình</th>
						<th align="center">Số Lượng</th>
						<th align="center">Giá</th>
						<th align="center">Thành Tiền</th>
						<td align="center">Thao Tác</td>
					</tr>

					<%--
					String tendaydu = (String) session.getAttribute("tendaydu");
						try{
									String loadgiohang = "SELECT giohang.sachID,giohang.tensach,giohang.hinhsach,giohang.gia,giohang.soluong,giohang.tongtien,giohang.thanhtoan FROM giohang inner join khachhang on giohang.khachhangID = khachhang.id where khachhang.tenkhachhang = '"+tendaydu+"';";
									PreparedStatement pstmtloadgiohang = ConnectionDB.getConnection().prepareStatement(loadgiohang);
									ResultSet rsloadgiohang = pstmtloadgiohang.executeQuery();
									while(rsloadgiohang.next()){
										GioHang giohang = new GioHang(rsloadgiohang.getInt(1), rsloadgiohang.getString(2),rsloadgiohang.getString(3), rsloadgiohang.getInt(4),
												rsloadgiohang.getInt(5));
					--%>
					<c:set var="count" value="1"></c:set>
					<c:forEach var="listgh" items="${sessionScope.listGioHang}">
						<form id="form" name="form" method="post"
							action="UpdateSPGHServlet">
							<tr>
								<td height="35" width="25" align="center">${count}</td>
								<td height="35" width="55" align="center">${listgh.maSP }</td>
								<td height="35" class="khoangcach">${listgh.tenSP }</td>
								<td>
									<div class="image-container shadow">
										<img src='${listgh.hinh}' height="35px" width="35px" />
									</div>
								</td>
								<td height="35" align="center"><label for="soluong"></label>
									<input name="soluong" type="text" id="soluong" size="10"
									value="${listgh.soLuong}" /> <input type="hidden" name="MASP"
									value="${listgh.maSP }"></td>
								<td height="35" class="khoangcach"><fmt:setLocale
										value="en_US" /> <fmt:formatNumber value="${listgh.gia }"
										type="number"></fmt:formatNumber></td>
								<!-- name="X<?php echo $i;  ?>": de sua nh mat hang cung luc-->

								<td height="35"><fmt:setLocale value="en_US" /> <fmt:formatNumber
										value="${listgh.gia * listgh.soLuong}" type="number"></fmt:formatNumber>
								</td>
								<td height="35" align="center"><a style="color: #777777"   href="DeleteSPGHServlet?id=${listgh.maSP}">Xóa</a>
									<%--a href="UpdateSPGHServlet?id=${listgh.maSP}&sl=${listgh.soLuong}">&nbsp;&nbsp;&nbsp;Cập nhật</a> --%>
									<input type="hidden" name="id" value="${listgh.maSP }">
									<input type="submit" name="capnhat" id="capnhat"
									value="Cập nhật" /></td>


							</tr>
						</form>
						<c:set var="count" value="${count+1}"></c:set>
					</c:forEach>
				</table>
				<p align="center">
					Tổng tiền:<font color="#FF0000"><b> <fmt:setLocale
								value="en_US" /> <fmt:formatNumber
								value="${requestScope.total}" type="number"></fmt:formatNumber>
							VNĐ
					</b></font>
				</p>
				<!-- <b>: chữ đậm -->
				<p align="center">
					<%-- input type="submit" name="capnhat" id="capnhat" value="Cập nhật" />--%>
					<input type="button" name="dathang" id="dathang" value="Đặt hàng"
						onclick="location.href='KiemTraDatHangServlet'" />
					<!--type="button" : khi bam vao chuyen sang trang khac -->

				</p>
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