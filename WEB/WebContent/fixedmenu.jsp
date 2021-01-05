<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="shortcut icon" href="../favicon.ico">
<link rel="stylesheet" href="css/headermenu.css">
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<link href='http://fonts.googleapis.com/css?family=Lato:300,400,700' rel='stylesheet' type='text/css' />
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<header>
	<c:set var="member" value="${requestScope.confirmID }"></c:set>
	<nav class="fixed-top" style="height: 180px;">
		<div class="nav-wrap ">
			<div id="dd" class="wrapper-dropdown-2" tabindex="1">
				<img src="icon/${sessionScope.image}" id="image">
				<c:choose>

					<c:when test="${admin eq 1 }">
				WELCOME ADMIN(${sessionScope.sessionID})
				</c:when>
					<c:otherwise>
				WELCOME (${sessionScope.sessionID})
				</c:otherwise>
				</c:choose>
				<ul class="dropdown">
					<li><a href="/WEB/Profile.do"> <i class="icon-user"></i>Profile
					</a></li>
					<li><a href="/WEB/Modify.do"> <i class="icon-cog"></i>Settings
					</a></li>
					<li><a href="/WEB/logoutAccess.do"> <i class="icon-remove"></i>Log out
					</a></li>
				</ul>
			</div>
		</div>
	</nav>
</header>
<script src="js_front/jquery-3.5.1.min.js"></script>
<script src="js_front/dropdown.js"></script>
<script src="js_front/modernizr.custom.js"></script>