<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fn"%>
<!DOCTYPE html>
<style>
div, p, span, button {
	font-family: Helvetica, "Malgun Gothic", "Apple SD Gothic Neo",
		AppleGothic, Dotum, Arial, Tahoma;
}

.most {
	border: 1px solid black;
	width: 20%;
}

td {
	
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
	padding: 30px;
}

.record, .record2 {
	margin-top: 50px;
}

.record2 {
	display: block;
	width: 80%;
	float: right;
}

p {
	text-align: center;
}

.champ {
	display: block;
	width: 100%;
	height: 100%;
	background: #000;
}

.rank {
	width: 175px;
}

.icon-position {
	width: 40px;
}

pre {
	width: 190px;
	text-align: center;
	font-weight: bold;
	font-size: 14px;
	margin: 10 0px;
}

.rank {
	font-size: 26px;
}

.mainimg {
	background: url(lol/main.png) no-repeat right;
	background-size: contain;
	height: 350px;
	border-radius: 500px;
}

.content {
	display: table;
	width: 1100px;
	border-collapse: collapse;
	border: 1px solid #cdd2d2;
	table-layout: fixed;
	margin-top: 7px;
}

.content>div {
	display: table-cell;
	height: 96px;
	vertical-align: middle;
	text-align: center;
}

.content>.gamestats {
	text-align: center;
	font-size: 14px;
	color: #555;
	line-height: 16px;
}

.content>.gamestats>.type {
	font-weight: bold;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
	text-align: center;
}

.content>.gamestats>.bar {
	display: block;
	width: 27px;
	margin: 5px auto;
	height: 2px;
	background: rgb(205, 210, 210);
}

.content>.gamesetting {
	width: 200px;
	font-size: 0;
}

.champimg {
	display: inline-block;
	width: 46px;
	height: 46px;
	vertical-align: middle;
	border-radius: 50%;
	overflow: hidden;
}

.content>.gamesetting>.spells {
	display: inline-block;
	vertical-align: middle;
	margin-left: 4px;
}

.content>.gamesetting>.spells>.spell:first-child {
	margin-left: 0;
}

.content>.gamesetting>.spells>.spell {
	display: block;
	width: 22px;
	height: 22px;
	margin-top: 2px;
	border-radius: 3px;
	overflow: hidden;
}

.content>.gamesetting>.spells>.spell>.img {
	display: block;
	width: 100%;
	height: 100%;
}

.content>.gamesetting>.runes {
	display: inline-block;
	vertical-align: middle;
	margin-left: 4px;
}

.content>.gamesetting>.runes:first-child {
	margin-top: 0;
}

.content>.gamesetting>.runes>.rune {
	width: 22px;
	height: 22px;
	margin-top: 2px;
}

.content>.gamesetting>.runes>.rune>.img {
	display: block;
	width: 100%;
	height: 100%;
	border-radius: 50%;
}

.content>.gamesetting>.champname {
	margin-top: 8px;
	font-size: 11px;
	color: #555;
	text-align: center;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}

.gamewrap {
	position: relative;
	border-radius: 3px;
	margin-bottom: 8px;
	display: inline-block;
	width: 690px;
	margin-left: 10px;
	font-size: 12px;
	vertical-align: top;
}

.content>.kda {
	font-size: 11px;
	text-align: center;
	color: #879292;
	font-size: 15px;
	white-space: nowrap;
}

.content>.kda>.kill {
	color: #555e5e;
	font-weight: bold;
}

.content>.kda>.death {
	color: #c6443e;
	font-weight: bold;
}

.content>.kda>.assist {
	color: #555e5e;
	font-variant: bold;
}

.content>.kda>.ratio {
	color: #555e5e;
	font-size: 12px;
	font-weight: bold;
	margin-top: 6px;
}

.content>.kda>.ratio>.ratio {
	color: #353a3a;
}

.badges {
	display: inline-block;
	color: #fff;
	margin: 8px auto 0;
	font-size: 13px;
}

.stats {
	width: 90px;
	font-size: 11px;
	text-align: center;
	line-height: 18px;
	color: #555e5e;
}

.badges .ACE {
	border-radius: 9px;
	background-color: #8c51c5;
	border: solid 1px #7f3590;
}

.badges .MVP {
	border-radius: 9px;
	background-color: #e19205;
	border: solid 1px #b88a2a;
}

