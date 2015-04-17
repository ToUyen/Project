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
<link rel="stylesheet" type="text/css" href="style.css" />
</head>
<body>
<%
		String tendd = (String) session.getAttribute("tendaydu");
		String n = (String) session.getAttribute("nhom");
		if (tendd != null &&  n.equalsIgnoreCase("1")) {
	%>
	<div id="wrap">
		<%@include file="Menu.jsp"%>
		<div class="center_content">

			<%@include file="DSTacGia.jsp"%>

			<br />
			<table align="center" cellspacing="20">
				<tr>
					<td><a href="AddTacGia.jsp"> <img src="../images_admin/add.png" /></a>
					</td>
					<td><a href="EditTacGia.jsp"><img src="../images_admin/edit.png" /></a>
					</td>
					<td><a href="DeleteTacGia.jsp"> <img
							src="../images_admin/delete.png" /></a></td>
				</tr>
			</table>

			<div class="clear"></div>
		</div>
		<!--end of center content-->


		<%@include file="Footer.jsp"%>


	</div><%
		} else {
			response.sendRedirect("../DangNhap.jsp");
		}
	%>
</body>
</html>