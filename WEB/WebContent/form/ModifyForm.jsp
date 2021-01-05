<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="group1.dao.MembersDAO"%>
<%@ page import="group1.dto.MembersDTO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../header.jsp"%>
<style>
.table-hover {
	background-color: #fff;
}

.table {
	width: 61%;
	margin: auto;
}

table th {
	text-align: center;
	font-size: 30px;
}

table td{
text-align: center;
}

.container {
	margin: 50px auto;
}
</style>
<script>
	function setComboValue(val) {
		var selectMail = document.getElementById('email2'); // select 아이디를 가져온다.
		for (i = 0, j = selectMail.length; i < j; i++) // select 하단 option 수만큼 반복문 돌린다.
		{
			if (selectMail.options[i].value == val) // 입력된값과 option의 value가 같은지 비교
			{
				selectMail.options[i].selected = true; // 같은경우라면 체크되도록 한다.
				break;
			}
		}
	}

	// 비밀번호 입력여부 체크
	function ModifyCheck() {
		if (!document.frm.pwd.value) {
			alert("비밀번호를 입력하세요.");
			return false;
		}
	}
</script>
<c:set var="member" value="${requestScope.confirmID }"></c:set>

<form action="/WEB/ModifyAccess.do" method="post" name="frm" onsubmit="return ModifyCheck()">
	<div class="container">
		<table class="table table-bordered table-hover">
			<tr>
				<th colspan="3">MEMBER MODIFY</th>
			</tr>
			<tr>
				<td id="info" colspan="1">ID</td>
				<td id="info" colspan="2">
					<input type="hidden" name="id" size="30">${sessionScope.sessionID}</td>
			</tr>
			<tr>
				<td id="info">PW</td>
				<td colspan="3">
					<input type="password" name="pwd" size="30" maxlength="12">
				</td>
			</tr>
			<tr>
				<td id="info">NAME</td>
				<td colspan="3">
					<input type="text" name="name" size="30">
				</td>
			</tr>

			<tr>
				<td id="info" style="border: none;">
					EMAIL
					<input type="text" name="email1" maxlength="50" size="20" style="float: right;">
				</td>
				<td style="border: none; padding: 8px 0; letter-spacing: -6px;">@</td>
				<td id="info" style="border: none; border-right: 1px solid #ddd">
					<select name="email2" class="form-control input input--hoshi" style="padding: 0 0px 0 120px;">
						<option>naver.com</option>
						<option>daum.net</option>
						<option>gmail.com</option>
						<option>nate.com</option>
					</select>
				</td>
			</tr>
			<tr>
				<td id="info">PHONE</td>
				<td colspan="2">
					<input type="text" name="phone" size="30">
				</td>
			</tr>

			<tr align="center" valign="middle">
				<td colspan="3">
					<input type="submit" class="btn btn-success" value="수정">
					<input type="button" class="btn btn-danger" value="취소" onclick="javascript:window.location='/WEB/index.do'">
				</td>
			</tr>
		</table>
	</div>
</form>
<%@ include file="../footer.jsp"%>