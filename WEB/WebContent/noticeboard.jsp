<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">

		<div class="card border-light mb-3" style="margin-top: 50px; text-align: center;">
			<div class="card-header">공지사항1</div>
			<div class="card-body">
				<h4 class="card-title">PUBG 커뮤니티</h4>
				<p class="card-text">WELCOME 입니까</p>
			</div>
		</div>
		<div class="card text-white bg-primary mb-3" style="margin-top: 30px; text-align: center;">
			<div class="card-header">공지사항2</div>
			<div class="card-body">
				<h4 class="card-title" style="color:white;">공지사항TEST</h4>
				<p class="card-text" style="color:white;">너는 누구십니까?</p>
			</div>
		</div>

		<c:if test="${admin eq 1 }">
			<div class="card text-white bg-dark mb-3" style="margin-top: 30px; text-align: center;">
				<div class="card-header">공지사항(관리자)</div>
				<div class="card-body">
					<h4 class="card-title" style="color:white;">관리자용TEST</h4>
					<p class="card-text" style="color:white;">너는 관리자입니다</p>
				</div>
			</div>

			<input type="button" class="btn btn-primary" value="글쓰기" style="float: right; margin: 100px 0;">
		</c:if>

	</div>
</body>
</html>
<%@ include file="footer.jsp"%>