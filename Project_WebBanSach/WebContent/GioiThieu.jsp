<%@page import="java.sql.ResultSet"%>
<%@page import="connection.ConnectionDB"%>
<%@page import="java.sql.PreparedStatement"%>
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
<title>gioithieu</title>
<link rel="stylesheet" type="text/css" href="TrangChu.css" />
</head>
<body>
	<div id="content_bottom">
		<div class="gioithieu">
			<b>Mua Sách Tại Share.vn</b>
		</div>
		<div class="gioithieu_title">
			<%
				String gioithieu = "SELECT * FROM gioithieu";
				PreparedStatement pstmtgioithieu = ConnectionDB.getConnection()
						.prepareStatement(gioithieu);
				ResultSet rsgioithieu = pstmtgioithieu.executeQuery();
				rsgioithieu.next();
			%>
			<p>
				<a><%=rsgioithieu.getString(2)%></a><br /> <br /> <a>✓ <%=rsgioithieu.getString(4)%></a><br />
				<a>✓ <%=rsgioithieu.getString(5)%>
				</a><br /> <a>✓<%=rsgioithieu.getString(6)%></a><br /> <br /> <a><%=rsgioithieu.getString(3)%>
				</a>
			</p>
		</div>
	</div>
</body>
</html>