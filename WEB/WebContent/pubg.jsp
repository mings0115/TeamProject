<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

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

.record2 {
	display: block;
	width: 80%;
	float: right;

}
p {
	text-align: center;
}

.pubg-record{
	width: 450px;
	padding-right: 20px;
	padding-bottom: 421px;

}

.pubg-record .playerSummaryStat img{
	float: left;
    margin-right: 5px;
}

.playerSummaryStat{
	border-bottom: none;
	background-color: white;
}
.record-column1{
	width: 225px;
	background-color: white;
	
}
.recordlist {
	display: flex;
}

.recordlist div{
	border: none;
}

</style>
		<div class="container" style="position: relative;">

			
			<form style="float: right; margin-top:20px;">
				<input type="text" size="30" name="nickname" style="padding: 3px 0" />
				&nbsp;
				<input type="submit" value="검색" style="margin-right: 20px" class="btn btn-default">
			</form>
			
			<c:if test="${empty nickname }">
			<h2 style="font-weight: bold; margin-top:70px; margin-bottom:100px;">전적을 검색할 닉네임을 입력해주세요</h2>
			</c:if>
			
			
			<c:if test="${not empty nickname}">
		
			<div class="section-title" style="margin-top:70px;">
				<h2 style="margin-bottom: 50px;">Battle Grounds</h2>
	
			</div>



		<div style="overflow-x: auto;">

				<div style="overflow-x: auto;">
					<table>
						<tr>
							<tr align="center">
								<td colspan="2" rowspan="3">
								<img src="pubg-img/pubg-main.jpg" style="width: 75%; float: right;">
								<div style="padding-top: 10px;">
								<div style="padding-right: 893px;"><input type="button" value="${profile.nickname }"></div>
								<p style="padding-top: 15px;">NICKNAME</p>
									<img src="pubg-img/pubgimg.png" style="width: 160px; padding-bottom: 15px;">
								<div style="padding-right: 898px;">
								<p style="padding-left: 42px;">RANK</p>	
									<input type="button" value="${profile.rankname}"></div>
								</div>
									<br>
							</td>
						</tr>

					</table>
			
							<table class="record-full">
						<tr>
							<td class="pubg-record" colspan="1">
								<div class="playerSummaryStat">
									<img src="pubg-img/${profile.p_rank }" width="150px;">
									<h3>${profile.rankname}
									<br>
									<b>${profile.score1}점</b>
									</h3>
									<em>${profile.p_level}위</em>
								</div>
								

									<div style="display: inline-flex; width: 100%;">
										<div class="record-column1"style=" border-left: none; border-bottom: none; border-top: none;">
											<div class="recordlist" style="border: none; background-color: #f6f6f6; padding: 5;">
												<div style="padding-left: 20;width: 115; color: gray;">K/DA</div>
												<c:set var="total" value="0" />
												<c:forEach var="pubg" items="${score }" begin="0"  end="4">
													<c:set var="size" value="${fn:length(score)}" />
													<c:set var="total" value="${(total + (pubg.kill + pubg.death))}" />
												</c:forEach>
												<c:out value="${total / size}" />
											</div>
											<div class="recordlist" style="border: none; padding: 5;">
												<div style="padding-left: 20;width: 115; color: gray;">승률</div>
												<c:forEach var="pubg" items="${record }" begin="0"  end="4">
													<c:set var="size" value="${fn:length(record)}" />
														<c:choose>
															<c:when test="${pubg.result == 1 }">
																<div>${(pubg.result / size) * 100}%</div>
															</c:when>
														</c:choose>
												</c:forEach>

											</div>
											<div class="recordlist" style="border: none; background-color: #f6f6f6; padding: 5;">
												<div style="padding-left: 20;width: 115; color: gray;">평균등수</div>
												<c:set var="total" value="0" />
												<c:forEach var="pubg" items="${pu_record }" begin="0"  end="4">
													<c:set var="size" value="${fn:length(pu_record)}" />
													<c:set var="total" value="${total + pubg.ranking}" />
												</c:forEach>
												<c:out value="${total / size}" />
											</div>
											
											<div class="recordlist" style="border: none; padding: 5;">
												<div style="padding-left: 20;width: 115; color: gray;">최다킬</div>
												
													<c:forEach var="pubg" items="${score }" begin="0"  end="4" varStatus="status">
														<c:choose>
															<c:when test="${a == null}">
																<c:set var="a" value="${pubg.kill }"></c:set>
															</c:when>
															<c:when test="${pubg.kill > a }">
																<c:set var="a" value="${pubg.kill }"></c:set>
															</c:when>
														</c:choose>
													</c:forEach>
													<c:out value="${a}" />
											</div>
										</div>
										
										<div class="record-column1" style="border: none;">
											<div class="recordlist" style="border: none; background-color: #f6f6f6; padding: 5;">
												<div style="padding-left: 20;width: 115; color: gray;">데미지</div>
												<c:set var="total" value="0" />
												<c:forEach var="pubg" items="${record }" begin="0" end="4">
													<c:set var="size" value="${fn:length(record)}" />
													<c:set var="total" value="${total + pubg.damage}" />
												</c:forEach>
												<c:out value="${total / size}" />
											</div>
											
											<div class="recordlist" style="border: none;padding: 5;">
												<div style="padding-left: 20;width: 115; color: gray;">TOP10</div>
												<c:set var="total" value="0" />
													<c:forEach var="pubg" items="${pu_record }" begin="0"  end="4">
														<c:set var="size" value="${fn:length(pu_record)}" />
														<c:set var="size2" value="${fn:length(pubg.ranking)}" />
															<c:choose>
																<c:when test="${pubg.ranking <= 10 }">
																	<c:set var="total" value="${total + size2}" />
																</c:when>
															</c:choose>
													</c:forEach>
												<c:out value="${(total / size) *100}" />%
													
											</div>
											<div class="recordlist" style="border: none; background-color: #f6f6f6; padding: 5;">
												<div style="padding-left: 20;width: 115; color: gray;">명중률</div>
												<c:set var="total" value="0" />
												<c:forEach var="pubg" items="${pu_record }" begin="0"  end="4">
													<c:set var="size" value="${fn:length(pu_record)}" />
													<c:set var="total" value="${total + pubg.accuracyrate}" />
												</c:forEach>
												<c:out value="${total / size}" />%
											</div>
											<div class="recordlist" style="border: none; padding: 5;">
												<div style="padding-left: 20;width: 115; color: gray;">이동거리</div>
												<c:set var="total" value="0" />
												<c:forEach var="pubg" items="${pu_record }" begin="0" end="4" varStatus="status">
													<c:set var="size" value="${fn:length(pu_record)}" />
													<c:set var="total" value="${(total + (pubg.drive + pubg.walking))}" />
												</c:forEach>
												<c:out value="${(total / size)}" />km												
												
											</div>
										</div>
									</div>	
							</td>


							<h2 style="border-bottom: 1px solid #ccc; 
								padding-bottom: 50px; padding-top: 50px;">게임전적</h2>
								<c:forEach var="ow" items="${record }" varStatus="status">
									<td class="record2" rowspan="3" style="width: 667px;">
									
										<div style="background-color: #c9e8ff; border: none; display: inline-flex; width: 100%;  text-align: center;
											 box-shadow: -7px 0px #0089ef;">
											
											<c:if test="${status.index == 0 }">
												<c:forEach var="pubg" items="${record }" end="0">
													<div style="width: 106px; font-size: 12px; padding-left: 20px; padding-top: 15px; border: none;">
														<img src="pubg-img/pubg-gun.png" style="width:40px;">
														<div style="border: none;">${pubg.gametype }</div>
														<div style="border: none;">${pubg.startdate }</div>
													</div>
												</c:forEach>
											</c:if>
											<c:if test="${status.index == 1 }">
												<c:forEach var="pubg" items="${record }" begin="1" end="1">
													<div style="width: 106px; font-size: 12px; padding-left: 20px; padding-top: 15px; border: none;">
														<img src="pubg-img/pubg-gun.png" style="width:40px;">
														<div style="border: none;">${pubg.gametype }</div>
														<div style="border: none;">${pubg.startdate }</div>
													</div>
												</c:forEach>
											</c:if>
											<c:if test="${status.index == 2 }">
												<c:forEach var="pubg" items="${record }" begin="2" end="2">
													<div style="width: 106px; font-size: 12px; padding-left: 20px; padding-top: 15px; border: none;">
														<img src="pubg-img/pubg-gun.png" style="width:40px;">
														<div style="border: none;">${pubg.gametype }</div>
														<div style="border: none;">${pubg.startdate }</div>
													</div>
												</c:forEach>
											</c:if>
											<c:if test="${status.index == 3 }">
												<c:forEach var="pubg" items="${record }" begin="3" end="3">
													<div style="width: 106px; font-size: 12px; padding-left: 20px; padding-top: 15px; border: none;">
														<img src="pubg-img/pubg-gun.png" style="width:40px;">
														<div style="border: none;">${pubg.gametype }</div>
														<div style="border: none;">${pubg.startdate }</div>
													</div>
												</c:forEach>
											</c:if>
											<c:if test="${status.index == 4 }">
												<c:forEach var="pubg" items="${record }" begin="4" end="4">
													<div style="width: 106px; font-size: 12px; padding-left: 20px; padding-top: 15px; border: none;">
														<img src="pubg-img/pubg-gun.png" style="width:40px;">
														<div style="border: none;">${pubg.gametype }</div>
														<div style="border: none;">${pubg.startdate }</div>
													</div>
												</c:forEach>
											</c:if>
											
											<c:if test="${status.index == 0 }">
												<c:forEach var="pubg" items="${pu_record }" end="0">
													<div style="border: none; width: 122px; padding-top: 30px; font-size: 14px;">
														<div style="border: none; color: #0089ef;">
															<b style="color: #0089ef; font-size: 25px;"># ${pubg.ranking }</b>/ 99</div>
													</div>
												</c:forEach>
											</c:if>
											<c:if test="${status.index == 1 }">
												<c:forEach var="pubg" items="${pu_record }" begin="1" end="1">
													<div style="border: none; width: 122px; padding-top: 30px; font-size: 14px;">
														<div style="border: none; color: #0089ef;">
															<b style="color: #0089ef; font-size: 25px;"># ${pubg.ranking }</b>/ 99</div>
													</div>
												</c:forEach>
											</c:if>
											<c:if test="${status.index == 2 }">
												<c:forEach var="pubg" items="${pu_record }" begin="2" end="2">
													<div style="border: none; width: 122px; padding-top: 30px; font-size: 14px;">
														<div style="border: none; color: #0089ef;">
															<b style="color: #0089ef; font-size: 25px;"># ${pubg.ranking }</b>/ 99</div>
													</div>
												</c:forEach>
											</c:if>
											<c:if test="${status.index == 3 }">
												<c:forEach var="pubg" items="${pu_record }" begin="3" end="3">
													<div style="border: none; width: 122px; padding-top: 30px; font-size: 14px;">
														<div style="border: none; color: #0089ef;">
															<b style="color: #0089ef; font-size: 25px;"># ${pubg.ranking }</b>/ 99</div>
													</div>
												</c:forEach>
											</c:if>
											<c:if test="${status.index == 4 }">
												<c:forEach var="pubg" items="${pu_record }" begin="4" end="4">
													<div style="border: none; width: 122px; padding-top: 30px; font-size: 14px;">
														<div style="border: none; color: #0089ef;">
															<b style="color: #0089ef; font-size: 25px;"># ${pubg.ranking }</b>/ 99</div>
													</div>
												</c:forEach>
											</c:if>
											
											<c:if test="${status.index == 0 }">	
												<c:forEach var="pubg" items="${score }" end="0">	
													<div style="border: none; width: 89px; padding-top: 15px; font-size: 14px;">
														<div style="border: none;">${pubg.kill}</div>
														<div style="border: none; color: gray;">킬</div>
													</div>
												</c:forEach>
											</c:if>
											<c:if test="${status.index == 1 }">	
												<c:forEach var="pubg" items="${score }" begin="1" end="1">	
													<div style="border: none; width: 89px; padding-top: 15px; font-size: 14px;">
														<div style="border: none;">${pubg.kill}</div>
														<div style="border: none; color: gray;">킬</div>
													</div>
												</c:forEach>
											</c:if>
											<c:if test="${status.index == 2 }">	
												<c:forEach var="pubg" items="${score }" begin="2" end="2">	
													<div style="border: none; width: 89px; padding-top: 15px; font-size: 14px;">
														<div style="border: none;">${pubg.kill}</div>
														<div style="border: none; color: gray;">킬</div>
													</div>
												</c:forEach>
											</c:if>
											<c:if test="${status.index == 3 }">	
												<c:forEach var="pubg" items="${score }" begin="3" end="3">	
													<div style="border: none; width: 89px; padding-top: 15px; font-size: 14px;">
														<div style="border: none;">${pubg.kill}</div>
														<div style="border: none; color: gray;">킬</div>
													</div>
												</c:forEach>
											</c:if>
											<c:if test="${status.index == 4 }">	
												<c:forEach var="pubg" items="${score }" begin="4" end="4">	
													<div style="border: none; width: 89px; padding-top: 15px; font-size: 14px;">
														<div style="border: none;">${pubg.kill}</div>
														<div style="border: none; color: gray;">킬</div>
													</div>
												</c:forEach>
											</c:if>
													
											
											<c:if test="${status.index == 0 }">	
												<c:forEach var="pubg" items="${record }" end="0">
													<div style="border: none; width: 110px; padding-top: 15px; font-size: 14px;">
														<div style="border: none;">${pubg.damage }</div>
														<div style="border: none; color: gray;">데미지</div>
													</div>
												</c:forEach>
											</c:if>
											<c:if test="${status.index == 1 }">	
												<c:forEach var="pubg" items="${record }" begin="1" end="1">
													<div style="border: none; width: 110px; padding-top: 15px; font-size: 14px;">
														<div style="border: none;">${pubg.damage }</div>
														<div style="border: none; color: gray;">데미지</div>
													</div>
												</c:forEach>
											</c:if>
											<c:if test="${status.index == 2 }">	
												<c:forEach var="pubg" items="${record }" begin="2" end="2">
													<div style="border: none; width: 110px; padding-top: 15px; font-size: 14px;">
														<div style="border: none;">${pubg.damage }</div>
														<div style="border: none; color: gray;">데미지</div>
													</div>
												</c:forEach>
											</c:if>
											<c:if test="${status.index == 3 }">	
												<c:forEach var="pubg" items="${record }" begin="3" end="3">
													<div style="border: none; width: 110px; padding-top: 15px; font-size: 14px;">
														<div style="border: none;">${pubg.damage }</div>
														<div style="border: none; color: gray;">데미지</div>
													</div>
												</c:forEach>
											</c:if>	
											<c:if test="${status.index == 4 }">	
												<c:forEach var="pubg" items="${record }" begin="4" end="4">
													<div style="border: none; width: 110px; padding-top: 15px; font-size: 14px;">
														<div style="border: none;">${pubg.damage }</div>
														<div style="border: none; color: gray;">데미지</div>
													</div>
												</c:forEach>
											</c:if>			
											
											<c:if test="${status.index == 0 }">
												<c:forEach var="pubg" items="${pu_record }" end="0">
													<div style="border: none; width: 109px; padding-top: 15px; font-size: 14px;">
														<div style="border: none;">${pubg.walking }km</div>
														<div style="border: none; color: gray;">걸은거리</div>
													</div>
													
													<div style="border: none; width: 100px; padding-top: 15px; font-size: 14px;">
														<div style="border: none;">${pubg.drive }km</div>
														<div style="border: none; color: gray;">탑승거리</div>
													</div>
												</c:forEach>
											</c:if>
											<c:if test="${status.index == 1 }">
												<c:forEach var="pubg" items="${pu_record }" begin="1" end="1">
													<div style="border: none; width: 109px; padding-top: 15px; font-size: 14px;">
														<div style="border: none;">${pubg.walking }km</div>
														<div style="border: none; color: gray;">걸은거리</div>
													</div>
													
													<div style="border: none; width: 100px; padding-top: 15px; font-size: 14px;">
														<div style="border: none;">${pubg.drive }km</div>
														<div style="border: none; color: gray;">탑승거리</div>
													</div>
												</c:forEach>
											</c:if>
											<c:if test="${status.index == 2 }">
												<c:forEach var="pubg" items="${pu_record }" begin="2" end="2">
													<div style="border: none; width: 109px; padding-top: 15px; font-size: 14px;">
														<div style="border: none;">${pubg.walking }km</div>
														<div style="border: none; color: gray;">걸은거리</div>
													</div>
													
													<div style="border: none; width: 100px; padding-top: 15px; font-size: 14px;">
														<div style="border: none;">${pubg.drive }km</div>
														<div style="border: none; color: gray;">탑승거리</div>
													</div>
												</c:forEach>
											</c:if>
											<c:if test="${status.index == 3 }">
												<c:forEach var="pubg" items="${pu_record }" begin="3" end="3">
													<div style="border: none; width: 109px; padding-top: 15px; font-size: 14px;">
														<div style="border: none;">${pubg.walking }km</div>
														<div style="border: none; color: gray;">걸은거리</div>
													</div>
													
													<div style="border: none; width: 100px; padding-top: 15px; font-size: 14px;">
														<div style="border: none;">${pubg.drive }km</div>
														<div style="border: none; color: gray;">탑승거리</div>
													</div>
												</c:forEach>
											</c:if>
											<c:if test="${status.index == 4 }">
												<c:forEach var="pubg" items="${pu_record }" begin="4" end="4">
													<div style="border: none; width: 109px; padding-top: 15px; font-size: 14px;">
														<div style="border: none;">${pubg.walking }km</div>
														<div style="border: none; color: gray;">걸은거리</div>
													</div>
													
													<div style="border: none; width: 100px; padding-top: 15px; font-size: 14px;">
														<div style="border: none;">${pubg.drive }km</div>
														<div style="border: none; color: gray;">탑승거리</div>
													</div>
												</c:forEach>
											</c:if>
										</div>
										
										
										
								</td>
							</c:forEach>	
						</tr>		
					</table>
				</div>
			</div>
		</c:if>
	</div>
<%@ include file="footer.jsp"%>