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
<title>footer</title>
<link rel="stylesheet" type="text/css" href="TrangChu.css" />
</head>
<body>
	<div id="footter">
		<div id="fotter_center">
			<ul>
				<li><img
					src="images_content/anh-dong-ngoi-sao-lap-lanh (1).gif" /><a
					href="<%=response.encodeURL("hcmuaf.edu.vn")%>">~ Địa Chỉ : Đại
						Học Nông Lâm, tp.Hồ Chí Minh .<img
						src="images_content/anh-dong-ngoi-sao-lap-lanh (1).gif" />
				</a></li>
				<li><a href="#">~ Số Điện Thoại : 01653164732 .</a></li>
				<li><a>~ Website Được Thực Hiện Bởi : Nguyễn Tuấn Anh -
						Phan Xuân Mạnh - Hồ Xuân Quý .</a></li>
			</ul>
			<ul>
				<li><a
					href="<%=response
					.encodeURL("https://www.facebook.com/profile.php?id=100004780501605")%>">
						<br />https://www.facebook.com/Nguyễn Tuấn Anh
				</a></li>
			</ul>
			<ul>
				<li><a
					href="<%=response.encodeURL("https://www.facebook.com/giua.doi")%>">https://www.facebook.com/Phan
						Xuân Mạnh</a></li>
			</ul>
			<ul>
				<li><a
					href="<%=response
					.encodeURL("https://www.facebook.com/xuanquy.ho.5")%>">https://www.facebook.com/Hồ
						Xuân Quý</a></li>
			</ul>
			<ul>
				<li><a
					href="<%=response
					.encodeURL("https://www.facebook.com/lam.long.988?fref=ufi")%>">https://www.facebook.com/Lâm
						Thành Long</a></li>
			</ul>
			<hr />
			<div id="footter_end">
				<div id="col_0">
					<table>
						<tr>
							<td><a href="<%=response.encodeURL("TrangChu.jsp")%>">
									Trang chủ</a></td>
							<td><font color="#99FF00">|</font></td>
							<td><a href="LoadSachTheoLoaiSach.jsp?MaLS=1&MaDM=1"> Sách</a></td>
							<td><font color="#99FF00">|</font></td>
							<td><a href="Feedback.jsp"> Phản hồi</a></td>
							<td><font color="#99FF00">|</font></td>
							<td><a href="Search.jsp"> Tìm kiếm</a></td>
							<td><font color="#99FF00">|</font></td>
							<td><a href="<%=response.encodeURL("Member.jsp")%>">
									Quản lý</a></td>
							<td><div id="fb-root"></div> <script>
								(function(d, s, id) {
									var js, fjs = d.getElementsByTagName(s)[0];
									if (d.getElementById(id))
										return;
									js = d.createElement(s);
									js.id = id;
									js.src = "//connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v2.0";
									fjs.parentNode.insertBefore(js, fjs);
								}(document, 'script', 'facebook-jssdk'));
							</script></td>
							<td><div class="fb-share-button"
									data-href="https://www.facebook.com/websachonline"
									data-type="button_count"></div>
								</td>
						</tr>
					</table>
					<a href="#"><input type="button" name="lendautrang"
						value="Lên đầu trang" /></a>
				</div>
			</div>
		</div>
	</div>
</body>
</html>