<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<style>
.most {
	border: 1px solid black;
	width: 20%;
}

td input {
	margin-left: 45px;
}

h2 {
	text-align: center;
}

.record-full div {
	border: 1px solid #ccc;
}

.record div, .record2 div {
	margin: 10px 0;
}

.record div {
	padding: 10px;
}

.record2 div {
	padding: 20px;
}

.record, .record2 {
	margin-top: 50px;
}

p {
	text-align: center;
	margin: 0px;
	padding: 0px;
}

.ow-record {
	width: 510px;
	padding-right: 20px;
	padding-bottom: 40px;
	padding-top: 50px;
	padding-left: 10px;
}

.ow-record .playerSummaryStat img {
	float: left;
	margin-right: 5px;
}

.record-text th {
	text-align: center;
}

.record-column1 {
	width: 200px;
	background-color: white;
}

.record-column2 {
	width: 170px;
	background-color: white;
	text-align: center;
}

.champ {
	background-color: #dadfe2;
	/* background-color: #c9e8ff; */
	border-color: #0089ef;
	border-radius: 0.6em;
	box-shadow: -2px 3px #b1b1b1;;
	height: 88px;
	color: #103553;
}

#span {
	font-size: 24px;
	font-weight: 700;
}

.ow-champ {
	font-size: 18px;
	font-weight: 600;
	display: inline-table;
}

.role-tier-image {
	color: #103553;
}
</style>


