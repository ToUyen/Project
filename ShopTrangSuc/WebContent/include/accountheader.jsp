<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@page import="servlet.XuLyDangNhap"%>
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
	<div id="header">
		<div id="logo">
			<p>Shop Trang Sức</p>
			<div class="times" data-role="times" data-alarm="hh:mm:ss"
				style="width: 385px;"></div>

		</div>
		
		<div id="right" style="padding-left: 452px;">
			<div id="top">
				<div class="item"> 
					<img src="images/icon/facebook.png" />
				</div>
				<div class="item">
					<img src="images/icon/email.png" />
				</div>
				<div class="item">
					<img src="images/icon/twitter.png" />
				</div>
				<h4 style="color: #FCFCFC;">
					Xin chào:
					<%=session.getAttribute("ten")%></h4>
				<h4><a href="logout.jsp" class="home">Thoát</a></h4>
			</div>
		</div>
	</div>
</body>
</html>