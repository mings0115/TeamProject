<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ include file="header.jsp"%>
<style>
td {
	display: flex;
}

tr {
	display: inline-block;
	margin-left: 25px;
	width: max-content;
}

.blog-post-des {
	margin-top: -10px;
	margin-left: 14px;
}

h3 {
	font-size: 24px;
}

.blog-post-format span {
	letter-spacing: 0.5px;
	padding-right: 2px;
}

.itemImg {
	width:120px;
}

.icon {
	margin: 10px 1% 20px 5%;
	display: inline-block;
	text-align: center;
	width: 40%;
	
	background-color:transparent;
}

.container{

margin-bottom:70px;
}
</style>

<script>
	function BuyConfirmOpen(imgno, index) {

		var mempoint = document.getElementById("memberPoint").value;
		var imgpoint = Number(document.getElementsByClassName("imgpoint")[index].value);

		var useimg = document.getElementById("useImg").value;
		var itemimg = document.getElementsByClassName("itemImg")[index].value;

		var temp = "구매 하시겠습니까?\n";
		temp += " 현재포인트는" + mempoint + "포인트 이고\n";
		temp += " 구매상품의 포인트는" + imgpoint + "입니다.";

		var msg = confirm(temp);

		if (msg == true) {
			if (useimg == itemimg) {
				alert("현재 사용중인 아이콘 입니다.");
			} else {
				if (mempoint >= imgpoint)
					location.href = "IconInsertAction.do?imgno=" + imgno;
				else {
					alert("포인트가 부족합니다");
				}
			}
		} else {
		}
	}
</script>
<input type="hidden" id="useImg" value="${useImg}">
<input type="hidden" id="memberPoint" value="${memberPoint }">
<div class="container">
	<div class="section-title">
		<h3>Point Shop</h3>
		<h2>포인트로 다양한 아이템들을 구입할 수 있습니다</h2>
	</div>
	<table class="table table-borderless table-sm">

		<c:set var="start" value="2" />
		<c:set var="end" value="${fn:length(list) }" />

		<div style="font-size:13px;">

			<c:forEach var="img" items="${list}" varStatus="status">
				<ul class="icon">
					<img src="original-Icon/${img.imgfile }" class="itemImg">
					<input type="hidden" value="${img.imgfile }">
					<h3>${img.imgname } 아이콘</h3>
					<br> Price : ${img.imgpoint }
					<br>
					<input type="hidden" class="imgpoint" value="${img.imgpoint }">
					<br>Content : ${img.imgcontent }
					<br>
					<br>
					<input type="button" class="btn btn-default"value="구매하기" onclick="BuyConfirmOpen('${img.imgno}','${status.index}')">
				</ul>
			</c:forEach>
		</div>


	</table>
</div>
</div>

<%@ include file="footer.jsp"%>