<div class="container" style="position: relative;">


	<form style="float: right; margin-top: 20px;">
		<input type="text" size="30" name="nickname" style="padding: 3px 0" />
		&nbsp;
		<input type="submit" value="검색" style="margin-right: 20px" class="btn btn-default">
	</form>

	<c:if test="${empty nickname }">
		<h2 style="font-weight: bold; margin-top: 70px; margin-bottom: 100px;">전적을 검색할 닉네임을 입력해주세요</h2>
	</c:if>


	<c:if test="${not empty nickname}">

		<div class="section-title" style="margin-top: 70px;">
			<h2 style="margin-bottom: 50px;">Over Watch</h2>

		</div>


		<div style="overflow-x: auto;">
			<table>
				<tr align="center">
					<td colspan="2" rowspan="3">
						<img src="ow-img/ow-main.png" style="width: 75%; float: right;">
						<div style="padding-top: 60px;">
							<div style="padding-right: 893px;">
								<input type="button" value="${profile.nickname }">
							</div>
							<p>NICKNAME</p>
							<img src="ow-img/owimg.jpg" style="width: 160px;">
							<div style="padding-right: 898px;">
								<p style="padding-left: 42px;">LEVEL</p>
								<input type="button" value="324">
							</div>
						</div>
						<br>
					</td>
				</tr>
			</table>

			<table class="record-full">
				<tr>
					<td class="ow-record" colspan="1">
						<div class="playerSummaryStat" style="border-bottom: none; background-color: white;">
							<img src="ow-img/${profile.p_rank }" style="width: 107px; padding-top: 10px; padding-left: 12px;">
							<h3 style="color: #103553;">
								<b style="padding-left: 11px;">${profile.rankname }</b> <br>
								<c:set var="score1" value="${profile.score1}" />
								<c:set var="score2" value="${profile.score2}" />
								<c:set var="score3" value="${profile.score3}" />
								<c:set var="score4" value="${(score1+score2+score3)/3}" />
								<c:choose>
									<c:when test="${score4 != 1 }">
										<fmt:formatNumber var="score5" value="${score4 }" pattern="0" />
										<span style="font-weight: 500; color: black; padding-left: 11px;">${score5}점</span>
									</c:when>
								</c:choose>
							</h3>
							<fmt:formatNumber var="test" value="${profile.p_level}" pattern="0" />
							<b style="padding-left: 11px;">${profile.p_level}위</b>
						</div>
						<div style="display: inline-flex; width: 100%; border: none;">
							<div class="record-column2" style="border-right: none;">
								<span style="color: #103553;">승률</span>

								<c:set var="total" value="0" />
								<c:forEach var="ow" items="${ow_record }" begin="0" end="5">
									<c:set var="size" value="${fn:length(ow_record)}" />
									<c:set var="a" value="${ow.win }" />
									<c:set var="b" value="${ow.loss }" />

									<c:set var="total" value="${total + (a/(a+b))}" />
								</c:forEach>
								<p>
									<c:out value="${((total* 100) / size)+((((total* 100) / size)%1>0.5)?(1-(((total* 100)
													 / size)%1))%1:-(((total* 100) / size)%1))}" />
									%
								</p>

								<c:set var="total1" value="0" />
								<c:set var="total2" value="0" />
								<c:forEach var="ow" items="${ow_record }" begin="0" end="5">
									<c:set var="a" value="${ow.win }" />
									<c:set var="b" value="${ow.loss }" />

									<c:set var="total1" value="${total1 + a}" />
									<c:set var="total2" value="${total2 + b}" />
								</c:forEach>
								<p>
									<c:out value="${total1}" />
									승
									<c:out value="${total2}" />
									패
								</p>
							</div>

							<div class="record-column2" style="border-right: none;">
								<span style="color: #103553;">K/D</span>
								<c:set var="total1" value="0" />
								<c:set var="total2" value="0" />
								<c:forEach var="ow" items="${score }" begin="0" end="5">
									<c:set var="size" value="${fn:length(score)}" />
									<c:set var="total1" value="${(total1 + ow.kill)}" />
									<c:set var="total2" value="${(total2 + ow.death)}" />
								</c:forEach>
								<p>
									<c:out value="${total1 / total2}" />
								</p>

								<c:set var="result1" value="0" />
								<c:set var="result2" value="0" />
								<c:forEach var="ow" items="${score }" begin="0" end="5">
									<c:set var="kill" value="${ow.kill }" />
									<c:set var="death" value="${ow.death }" />

									<c:set var="result1" value="${result1 + kill}" />
									<c:set var="result2" value="${result2 + death}" />
								</c:forEach>
								<p>
									<c:out value="${result1}" />
									킬
									<c:out value="${result2}" />
									데스
								</p>
							</div>


							<div class="record-column2">
								<span style="color: #103553;">플레이시간</span>
								<c:set var="total" value="0" />
								<c:forEach var="ow" items="${ow_record }" begin="0" end="5">
									<c:set var="total" value="${total + ow.gametime}" />
								</c:forEach>
								<p>
									<c:out value="${total}" />
									시간
								</p>

								<c:set var="total" value="0" />
								<c:forEach var="ow" items="${ow_record }" begin="0" end="5">
									<c:set var="sum" value="${ow.win + ow.loss }" />
									<c:set var="total" value="${total + sum}" />
								</c:forEach>
								<p>
									<c:out value="${total}" />
									게임
								</p>
							</div>

						</div>
					</td>

					<td style="display: inline-flex; text-align: center; padding-top: 50px;">
						<div class="record-column1" style="padding-bottom: 12px;">
							<div style="border: none;">
								<img src="ow-img/${profile.p_rank }" width="80px">
							</div>
							<img src="ow-img/ow_tank.png" width="20px">
							<b class="role-tier-image">${profile.rankname }</b> <br> <b>${profile.score1 }점</b> <br>
							<c:set var="total1" value="0" />
							<c:set var="total2" value="0" />
							<c:forEach var="ow" items="${ow_record }" end="0">
								<c:set var="a" value="${ow.win }" />
								<c:set var="b" value="${ow.loss }" />

								<c:set var="total1" value="${total1 + a}" />
								<c:set var="total2" value="${total2 + b}" />
							</c:forEach>

							<c:set var="total3" value="0" />
							<c:set var="total4" value="0" />
							<c:forEach var="ow" items="${ow_record }" begin="2" end="2">
								<c:set var="c" value="${ow.win }" />
								<c:set var="d" value="${ow.loss }" />

								<c:set var="total3" value="${total3 + c}" />
								<c:set var="total4" value="${total4 + d}" />
							</c:forEach>
							<span style="color: gray;">
								<c:out value="${ ((total1 + total3) / ((total1 + total3) +(total2 + total4)))* 
														100+((((total1 + total3) / ((total1 + total3) +(total2 + total4)))* 100%1>0.5)?
														(1-(((total1 + total3) / ((total1 + total3) +(total2 + total4)))* 100%1))%1:-
														(((total1 + total3) / ((total1 + total3) +(total2 + total4)))* 100%1))}" />
								%
							</span>

							<br>
							<c:set var="total1" value="0" />
							<c:set var="total2" value="0" />
							<c:forEach var="ow" items="${ow_record }" end="0">
								<c:set var="a" value="${ow.win }" />
								<c:set var="b" value="${ow.loss }" />

								<c:set var="total1" value="${total1 + a}" />
								<c:set var="total2" value="${total2 + b}" />
							</c:forEach>

							<c:set var="total3" value="0" />
							<c:set var="total4" value="0" />
							<c:forEach var="ow" items="${ow_record }" begin="2" end="2">
								<c:set var="c" value="${ow.win }" />
								<c:set var="d" value="${ow.loss }" />

								<c:set var="total3" value="${total3 + c}" />
								<c:set var="total4" value="${total4 + d}" />
							</c:forEach>
							<span style="color: gray;">
								<c:out value="${total1 + total3}" />
								승
								<c:out value="${total2 + total4}" />
								패
							</span>

							<br>
							<c:set var="total1" value="0" />
							<c:set var="total2" value="0" />
							<c:forEach var="ow" items="${score }" end="0">
								<c:set var="size" value="${fn:length(score)}" />
								<c:set var="total1" value="${(total1 + ow.kill)}" />
								<c:set var="total2" value="${(total2 + ow.death)}" />
							</c:forEach>
							<c:set var="total3" value="0" />
							<c:set var="total4" value="0" />
							<c:forEach var="ow" items="${score }" begin="2" end="2">
								<c:set var="size" value="${fn:length(score)}" />
								<c:set var="total3" value="${(total3 + ow.kill)}" />
								<c:set var="total4" value="${(total4 + ow.death)}" />
							</c:forEach>

							<span style="color: gray;">
								K/D(
								<c:out value="
													${((total1 + total3) / (total2 + total4))+((((total1 + total3) / (total2 + total4))%1>0.5)
													?(1-(((total1 + total3) / (total2 + total4))%1))%1:-(((total1 + total3) / (total2 + total4))%1))}" />
								)
							</span>


						</div>

						<div class="record-column1" style="border-right: none; border-left: none;">
							<div style="border: none;">
								<img src="ow-img/${profile.p_rank }" width="80px">
							</div>
							<img src="ow-img/ow_attack.png" width="20px">
							<b class="role-tier-image">${profile.rankname }</b> <br> <b>${profile.score2 }점 </b> <br>
							<c:set var="total1" value="0" />
							<c:set var="total2" value="0" />
							<c:forEach var="ow" items="${ow_record }" begin="1" end="1">
								<c:set var="a" value="${ow.win }" />
								<c:set var="b" value="${ow.loss }" />

								<c:set var="total1" value="${total1 + a}" />
								<c:set var="total2" value="${total2 + b}" />
							</c:forEach>

							<c:set var="total3" value="0" />
							<c:set var="total4" value="0" />
							<c:forEach var="ow" items="${ow_record }" begin="4" end="4">
								<c:set var="c" value="${ow.win }" />
								<c:set var="d" value="${ow.loss }" />

								<c:set var="total3" value="${total3 + c}" />
								<c:set var="total4" value="${total4 + d}" />
							</c:forEach>
							<span style="color: gray;">
								<c:out value="${ ((total1 + total3) / ((total1 + total3) +(total2 + total4)))* 
														100+((((total1 + total3) / ((total1 + total3) +(total2 + total4)))* 100%1>0.5)?
														(1-(((total1 + total3) / ((total1 + total3) +(total2 + total4)))* 100%1))%1:-
														(((total1 + total3) / ((total1 + total3) +(total2 + total4)))* 100%1))}" />
								%
							</span>
							<br>
							<c:set var="total1" value="0" />
							<c:set var="total2" value="0" />
							<c:forEach var="ow" items="${ow_record }" begin="1" end="1">
								<c:set var="a" value="${ow.win }" />
								<c:set var="b" value="${ow.loss }" />

								<c:set var="total1" value="${total1 + a}" />
								<c:set var="total2" value="${total2 + b}" />
							</c:forEach>

							<c:set var="total3" value="0" />
							<c:set var="total4" value="0" />
							<c:forEach var="ow" items="${ow_record }" begin="4" end="4">
								<c:set var="c" value="${ow.win }" />
								<c:set var="d" value="${ow.loss }" />

								<c:set var="total3" value="${total3 + c}" />
								<c:set var="total4" value="${total4 + d}" />
							</c:forEach>
							<span style="color: gray;">
								<c:out value="${total1 + total3}" />
								승
								<c:out value="${total2 + total4}" />
								패
							</span>
							<br>
							<c:set var="total1" value="0" />
							<c:set var="total2" value="0" />
							<c:forEach var="ow" items="${score }" begin="1" end="1">
								<c:set var="size" value="${fn:length(score)}" />
								<c:set var="total1" value="${(total1 + ow.kill)}" />
								<c:set var="total2" value="${(total2 + ow.death)}" />
							</c:forEach>
							<c:set var="total3" value="0" />
							<c:set var="total4" value="0" />
							<c:forEach var="ow" items="${score }" begin="4" end="4">
								<c:set var="size" value="${fn:length(score)}" />
								<c:set var="total3" value="${(total3 + ow.kill)}" />
								<c:set var="total4" value="${(total4 + ow.death)}" />
							</c:forEach>

							<span style="color: gray;">
								K/D(
								<c:out value="
													${((total1 + total3) / (total2 + total4))+((((total1 + total3) / (total2 + total4))%1>0.5)
													?(1-(((total1 + total3) / (total2 + total4))%1))%1:-(((total1 + total3) / (total2 + total4))%1))}" />
								)
							</span>
						</div>

						<div class="record-column1">
							<div style="border: none;">
								<img src="ow-img/${profile.p_rank }" width="80px">
							</div>
							<img src="ow-img/ow_support.png" width="20px">
							<b class="role-tier-image">${profile.rankname }</b> <br> <b>${profile.score3 }점 </b> <br>
							<c:set var="total1" value="0" />
							<c:set var="total2" value="0" />
							<c:forEach var="ow" items="${ow_record }" begin="3" end="3">
								<c:set var="a" value="${ow.win }" />
								<c:set var="b" value="${ow.loss }" />

								<c:set var="total1" value="${total1 + a}" />
								<c:set var="total2" value="${total2 + b}" />
							</c:forEach>

							<c:set var="total3" value="0" />
							<c:set var="total4" value="0" />
							<c:forEach var="ow" items="${ow_record }" begin="5" end="5">
								<c:set var="c" value="${ow.win }" />
								<c:set var="d" value="${ow.loss }" />

								<c:set var="total3" value="${total3 + c}" />
								<c:set var="total4" value="${total4 + d}" />
							</c:forEach>
							<span style="color: gray;">
								<c:out value="${ ((total1 + total3) / ((total1 + total3) +(total2 + total4)))* 
														100+((((total1 + total3) / ((total1 + total3) +(total2 + total4)))* 100%1>0.5)?
														(1-(((total1 + total3) / ((total1 + total3) +(total2 + total4)))* 100%1))%1:-
														(((total1 + total3) / ((total1 + total3) +(total2 + total4)))* 100%1))}" />
								%
							</span>
							<br>
							<c:set var="total1" value="0" />
							<c:set var="total2" value="0" />
							<c:forEach var="ow" items="${ow_record }" begin="3" end="3">
								<c:set var="a" value="${ow.win }" />
								<c:set var="b" value="${ow.loss }" />

								<c:set var="total1" value="${total1 + a}" />
								<c:set var="total2" value="${total2 + b}" />
							</c:forEach>

							<c:set var="total3" value="0" />
							<c:set var="total4" value="0" />
							<c:forEach var="ow" items="${ow_record }" begin="5" end="5">
								<c:set var="c" value="${ow.win }" />
								<c:set var="d" value="${ow.loss }" />

								<c:set var="total3" value="${total3 + c}" />
								<c:set var="total4" value="${total4 + d}" />
							</c:forEach>
							<span style="color: gray;">
								<c:out value="${total1 + total3}" />
								승
								<c:out value="${total2 + total4}" />
								패
							</span>
							<br>
							<c:set var="total1" value="0" />
							<c:set var="total2" value="0" />
							<c:forEach var="ow" items="${score }" begin="3" end="3">
								<c:set var="size" value="${fn:length(score)}" />
								<c:set var="total1" value="${(total1 + ow.kill)}" />
								<c:set var="total2" value="${(total2 + ow.death)}" />
							</c:forEach>
							<c:set var="total3" value="0" />
							<c:set var="total4" value="0" />
							<c:forEach var="ow" items="${score }" begin="5" end="5">
								<c:set var="size" value="${fn:length(score)}" />
								<c:set var="total3" value="${(total3 + ow.kill)}" />
								<c:set var="total4" value="${(total4 + ow.death)}" />
							</c:forEach>

							<span style="color: gray;">
								K/D(
								<c:out value="
													${((total1 + total3) / (total2 + total4))+((((total1 + total3) / (total2 + total4))%1>0.5)
													?(1-(((total1 + total3) / (total2 + total4))%1))%1:-(((total1 + total3) / (total2 + total4))%1))}" />
								)
							</span>
						</div>
					</td>
				</tr>
			</table>


			<table class="record-fu" style="width: 1140px;">
				<h3 style="text-align: center; color: gray; padding-top: 30px; padding-bottom: 20px;">경쟁전 실력 평점</h3>
				<thead style="background-color: #dadfe2; color: gray;">
					<tr class="record-text" style="border-top: 1px solid #ccc; border-bottom: 1px solid #ccc;">
						<th style="width: 235px;">영웅</th>
						<th>승</th>
						<th style="width: 162px;">패</th>
						<th style="width: 110px;">승률</th>
						<th style="width: 175px;">K/D</th>
						<th>명중률</th>
						<th>플레이시간</th>
					</tr>
				</thead>
				<tr>
					<td class="record2" colspan="7">


						<c:forEach var="ow" items="${record }" varStatus="status">

							<c:if test="${status.index == 0 }">
								<c:forEach var="img" items="${img }" end="0">
									<div class="champ">
										<img src="ow-img/${img}" style="width: 40px;">
								</c:forEach>
							</c:if>
							<c:if test="${status.index == 1 }">
								<c:forEach var="img" items="${img }" begin="1" end="1">
									<div class="champ">
										<img src="ow-img/${img}" style="width: 40px;">
								</c:forEach>
							</c:if>
							<c:if test="${status.index == 2 }">
								<c:forEach var="img" items="${img }" begin="2" end="2">
									<div class="champ">
										<img src="ow-img/${img}" style="width: 40px;">
								</c:forEach>
							</c:if>
							<c:if test="${status.index == 3 }">
								<c:forEach var="img" items="${img }" begin="3" end="3">
									<div class="champ">
										<img src="ow-img/${img}" style="width: 40px;">
								</c:forEach>
							</c:if>
							<c:if test="${status.index == 4 }">
								<c:forEach var="img" items="${img }" begin="4" end="4">
									<div class="champ">
										<img src="ow-img/${img}" style="width: 40px;">
								</c:forEach>
							</c:if>
							<c:if test="${status.index == 5 }">
								<c:forEach var="img" items="${img }" begin="5" end="5">
									<div class="champ">
										<img src="ow-img/${img}" style="width: 40px;">
								</c:forEach>
							</c:if>


							<c:if test="${status.index == 0 }">
								<c:forEach var="ow" items="${champ }" end="0">
									<img src="ow-img/${ow.champtype2}" style="width: 15px;">
									<div class="ow-champ" style="width: 157px;">${ow.champname }</div>
								</c:forEach>
							</c:if>
							<c:if test="${status.index == 1 }">
								<c:forEach var="ow" items="${champ }" begin="1" end="1">
									<img src="ow-img/${ow.champtype2}" style="width: 15px;">
									<div class="ow-champ" style="width: 157px;">${ow.champname }</div>
								</c:forEach>
							</c:if>
							<c:if test="${status.index == 2 }">
								<c:forEach var="ow" items="${champ }" begin="2" end="2">
									<img src="ow-img/${ow.champtype2}" style="width: 15px;">
									<div class="ow-champ" style="width: 157px;">${ow.champname }</div>
								</c:forEach>
							</c:if>
							<c:if test="${status.index == 3 }">
								<c:forEach var="ow" items="${champ }" begin="3" end="3">
									<img src="ow-img/${ow.champtype2}" style="width: 15px;">
									<div class="ow-champ" style="width: 157px;">${ow.champname }</div>
								</c:forEach>
							</c:if>
							<c:if test="${status.index == 4 }">
								<c:forEach var="ow" items="${champ }" begin="4" end="4">
									<img src="ow-img/${ow.champtype2}" style="width: 15px;">
									<div class="ow-champ" style="width: 157px;">${ow.champname }</div>
								</c:forEach>
							</c:if>
							<c:if test="${status.index == 5 }">
								<c:forEach var="ow" items="${champ }" begin="5" end="5">
									<img src="ow-img/${ow.champtype2}" style="width: 15px;">
									<div class="ow-champ" style="width: 157px;">${ow.champname }</div>
								</c:forEach>
							</c:if>


							<c:if test="${status.index == 0 }">
								<c:forEach var="ow" items="${ow_record }" end="0">
									<div class="ow-champ" style="width: 103px; color: #1f8ecd;">${ow.win }</div>
									<div class="ow-champ" style="width: 123px;">${ow.loss }</div>

									<c:set var="a" value="${ow.win }" />
									<c:set var="b" value="${ow.loss}" />
									<c:set var="c" value="${(a/(a+b)) * 100}" />
									<c:set var="result" value="${c+((c%1>0.5)?(1-(c%1))%1:-(c%1)) }" />

									<div class="ow-champ" style="width: 134px;">${result}%</div>

								</c:forEach>
							</c:if>
							<c:if test="${status.index == 1}">
								<c:forEach var="ow" items="${ow_record }" begin="1" end="1">
									<div class="ow-champ" style="width: 103px; color: #1f8ecd;">${ow.win }</div>
									<div class="ow-champ" style="width: 123px;">${ow.loss }</div>

									<c:set var="a" value="${ow.win }" />
									<c:set var="b" value="${ow.loss}" />
									<c:set var="c" value="${(a/(a+b)) * 100}" />
									<c:set var="result" value="${c+((c%1>0.5)?(1-(c%1))%1:-(c%1)) }" />

									<div class="ow-champ" style="width: 134px;">${result}%</div>

								</c:forEach>
							</c:if>
							<c:if test="${status.index == 2}">
								<c:forEach var="ow" items="${ow_record }" begin="2" end="2">
									<div class="ow-champ" style="width: 103px; color: #1f8ecd;">${ow.win }</div>
									<div class="ow-champ" style="width: 123px;">${ow.loss }</div>

									<c:set var="a" value="${ow.win }" />
									<c:set var="b" value="${ow.loss}" />
									<c:set var="c" value="${(a/(a+b)) * 100}" />
									<c:set var="result" value="${c+((c%1>0.5)?(1-(c%1))%1:-(c%1)) }" />

									<div class="ow-champ" style="width: 134px;">${result}%</div>

								</c:forEach>
							</c:if>
							<c:if test="${status.index == 3}">
								<c:forEach var="ow" items="${ow_record }" begin="3" end="3">
									<div class="ow-champ" style="width: 103px; color: #1f8ecd;">${ow.win }</div>
									<div class="ow-champ" style="width: 123px;">${ow.loss }</div>

									<c:set var="a" value="${ow.win }" />
									<c:set var="b" value="${ow.loss}" />
									<c:set var="c" value="${(a/(a+b)) * 100}" />
									<c:set var="result" value="${c+((c%1>0.5)?(1-(c%1))%1:-(c%1)) }" />

									<div class="ow-champ" style="width: 134px;">${result}%</div>

								</c:forEach>
							</c:if>
							<c:if test="${status.index == 4}">
								<c:forEach var="ow" items="${ow_record }" begin="4" end="4">
									<div class="ow-champ" style="width: 103px; color: #1f8ecd;">${ow.win }</div>
									<div class="ow-champ" style="width: 123px;">${ow.loss }</div>

									<c:set var="a" value="${ow.win }" />
									<c:set var="b" value="${ow.loss}" />
									<c:set var="c" value="${(a/(a+b)) * 100}" />
									<c:set var="result" value="${c+((c%1>0.5)?(1-(c%1))%1:-(c%1)) }" />

									<div class="ow-champ" style="width: 134px;">${result}%</div>

								</c:forEach>
							</c:if>
							<c:if test="${status.index == 5}">
								<c:forEach var="ow" items="${ow_record }" begin="5" end="5">
									<div class="ow-champ" style="width: 103px; color: #1f8ecd;">${ow.win }</div>
									<div class="ow-champ" style="width: 123px;">${ow.loss }</div>

									<c:set var="a" value="${ow.win }" />
									<c:set var="b" value="${ow.loss}" />
									<c:set var="c" value="${(a/(a+b)) * 100}" />
									<c:set var="result" value="${c+((c%1>0.5)?(1-(c%1))%1:-(c%1)) }" />

									<div class="ow-champ" style="width: 134px;">${result}%</div>

								</c:forEach>
							</c:if>


							<c:if test="${status.index == 0 }">
								<c:forEach var="ow" items="${score }" end="0">
									<c:set var="total" value="${ow.kill / ow.death }" />
									<c:set var="result" value="${total+((total%1>0.5)?(1-(total%1))%1:-(total%1)) }" />

									<div class="ow-champ" style="width: 159px; color: #2daf7f">${result}</div>

								</c:forEach>
							</c:if>
							<c:if test="${status.index == 1 }">
								<c:forEach var="ow" items="${score }" begin="1" end="1">

									<c:set var="total" value="${ow.kill / ow.death }" />
									<c:set var="result" value="${total+((total%1>0.5)?(1-(total%1))%1:-(total%1)) }" />

									<div class="ow-champ" style="width: 159px; color: #2daf7f">${result}</div>

								</c:forEach>
							</c:if>
							<c:if test="${status.index == 2 }">
								<c:forEach var="ow" items="${score }" begin="2" end="2">

									<c:set var="total" value="${ow.kill / ow.death }" />
									<c:set var="result" value="${total+((total%1>0.5)?(1-(total%1))%1:-(total%1)) }" />

									<div class="ow-champ" style="width: 159px; color: #2daf7f">${result}</div>

								</c:forEach>
							</c:if>
							<c:if test="${status.index == 3 }">
								<c:forEach var="ow" items="${score }" begin="3" end="3">

									<c:set var="total" value="${ow.kill / ow.death }" />
									<c:set var="result" value="${total+((total%1>0.5)?(1-(total%1))%1:-(total%1)) }" />

									<div class="ow-champ" style="width: 159px; color: #2daf7f">${result}</div>

								</c:forEach>
							</c:if>
							<c:if test="${status.index == 4 }">
								<c:forEach var="ow" items="${score }" begin="4" end="4">

									<c:set var="total" value="${ow.kill / ow.death }" />
									<c:set var="result" value="${total+((total%1>0.5)?(1-(total%1))%1:-(total%1)) }" />

									<div class="ow-champ" style="width: 159px; color: #2daf7f">${result}</div>

								</c:forEach>
							</c:if>
							<c:if test="${status.index == 5 }">
								<c:forEach var="ow" items="${score }" begin="5" end="5">

									<c:set var="total" value="${ow.kill / ow.death }" />
									<c:set var="result" value="${total+((total%1>0.5)?(1-(total%1))%1:-(total%1)) }" />

									<div class="ow-champ" style="width: 159px; color: #2daf7f">${result}</div>

								</c:forEach>
							</c:if>



							<c:if test="${status.index == 0 }">
								<c:forEach var="ow" items="${ow_record}" end="0">
									<div class="ow-champ" style="width: 183px;">${ow.accuracyrate }%</div>
									<div class="ow-champ">${ow.gametime }시간</div>
								</c:forEach>
							</c:if>
							<c:if test="${status.index == 1 }">
								<c:forEach var="ow" items="${ow_record}" begin="1" end="1">
									<div class="ow-champ" style="width: 183px;">${ow.accuracyrate }%</div>
									<div class="ow-champ">${ow.gametime }시간</div>
								</c:forEach>
							</c:if>
							<c:if test="${status.index == 2 }">
								<c:forEach var="ow" items="${ow_record}" begin="2" end="2">
									<div class="ow-champ" style="width: 183px;">${ow.accuracyrate }%</div>
									<div class="ow-champ">${ow.gametime }시간</div>
								</c:forEach>
							</c:if>
							<c:if test="${status.index == 3 }">
								<c:forEach var="ow" items="${ow_record}" begin="3" end="3">
									<div class="ow-champ" style="width: 183px;">${ow.accuracyrate }%</div>
									<div class="ow-champ">${ow.gametime }시간</div>
								</c:forEach>
							</c:if>
							<c:if test="${status.index == 4 }">
								<c:forEach var="ow" items="${ow_record}" begin="4" end="4">
									<div class="ow-champ" style="width: 183px;">${ow.accuracyrate }%</div>
									<div class="ow-champ">${ow.gametime }시간</div>
								</c:forEach>
							</c:if>
							<c:if test="${status.index == 5 }">
								<c:forEach var="ow" items="${ow_record}" begin="5" end="5">
									<div class="ow-champ" style="width: 183px;">${ow.accuracyrate }%</div>
									<div class="ow-champ">${ow.gametime }시간</div>
								</c:forEach>
							</c:if>
							</div>
							</div>
							</div>
							</div>
							</div>
							</div>
						</c:forEach>
					</td>
			</table>

		</div>
	</c:if>
</div>

<%@ include file="footer.jsp"%>