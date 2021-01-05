<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en" class="no-js">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<title>Start Page</title>
<meta name="description" content="" />
<meta name="keywords" content="" />
<link href="https://fonts.googleapis.com/css?family=Nunito:400,700|Poppins" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="css/normalize.css" />
<link rel="stylesheet" type="text/css" href="css/font-awesome.min.css" />
<link rel="stylesheet" type="text/css" href="css/start.css" />
<link rel="stylesheet" type="text/css" href="css/input.css" />

<script src="js_front/jquery-3.5.1.min.js"></script>

<script>
	function checkValue() {

		frm = eval("document.frm");

		if (!frm.id.value) {
			alert("아이디를 입력하세요");
			frm.id.focus();
			return false;
		}
		if (!frm.pwd.value) {
			alert("비밀번호를 입력하세요");
			frm.pwd.foucs();
			return false;
		}

	}
</script>
</head>
<c:if test="${sessionScope.sessionID != null}">
	<script>
		$(document).ready(function() {

			var msg = '로그인이 되어있습니다.\n';
			msg += '메인페이지로 이동합니다';

			alert(msg);

			location.href = "index.do";

		});
	</script>
</c:if>
<body class="start loading">
	<main>
		<div class="clear"></div>
		<!-- /content -->
		<form action="/WEB/loginAccess.do" method="post" name="frm" onsubmit="return checkValue()">
			<div class="content content--fixed">
				<div class="content__inner">
					<div class="content__title--filled">
						<a href="/WEB/account.do" class="btn account" style="margin-top: -4px; margin-right: -8px;">ACCOUNT</a>
						<img alt="Loginlogo" src="img/logo_login1.jpg">
						<br>
						<div class="clear"></div>

						<section class="content_input">
							<span class="input input--hoshi">
								<input class="input__field input__field--hoshi" type="text" name="id" />
								<label class="input__label input__label--hoshi input__label--hoshi-color-1" for="input-4"> <span class="input__label-content input__label-content--hoshi">ID</span>
								</label>
							</span>
							<span class="input input--hoshi">
								<input class="input__field input__field--hoshi" type="password" name="pwd" />
								<label class="input__label input__label--hoshi input__label--hoshi-color-1" for="input-4"> <span class="input__label-content input__label-content--hoshi">PW</span>
								</label>
							</span>
						</section>

						<div class="content_footer">
							<input type="submit" class="btn" value="LOGIN" style="padding: 20px; border-radius: 3px; border: hidden; margin: 0;">
						</div>
					</div>
				</div>
			</div>

			<c:set var="failMessage" value="${requestScope.fail}" />
			<c:if test="${failMessage!=null}">
				<c:choose>
					<c:when test="${failMessage=='0'}">
						<br>
						<c:out value="<script>alert('비밀번호를 확인해주세요'); location.href='login.do';</script>" escapeXml="false" />
					</c:when>
					<c:otherwise>
						<br>
						<c:out value="<script>alert('아이디를 확인해주세요'); location.href='login.do';</script>" escapeXml="false" />
					</c:otherwise>
				</c:choose>
			</c:if>

		</form>

		<script src="js_front/imagesloaded.pkgd.min.js"></script>
		<script src="js_front/charming.min.js"></script>
		<script src="js_front/anime.min.js"></script>
		<script src="js_front/start.js"></script>
		<script src="js_front/classie.js"></script>
	</main>
</body>
</html>