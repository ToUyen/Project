<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>


	<div class="nav-outer-repeat"
		style="background-color: #13544F;">
		<!--  start nav-outer -->
		<div class="nav-outer">

			<!-- start nav-right -->
			<div id="nav-right">

				<div class="nav-divider">&nbsp;</div>
				<div class="showhide-account">
					<nav class="animated flipInX">
					<ul>
						<li></li>
						<li class='sub-menu'><a href='#'> <img
								src="../images/shared/nav/nav_myaccount.gif" width="90"
								height="14" alt="" /><i class='fa fa-angle-down'></i>
						</a>
							<ul>
								<li><a href='#'> <img
										src="../images/shared/nav/caidat.png" alt="" /> Cài đặt
								</a></li>
								<li><a href='#'> <img
										src="../images/shared/nav/thietlap.png" alt="" /> Thiết lập
								</a></li>
								<li><a href='#'> <img
										src="../images/shared/nav/capnhat.png" alt="" /> Cập nhật
								</a></li>
								<li><a href='#' class="changePassword"> <img
										src="../images/shared/nav/doimatkhau.png" alt="" /> Đổi mật
										khẩu
								</a></li>
							</ul></li>
					</ul>
					</nav>
					<script src="../js/admin/jquery-1.4.2.min.js"></script>
					<script>
						$('.sub-menu ul').hide();
						$(".sub-menu a").click(
								function() {
									$(this).parent(".sub-menu").children("ul")
											.slideToggle("100");
									$(this).find("i.fa").toggleClass(
											"fa-angle-up fa-angle-down");
								});
					</script>
				</div>
				<div class="nav-divider">&nbsp;</div>
				<a href="#" id="logout"> <img
					src="../images/shared/nav/nav_logout.gif" width="64" height="14"
					alt="" /></a>
				<div class="clear">&nbsp;</div>
			</div>
			<!--  start nav -->
			<div class="nav">
				<div class="table">
					<ul class="select">
						<li><a href="../trangchu.jsp"><b>Trang Chủ</b></a></li>
					</ul>

					<div class="nav-divider">&nbsp;</div>

					<ul class="select">
						<li><a href="../admin/TaiKhoan.jsp"><b>Tài Khoản</b></a></li>
					</ul>
					<div class="nav-divider">&nbsp;</div>

					<ul class="select">
						<li><a href="SanPham.jsp"><b>Sản Phẩm</b></a>
							<%--<div class="select_sub show">
								<ul class="sub">
									<li><a href="#nogo">Thông Tin Sản Phẩm</a></li>
								</ul>
							</div>--%>
							</li>
					</ul>
					<div class="nav-divider">&nbsp;</div>
					<ul class="select">
						<li><a href="#nogo"><b>Tin Tức</b> </a>
							<div class="select_sub show">
								<ul class="sub">
									<li><a href="#nogo">Tin Tức Mới</a></li>
									<li><a href="#nogo">Quảng Cáo</a></li>
									<li><a href="#nogo">Giới Thiệu</a></li>
								</ul>
							</div></li>
					</ul>
					<div class="nav-divider">&nbsp;</div>
					<ul class="select">
						<li><a href="#nogo"><b>Khác</b></a>
							<div class="select_sub show">
								<ul class="sub">
									<li><a href="#nogo">Thông Báo</a></li>
									<li><a href="#nogo">Liên Hệ</a></li>
									<li><a href="#nogo">Thống Kê</a></li>
								</ul>
							</div></li>
					</ul>
					<div class="clear"></div>
				</div>
				<div class="clear"></div>
			</div>
			<!--  start nav -->
		</div>
	</div>
</body>
</html>