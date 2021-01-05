
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="fixedmenu.jsp" %>

<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta name="description" content="">
<meta name="keywords" content="">
<meta name="author" content="">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

<title>PLOC - Comunity</title>

<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/font-awesome.min.css">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/menubar.css">
<link rel="stylesheet" href="css/swiper-bundle.css">
<link rel="stylesheet" href="css/swiper-bundle-min.css">
<link rel="stylesheet" href="css/slider.css">

<link href="https://fonts.googleapis.com/css?family=Work+Sans:300,400,700" rel="stylesheet">


<div class="preloader">
	<div class="sk-spinner sk-spinner-wordpress">
		<span class="sk-inner-circle"></span>
	</div>
</div>

<div class="container navbar navbar-default navbar-static-top" role="navigation">

	<div class="navbar-header">
		<button class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
			<span class="icon icon-bar"></span>
			<span class="icon icon-bar"></span>
			<span class="icon icon-bar"></span>
		</button>
		<a href="index.do" class="navbar-brand">
			<img src="img/logo_header.gif">
		</a>
	</div>
	<div class="collapse navbar-collapse">
		<ul class="nav navbar-nav navbar-right">
			<li><a href="pubg.do">
					<img src="img/logo_pubg.jpg" alt="PUBG">
				</a></li>
			<li><a href="lol.do">
					<img src="img/logo_lol.jpg" alt="LOL">
				</a></li>
			<li><a href="overwatch.do">
					<img src="img/logo_ow.jpg" alt="OVERWATCH">
				</a></li>
		</ul>
	</div>

</div>
<div class="menubar_end"></div>

<div class='menubar'>
	<input type='checkbox' id='mmeennuu'>
	<label class='menu' for='mmeennuu'>

		<div class='barry'>
			<span class='bar'></span>
			<span class='bar'></span>
			<span class='bar'></span>
			<span class='bar'></span>
		</div>

		<ul>
			<li><a class='effect' id='board1' href='noticeboard.do'>공지</a></li>
			<li><a class='effect' id='board2' href='board_list.do'>자유</a></li>
			<li><a class='effect' id='close'>X</a></li>
			<li><a class='effect' id='board3' href='Shop.do'>상점</a></li>
			<li><a class='effect' id='board4' href='QNA.jsp'>Q&amp;A</a></li>
		</ul>


	</label>
</div>
<div class="menubar_end"></div>

<script src="js_front/jquery.js"></script>
<script src="js_front/bootstrap.min.js"></script>
<script src="js_front/custom.js"></script>
<script src="js_front/jquery-3.5.1.min.js"></script>
<script src="js_front/swiper-bundle.js"></script>
<script src="js_front/swiper-bundle-min.js"></script>
