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
<title>Footer Admin</title>
<link rel="stylesheet" type="text/css" href="style.css" />
</head>

<body>
	<%
		String tenProject = request.getContextPath();
		String tendaydu = (String) session.getAttribute("tendaydu");
		if (tendaydu == null) {
			tendaydu = "";
		}
	%>
	<div class="footer">
		<div class="left_footer">
			<img src="<%=tenProject %>/images_admin/footer_logo.gif" alt="" title="" /><br />
			<a href="http://csscreme.com/freecsstemplates/"
				title="free templates"><img src="<%=tenProject %>/images_admin/csscreme.gif"
				alt="free templates" title="free templates" border="0" /></a>
		</div>

		<div class="right_footer">
			<a href="../TrangChu.jsp">Trang Chủ</a> <a href="../UpdateGioiThieu.jsp">Giới
				Thiệu</a><a href="<%=tenProject %>/LienHe.jsp">Liên Hệ</a><a href="<%=tenProject %>/Logout">Đăng
				Xuất</a>
		</div>
		<table>
			<tr>
				<td><c:if test="${sessionScope['tendaydu']!= null}">
						<b><font size="3" color="#CC9">Admin: </font></b>
						<h3>
							<font size="3" color="red">${sessionScope['tendaydu']}</font>
						</h3>
					</c:if></td>
			</tr>
		</table>
	</div>
</body>
</html>