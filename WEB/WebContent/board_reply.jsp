<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
#title {
	height: 16;
	font-family: '돋움';
	font-size: 12;
	text-align: center;
}

.table-hover {
	background-color: #fff;
}

table {
	text-align: center;
	width: 70%;
	margin: auto;
}

table th {
	text-align: center;
	font-size: 30px;
}

.container {
	margin: 50px auto;
}
</style>
</head>
<body>

	<form method="post" action="BoardReplyAction.do?page=${pageNum}" name="boardForm">
		<div class="container" style="margin-top: 100px;">


			<input type="hidden" name="board_id" value="${sessionScope.sessionID}">
			<input type="hidden" name="board_num" value="${board.board_num}" />
			<input type="hidden" name="board_re_ref" value="${board.board_re_ref}" />
			<table class="table table-bordered table-hover">
				<tr>
					<th colspan="2">BOARD REPLY</th>
				</tr>
				<tr>
					<td id="title">작성자</td>
					<td>${sessionScope.sessionID}</td>
				</tr>
				<tr>
					<td id="title">제 목</td>
					<td>
						<input name="board_subject" type="text" size="70" maxlength="100" value="" class="input">
					</td>
				</tr>
				<tr>
					<td id="title">내 용</td>
					<td>
						<textarea name="board_content" cols="72" rows="20" class="input"></textarea>
					</td>
				</tr>

				<tr align="center" valign="middle">
					<td colspan="5">
						<input type="submit" class="btn btn-success" value="등록">
						<input type="reset" class="btn btn-danger" value="작성취소">
						<input type="button" class="btn btn-default" value="목록" onclick="javascript:history.go(-1)">
					</td>
				</tr>
			</table>
		</div>
	</form>

</body>
</html>
<%@ include file="footer.jsp"%>