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
		if (tendd != null && n.equalsIgnoreCase("1")) {
	%>
	<div id="wrap">
		<%@include file="Menu.jsp"%>
		<div class="center_content">
			<br />
			<table align="center" bgcolor="#CCFFCC">
				<tr>
					<td><strong><font size="6" color="#3399CC">XEM
								CHI TIẾT ĐƠN HÀNG</font></strong></td>
				</tr>
			</table>
			<br /> <br />

			<form id="form1" name="form1" method="post"
				action="ChiTietDonHang.jsp">
				<center>
					Chọn Khách Hàng Cần Xem: <label> <select name="tenKH"
						id="tenkh">
							<%
								String loadtenkh = "SELECT khachhang.tenkhachhang FROM khachhang order by khachhang.id;";
									PreparedStatement pstmtloadtenkh = ConnectionDB.getConnection()
											.prepareStatement(loadtenkh);
									ResultSet rsloadtenkh = pstmtloadtenkh.executeQuery();
									while (rsloadtenkh.next()) {
										String tenkh = rsloadtenkh.getString(1);
							%>
							<option <%=tenkh%>><%=tenkh%></option>
							<%
								}
							%>
					</select>
					</label> <label> <input type="submit" name="Submit"
						value="Xem chi tiết" />
					</label>

				</center>
			</form>



			<%@include file="DSDonHang.jsp"%>

			<br />
			<table align="center" cellspacing="20">
				<tr>
					<td><a href="Deletedondathang.jsp"> <img
							src="../images_admin/delete.png" /></a></td>
				</tr>
			</table>






			<div class="clear"></div>
		</div>
		<!--end of center content-->


		<%@include file="Footer.jsp"%>


	</div>
	<%
		} else {
			response.sendRedirect("../DangNhap.jsp");
		}
	%>
</body>
</html>