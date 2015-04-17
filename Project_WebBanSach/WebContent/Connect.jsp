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
</head>
<body>
	<%@page import="java.sql.*"%>
	<%
		Connection connection = null;
		Statement st = null;
		ResultSet rs = null;
		try {
			if (connection == null || connection.isClosed()) {
				Class.forName("com.mysql.jdbc.Driver");
				connection = DriverManager
						.getConnection(
								"jdbc:mysql://localhost:3306/webbansach?useUnicode=true&characterEncoding=utf-8",
								"root", "");
				System.out.println("Liên kết thành công");
				st = connection.createStatement();
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			System.out.println("Liên kết thất bại");
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("Liên kết thất bại");
		}
	%>
</body>
</html>