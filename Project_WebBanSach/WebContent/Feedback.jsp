<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
	request.setCharacterEncoding("utf-8");
	response.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%--Style table thong tin--%>
<style type="text/css">
<!--
#feedback img {
	float: right;
	margin-right: 10px;
}
-->
</style>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Feedback</title>
<link rel="stylesheet" type="text/css" href="TrangChu.css" />
</head>
<body>
	<%@include file="Script.jsp"%>
	<%@include file="Header.jsp"%>
	<%@include file="After_header.jsp"%>
	<div id="content">
		<div id="main_content">
			<div id="content_left">
				<%@include file="Left.jsp"%>
			</div>
			<div id="content_right">
				<%@include file="QuangCao.jsp"%>
			</div>
			<div id="content_center">
				<div id="feedback">
					<a>Feedback</a><img src="images_content/tim.gif" />
				</div>
				<% 
					String emailfb = request.getParameter("emailfb");
					String passwordfb = request.getParameter("passwordfb");
					String tieude = request.getParameter("tieude");
					String thongtin = request.getParameter("thongtin");

					String emailerr = (String) request.getAttribute("emailerr");
					String passwordfberr = (String) request.getAttribute("passworderr");
					String tieudeerr = (String) request.getAttribute("tieudeerr");
					String thongtinerr = (String) request.getAttribute("thongtinerr");
					String thongbao = (String) request.getAttribute("thongbao");

					System.out.print("loi: " + emailerr);
					if (emailfb == null)
						emailfb = "";
					if (passwordfb == null)
						passwordfb = "";
					if (tieude == null)
						tieude = "";
					if (thongtin == null)
						thongtin = "";

					if (emailerr == null)
						emailerr = "";
					if (passwordfberr == null)
						passwordfberr = "";
					if (tieudeerr == null)
						tieudeerr = "";
					if (thongtinerr == null)
						thongtinerr = "";
					if (thongbao == null)
						thongbao = "";
				%> 
				<div id="feedback_title">
					<b>Chào mừng bạn đã đến với trang thông tin phản hồi. Để được
						giải đáp thắc mắc bạn có thể điền thông tin muốn thắc mắc vào các
						mục phái dưới đây. Hệ thống sẽ cập nhật lại và chúng tôi sẽ giải
						đáp thắc mắc sớm nhất cho bạn.<font color="red"><%=thongbao%></font>
					</b>
				</div>
				<form action="XuLyEmailPhanHoi" method="post">
					<table>
						<tr>
							<td colspan="2"><b>THÔNG TIN PHẢN HỒI</b></td>
						</tr>
						<tr>
							<td>Email của bạn:</td>
							<td><input type="text" name="emailfb" value="<%=emailfb%>" /><font
								style="color: red;">* <%=emailerr%></font></td>
						</tr>
						<tr>
							<td>Password của bạn:</td>
							<td><input type="password" name="passwordfb"
								value="<%=passwordfb%>" /><font style="color: red;">* <%=passwordfberr%></font></td>
						</tr>
						<tr>
							<td>Tiều đề:</td>
							<td><input type="text" name="tieude" value="<%=tieude%>" /><font
								style="color: red;">* <%=tieudeerr%></font></td>
						</tr>
						<tr>
							<td>Thông tin:</td>
							<td><div id="sample">
									<script type="text/javascript" src="nicedit/nicEdit.js"></script>
									<script type="text/javascript">
										//<![CDATA[
										bkLib.onDomLoaded(function() {
											nicEditors.allTextAreas()
										});
										//]]>
									</script>
									<textarea name="area1" cols="40" rows="7">
</textarea>
								</div></td>
						</tr>
						<tr>
							<td colspan="2"><input type="submit" value="Gửi" /> <input
								type="reset" value="Xóa form" /></td>
						</tr>
					</table>
				</form>
				<hr />
				<%@include file="GioiThieu.jsp"%>
			</div>
		</div>
		<%@include file="Footer.jsp"%>
	</div>
</body>
</html>