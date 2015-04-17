
<%@page import="java.sql.SQLException"%>
<%@page import="servlet.XuLyDangNhap"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

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

			<p class="title">Liên Hệ</p>

			<p class="p">--------------------------------------------------</p>
			<p class="p"></p>
			<div id="header">
				<img src="images/brsp.jpg" />
			</div>
			<div id="formSP" style="background-color: #006363">
			<% 
					String emailfb = request.getParameter("emailfb");
					String passwordfb = request.getParameter("passwordfb");
					String tieude = request.getParameter("tieude");
					String thongtin = request.getParameter("thongtin");

					String emailerr = (String) request.getAttribute("emailerr");
					String passwordfberr = (String) request.getAttribute("passworderr");
					String tieudeerr = (String) request.getAttribute("tieudeerr");
					String thongtinerr = (String) request.getAttribute("thongtinerr");
					String thongbao = (String) request.getAttribute("thongbao");

					System.out.print("loi: " + emailerr);
					if (emailfb == null)
						emailfb = "";
					if (passwordfb == null)
						passwordfb = "";
					if (tieude == null)
						tieude = "";
					if (thongtin == null)
						thongtin = "";

					if (emailerr == null)
						emailerr = "";
					if (passwordfberr == null)
						passwordfberr = "";
					if (tieudeerr == null)
						tieudeerr = "";
					if (thongtinerr == null)
						thongtinerr = "";
					if (thongbao == null)
						thongbao = "";
				%> 
				<div id="feedback_title">
					<b>Chào mừng bạn đã đến với trang thông tin phản hồi. Để được
						giải đáp thắc mắc bạn có thể điền thông tin muốn thắc mắc vào các
						mục phái dưới đây. Hệ thống sẽ cập nhật lại và chúng tôi sẽ giải
						đáp thắc mắc sớm nhất cho bạn.<font color="red"><%=thongbao %></font>
					</b>
				</div>
				<form action="XuLyEmailPH" method="post">
					<table>
						<tr>
							<td colspan="2"><b>THÔNG TIN PHẢN HỒI</b></td>
						</tr>
						<tr>
							<td>Email của bạn:</td>
							<td><input type="text" name="emailfb" value="<%=emailfb%>" /><font
								style="color: red;">* <%=emailerr%></font></td>
						</tr>
						<tr>
							<td>Password của bạn:</td>
							<td><input type="password" name="passwordfb"
								value="<%=passwordfb%>" /><font style="color: red;">* <%=passwordfberr%></font></td>
						</tr>
						<tr>
							<td>Tiều đề:</td>
							<td><input type="text" name="tieude" value="<%=tieude%>" /><font
								style="color: red;">* <%=tieudeerr%></font></td>
						</tr>
						<tr>
							<td>Thông tin:</td>
							<td><div id="sample">
									<script type="text/javascript" src="nicedit/nicEdit.js"></script>
									<script type="text/javascript">
										//<![CDATA[
										bkLib.onDomLoaded(function() {
											nicEditors.allTextAreas()
										});
										//]]>
									</script>
									<textarea name="area1" cols="40" rows="7">
</textarea>
								</div></td>
						</tr>
						<tr>
							<td colspan="2"><input type="submit" value="Gửi" /> <input
								type="reset" value="Xóa form" /></td>
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