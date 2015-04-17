<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="connection.ConnectionDB"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
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
<title>load sach len theo danh muc</title>
<link rel="stylesheet" type="text/css" href="TrangChu.css" />
</head>
<body>
	<%@include file="Script.jsp"%>
	<%@include file="Header.jsp"%>
	<%@include file="After_header.jsp"%>
	<div id="content">
		<div id="main_content">
			<div id="content_left">
				<div id="centent_left_center">
					<%--Khi chọn thể loại. Sẽ gán MaLS = id loại sách , MaDM = với iddanhmuc mới gán 
					bên lớp Left_DanhMuc.jsp sau đó chuyển qua trang--%>
					<%
						int madanhmuc = Integer.valueOf(request.getParameter("MaDM"));
						String sql = "SELECT * FROM loaisach WHERE danhmucsachID=?";
						String sqlTG = "SELECT danhmucsach.maDanhMucSach, tacgia.matacgia, tacgia.tentacgia"
								+ " FROM tacgia ,sach ,loaisach ,danhmucsach"
								+ " WHERE tacgia.matacgia = sach.tacgiaID"
								+ " AND sach.loaisachID = loaisach.maLoaiSach"
								+ " AND loaisach.danhmucsachID = danhmucsach.maDanhMucSach"
								+ " AND danhmucsach.maDanhMucSach = " + madanhmuc;
					%>
					<fieldset id="fieldset_danhmuc">
						<legend>
							<font size="3" color="#00FF00">Thể Loại</font>
						</legend>
						<div id=" menu_loaisach">
							<%
								try {
									PreparedStatement pstheloai = ConnectionDB.conn()
											.prepareStatement(sql);
									pstheloai.setInt(1, madanhmuc);
									ResultSet rstheloai = pstheloai.executeQuery();
									while (rstheloai.next()) {
							%>
							<a
								href="LoadSachTheoLoaiSach.jsp?MaLS=<%=rstheloai.getInt(1)%>&MaDM=<%=madanhmuc%>"><%=rstheloai.getString(3)%></a>
							<hr />
							<%
								}
								} catch (SQLException e) {
									e.printStackTrace();
								}
							%>
						</div>
					</fieldset>
					<hr>
					<%@include file="Left_TacGia.jsp"%>
				</div>
			</div>
			<div id="content_right">
				<%@include file="Right.jsp"%>
				<%@include file="QuangCao.jsp"%>
			</div>
			<div id="content_center">
				<%@include file="Logo.jsp"%>
				<jsp:include page="SachMoi.jsp" />
				<%@include file="GioiThieu.jsp"%>
			</div>
		</div>
		<%@include file="Footer.jsp"%>
	</div>
</body>
</html>