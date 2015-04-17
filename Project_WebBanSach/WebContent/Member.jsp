<%@page import="entity.Manager"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Member</title>
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
				<div id="member">
					<a>Nhấp vào tên để được liên hệ tới họ</a><img
						src="images_content/tim.gif" />
				</div>
				<hr />
				<div id="member_title">
					<div id="giaovienhuongdan">
						<a>Giáo Viên Hướng Dẫn :</a>
					</div>
					<hr />
					<%
						try {
							String loadmanager = "SELECT * FROM manager WHERE manager.`group` = 'giangvien';";
							PreparedStatement pstmtloadmanager = ConnectionDB
									.getConnection().prepareStatement(loadmanager);
							ResultSet rsloafmanager = pstmtloadmanager.executeQuery();
							while (rsloafmanager.next()) {
								int id = rsloafmanager.getInt(1);
								String names = rsloafmanager.getString(2);
								String avatar = rsloafmanager.getString(3);
								String facebook = rsloafmanager.getString(4);
								String university = rsloafmanager.getString(5);
								String department = rsloafmanager.getString(6);
								Manager manager = new Manager(id, names, avatar, facebook,
										university, department);
					%>
					<table>
						<tr>
							<td><a href="<%=manager.getFacebook()%>"><img
									src="<%=manager.getAvatar()%>" /></a></td>
							<td><a href="<%=manager.getFacebook()%>"><%=manager.getName()%></a><br />
								<p>
									Trường:
									<%=manager.getUniversity()%></p>
								<p>
									Khoa:
									<%=manager.getDepartment()%></p></td>
						</tr>
					</table>
					<%
						}
						} catch (SQLException e) {
							e.printStackTrace();
						}
					%>
					<hr />
				</div>
				<hr />
				<div id="member_title">
					<div id="giaovienhuongdan">
						<a>Nhóm Sinh Viên : Nhóm 10</a>
					</div>
					<%
						try {
							String loadmanager = "SELECT * FROM manager WHERE manager.`group` = 'sinhvien';";
							PreparedStatement pstmtloadmanager = ConnectionDB
									.getConnection().prepareStatement(loadmanager);
							ResultSet rsloafmanager = pstmtloadmanager.executeQuery();
							while (rsloafmanager.next()) {
								int id = rsloafmanager.getInt(1);
								String names = rsloafmanager.getString(2);
								String avatar = rsloafmanager.getString(3);
								String facebook = rsloafmanager.getString(4);
								String university = rsloafmanager.getString(5);
								String department = rsloafmanager.getString(6);
								String class1 = rsloafmanager.getString(7);
								Manager manager = new Manager(id, names, avatar, facebook,
										university, department,class1);
					%>
					<table>
						<tr>
							<td><a href="<%=manager.getFacebook()%>"><img
									src="<%=manager.getAvatar()%>" /></a></td>
							<td><a href="<%=manager.getFacebook()%>"><%=manager.getName()%></a><br />
								<p>
									Trường:
									<%=manager.getUniversity()%></p>
								<p>
									Khoa:
									<%=manager.getDepartment()%></p>
								<p>
									Lop:
									<%=manager.getClass1()%></p>
								<p>
									MSSV:
									<%=manager.getId()%></p></td>
						</tr>
					</table>
					<hr />
					<%
						}
						} catch (SQLException e) {
							e.printStackTrace();
						}
					%>

					<br />
				</div>
			</div>
		</div>
		<%@include file="Footer.jsp"%>
	</div>
</body>
</html>
