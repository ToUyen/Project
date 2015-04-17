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
<title>Insert title here</title>
<link rel="stylesheet" href="../css/admin/admin.css" type="text/css" />
<!-- css admin -->
<script src="../js/admin/jquery-1.4.2.min.js"></script>


<!--error-->
<!-- Custom jquery scripts -->
<script src="../js/error/custom_jquery.js" type="text/javascript"></script>
<!--tab-->
<link href="../css/admin/tab.css" rel="stylesheet" />
<script type="text/javascript">
	// When the document loads do everything inside here ...
	$(document).ready(function() {

		// When a link is clicked
		$("a.tab").click(function() {

			// switch all tabs off
			$(".active").removeClass("active");

			// switch this tab on
			$(this).addClass("active");

			// slide all content up
			$(".contenttt").slideUp();

			// slide this content up
			var content_show = $(this).attr("title");
			$("#" + content_show).slideDown();

		});

	});
</script>
<script src="../js/check/check.js"></script>
</head>
<body>
	<!-- Start: page-top-outer -->
	<%@include file="include/Top.jsp"%>
	<!-- End: page-top-outer -->
	<div class="clear">&nbsp;</div>
	<!--  start nav-outer-repeat.... START -->
	<%@include file="include/Menu.jsp"%>
	<div class="clear">&nbsp;</div>
	<div id="content">
		<div id="notify">
			<fieldset>
				<%@include file="include/Notify.jsp"%>
			</fieldset>
		</div>

		<div class="tabbed_area">
			<ul class="tabs">
				<li><a title="content_1" class="tab active">Thêm Mới Sản
						Phẩm</a></li>
				<li><a title="content_2" class="tab">Sửa Thông Tin Sản Phẩm</a></li>
				<li><a title="content_3" class="tab">Danh Sách Thông Tin
						Sản Phẩm</a></li>
			</ul>
			<div style="display: block; overflow: auto;" id="content_1"
				class="contenttt">
				<div id="content-left">
					<!--========= Them moi =========-->
					<div id="container">
						<div id="title">Thêm Mới Sản Phẩm</div>

					</div>
					<!--=============== End Add ==================-->
				</div>
				<div id="content-right">
					<div id="note">
						<div id="bag">
							<%@include file="include/Note.jsp"%>
						</div>
					</div>
				</div>
			</div>
			<div style="display: none; overflow: auto;" id="content_2"
				class="contenttt">
				<div id="content-left">
					<!--=============== Update  ==================-->
					<div id="container">
						<div id="title">Sửa Thông Tin Sản Phẩm</div>

					</div>
					<!--=============== End thêm mới==================-->
				</div>
				<!--=============== Danh Sách sa==================-->

				<div id="content-right">
					<div id="note">
						<div id="bag">
							<%@include file="include/Note.jsp"%>
						</div>
					</div>
				</div>
			</div>
			<div style="display: none; overflow: auto;" id="content_3"
				class="contenttt">
				<div id="footer-content">
					<div id="title">Danh Sách Thông Tin Sản Phẩm</div>
					<!-- danh sach -->
					<fieldset>
						<div id="data">
							<%@include file="include/DataTableSP.jsp"%>
						</div>
					</fieldset>
				</div>
			</div>
		</div>
	</div>

</body>
</html>