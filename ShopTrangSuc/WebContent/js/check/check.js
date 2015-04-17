function check(){
var txttaikhoan = document.getElementById('txttaikhoan').value;
if(txttaikhoan == "" || txttaikhoan == null){
alert('Chưa nhập tên tài khoản kìa!!!');
}else if(txttaikhoan.length() < 8){
document.getElementById('errorTaiKhoan').innerHTML = "Độ dài chưa đủ"
}
}