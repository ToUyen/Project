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
<title>header</title>
<link rel="stylesheet" type="text/css" href="TrangChu.css" />
</head>
<body>
	<div id="header_wraper">
		<%
			String name = (String) session.getAttribute("tendaydu");
		%>
		<div id="header">
			<a href="#"></a>
		</div>
		<div id="menu">
			<ul id="nav">
				<li>
					<div id="menu_item">
						<a href="TrangChu.jsp">TRANG CHỦ</a>
					</div>
				</li>
				<li>
					<div id="menu_item2">
						<a
							href="<%=response.encodeURL("LoadLoaiSachTheoDanhMuc.jsp?MaDM=1")%>">SACH
							&darr;</a>
						<ul>
							<li><a href="LoadLoaiSachTheoDanhMuc.jsp?MaDM=1">-Sách
									Tiếng Anh</a></li>
							<li><a href="LoadLoaiSachTheoDanhMuc.jsp?MaDM=2">-Sách
									Văn Học - Tiểu Thuyết</a></li>
							<li><a href="LoadLoaiSachTheoDanhMuc.jsp?MaDM=3">-Sách
									Kinh Tế Chuyên Ngành</a></li>
							<li><a href="LoadLoaiSachTheoDanhMuc.jsp?MaDM=4">-Sách
									Kỹ Năng Sông- Nghệ Thuật Sông</a></li>
							<li><a href="LoadLoaiSachTheoDanhMuc.jsp?MaDM=5">-Sách
									Văn Học Trong Nước</a></li>
							<li><a href="LoadLoaiSachTheoDanhMuc.jsp?MaDM=6">-Sách
									Văn Học Nước Ngoài</a></li>
							<li><a href="LoadLoaiSachTheoDanhMuc.jsp?MaDM=7">-Sách
									Học Ngoại Ngữ - Từ Điển</a></li>
							<li><a href="LoadLoaiSachTheoDanhMuc.jsp?MaDM=8">-Sách
									Cho Tuổi Mới Lớn</a></li>
							<li><a href="LoadLoaiSachTheoDanhMuc.jsp?MaDM=9">-Sách
									Truyện Thiếu Nhi</a></li>
							<li><a href="LoadLoaiSachTheoDanhMuc.jsp?MaDM=10">-Sách
									Thường Thức - Đời Sống</a></li>
							<li><a href="LoadLoaiSachTheoDanhMuc.jsp?MaDM=11">-Truyện
									Tranh, Manga, Comic</a></li>
							<li><a href="LoadLoaiSachTheoDanhMuc.jsp?MaDM=12">-Sách
									Văn Hóa - Nghệ Thuật - Du Lịch</a></li>
						</ul>
					</div>
				</li>
				<li>
					<div id="menu_item3">
						<a href="Feedback.jsp">PHẢN HỒI</a>
					</div>
				</li>
				<li>
					<div id="menu_item4">
						<a href="Search.jsp">TÌM KIẾM</a>
					</div>
				</li>
				<li>
					<div id="menu_item5">
						<a href="Member.jsp">QUẢN LÝ</a>
					</div>
				</li>
				<%
					String tendaydu = (String) session.getAttribute("tendaydu");
					String nhom = (String) session.getAttribute("nhom");
					System.out.print("nhom: " + nhom);
				%>
				<%
					if (tendaydu == null || tendaydu == "" && nhom == null) {
				%>
				<%--Bat dau div dang nhap --%>
				<li><div id="menu_item1"></div></li>
				<li>
					<div id="menu_image_login">
						<img src="image_header/DangNhap.png" />
					</div>
				</li>

				<li>
					<div id="menu_login">
						<a href="DangNhap.jsp">Đăng Nhập</a>
					</div>
				</li>
				<li>
					<div id="menu_image_dangky">
						<img src="image_header/DangKy.png" />
					</div>
				</li>
				<li>
					<div id="menu_dangky">
						<a href="DangKy.jsp">Đăng Ký</a>
					</div>
				</li>
				<%--ket thuc div dang ky --%>
				<%
					} else {
						if (nhom.equalsIgnoreCase("1")) {
							System.out.print("nhom: " + nhom);
				%>
				<li>
					<div id="menu_item5">
						<a href="admin/AdminPage.jsp">Admin</a>
					</div>
				</li>
				<li><div id="menu_item1"></div></li>
				<li>
					<div id="menu_image_dangky">
						<img src="image_header/DangKy.png" />
					</div>
				</li>
				<li>
					<div id="menu_dangky">
						<a href="Logout"><font color="RED">Đăng Xuất</font></a>
					</div>
				</li>
				<%
					}
						if (nhom.equalsIgnoreCase("2")) {
				%>
				<li>
					<div id="menu_login"></div>
				</li>
				<li>
					<div id="menu_login"></div>
				</li>
				<li>
					<div id="menu_login"></div>
				</li>
				<li>
					<div id="menu_dangky">
						<a href="Logout"><font color="RED">Đăng Xuất</font></a>
					</div>
				</li>
				<%
					}
					}
				%>
				<li></li>
			</ul>
			<!-- end nav-->
		</div>
	</div>
</body>
</html>