.badges .Text {
	border-radius: 7px;
	display: inline-block;
	padding: 2px 5px;
	line-height: 1;
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
			<h2 style="margin-bottom: 50px;">League Of Legend</h2>
			<input type="button" value="REFRESH" class="btn btn-default" style="margin: 0 10px; padding: 20px 40px; font-size: 20px; float: left;">
		</div>

		<br>
		<table class="mainimg">
			<tr>
				<td colspan="3" style="width: 1200px">
					<pre style="margin-left: 5px">${profile.nickname }</pre>
					<p style="border-bottom: 1px solid #ccc; width: 188px;">NICKNAME</p>
					<!-- <img src="lol/ezmain.png" style="width: 75%; float: right;"> -->
					<pre style="width: 200px; display: table;">
						<img src="gameimg/${profile.p_rank }" class="rank">
					</pre>
					<p style="border-bottom: 1px solid #ccc; width: 188px;">RANK</p>
					<pre class="rank text-primary" style="margin-left: 7px; border: solid;">${profile.rankname}</pre>
					<br>
				</td>
			</tr>
		</table>
		<table class="record-full" style="width: 100%; margin-top: 3px;">

			<tr style="border-top: 1px solid #ccc;">
				<td class="record" rowspan="3">
					<div>
						<h2>선호챔피언</h2>
					</div>

					<div style="text-align: center; display: -webkit-inline-box; width: 100%">
						<c:forEach var="champ" items="${champ }" varStatus="status">
							<div style="display: block; margin: 0 auto;">
								<p>

									<c:if test="${status.index == 0 }">
										<c:forEach var="img" items="${img }" begin="4" end="4">
											<img src="lol/${img}" class="champ">
										</c:forEach>
									</c:if>
									<c:if test="${status.index == 1 }">
										<c:forEach var="img" items="${img }" end="0">
											<img src="lol/${img}" class="champ">
										</c:forEach>
									</c:if>
									<c:if test="${status.index == 2 }">
										<c:forEach var="img" items="${img }" begin="1" end="1">
											<img src="lol/${img}" class="champ">
										</c:forEach>
									</c:if>
									<c:if test="${status.index == 3 }">
										<c:forEach var="img" items="${img }" begin="2" end="2">
											<img src="lol/${img}" class="champ">
										</c:forEach>
									</c:if>
									<c:if test="${status.index == 4 }">
										<c:forEach var="img" items="${img }" begin="3" end="3">
											<img src="lol/${img}" class="champ">
										</c:forEach>
									</c:if>

									&nbsp;${champ.champname}
								</p>
								<p style="text-align: center;">
								<h3>포지션</h3>
								<img src="lol/${champ.champtype1 }" class="icon-position">
								/
								<img src="lol/${champ.champtype2 }" class="icon-position">
								</p>
							</div>
						</c:forEach>
					</div>
				</td>
			</tr>
		</table>
		<h2 style="border-top: 1px solid #ccc; margin-top: 5px; padding-top: 12px;">게임전적</h2>
		<div class="gamewrap clear">
			<c:forEach var="record" items="${record }" varStatus="status">
				<c:choose>
					<c:when test="${record.result eq 0 }">
						<div class="content" style="background-color: #e2b6b3; border-color: #cea7a7;">
							<div class="gamestats">
								<div class="type">${record.gametype }</div>
								<div class="bar"></div>
								<div style="color: #c6443e; font-weight: bold;">패배</div>
								<div>${record.startdate}</div>
							</div>
							<div class="gamesetting">
								<div class="champimg">
									<c:if test="${status.index == 0 }">
										<c:forEach var="img" items="${img }" begin="4" end="4">
											<img src="lol/${img}" class="champ">
										</c:forEach>
									</c:if>
									<c:if test="${status.index == 3 }">
										<c:forEach var="img" items="${img }" begin="2" end="2">
											<img src="lol/${img}" class="champ">
										</c:forEach>
									</c:if>

								</div>
								<div class="spells">
									<c:if test="${status.index == 0 }">
										<c:forEach var="lol" items="${lol_record }" end="0">
											<div class="spell">
												<img src="lol/${lol.spell1}" class="img">
											</div>
											<div class="spell">
												<img src="lol/${lol.spell2}" class="img">
											</div>
										</c:forEach>
									</c:if>

									<c:if test="${status.index == 3 }">
										<c:forEach var="lol" items="${lol_record }" begin="3" end="3">
											<div class="spell">
												<img src="lol/${lol.spell1}" class="img">
											</div>
											<div class="spell">
												<img src="lol/${lol.spell2}" class="img">
											</div>
										</c:forEach>
									</c:if>

								</div>
								<div class="runes">
									<c:if test="${status.index == 0 }">
										<c:forEach var="lol" items="${lol_record }" end="0">
											<div class="rune">
												<img src="lol/${lol.property1 }" class="img">
											</div>
											<div class="rune">
												<img src="lol/${lol.property2 }" class="img">
											</div>
										</c:forEach>
									</c:if>

									<c:if test="${status.index == 3 }">
										<c:forEach var="lol" items="${lol_record }" begin="3" end="3">
											<div class="rune">
												<img src="lol/${lol.property1 }" class="img">
											</div>
											<div class="rune">
												<img src="lol/${lol.property2 }" class="img">
											</div>
										</c:forEach>
									</c:if>
								</div>
								<div class="champname">${record.champ}</div>
							</div>
							<div class="kda">
								<div style="font-size: 12px;">Kill Death Assist</div>
								<c:if test="${status.index == 0 }">
									<c:forEach var="score" items="${score}" end="0">
										<span class="kill"> ${score.kill} </span> /
									<span class="death"> ${score.death} </span> /
									<span class="assist"> ${score.assist} </span>
										<div>KDA (${(score.kill + score.assist) / score.death})</div>
									</c:forEach>
								</c:if>
								<c:if test="${status.index == 3 }">
									<c:forEach var="score" items="${score}" begin="3" end="3">
										<span class="kill"> ${score.kill} </span> /
									<span class="death"> ${score.death} </span> /
									<span class="assist"> ${score.assist} </span>
										<div>KDA (${(score.kill + score.assist) / score.death})</div>
									</c:forEach>
								</c:if>
							</div>

							<div class="level">
								<div style="color: #879292">DAMAGE</div>
								<span style="font-size: 14px">
									<c:out value="${record.damage}" />
								</span>
							</div>

							<div class="cs">
								<c:if test="${status.index == 0 }">
									<c:forEach var="lol" items="${lol_record }" end="0">
										<div style="color: #879292">CS</div>
										<span style="font-size: 14px">${lol.cs} CS</span>
									</c:forEach>
								</c:if>
								<c:if test="${status.index == 3 }">
									<c:forEach var="lol" items="${lol_record }" begin="3" end="3">
										<div style="color: #879292">CS</div>
										<span style="font-size: 14px">${lol.cs} CS</span>
									</c:forEach>
								</c:if>
							</div>

							<div class="badges">
								<div style="font-size: 12px; color: #879292">GRADE</div>
								<c:choose>
									<c:when test="${record.mvp eq 1 }">
										<span class="Text ACE">ACE</span>
									</c:when>
									<c:otherwise>
										분발하세요
									</c:otherwise>
								</c:choose>
							</div>
						</div>
					</c:when>
					<c:otherwise>
						<div class="content" style="background-color: #a3cfec; border-color: #99b9cf;">
							<div class="gamestats">
								<div class="type">${record.gametype }</div>
								<div class="bar"></div>
								<div style="color: #1a78ae; font-weight: bold;">승리</div>
								<div>${record.startdate}</div>
							</div>
							<div class="gamesetting">
								<div class="champimg">
									<c:if test="${status.index == 1 }">
										<c:forEach var="img" items="${img }" end="0">
											<img src="lol/${img}" class="champ">
										</c:forEach>
									</c:if>
									<c:if test="${status.index == 2 }">
										<c:forEach var="img" items="${img }" begin="1" end="1">
											<img src="lol/${img}" class="champ">
										</c:forEach>
									</c:if>
									<c:if test="${status.index == 4 }">
										<c:forEach var="img" items="${img }" begin="3" end="3">
											<img src="lol/${img}" class="champ">
										</c:forEach>
									</c:if>

								</div>
								<div class="spells">
									<c:if test="${status.index == 1 }">
										<c:forEach var="lol" items="${lol_record }" begin="1" end="1">
											<div class="spell">
												<img src="lol/${lol.spell1}" class="img">
											</div>
											<div class="spell">
												<img src="lol/${lol.spell2}" class="img">
											</div>
										</c:forEach>
									</c:if>
									<c:if test="${status.index == 2 }">
										<c:forEach var="lol" items="${lol_record }" begin="2" end="2">
											<div class="spell">
												<img src="lol/${lol.spell1}" class="img">
											</div>
											<div class="spell">
												<img src="lol/${lol.spell2}" class="img">
											</div>
										</c:forEach>
									</c:if>
									<c:if test="${status.index == 4 }">
										<c:forEach var="lol" items="${lol_record }" begin="4" end="4">
											<div class="spell">
												<img src="lol/${lol.spell1}" class="img">
											</div>
											<div class="spell">
												<img src="lol/${lol.spell2}" class="img">
											</div>
										</c:forEach>
									</c:if>
								</div>
								<div class="runes">
									<c:if test="${status.index == 1 }">
										<c:forEach var="lol" items="${lol_record }" begin="1" end="1">
											<div class="rune">
												<img src="lol/${lol.property1 }" class="img">
											</div>
											<div class="rune">
												<img src="lol/${lol.property2 }" class="img">
											</div>
										</c:forEach>
									</c:if>
									<c:if test="${status.index == 2 }">
										<c:forEach var="lol" items="${lol_record }" begin="2" end="2">
											<div class="rune">
												<img src="lol/${lol.property1 }" class="img">
											</div>
											<div class="rune">
												<img src="lol/${lol.property2 }" class="img">
											</div>
										</c:forEach>
									</c:if>
									<c:if test="${status.index == 4 }">
										<c:forEach var="lol" items="${lol_record }" begin="4" end="4">
											<div class="rune">
												<img src="lol/${lol.property1 }" class="img">
											</div>
											<div class="rune">
												<img src="lol/${lol.property2 }" class="img">
											</div>
										</c:forEach>
									</c:if>
								</div>
								<div class="champname">${record.champ}</div>
							</div>
							<div class="kda">
								<div style="font-size: 12px;">Kill Death Assist</div>
								<c:if test="${status.index == 1 }">
									<c:forEach var="score" items="${score}" begin="1" end="1">
										<span class="kill"> ${score.kill} </span> /
									<span class="death"> ${score.death} </span> /
									<span class="assist"> ${score.assist} </span>
										<div>KDA (${(score.kill + score.assist) / score.death})</div>
									</c:forEach>
								</c:if>
								<c:if test="${status.index == 2 }">
									<c:forEach var="score" items="${score}" begin="2" end="2">
										<span class="kill"> ${score.kill} </span> /
									<span class="death"> ${score.death} </span> /
									<span class="assist"> ${score.assist} </span>
										<div>KDA (${(score.kill + score.assist) / score.death})</div>
									</c:forEach>
								</c:if>
								<c:if test="${status.index == 4 }">
									<c:forEach var="score" items="${score}" begin="4" end="4">
										<span class="kill"> ${score.kill} </span> /
									<span class="death"> ${score.death} </span> /
									<span class="assist"> ${score.assist} </span>
										<div>KDA (${(score.kill + score.assist) / score.death})</div>
									</c:forEach>
								</c:if>
							</div>

							<div class="level">
								<div style="color: #879292">DAMAGE</div>
								<span style="font-size: 14px">
									<c:out value="${record.damage}" />
								</span>
							</div>

							<div class="cs">
								<c:if test="${status.index == 1 }">
									<c:forEach var="lol" items="${lol_record }" begin="1" end="1">
										<div style="color: #879292">CS</div>
										<span style="font-size: 14px">${lol.cs} CS</span>
									</c:forEach>
								</c:if>
								<c:if test="${status.index == 2 }">
									<c:forEach var="lol" items="${lol_record }" begin="2" end="2">
										<div style="color: #879292">CS</div>
										<span style="font-size: 14px">${lol.cs} CS</span>
									</c:forEach>
								</c:if>
								<c:if test="${status.index == 4 }">
									<c:forEach var="lol" items="${lol_record }" begin="4" end="4">
										<div style="color: #879292">CS</div>
										<span style="font-size: 14px">${lol.cs} CS</span>
									</c:forEach>
								</c:if>
							</div>

							<div class="badges">
								<div style="font-size: 12px; color: #879292">GRADE</div>
								<c:choose>
									<c:when test="${record.mvp eq 1 }">
										<span class="Text MVP">MVP</span>
									</c:when>
									<c:otherwise>
										분발하세요
									</c:otherwise>
								</c:choose>
							</div>
						</div>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</div>
	</c:if>
</div>
</div>


<%@ include file="footer.jsp"%>