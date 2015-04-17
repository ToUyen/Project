var xmlhttp = new XMLHttpRequest();
function muaVit() {
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("FAX").innerHTML 
			= xmlhttp.responseText;
		}
	};
	xmlhttp.open("POST", "AddProduct", true);
	xmlhttp.send();
}
