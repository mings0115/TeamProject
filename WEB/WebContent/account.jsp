<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<title>ACCOUNT</title>
<meta name="description" content="">
<meta name="keywords" content="">
<link href="https://fonts.googleapis.com/css?family=Nunito:400,700|Poppins" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="css/normalize.css">
<link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="css/start.css">
<link rel="stylesheet" type="text/css" href="css/input.css">

<style>
.btncheck {
	border: hidden;
	float: right;
	padding: 0.3em 0.6em;
	margin-top: 34px;
	margin-right: 20px;
}
</style>

<script>
	document.documentElement.className = 'js';
	
	//
	
	function checkValue()
		{
			var form = document.userInfo;
		
			if(!form.id.value){
				alert("아이디를 입력하세요.");
				return false;
			}
			
			if(form.idDuplication.value != "idCheck"){
				alert("아이디 중복체크를 해주세요.");
				return false;
			}
			
			if(!form.pwd.value){
				alert("비밀번호를 입력하세요.");
				return false;
			}
			
			// 비밀번호와 비밀번호 확인에 입력된 값이 동일한지 확인
			if(form.pwd.value != form.pwdCheck.value ){
				alert("비밀번호를 동일하게 입력하세요.");
				return false;
			}	
			
			if(!form.name.value){
				alert("이름을 입력하세요.");
				return false;
			}
		
			if(!form.mail1.value){
				alert("메일 주소를 입력하세요.");
				return false;
			}
			
			if(!form.phone.value){
				alert("전화번호를 입력하세요.");
				return false;
			}
			
			if(isNaN(form.phone.value)){
				alert("전화번호는 - 제외한 숫자만 입력해주세요.");
				return false;
			}
			
		}

		// 아이디 중복체크 화면open
		function openIdChk(){
		
			window.name = "parentForm";
			window.open("/WEB/form/IdCheckForm.jsp",
					"chkForm", "width=320, height=150, resizable = no, scrollbars = no");	
		}

		function inputIdChk(){
			document.userInfo.idDuplication.value ="idUncheck";
		}
		
		// 아이디 입력창에 값 입력시 hidden에 idUncheck를 세팅한다.
		// 이렇게 하는 이유는 중복체크 후 다시 아이디 창이 새로운 아이디를 입력했을 때
		// 다시 중복체크를 하도록 한다.
	
</script>
</head>
<body class="start">
	<form action="/WEB/accountAccess.do" method="post" name="userInfo" onsubmit="return checkValue()">
		<!-- /WEB/accountAccess.do -->
		<main>
			<div class="content content--fixed">
				<div class="content__inner">
					<div class="content__title--filled" style="height: 850px;">

						<img alt="Loginlogo" src="img/logo_login1.jpg" style="margin: auto;">
						<br>
						<div class="clear"></div>
						<section class="content_input" style="height: 500px;">
							<div>
								<span class="input input--hoshi" style="margin-left: 148px">
									<input class="input__field input__field--hoshi" type="text" name="id" maxlength="50" onkeydown="inputIdChk()">
									<input type="hidden" name="idDuplication" value="idUncheck">
									<label class="input__label input__label--hoshi input__label--hoshi-color-1" for="input-4">
										<span class="input__label-content input__label-content--hoshi">ID</span>
									</label>
								</span>
								<input type="button" class="btn btncheck" value="ID CHECK" onclick="openIdChk()">
							</div>
							<span class="input input--hoshi">
								<input class="input__field input__field--hoshi" type="password" name="pwd" maxlength="50">
								<label class="input__label input__label--hoshi input__label--hoshi-color-1" for="input-4">
									<span class="input__label-content input__label-content--hoshi">PW</span>
								</label>
							</span>
							<span class="input input--hoshi">
								<input class="input__field input__field--hoshi" type="password" name="pwdCheck" maxlength="50">
								<label class="input__label input__label--hoshi input__label--hoshi-color-1" for="input-4">
									<span class="input__label-content input__label-content--hoshi">PW CHECK</span>
								</label>
							</span>
							<span class="input input--hoshi">
								<input class="input__field input__field--hoshi" type="text" name="name">
								<label class="input__label input__label--hoshi input__label--hoshi-color-1" for="input-4">
									<span class="input__label-content input__label-content--hoshi">NAME</span>
								</label>
							</span>
							<div class=email>
								<span class="input input--hoshi" style="width: 50%; margin-right: -60px; margin-left: 100px;">
									<input class="input__field input__field--hoshi" type="text" name="email1">
									<label class="input__label input__label--hoshi input__label--hoshi-color-1" for="input-4">
										<span class="input__label-content input__label-content--hoshi">EMAIL</span>
									</label>
								</span>
								<span class="input input--hoshi" style="width: 40%; padding: 30px 0;">
									<select name="email2" class="form-control" style="padding: 0 30px 0 30px;">
										<option>naver.com</option>
										<option>daum.net</option>
										<option>gmail.com</option>
										<option>nate.com</option>
									</select>
								</span>
							</div>
							<span class="input input--hoshi">
								<input class="input__field input__field--hoshi" type="tel" name="phone">
								<label class="input__label input__label--hoshi input__label--hoshi-color-1" for="input-4">
									<span class="input__label-content input__label-content--hoshi">PHONE</span>
								</label>
							</span>
						</section>

						<div class="content_footer" style="heigth: 28px;">
							<input type="submit" class="btn" value="SIGNUP" style="border: hidden">
						</div>
						<a href="/WEB/login.do" class="btn" style="margin-top: 19.5px; margin-right: -8px; float: right; border-bottom-right-radius: 10px;">BACK</a>
					</div>
				</div>
			</div>

			<script src="js_front/imagesloaded.pkgd.min.js"></script>
			<script src="js_front/modernizr.custom.js"></script>
			<script src="js_front/charming.min.js"></script>
			<script src="js_front/anime.min.js"></script>
			<script src="js_front/start.js"></script>
			<script src="js_front/classie.js"></script>
			<script src="js_back/checkvalue.js"></script>

		</main>
	</form>


</body>
</html>