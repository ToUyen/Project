<%@page import="dao.TaiKhoanDao"%>
<%@page import="dao.KhachHangDao"%>
<%@page import="model.KhachHang"%>
<%@page import="java.util.Locale"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="servlet.sanphamServlet"%>
<%@page import="dao.SanPhamDao"%>
<%@page import="model.SanPham"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link href="js/datatable/table.css" rel="stylesheet" type="text/css" />
<link href="css/admin/datatable.css" rel="stylesheet" type="text/css" />
<script src="js/datatable/jquery.js"></script>
<script src="js/datatable/jquery.dataTables.js"></script>
<script type="text/javascript">
	$(document)
			.ready(
					function() {
						var table = $('#example').DataTable();

						$('button')
								.click(
										function() {
											var data = table.$('select')
													.serialize();
											alert("The following data would have been submitted to the server: \n\n"
													+ data.substr(0, 120)
													+ '...');
											return false;
										});
					});
</script>
</head>
<body>
	<%
		int pages = 1;
		if (request.getParameter("page") != null) {
			pages = Integer.parseInt(request.getParameter("page"));
		}
		NumberFormat nf = NumberFormat.getInstance(Locale.ENGLISH);
		int i = -1;
	%>
	<table id="example" class="display" width="100%" cellspacing="0"
		border="1px">
		<thead>
			<tr style="background-color: #80B6B6;">
				<th>Mã tài khoản</th>
				<th>Họ và tên</th>
				<%--<th>Sinh ngày</th> --%>
				<th>Giới tính</th>
				<th>Địa chỉ</th>
				<th>Số điện thoại</th>
				<th>Email</th>
				<th>Chỉnh sửa</th>
			</tr>
		</thead>

		<tfoot>
			<tr style="background-color: #80B6B6;">
				<th>Mã tài khoản</th>
				<th>Họ và tên</th>
				<%--<th>Sinh ngày</th> --%>
				<th>Giới tính</th>
				<th>Địa chỉ</th>
				<th>Số điện thoại</th>
				<th>Email</th>
				<th>Chỉnh sửa</th>

			</tr>
		</tfoot>

		<tbody>
			<%
				List<KhachHang> listkh = TaiKhoanDao.getTaiKhoan();
				for (KhachHang kh : listkh) {
			%>
			<tr>

				<th><%=kh.getId()%></th>
				<th><%=kh.getTenKH()%></th>
				<%--<th><%=kh.getNgaySinh()%></th>--%>
				<th><%=kh.getGioiTinh()%></th>
				<th><%=kh.getDiaChi()%></th>
				<th><%=kh.getSoDT()%></th>
				<th><%=kh.getEmail()%></th>
				<th class="option">
					<div class="item">
						<a href="#" class="tooltipinfor"> <img
							src="../images/icon/info.png" /></a>
					</div>
					<div class="item">
						<a href="google.com" class="tooltipdelete"> <img
							src="../images/icon/delete.png" /></a>
					</div>
					<div class="item">
						<a href="#" class="tooltipactive"> <img
							src="../images/icon/active.png" /></a>
					</div>
				</th>
			</tr>
			<%
				}
			%>
		</tbody>
	</table>
</body>
</html>