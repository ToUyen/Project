<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
	request.setCharacterEncoding("utf-8");
	response.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="TrangChu.css" />
<title>Web-Chia-Se-Sach</title>
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
				<div id="dangky">
					<a>Đăng Ký</a><img src="images_content/tim.gif" />
				</div>
				<div id="dangky_title">
					<b>Chào mừng bạn đã đến với trang đăng ký thành viên. Để đăng
						ký thành viên thành công bạn phải khai báo đầy đủ các ô dưới đây,
						hệ thống sẽ kiểm tra tính hợp lệ của thông tin. Chúc bạn đăng ký
						thành công.</b>
				</div>

				<%
					String user = request.getParameter("username");
					String password = request.getParameter("password");
					String re_password = request.getParameter("re_password");
					String names = request.getParameter("name");
					String sex = request.getParameter("sex");
					String s_day = request.getParameter("day");
					String s_month = request.getParameter("month");
					String s_year = request.getParameter("year");
					String email = request.getParameter("email");
					String phone = request.getParameter("phone");
					String mb_phone = request.getParameter("mb_phone");
					String avatar = request.getParameter("avatar");
					String country = request.getParameter("country");
					String province = request.getParameter("province");
					String homeadd = request.getParameter("homeadd");

					String err_user = (String) request.getAttribute("err_user");
					String err_password = (String) request.getAttribute("err_password");
					String err_re_password = (String) request
							.getAttribute("err_re_password");
					String err_name = (String) request.getAttribute("err_name");
					String err_s_day = (String) request.getAttribute("err_s_day");
					String err_s_month = (String) request.getAttribute("err_s_month");
					String err_birthday = (String) request.getAttribute("err_birthday");
					String err_email = (String) request.getAttribute("err_email");
					String err_phone = (String) request.getAttribute("err_phone");
					String err_mb_phone = (String) request.getAttribute("err_mb_phone");
					String err_avatar = (String) request.getAttribute("err_avatar");
					String err_homeadd = (String) request.getAttribute("err_homeadd");

					String[] quocgias = new String[] { "Viet Nam", "Lao", "Camphuchia",
							"Thai Lan", "Trung Quoc", "Nhat Ban", "Singapo",
							" Nuoc Khac" };
					String[] tinhthanhs = new String[] { "TP. HCM", "Tra Vinh",
							"Tay Ninh", "Can Tho", "Thanh Hoa", "Thai Binh", "Da Nang",
							"Hue", "Nha Trang", "Vung Tau", "Ha Noi", "Đong Nai",
							"Khac" };
					// Lay du lieu loi:
					if (user == null)
						user = "";
					if (request.getAttribute("username") != null)
						user = (String) request.getAttribute("username");
					if (password == null)
						password = "";
					if (request.getAttribute("password") != null)
						password = (String) request.getAttribute("password");
					if (re_password == null)
						re_password = "";
					if (request.getAttribute("re_password") != null)
						re_password = (String) request.getAttribute("re_password");
					if (names == null)
						names = "";
					if (request.getAttribute("name") != null)
						names = (String) request.getAttribute("name");
					if (email == null)
						email = "";
					if (request.getAttribute("email") != null)
						email = (String) request.getAttribute("email");
					if (phone == null)
						phone = "";
					if (request.getAttribute("phone") != null)
						phone = (String) request.getAttribute("phone");
					if (mb_phone == null)
						mb_phone = "";
					if (request.getAttribute("mb_phone") != null)
						mb_phone = (String) request.getAttribute("mb_phone");
					if (avatar == null)
						avatar = "";
					if (country == null)
						country = "";
					if (province == null)
						province = "";
					if (homeadd == null)
						homeadd = "";
					if (request.getAttribute("homeadd") != null)
						homeadd = (String) request.getAttribute("homeadd");

					if (err_user == null)
						err_user = "";
					if (err_password == null)
						err_password = "";
					if (err_re_password == null)
						err_re_password = "";
					if (err_name == null)
						err_name = "";
					if (err_birthday == null)
						err_birthday = "";
					if (err_email == null)
						err_email = "";
					if (err_phone == null)
						err_phone = "";
					if (err_mb_phone == null)
						err_mb_phone = "";
					if (err_homeadd == null)
						err_homeadd = "";
				%>
				<form action="XuLyDangKy" method="post">
					<table>
						<tr>
							<td colspan="2"><b>THÔNG TIN ĐĂNG NHẬP</b></td>
						</tr>
						<tr>
							<td>Username:</td>
							<td><input type="text" name="username" value="<%=user%>" /><font
								style="color: red;">* <%=err_user%></font></td>

						</tr>
						<tr>
							<td>Mật khẩu:</td>
							<td><input type="password" name="password"
								value="<%=password%>" /><font style="color: red;">* <%=err_password%></font></td>
						</tr>
						<tr>
							<td>Nhập lại mật khẩu:</td>
							<td><input type="password" name="re_password"
								value="<%=re_password%>" /><font style="color: red;">* <%=err_re_password%></font></td>
						</tr>
						<tr>
							<td colspan="2"><b>THÔNG TIN CÁ NHÂN</b></td>
						</tr>
						<tr>
							<td>Họ và tên:</td>
							<td><input type="text" name="name" value="<%=names%>" /><font
								style="color: red">*<%=err_name%></font></td>
						</tr>
						<tr>
							<td>Phái:</td>
							<td><input type="radio" name="sex" value="Nam"
								checked="checked" />Nam <input type="radio" name="sex"
								value="Nữ" />Nữ</td>
						</tr>
						<tr>
							<td>Ngày Sinh:</td>
							<td><select name="day">
									<%
										for (int day = 1; day <= 31; day++) {
									%>
									<option value="<%=day%>"><%=day%></option>
									<%
										}
									%>
							</select> <select name="month">
									<%
										for (int mounth = 1; mounth <= 12; mounth++) {
									%>
									<option value="<%=mounth%>"><%=mounth%></option>
									<%
										}
									%>
							</select> <select name="year">
									<%
										for (int year = 1970; year <= 2020; year++) {
									%>
									<option value="<%=year%>"><%=year%></option>
									<%
										}
									%>
							</select> <font style="color: red;">*<%=err_birthday%></font></td>
						</tr>
						<tr>
							<td>Email:</td>
							<td><input type="text" name="email" value="<%=email%>" /><font
								style="color: red;">* <%=err_email%></font></td>
						</tr>
						<tr>
							<td>Số điện thoại:</td>
							<td><input type="text" name="phone" value="<%=phone%>" /><font
								style="color: red;">* <%=err_phone%></font></td>
						</tr>
						<tr>
							<td>Số di động:</td>
							<td><input type="text" name="mb_phone" value="<%=mb_phone%>" /><font
								style="color: red;">* <%=err_mb_phone%></font></td>
						</tr>
						<tr>
							<td colspan="2"><b>ĐỊA CHỈ</b></td>
						</tr>
						<tr>
							<td>Quốc gia:</td>
							<td><select name="country">
									<%
										for (String qg : quocgias) {
									%>
									<option value="<%=qg%>"><%=qg%></option>
									<%
										}
									%>
							</select></td>
						</tr>
						<tr>
							<td>Tỉnh/ Thành:</td>
							<td><select name="province">
									<%
										for (String tt : tinhthanhs) {
									%>
									<option value="<%=tt%>"><%=tt%></option>
									<%
										}
									%>
							</select></td>
						</tr>
						<tr>
							<td>Địa chỉ nhà:</td>
							<td><textarea rows="5" cols="15" name="homeadd">so</textarea><font
								style="color: red;">*<%=err_homeadd%></font></td>
						</tr>
						<tr>
							<td colspan="2"><input type="submit" value="Đăng ký" /> <input
								type="reset" value="Xóa form" /></td>
						</tr>
					</table>
				</form>
				<hr />
				<%@include file="GioiThieu.jsp" %>
			</div>
		</div>
		<%@include file="Footer.jsp" %>
	</div>
	<%--Quảng cáo trượt 2 bên --%>
</body>
</html>