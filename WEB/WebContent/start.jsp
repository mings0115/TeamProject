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
	$(function() {

		var timer;

		$('#start').click(function() {
			timer = setTimeout(function() {
				location.href = "login.do";
			}, 1800);
		});

	});
</script>

</head>
<body class="start loading">
	<main>
		<div class="content content--intro">
			<div class="content__inner">
				<p class="content__title">PUBG</p>
				<p class="content__title">LOL</p>
				<p class="content__title">OVERWATCH</p>
				<p class="content__title">COMUNITY SITE</p>
				<h3 class="content__subtitle">ARE YOU GOING TO START?</h3>
				<a href="#" class="enter" id="start">START</a>
				<!-- <input type="button" class="enter" value="START" id="start"> -->
			</div>
			<div class="shape-wrap">
				<svg class="shape" width="100%" height="100vh" preserveAspectRatio="none" viewBox="0 0 1440 800" xmlns:pathdata="http://www.codrops.com/">
						<path d="M -30.45,-43.86 -30.45,0 53.8,0 53.8,0 179.5,0 179.5,0 193.3,0 193.3,0 253.1,0 253.1,0 276.1,0 276.1,0 320.6,0 320.6,0 406.5,0 406.5,0 435.6,0 435.6,0 477,0 477,0 527.6,0 527.6,0 553.7,0 553.7,0 592,0 592,0 742.3,0 742.3,0 762.2,0 762.2,0 776,0 776,0 791.3,0 791.3,0 852.7,0 852.7,0 871.1,0 871.1,0 878.7,0 878.7,0 891,0 891,0 923.2,0 923.2,0 940.1,0 940.1,0 976.9,0 976.9,0 1031,0 1031,0 1041,0 1041,0 1176,0 1176,0 1192,0 1192,0 1210,0 1210,0 1225,0 1225,0 1236,0 1236,0 1248,0 1248,0 1273,0 1273,0 1291,0 1291,0 1316,0 1316,0 1337,0 1337,0 1356,0 1356,0 1414,0 1414,0 1432,0 1432,0 1486,0 1486,-43.86 Z"
						pathdata:id="M -30.45,-57.86 -30.45,442.6 53.8,443.8 53.8,396.3 179.5,396.3 179.5,654.7 193.3,654.7 193.3,589.1 253.1,589.1 253.1,561.6 276.1,561.6 276.1,531.2 320.6,531.2 320.6,238.6 406.5,238.6 406.5,213.9 435.6,213.9 435.6,246.2 477,246.2 477,289.9 527.6,289.9 527.6,263.3 553.7,263.3 553.7,280.4 592,280.4 592,189.2 742.3,189.2 742.3,259.5 762.2,259.5 762.2,103.7 776,103.7 776,77.11 791.3,77.11 791.3,18.21 852.7,18.21 852.7,86.61 871.1,86.61 871.1,231 878.7,240.5 878.7,320.3 891,320.3 891,434.3 923.2,434.3 923.2,145.5 940.1,145.5 940.1,117 976.9,117 976.9,139.8 1031,139.8 1031,284.2 1041,284.2 1041,242.4 1176,242.4 1176,282.3 1192,282.3 1192,641.4 1210,641.4 1210,692.7 1225,692.7 1225,599.6 1236,599.6 1236,527.4 1248,527.4 1248,500.8 1273,500.8 1273,523.6 1291,523.6 1291,652.8 1316,652.8 1316,533.1 1337,533.1 1337,502.7 1356,502.7 1356,523.6 1414,523.6 1414,491.3 1432,491.3 1432,523.6 1486,523.6 1486,-57.86 Z"
					></path>
					
					</svg>
			</div>
		</div>

				<div class="clear"></div>
		<!-- /content -->
		<form>
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
								<label class="input__label input__label--hoshi input__label--hoshi-color-1" for="input-4">
									<span class="input__label-content input__label-content--hoshi">ID</span>
								</label>
							</span>
							<span class="input input--hoshi">
								<input class="input__field input__field--hoshi" type="password" name="pwd" />
								<label class="input__label input__label--hoshi input__label--hoshi-color-1" for="input-4">
									<span class="input__label-content input__label-content--hoshi">PW</span>
								</label>
							</span>
						</section>

						<div class="content_footer">
							<input type="submit" class="btn" value="LOGIN" style="padding: 20px; border-radius: 3px; border: hidden; margin: 0;">
						</div>
					</div>
				</div>
			</div>

		<script src="js_front/imagesloaded.pkgd.min.js"></script>
		<script src="js_front/charming.min.js"></script>
		<script src="js_front/anime.min.js"></script>
		<script src="js_front/start.js"></script>
		<script src="js_front/classie.js"></script>

	</main>
</body>
</html>
