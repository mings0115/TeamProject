<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
.img {
	width: 130px;
}

.tem {
	display: inline-block;
	width: 140px;
}
</style>

<div class="swiper-container">
	<div class="swiper-wrapper">
		<div class="swiper-slide">
			<img src="img/lol_banner.jpg">
		</div>
		<div class="swiper-slide">
			<img src="img/pubg_banner.jpg">
		</div>
		<div class="swiper-slide">
			<img src="img/overwatch_banner.jpg">
		</div>
		...
	</div>
	<div class="swiper-pagination"></div>
</div>

<script>
	var swiper = new Swiper('.swiper-container', {
		slidesPerView : 1,
		loop : true,
		spaceBetween : 30,
		centeredSlides : true,
		grabCursor : false,
		/* 		effect : 'cube',
		 cubeEffect : {
		 shadow : true,
		 slideShadows : true,
		 shadowOffset : 20,
		 shadowScale : 0.94,
		 }, */
		effect : 'fade',
		fadeEffect : {
			crossFade : true
		},

		autoplay : {
			delay : 3000,
			disableOnInteraction : false,
		},
		pagination : {
			el : '.swiper-pagination',
			clickable : true,
		}
	});
</script>

<c:if test="${sessionScope.sessionID == null}">
	<script>
		$(document).ready(function() {

			var msg = '로그인이 되어있지 않습니다.\n';
			msg += '로그인 폼으로 이동합니다';

			alert(msg);

			location.href = "login.do";

		});
	</script>
</c:if>

<div style="width: 50%; border-bottom: 2px solid #ccc; display: block; margin: 40 auto 40 auto;"></div>

<div class="conatiner">
	<!-- 	<div class="card text-white bg-primary mb-3" style="display: block; margin: 0 auto; width: 70%; text-align: center;"> -->
	<div class="card border-primary mb-3" style="display: block; margin: 0 auto; width: 70%; text-align: center;">
		<div class="card-header">BEST ICON</div>
		<div class="card-body" style="width: 100%; background-color: #fff">
			<div class="tem text-primary">
				<img src="original-Icon/d.va.png" style="height: 130px">
				<h4 class="card-title" style="font-weight: bold">디바 아이콘</h4>
				<p class="card-text">정체 모를 토끼입니다</p>
			</div>
			<div class="tem text-primary" style="margin: 0 200px;">
				<img src="original-Icon/demasia.png" class="img">
				<h4 class="card-title" style="font-weight: bold">데마시아 아이콘</h4>
				<p class="card-text">질서와 정의를 수호하는 데마시아 아이콘 입니다</p>
			</div>
			<div class="tem text-primary">
				<img src="original-Icon/future.png" class="img">
				<h4 class="card-title" style="font-weight: bold">치킨 아이콘</h4>
				<p class="card-text">왠지 모르게 맥주를 마시고 싶은 비주얼 입니다</p>
			</div>

		</div>
		<button type="button" class="btn btn-secondary" style="padding: 1em; margin-bottom: 10px; border: 1px solid #ccc;" onclick="javascript:location.href='Shop.do'">구매하러가기</button>
	</div>
</div>

<div style="width: 50%; border-bottom: 2px solid #ccc; display: block; margin: 40 auto 20 auto;"></div>

<section id="item">
	<div class="container">
		<div class="row">

			<div class="col-md-4 col-sm-6">
				<a href="https://www.pubg.com/ko/">
					<div class="item-thumb">
						<img src="img/pubg.jpg" class="img-responsive" alt="item">
						<div class="item-overlay">
							<div class="item-item">
								<h3>
									Player Unknown's<br>Battle Grounds
								</h3>
								<small>공식 홈페이지</small>
							</div>
						</div>
					</div>
				</a>
			</div>

			<div class="col-md-4 col-sm-6">
				<a href="https://kr.leagueoflegends.com/ko-kr/">
					<div class="item-thumb">
						<img src="img/lol.jpg" class="img-responsive" alt="item">
						<div class="item-overlay">
							<div class="item-item">
								<h3>
									League<br>Of<br>Legends
								</h3>
								<small>공식 홈페이지</small>
							</div>
						</div>
					</div>
				</a>
			</div>

			<div class="col-md-4 col-sm-6">
				<a href="https://playoverwatch.com/ko-kr/">
					<div class="item-thumb">
						<img src="img/overwatch.jpg" class="img-responsive" alt="item">
						<div class="item-overlay">
							<div class="item-item">
								<h3>Over Watch</h3>
								<small>공식 홈페이지</small>
							</div>
						</div>
					</div>
				</a>
			</div>

		</div>
	</div>
</section>

<%@ include file="footer.jsp"%>