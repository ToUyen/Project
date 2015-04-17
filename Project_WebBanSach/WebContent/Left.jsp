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
<title>left</title>
<style type="text/css">
#tk {
	-webkit-border-radius: 10px;
	-moz-border-radius: 10px;
	border-radius: 5px;
}
#search{
margin-left: 10px;
}
</style>
<link rel="stylesheet" type="text/css" href="TrangChu.css" />
</head>
<body>
	<form action="Search.jsp">
					<input id="search" type="text" name="search"/>
		<div class="search_title">
			<input type="submit" id="tk" name="tk" value="Search">
		</div>
	</form><hr>
	<div id="centent_left_center">
		<%@include file="Left_DanhMuc.jsp"%>
		<hr>
		<%@include file="Left_TacGia.jsp"%>
	</div>
	<hr />
	<p align="center">
		<b><font size="1" color="#00FF00">Nhắp vào đây để liên hệ
				với tôi</font></b>
	</p>
	<p align=center>
		<a href="ymsgr:sendim?NickCuaBan&amp;m=Hello"> <img
			alt="Nhắp vào đây để liên hệ với tôi" src="images_content/online.gif"
			border=0 /></a>
	</p>


</body>
</html>