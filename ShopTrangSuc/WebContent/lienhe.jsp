
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

	<%--
		int pages = 1;
		if (request.getParameter("page") != null) {
			pages = Integer.parseInt(request.getParameter("page"));
		}
		NumberFormat nf = NumberFormat.getInstance(Locale.ENGLISH);
		int i = -1;
	--%>
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
		<%@include file="../include/accountheader.jsp"%>
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
					String tendd = (String) session.getAttribute("ten");
// 				    String n = (String)session.getAttribute("nhom");&& n.equalsIgnoreCase("1")
					if (tendd != null ) {
				%>
				<%
				String thongbao = (String) request.getAttribute("thongbao");
				if (thongbao == null)
					thongbao = "";
				%>
				<form id="form1" name="form1" method="post" action="LienHeServlet">

					<table width="850px" border="0" align="center" cellpadding="0"
						cellspacing="0" bordercolor="#00CCFF"
						style="margin-left: auto; margin-right: auto;">
						<tr>
							<td height="40" colspan="2" bgcolor="#00CCFF"><div
									align="center" class="style1"
									style="font-weight: bold; font-size: 24px; color: blue;">LIÊN
									HỆ <font color="red"><%=thongbao %></font></div></td>
						</tr>
						
						<tr>
							<td width=150px; height="30" bgcolor="#CCFFCC" class="thongtin"><div
									align="center">
									<strong>Email</strong>
								</div></td>
							<td bgcolor="#66CC99"><label> <input name="ten"
									type="text"  id="ten" size="65" />
							</label><font color="red"></font></td>
						</tr>
						<tr>
						<tr>
							<td width=150px; height="30" bgcolor="#CCFFCC" class="thongtin"><div
									align="center">
									<strong>Tiêu đề:</strong>
								</div></td>
							<td bgcolor="#66CC99"><label> <input name="tieude"
									type="text" class="textbox" id="tieude" size="65" />
							</label><font color="red"></font></td>
						</tr>
						<tr>
							<td width=150px; height="30" bgcolor="#CCFFCC" class="thongtin"><div
									align="center">
									<strong>Thông Tin:</strong>
								</div></td>
							<td bgcolor="#FFF">
								<div id="sample">
									<script type="text/javascript" src="nicedit/nicEdit.js"></script>
									<script type="text/javascript">
										//<![CDATA[
										bkLib.onDomLoaded(function() {
											nicEditors.allTextAreas()
										});
										//]]>
									</script>
									<textarea name="thongtin" cols="60" rows="7">
</textarea>
								</div>
							</td>
						</tr>
						<tr>
							<td bgcolor="#CCFFCC"></td>
							<td colspan="2" height="40" bgcolor="#66CC99">
								<div align="center">
									<input type="submit" name="them" id="them" value="Gửi" /> <input
										type="reset" name="lamlai" id="lamlai" value="Làm Lại" />
								</div>
							</td>
						</tr>
					</table>
				</form>
				<%
					} else {
						response.sendRedirect("dangnhap.jsp");
					}
				%>
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