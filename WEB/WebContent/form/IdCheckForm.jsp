<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ID CHECK</title>
<link rel="stylesheet" href="../css/bootstrap.min.css">
<script>
var httpRequest = null;

// httpRequest 객체 생성
function getXMLHttpRequest(){
	var httpRequest = null;

	if(window.ActiveXObject){
		try{
			httpRequest = new ActiveXObject("Msxml2.XMLHTTP");	
		} catch(e) {
			try{
				httpRequest = new ActiveXObject("Microsoft.XMLHTTP");
			} catch (e2) { httpRequest = null; }
		}
	}
	else if(window.XMLHttpRequest){
		httpRequest = new window.XMLHttpRequest();
	}
	return httpRequest;	
}


// 회원가입창의 아이디 입력란의 값을 가져온다.
function pValue(){
	document.getElementById("userId").value = opener.document.userInfo.id.value;
}

// 아이디 중복체크
function idCheck(){

	var id = document.getElementById("userId").value;

	if (!id) {
		alert("아이디를 입력하지 않았습니다.");
		return false;
	} 
	else if((id < "0" || id > "9") && (id < "A" || id > "Z") && (id < "a" || id > "z")){ 
		alert("한글 및 특수문자는 아이디로 사용하실 수 없습니다.");
		return false;
	}
	else
	{
		var param="id="+id;
		httpRequest = getXMLHttpRequest();
		httpRequest.onreadystatechange = callback;
		httpRequest.open("POST", "/WEB/IdCheckAction.do", true);	
		httpRequest.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded'); 
		httpRequest.send(param);
	}
}

function callback(){
	if(httpRequest.readyState == 4){
		var resultText = httpRequest.responseText;
		if(resultText == 0){
			alert("사용할수없는 아이디입니다.");
			document.getElementById("cancelBtn").style.visibility='visible';
			document.getElementById("useBtn").style.visibility='hidden';
			document.getElementById("msg").innerHTML ="";
		} 
		else if(resultText == 1){ 
			document.getElementById("cancelBtn").style.visibility='hidden';
			document.getElementById("useBtn").style.visibility='visible';
			document.getElementById("msg").innerHTML = "사용 가능한 아이디입니다.";
		}
	}
}

function sendCheckValue(){
	opener.document.userInfo.idDuplication.value ="idCheck";
	opener.document.userInfo.id.value = document.getElementById("userId").value;
	
	if (opener != null) {
    	opener.chkForm = null;
    	self.close();
	}	
}	

</script>
</head>
<body onload="pValue()" class="container" style="display:table;">
	<div id="wrap">
		<h2>ID CHECK FORM</h2>
		<div id="chk">
			<form action="checkForm" style="margin-right: 0">
				<input type="text" name="idinput" class="input" id="userId">
				<input type="button" class="btn btn-default" value="중복확인" onclick="idCheck()">
			</form>
			<div id="msg"></div>
		</div>
		<input id="useBtn" type="button" class="btn btn-success"value="사용하기" onclick="sendCheckValue()">
		<input id="cancelBtn" type="button" class="btn btn-danger" value="취소" onclick="window.close()">
	</div>

</body>
</html>