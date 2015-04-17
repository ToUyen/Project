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
<link rel="stylesheet" href="../css/admin/admin.css" type="text/css" />
<!-- css admin -->
<script src="../js/admin/jquery-1.4.2.min.js"></script>


<!--error-->
<!-- Custom jquery scripts -->
<script src="../js/error/custom_jquery.js" type="text/javascript"></script>
<!--tab-->
<link href="../css/admin/tab.css" rel="stylesheet" />
<script type="text/javascript">
	// When the document loads do everything inside here ...
	$(document).ready(function() {

		// When a link is clicked
		$("a.tab").click(function() {

			// switch all tabs off
			$(".active").removeClass("active");

			// switch this tab on
			$(this).addClass("active");

			// slide all content up
			$(".contenttt").slideUp();

			// slide this content up
			var content_show = $(this).attr("title");
			$("#" + content_show).slideDown();

		});

	});
</script>
<script src="../js/check/check.js"></script>
</head>
<body>
	<!-- Start: page-top-outer -->
	<%@include file="include/Top.jsp"%>
	<!-- End: page-top-outer -->
	<div class="clear">&nbsp;</div>
	<!--  start nav-outer-repeat.... START -->
	<%@include file="include/Menu.jsp"%>
	<div class="clear">&nbsp;</div>
	<div id="content">
		<div id="notify">
			<fieldset>
				<%@include file="include/Notify.jsp"%>
			</fieldset>
		</div>

		<div class="tabbed_area">
			<ul class="tabs">
				<li><a title="content_1" class="tab active">Thêm Mới Thông
						Tin Tài Khoản</a></li>
				<li><a title="content_2" class="tab">Sửa Thông Tin Tài
						Khoản</a></li>
				<li><a title="content_3" class="tab">Danh Sách Thông Tin
						Tài Khoản</a></li>
			</ul>
			<div style="display: block; overflow: auto;" id="content_1"
				class="contenttt">
				<div id="content-left">
					<!--========= Them moi =========-->
					<div id="container">
						<div id="title">Thêm Thông Tin Tài Khoản</div>
						<div id="add-information">
							<fieldset>
								<div id="add">
									<%-- <form method="post" onclick="check();">--%>
									<form method="post"">
										<table class="table">
											<tr>
												<td class="title">Tài khoản:</td>
												<td class="input">
													<div class="div-input">
														<input type="text" value="" id="txttaikhoan"
															name="txttaikhoan" placeholder="nhập tên tài khoản" />
													</div>
												</td>
												<td class="errorTaiKhoan" id="errorTaiKhoan"
													style="color: red;">Lỗi</td>
											</tr>
											<tr>
												<td class="title">Mật khẩu:</td>
												<td class="input">
													<div class="div-input">
														<input type="password" value="" id="password"
															name="password" placeholder="nhập mật khẩu" />
													</div>
												</td>
												<td class="error"></td>
											</tr>
											<tr>
												<td class="title">Nhập lại mật khẩu:</td>
												<td class="input">
													<div class="div-input">
														<input type="password" value="" id="repassword"
															name="repassword" placeholder="nhập lại mật khẩu" />
													</div>
												</td>
												<td class="error"></td>
											</tr>
											<tr>
												<td class="title">Họ tên:</td>
												<td class="input">
													<div class="div-input">
														<input type="text" value="" placeholder="nhập họ tên"
															id="name" name="name" />
													</div>
												</td>
												<td class="error"></td>
											</tr>
											<tr>
												<td class="title">Giới Tính:</td>
												<td class="input"><input type="radio"
													name="radiog_lite" id="radio1" class="css-checkbox"
													style="margin-right: 30px;" /> <label for="radio1"
													class="css-label radGroup1"
													style="background-image: url(../images/radiobutton.png);">Nam</label>
													<input type="radio" name="radiog_lite" id="radio2"
													class="css-checkbox" /> <label for="radio2"
													class="css-label radGroup1"
													style="background-image: url(../images/radiobutton.png);">Nữ</label></td>
												<td class="error"></td>
											</tr>
											<tr>
												<td class="title">Ngày Sinh:</td>
												<td class="input">
													<%-- <select id="day">
														<option value="1">1</option>
														<option value="2">2</option>
														<option value="3">3</option>
														<option value="4">4</option>
												</select> <select id="month">
														<option value="1">1</option>
														<option value="2">2</option>
														<option value="3">3</option>
														<option value="4">4</option>
												</select> <select id="year">
														<option value="1">2014</option>
														<option value="2">2013</option>
														<option value="3">2012</option>
														<option value="4">2011</option>
												</select>--%> <input type="date" name="date" id="date"
													style="width: 443px; height: 33px; font-size: 16px; color: #BABABA" />
												</td>
												<td class="error"></td>
											</tr>
											<tr>
												<td class="title">Số điện thoại:</td>
												<td class="input">
													<div class="div-input">
														<input type="text" value="" placeholder="nhập sdt" />
													</div>
												</td>
												<td class="error"></td>
											</tr>
											<tr>
												<td class="title">Hình ảnh:</td>
												<td class="input"><input type="file" id="file"
													name="myfiles[]" multiple /> <script
														type="text/javascript">
														;
														(function($) {

															// Browser supports HTML5 multiple file?
															var multipleSupport = typeof $('<input/>')[0].multiple !== 'undefined', isIE = /msie/i
																	.test(navigator.userAgent);

															$.fn.customFile = function() {

																return this
																		.each(function() {

																			var $file = $(
																					this)
																					.addClass(
																							'customfile'), // the original file input
																			$wrap = $('<div class="customfile-wrap">'), $input = $('<input type="text" class="customfile-filename" />'),
																			// Button that will be used in non-IE browsers
																			$button = $('<button type="button" class="customfile-upload">Open</button>'),
																			// Hack for IE
																			$label = $('<label class="customfile-upload" for="' + $file[0].id + '">Open</label>');

																			// Hide by shifting to the left so we
																			// can still trigger events
																			$file
																					.css({
																						position : 'absolute',
																						left : '-9999px'
																					});

																			$wrap
																					.insertAfter(
																							$file)
																					.append(
																							$file,
																							$input,
																							(isIE ? $label
																									: $button));

																			// Prevent focus
																			$file
																					.attr(
																							'tabIndex',
																							-1);
																			$button
																					.attr(
																							'tabIndex',
																							-1);

																			$button
																					.click(function() {
																						$file
																								.focus()
																								.click(); // Open dialog
																					});

																			$file
																					.change(function() {

																						var files = [], fileArr, filename;

																						// If multiple is supported then extract
																						// all filenames from the file array
																						if (multipleSupport) {
																							fileArr = $file[0].files;
																							for ( var i = 0, len = fileArr.length; i < len; i++) {
																								files
																										.push(fileArr[i].name);
																							}
																							filename = files
																									.join(', ');

																							// If not supported then just take the value
																							// and remove the path to just show the filename
																						} else {
																							filename = $file
																									.val()
																									.split(
																											'')
																									.pop();
																						}

																						$input
																								.val(
																										filename)
																								// Set the value
																								.attr(
																										'title',
																										filename)
																								// Show filename in title tootlip
																								.focus(); // Regain focus

																					});

																			$input
																					.on({
																						blur : function() {
																							$file
																									.trigger('blur');
																						},
																						keydown : function(
																								e) {
																							if (e.which === 13) { // Enter
																								if (!isIE) {
																									$file
																											.trigger('click');
																								}
																							} else if (e.which === 8
																									|| e.which === 46) { // Backspace & Del
																								// On some browsers the value is read-only
																								// with this trick we remove the old input and add
																								// a clean clone with all the original events attached
																								$file
																										.replaceWith($file = $file
																												.clone(true));
																								$file
																										.trigger('change');
																								$input
																										.val('');
																							} else if (e.which === 9) { // TAB
																								return;
																							} else { // All other keys
																								return false;
																							}
																						}
																					});

																		});

															};
														}(jQuery));

														$('input[type=file]')
																.customFile();
													</script></td>
												<td class="error"></td>
											</tr>
											<tr>
												<td class="title">Địa chỉ:</td>
												<td class="input">
													<div class="div-textarea">
														<textarea style="padding-top: 1%"
															placeholder="nhập địa chỉ"></textarea>
													</div>
												</td>
												<td class="error"></td>
											</tr>
											<tr>
												<td colspan="2"><input type="reset" id="btnHuy"
													value="Hủy" /> <input type="submit" id="btnThem"
													value="Thêm" /></td>
											</tr>
										</table>
									</form>
								</div>
							</fieldset>
						</div>
					</div>
					<!--=============== End Add ==================-->
				</div>
				<div id="content-right">
					<div id="note">
						<div id="bag">
							<%@include file="include/Note.jsp"%>
						</div>
					</div>
				</div>
			</div>
			<div style="display: none; overflow: auto;" id="content_2"
				class="contenttt">
				<div id="content-left">
					<!--=============== Update  ==================-->
					<div id="container">
						<div id="title">Sửa Thông Tin Tài Khoản</div>
						<div id="update-information">
							<fieldset>
								<div id="add">
									<table class="table">
										<tr>
											<td class="title">Tài khoản:</td>
											<td class="input">
												<div class="div-input">
													<input type="text" value=""
														placeholder="nhập tên tài khoản" />
												</div>
											</td>
											<td class="error" style="color: red;">lỗi</td>
										</tr>
										<tr>
											<td class="title">Mật khẩu:</td>
											<td class="input">
												<div class="div-input">
													<input type="password" value="" placeholder="nhập mật khẩu" />
												</div>
											</td>
											<td class="error"></td>
										</tr>
										<tr>
											<td class="title">Nhập lại mật khẩu:</td>
											<td class="input">
												<div class="div-input">
													<input type="password" value=""
														placeholder="nhập lại mật khẩu" />
												</div>
											</td>
											<td class="error"></td>
										</tr>
										<tr>
											<td class="title">Họ tên:</td>
											<td class="input">
												<div class="div-input">
													<input type="text" value="" placeholder="nhập họ tên" />
												</div>
											</td>
											<td class="error"></td>
										</tr>
										<tr>
											<td class="title">Giới Tính:</td>
											<td class="input"><input type="radio" name="radiog_lite"
												id="radio3" class="css-checkbox" style="margin-right: 30px;" /><label
												for="radio3" class="css-label radGroup1"
												style="background-image: url(../images/radiobutton.png);">Nam</label>
												<input type="radio" name="radiog_lite" id="radio4"
												class="css-checkbox" /><label for="radio4"
												class="css-label radGroup1"
												style="background-image: url(../images/radiobutton.png);">Nữ</label>
											</td>
											<td class="error"></td>
										</tr>
										<tr>
											<td class="title">Ngày Sinh:</td>
											<td class="input"><select id="day">
													<option value="1">1</option>
													<option value="2">2</option>
													<option value="3">3</option>
													<option value="4">4</option>
											</select> <select id="month">
													<option value="1">1</option>
													<option value="2">2</option>
													<option value="3">3</option>
													<option value="4">4</option>
											</select> <select id="year">
													<option value="1">2014</option>
													<option value="2">2013</option>
													<option value="3">2012</option>
													<option value="4">2011</option>
											</select></td>
											<td class="error"></td>
										</tr>
										<tr>
											<td class="title">Số điện thoại:</td>
											<td class="input">
												<div class="div-input">
													<input type="text" value="" placeholder="nhập sdt" />
												</div>
											</td>
											<td class="error"></td>
										</tr>
										<tr>
											<td class="title">Địa chỉ:</td>
											<td class="input">
												<div class="div-textarea">
													<textarea style="padding-top: 1%"
														placeholder="nhập địa chỉ"></textarea>
												</div>
											</td>
											<td class="error"></td>
										</tr>
										<tr>
											<td colspan="2" style="text-align: center;"><input
												type="button" value="First" /> <input type="button"
												value="Previos" /> <input type="button" value="Next" /> <input
												type="button" value="Last" /></td>
										</tr>
										<tr>
											<td colspan="2"><input type="button" id="btnHuy"
												value="Hủy" /> <input type="button" id="btnThem"
												value="Lưu" /></td>
										</tr>
									</table>
								</div>
							</fieldset>
						</div>
					</div>
					<!--=============== End thêm mới==================-->
				</div>
				<!--=============== Danh Sách sa==================-->

				<div id="content-right">
					<div id="note">
						<div id="bag">
							<%@include file="include/Note.jsp"%>
						</div>
					</div>
				</div>
			</div>
			<div style="display: none; overflow: auto;" id="content_3"
				class="contenttt">
				<div id="footer-content">
					<!-- danh sach -->
					<%@include file="include/DataTable.jsp"%>

				</div>
			</div>
		</div>
	</div>

</body>
</html>