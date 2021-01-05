<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>
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

table td {
	text-align: center;
}

.container {
	margin: 50px auto;
}

input {
	text-align: center;
}
</style>
</head>
<body>

	<div class="container">
		<table class="table table-bordered table-hover">
			<c:forEach var="list" items="${list }">
				<tr>
					<th colspan="4">MEMBER PROFILE</th>
				</tr>
				<tr>
					<td id="info" colspan="1">ID</td>
					<td id="info" colspan="3">
						<input type="text" size="30" value="${list.id }" disabled="disabled">
					</td>
				</tr>
				<tr>
					<td id="info">NAME</td>
					<td colspan="4">
						<input type="text" value="${list.name }" size="30" disabled="disabled">
					</td>
				</tr>

				<tr>
					<td id="info" style="border: none;">EMAIL</td>
					<td>
						<input type="text" size="20" value="${list.email1 }" disabled="disabled">
					</td>
					<td style="border: hidden">@</td>
					<td>
						<input type="text" size="20" value="${list.email2 }" disabled="disabled">
					</td>
				</tr>
				<tr>
					<td id="info">PHONE</td>
					<td colspan="3">
						<input type="text" size="30" value="${list.phone }" disabled="disabled">
					</td>
				</tr>
				<tr>
					<td id="info">POINT</td>
					<td colspan="3">
						<input type="text" size="30" value="${list.point }" disabled="disabled">
					</td>
				</tr>
				<tr>
					<td id="info">ICON</td>
					<td colspan="3">
						<img src="icon/${img }">
					</td>
				</tr>

				<tr align="center" valign="middle">
					<td colspan="4">
						<input type="button" class="btn btn-danger" value="뒤로가기" onclick="javascript:window.location='/WEB/index.do'">
					</td>
				</tr>
			</c:forEach>
		</table>
	</div>

</body>
</html>
<%@ include file="../footer.jsp"%>