<%@page import="java.sql.SQLException"%>
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
<%--Style table thong tin--%>
<style type="text/css">
<!--
.style1 {
	font-size: 24px;
	color: #3366FF;
	font-weight: bold;
}

.textbox {
	border: 1px solid #3399FF;
}

.thongtin {
	padding-right: 10px;
}
-->
</style>
<%--Ket thuc style table thong tin--%>
</head>
<body>
	<%
		String tendd = (String) session.getAttribute("tendaydu");
		String n = (String) session.getAttribute("nhom");
		if (tendd != null && n.equalsIgnoreCase("1") ) {
	%>
	<div id="wrap">
		<%@include file="/admin/Menu.jsp"%>
		<div class="center_content">
			<br />
			<table align="center" bgcolor="#CCFFCC">
				<tr>
					<td><strong><font size="6" color="#3399CC">TRANG
								LIÊN HỆ</font></strong></td>
				</tr>
			</table>
			<br /> <br />
			<%--onsubmit="return kiemtranhap();"--%>
			<%--Table thong tin nguoi dung--%>
			<%
				String tentl_err = (String) request.getAttribute("tentl_err");
					if (tentl_err == null) {

						tentl_err = "";
					}
			%>
			<form id="form1" name="form1" method="post" action="LienHe">

				<table width="571" border="0" align="center" cellpadding="0"
					cellspacing="0" bordercolor="#00CCFF">
					<tr>
						<td height="40" colspan="2" bgcolor="#33FF99"><div
								align="center" class="style1">LIÊN HỆ</div></td>
					</tr>
					<tr>
						<td height="30" bgcolor="#CCFFCC" class="thongtin"><div
								align="right">
								<strong>Tiêu đề:</strong>
							</div></td>
						<td bgcolor="#66CC99"><label> <input name="tieude"
								type="text" class="textbox" id="tieude" size="40" />
						</label><font color="red"></font></td>
					</tr>
					<tr>
						<td height="30" bgcolor="#CCFFCC" class="thongtin"><div
								align="right">
								<strong>Thông Tin:</strong>
							</div></td>
						<td bgcolor="#FFF"><div id="sample">
								<script type="text/javascript" src="nicedit/nicEdit.js"></script>
								<script type="text/javascript">
									//<![CDATA[
									bkLib.onDomLoaded(function() {
										nicEditors.allTextAreas()
									});
									//]]>
								</script>
								<textarea name="thongtin" cols="60" rows="7">
</textarea>
							</div></td>
					</tr>
					<tr>
						<td bgcolor="#CCFFCC"></td>
						<td colspan="2" height="40" bgcolor="#66CC99">
							<div align="center">
								<input type="submit" name="them" id="them" value="Gửi" /> <input
									type="reset" name="lamlai" id="lamlai" value="Làm Lại" />
							</div>
						</td>
					</tr>
				</table>
			</form>
			<%--Ket thuc table thong tin nguoi dung --%>
			<br />
			<div class="clear"></div>
		</div>
		<!--end of center content-->


		<%@include file="/admin/Footer.jsp"%>


	</div>
	<%
		} else {
			response.sendRedirect("DangNhap.jsp");
		}
	%>
</body>
</html>