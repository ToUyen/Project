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
	<script src="jquery/rainbow.js">
		
	</script>
	<script language="javascript"
		src="http://dai10a1.xtgem.com/javascript/cursor.js"></script>
	<script language="javascript"
		src="http://dai10a1.xtgem.com/javascript/trochuot2.js"></script>

	<script>
		var msg = ".:: Lập Trình Web ::. || .:: Nhóm 6 - AdminPage ::.";

		var pos = 0;

		var spacer = " || ";

		var time_length = 1000;

		function ScrollTitle()

		{

			document.title = msg.substring(pos, msg.length) + spacer
					+ msg.substring(0, pos);

			pos++;

			if (pos > msg.length)
				pos = 0;

			window.setTimeout("ScrollTitle()", time_length);

		}

		ScrollTitle();
	</script>
</body>
</html>