<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
<%@page import="connection.ConnectionDB"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
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
<title>loại sách</title>
<link rel="stylesheet" type="text/css" href="TrangChu.css" />
</head>
<body>
	<fieldset id="fieldset_danhmuc">
		<legend>
			<font size="3" color="#00FF00">Danh Mục Sách</font>
		</legend>

		<%--Khi chọn danh mục sẽ gán mã danh muc = id danh muc rồi chuyển
			qua trang LaodLoaiSachTheoDanhMuc, liệt kê thể loại sách theo mã
			danh mục.
		 --%>
		<%
			String sqldanhmucsach = "SELECT * FROM danhmucsach";
		%>
		<div id=" menu_sach">
			<%
				try {
					PreparedStatement psdanhmucsach = ConnectionDB.conn().prepareStatement(sqldanhmucsach);
					ResultSet rsdanhmucsach = psdanhmucsach.executeQuery();
					while (rsdanhmucsach.next()) {
			%>
			<a href="LoadLoaiSachTheoDanhMuc.jsp?MaDM=<%=rsdanhmucsach.getInt(1)%>"><%=rsdanhmucsach.getString(2)%></a>
			<hr />
			<%
				}
				} catch (SQLException e) {
					e.printStackTrace();
				}
			%>
		</div>
	</fieldset>
</body>
</html>