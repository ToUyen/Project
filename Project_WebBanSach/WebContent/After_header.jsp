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
<title>after</title>
<link rel="stylesheet" type="text/css" href="TrangChu.css" />
</head>
<body>
	<%
		String username = (String) request.getAttribute("username");

		if (username == null) {
			username = "";
		}
	%>
	<div id="after_header_wraper">
		<div id="title_date">
			<form action="Login" method="post">
				<marquee scrollamount="1" scrolldelay="50">
					<font size="3" color="#00FF00"><img
						src="images_content/tim.gif" /><img src="images_content/tim.gif" /><img
						src="images_content/tim.gif" />~Chào mừng bạn <%=username%> đến
						với website của chúng tối....~<img src="images_content/tim.gif" /><img
						src="images_content/tim.gif" /><img src="images_content/tim.gif" /></font>
				</marquee>
			</form>
		</div>
	</div>
</body>
</html>