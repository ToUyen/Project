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
			<br />
			<table align="center" bgcolor="#CCFFCC">
				<tr>
					<td><strong><font size="6" color="#3399CC">XEM
								CHI TIẾT SÁCH</font></strong></td>
				</tr>
			</table>
			<br /> <br />

			<form id="form1" name="form1" method="post" action="ChiTietSach.jsp">
				<center>
					Chọn Mã Sách cần xem: <label> <select name="tensach"
						id="tensach">
							<%
								try {
										String loadms = "SELECT tenSach FROM sach";
										PreparedStatement psloadms = ConnectionDB.conn()
												.prepareStatement(loadms);
										ResultSet rsloadms = psloadms.executeQuery();
										while (rsloadms.next()) {
											String tensach = rsloadms.getString(1);
							%>
							<option value="<%=tensach%>"><%=tensach%></option>
							<%
								}
									} catch (SQLException e) {
										e.printStackTrace();
									} catch (Exception e) {
										e.printStackTrace();
									}
							%>
					</select>
					</label> <label> <input type="submit" name="Submit"
						value="Xem chi tiết" />
					</label>
				</center>
			</form>
			<br /> <br />
			<form id="form1" name="form1" method="post"
				action="<%=tenproject%>/UpdateSachTacGiaServlet">
				<table align="center" bgcolor="#CCFFCC">
					<tr>
						<td><strong><font size="6" color="#3399CC">QUẢN
									LÝ SÁCH-TÁC GIẢ</font></strong></td>
					</tr>
				</table>
				<br />
				<center>
					<table>
						<tr>
							<td align="left">Chọn Sách cần gán tác giả:</td>
							<td width="100"><label> <select name="tensach"
									id="tensach">
										<%
											try {
													String loadms = "SELECT tenSach FROM sach";
													PreparedStatement psms = ConnectionDB.conn()
															.prepareStatement(loadms);
													ResultSet rsms = psms.executeQuery();
													while (rsms.next()) {
														String tensach = rsms.getString(1);
										%>
										<option value="<%=tensach%>"><%=tensach%></option>
										<%
											}
												} catch (SQLException e) {
													e.printStackTrace();
												} catch (Exception e) {
													e.printStackTrace();
												}
										%>

								</select>
							</label></td>
						</tr>
						<tr>
							<td align="left">Chọn tác giả của sách vừa chọn:</td>
							<td><label> <select name="tentg" id="tentg">

										<%
											try {
													String tenTg = "SELECT tenTacGia FROM tacgia";
													PreparedStatement psloadmtg = ConnectionDB.conn()
															.prepareStatement(tenTg);
													ResultSet rsloadmtg = psloadmtg.executeQuery();
													while (rsloadmtg.next()) {
														String tentg = rsloadmtg.getString(1);
										%>
										<option value="<%=tentg%>"><%=tentg%></option>
										<%
											}
												} catch (SQLException e) {
													e.printStackTrace();
												} catch (Exception e) {
													e.printStackTrace();
												}
										%>

								</select>
							</label></td>
						</tr>
						<tr>
							<td></td>
							<td align="left"><label> <input type="submit"
									name="Submit" value="Gán" />
							</label></td>
						</tr>
					</table>
				</center>
			</form>
			<br /> <br />
			<form id="form1" name="form1" method="post"
				action="<%=tenproject%>/UpdateSachDichGiaServlet">
				<table align="center" bgcolor="#CCFFCC">
					<tr>
						<td><strong><font size="6" color="#3399CC">QUẢN
									LÝ SÁCH-DỊCH GIẢ</font></strong></td>
					</tr>
				</table>
				<br />
				<center>
					<table>
						<tr>
							<td align="left">Chọn Sách cần gán dịch giả:</td>
							<td><label> <select name="tensach" id="tensach">

										<%
											try {
													String loadts = "SELECT tenSach FROM sach";
													PreparedStatement psts = ConnectionDB.conn()
															.prepareStatement(loadts);
													ResultSet rsts = psts.executeQuery();
													while (rsts.next()) {
														String tensach = rsts.getString(1);
										%>
										<option value="<%=tensach%>"><%=tensach%></option>
										<%
											}
												} catch (SQLException e) {
													e.printStackTrace();
												} catch (Exception e) {
													e.printStackTrace();
												}
										%>

								</select>
							</label></td>
						</tr>
						<tr>
							<td align="left">dịch giả của sách vừa chọn:</td>
							<td><input name="tendg"></td>
						</tr>
						<tr>
							<td></td>
							<td align="left"><label> <input type="submit"
									name="Submit" value="Gán" />
							</label></td>
						</tr>
					</table>
				</center>
			</form>
			<%@include file="DSSach.jsp"%>

			<br />
			<table align="center" cellspacing="20">
				<tr>
					<td><a href="<%=tenproject%>/admin/Addsach.jsp"> <img
							src="<%=tenproject%>/images_admin/add.png" /></a></td>
					<td><a href="<%=tenproject%>/admin/Editsach.jsp"><img
							src="<%=tenproject%>/images_admin/edit.png" /></a></td>
					<td><a href="<%=tenproject%>/admin/Deletesach.jsp"> <img
							src="<%=tenproject%>/images_admin/delete.png" /></a></td>
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