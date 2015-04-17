<%@page import="java.util.List"%>
<%@page import="model.SanPham"%>
<%@page import="database.*"%>
<%@page import="dao.*"%>

<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>

	<%
		int id = SanPhamDao.getNumberPage();
		for (int i = 0; i <= id; i++) {
	%>
	<a href="SanPham.jsp?id=<%=i%>"><div class="itempage"><%=i%></div></a>
	<%
		}
	%>
</body>
</html>