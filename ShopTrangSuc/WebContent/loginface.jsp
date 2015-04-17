<%@ page language="java" contentType="text/html; charset=uft-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Facebook login</title>
</head>

<body>
	<!-- client_id : đây là APP ID của app ta vừa tạo -->
	<!-- redirect_uri : sau khi người dùng xác thực với facebook xong, facebook sẽ tự động điều hướng người dùng trở lại địa chỉ này. (tại đây ta sẽ xử lý các tham số được gởi về bởi facebook để lấy thông tin người dùng) -->
	<a
		href="https://www.facebook.com/dialog/oauth?client_id=shoptrangsuc&redirect_uri=http://localhost/fblogin/callback.php">
		<img
		src="images/icon/facebook.png" />
	</a>
<!-- 	nút like -->
<div class="fb-like" data-share="true" data-width="450"
			data-show-faces="true"></div>
</body>

</html>