<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>web_trangsuc</title>
<!--css metros-->
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
</head>

<body class="metro" onLoad="initialize()">


	<%@include file="../include/TrangChuHeader.jsp"%>
	<div id="menu_top">

		<a href="trangchu.jsp"><div class="item" id="home">
				<div id="logo">
					<img src="images/icon/home.png" />
				</div>
				<div id="title">
					<p>Home</p>
				</div>
			</div></a> <a href="sanpham.jsp"><div class="item" id="sanpham">
				<div id="logo">
					<img src="images/icon/sanpham.png" />
				</div>
				<div id="title">
					<p>Sản Phẩm</p>
				</div>
			</div></a> <a href="gioithieu.jsp"><div class="item" id="gioithieu">
				<div id="logo">
					<img src="images/icon/gioithieu.png" />
				</div>
				<div id="title">
					<p>Giới Thiệu</p>
				</div>
			</div></a> <a href="tintuc.jsp"><div class="item" id="tintuc">
				<div id="logo">
					<img src="images/icon/tintuc.png" />
				</div>
				<div id="title">
					<p>Tin Tức</p>
				</div>
			</div></a> <a href="lienhe.jsp"><div class="item" id="lienhe">
				<div id="logo">
					<img src="images/icon/lienhe.png" />
				</div>
				<div id="title">
					<p>Liên Hệ</p>
				</div>
			</div></a> <a href="giohang.jsp"><div class="item" id="giohang">
				<div id="logo">
					<img src="images/icon/shopping.png" />
				</div>
				<div id="title">
					<p>Giỏ Hàng</p>
				</div>
				<div id="quantity">1</div>
			</div></a>

		<div id="search">
			<form id="searchForm" name="searchForm" method="post"
				action="TimKiemServelet">
				<div class="input-control text">
					<input type="text" placeholder="Tìm kiếm..." id="timkiem"
						name="timkiem" />
					<button class="btn-search" type="submit" class="search">
						<img src="images/icon/search.png" />
					</button>
				</div>
			</form>
		</div>
	</div>
	<div id="slider">
		<div style="width: 100%; height: 100%;" class="tile live"
			data-role="live-tile" data-effect="slideLeftRight">
			<div class="tile-content">
				<img class="img" src="images/slide/1.JPG" />
				<h2 class="h2">
					<b>Nhẫn Kim Cương</b>
				</h2>
				<p class="p">Nhẫn cặp, nhẫn sỉ lẻ, vô vàn loại nhẫn</p>
			</div>
			<div class="tile-content">
				<img class="img" src="images/slide/2.JPG" />
			</div>
			<div class="tile-content">
				<img class="img" src="images/slide/3.JPG" />
			</div>
			<div class="tile-content">
				<img class="img" src="images/slide/4.JPG" />
			</div>
			<div class="tile-content">
				<img class="img" src="images/slide/6.jpg" />
			</div>
			<div class="tile-content">
				<img class="img" src="images/slide/7.JPG" />
			</div>
		</div>
	</div>
	<div id="center">
		<table id="table">
			<tr>
				<td colspan="2">
					<div id="slide_daychuyen">
						<div style="width: 100%; height: 100%;" class="tile live"
							data-role="live-tile" data-effect="slideLeftRight">
							<div class="tile-content">
								<img src="images/slide/daychuyen/daychuyen2.JPG" />
							</div>
							<div class="tile-content">
								<img src="images/slide/daychuyen/daychuyen1.JPG" />
							</div>
							<div class="tile-content">
								<img src="images/slide/daychuyen/daychuyen3.JPG" />
							</div>
							<div class="tile-content">
								<img src="images/slide/daychuyen/daychuyen4.JPG" />
							</div>
						</div>
					</div>
				</td>
				<td rowspan="2" colspan="2">
					<div class="news">
						<h3>Tin Tức</h3>
						<div id="title">
							<a href="#">
								<div class="img_tin">
									<img src="images/tintuc/bantin0.png" />
								</div>
								<div class="content">
									<h5>Xu hướng trang sức dự tiệc Thu 2014</h5>
									<p>
										Đã bao giờ quý cô hình dung đến những bộ trang sức đủ sắc màu
										làm điểm nhấn... <i>4/12/2014</i>
									</p>
								</div>
							</a>
						</div>
						<div id="title">
							<a href="#">
								<div class="img_tin">
									<img src="images/tintuc/bantin0.png" />
								</div>
								<div class="content">
									<h5>Xu hướng trang sức dự tiệc Thu 2014</h5>
									<p>
										Đã bao giờ quý cô hình dung đến những bộ trang sức đủ sắc màu
										làm điểm nhấn... <i>4/12/2014</i>
									</p>
								</div>

							</a>
						</div>
						<div id="tile-xemthem">
							<a href="#">Xem thêm</a>
						</div>
				</td>
				<td colspan="2" rowspan="2">
					<div class="maps">
						<!--    Chuỗi khai báo lấy tham số của google maps   -->
						<script type="text/javascript"
							src="http://maps.googleapis.com/maps/api/js?sensor=false&language=vi"></script>
						<script type="text/javascript">
							var map;
							function initialize() {
								var myLatlng = new google.maps.LatLng(
										10.872103, 106.792817);
								var myOptions = {
									zoom : 16,
									center : myLatlng,
									mapTypeId : google.maps.MapTypeId.ROADMAP
								}
								map = new google.maps.Map(document
										.getElementById("div_id"), myOptions);
								// Biến text chứa nội dung sẽ được hiển thị
								var text;
								text = "<b style='color:#00F' " +
                                             "style='text-align:center'>Shop Trang Sức<br />"
										+ "<img src='images/icon/logoshop.png' style='width:30px;height:30px,float:left'/></b><i style='float:left;width:70px;font-size:12px;'>Linh Trung, Thủ Đức</i>";
								var infowindow = new google.maps.InfoWindow({
									content : text,
									size : new google.maps.Size(100, 50),
									position : myLatlng
								});
								infowindow.open(map);
								var marker = new google.maps.Marker({
									position : myLatlng,
									map : map,
									title : "Trường ĐH Nông Lâm TP.HCM!"
								});
							}
						</script>
						<div id="div_id" style="height: 100%; width: 100%;"></div>
					</div>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<div id="slide_nhan">
						<div style="width: 100%; height: 100%;" class="tile live"
							data-role="live-tile" data-effect="slideLeftRight">
							<div class="tile-content">
								<img src="images/slide/nhan/nhan1.JPG" />
								<h2 class="h2">
									<b>Nhẫn Kim Cương</b>
								</h2>
								<p class="p">Thể hiện đẳng cấp quý phái</p>
							</div>
							<div class="tile-content">
								<img src="images/slide/nhan/nhan2.JPG" />
							</div>
							<div class="tile-content">
								<img src="images/slide/nhan/nhan3.JPG" />
							</div>
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<div id="slide_lactay">
						<div style="width: 100%; height: 100%;" class="tile live"
							data-role="live-tile" data-effect="slideLeftRight">
							<div class="tile-content">
								<img src="images/slide/lactay/lactay1.JPG" />
							</div>
							<div class="tile-content">
								<img src="images/slide/lactay/lactay2.JPG" />
							</div>
							<div class="tile-content">
								<img src="images/slide/lactay/lactay3.JPG" />
							</div>
							<div class="tile-content">
								<img src="images/slide/lactay/lactay4.JPG" />
							</div>
						</div>
					</div>
				</td>
				<td colspan="2">
					<div id="lienket">
						<div id="name">
							<p class="admin">
								Liên kết<br />---------------------
							</p>
						</div>
						<a href="http://shop.mygift.vn/" class="itemlieket"> <img
							src="images/icon/lienket1.png" style="width: 35px; height: 35px;" />
							Shop Trang Sức MyGift
						</a><br /> <a href="http://store.miumiu.com" class="itemlieket">
							<img src="images/icon/logoshop.png"
							style="width: 35px; height: 35px;" /> Shop Miu Miu
						</a><br /> <a href="http://www.sanhdieushop.com" class="itemlieket">
							<img src="images/icon/card.png"
							style="width: 35px; height: 35px;" /> Sành Điệu Shop
						</a>
					</div>
				</td>
				<td colspan="2">
					<div id="lienhe">
						<div id="name">
							<p class="admin">
								Admin<br />---------------------
							</p>
						</div>
						<div id="bag">
							<img id="images" src="images/avatar/admin.jpg">
							<div id="p">
								<p class="tenadmin" style="padding-left: 10px;">Bích Phương</p>
							</div>
						</div>
						<div id="infor">
							<div id="leftinfor">
								Trường ĐH Nông Lâm TP.Hồ Chí Minh<br> Khoa: Công Nghệ Thông
								Tin<br>
							</div>
							<div id="rightinfor">
								Lớp: CD12TH<br> Khóa: 2012-2016<br>
							</div>
						</div>
					</div>
				</td>
			</tr>
		</table>
	</div>
	<%@include file="../include/ContainerFooter.jsp"%>

</body>
</html>