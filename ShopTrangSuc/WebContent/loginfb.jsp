<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Facebook Login JavaScript Example</title>
</head>
<body>
<script>
			window.fbAsyncInit = function() {
				FB.init({
					appId : '705880689527906',
					xfbml : true,
					version : 'v2.2'
				});
			};

			(function(d, s, id) {
				var js, fjs = d.getElementsByTagName(s)[0];
				if (d.getElementById(id)) {
					return;
				}
				js = d.createElement(s);
				js.id = id;
				js.src = "//connect.facebook.net/en_US/sdk.js";
				fjs.parentNode.insertBefore(js, fjs);
			}(document, 'script', 'facebook-jssdk'));
		</script>
	<script>
		// Điều này được gọi với các kết quả từ FB.getLoginStatus ( ) .
		function statusChangeCallback(response) {
			console.log('statusChangeCallback');
			console.log(response);
			// Các đối tượng đáp ứng được trả về với một trường trạng thái cho phép các ứng dụng biết tình trạng đăng nhập hiện tại của người đó . 
			// Tài liệu đầy đủ về đối tượng phản ứng có thể được tìm thấy trong các tài liệu hướng dẫn cho FB.getLoginStatus ( ) .
			if (response.status === 'connected') {
				// Đăng nhập vào ứng dụng của bạn và Facebook .
				testAPI();
			} else if (response.status === 'not_authorized') {
				// Những người đang đăng nhập vào Facebook , nhưng không trong ứng dụng của bạn .
				document.getElementById('status').innerHTML = 'Please log '
						+ 'into this app.';
			} else {
			//Những người không được đăng nhập vào Facebook , nên chúng tôi không chắc chắn nếu họ đăng nhập vào ứng dụng này hay không .
				document.getElementById('status').innerHTML = 'Please log '
						+ 'into Facebook.';
			}
		}

		//phân tích sử dụng xã hội chức năng này được gọi khi một người nào đó kết thúc với Login Button.
		//Xem các handler onlogin gắn liền với nó trong mẫu
		// Mã dưới đây.
		function checkLoginState() {
			FB.getLoginStatus(function(response) {
				statusChangeCallback(response);
			});
		}

		window.fbAsyncInit = function() {
			FB.init({
				appId : '705880689527906',
				cookie : true, // bật cookie để cho phép các máy chủ để truy cập phiên
				xfbml : true, //phân tích các plugin xã hội trên trang này
				version : 'v2.1' // use version 2.1
			});

			// Bây giờ chúng ta đã khởi tạo các SDK JavaScript , chúng ta gọi FB.getLoginStatus ( ) . Chức năng này được các nhà nước của người truy cập vào trang này và có thể trở lại một trong ba trạng thái để gọi lại bạn cung cấp . Họ có thể là:
			// 1. Đăng nhập vào ứng dụng của bạn ( 'kết nối' )
			// 2. Đăng nhập vào Facebook , nhưng không ứng dụng của bạn ( ' not_authorized ' )
			// 3. Không đăng nhập vào Facebook và không thể nói nếu họ đăng nhập vào ứng dụng của bạn hay không .
			// Ba trường hợp được xử lý trong hàm callback .

			FB.getLoginStatus(function(response) {
				statusChangeCallback(response);
			});

		};

		// Tải SDK không đồng bộ
		(function(d, s, id) {
			var js, fjs = d.getElementsByTagName(s)[0];
			if (d.getElementById(id))
				return;
			js = d.createElement(s);
			js.id = id;
			js.src = "//connect.facebook.net/en_US/sdk.js";
			fjs.parentNode.insertBefore(js, fjs);
		}(document, 'script', 'facebook-jssdk'));

		// Dưới đây chúng tôi chạy một thử nghiệm rất đơn giản của API Graph sau khi đăng nhập thành công . Xem statusChangeCallback ( ) khi cuộc gọi này được thực hiện.
		function testAPI() {
			console.log('Welcome!  Fetching your information.... ');
			FB
					.api(
							'/me',
							function(response) {
								console.log('Successful login for: '
										+ response.name);
								document.getElementById('status').innerHTML = 'Thanks for logging in, '
										+ response.name + '!';
							});
		}
	</script>

	<!--
  Dưới đây chúng tôi bao gồm các plugin Login Nút xã hội . Nút này sử dụng
  SDK JavaScript để trình bày một nút Login đồ họa mà gây nên
  các FB.login ( ) chức năng khi nhấp vào.
-->

	<fb:login-button scope="public_profile,email"
		onlogin="checkLoginState();">
	</fb:login-button>

	<div id="status"></div>

</body>
</html>