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
<title>title login</title>
<link rel="stylesheet" type="text/css" href="TrangChu.css" />
</head>
<body>
	<%--phần xét đăng nhập --%>
	<c:if test="${sessionScope['tendaydu']!=null}">
		<b>Xin chào bạn :</b>
		<h3>
			<font color="red">${sessionScope['tendaydu']}</font>
		</h3>
	</c:if>
</body>
</html>