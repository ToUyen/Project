function checkTaiKhoan(){
	var taikhoan = document.getElementById('txttaikhoan').value;
	if(taikhoan == "" || taikhoan == null){
		document.getElementById('errorTaiKhoan').innerHTML = 'Chưa nhập tài khoản';
	}else if(taikhoan != "admin"){
		document.getElementById('errorTaiKhoan').innerHTML = 'Sai tài khoản';
	}
} 