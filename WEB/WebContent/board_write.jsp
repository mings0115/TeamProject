<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
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
<script>
	function checkValue() {
		var form = document.forms[0];
		var board_subject = form.board_subject.value;
		var board_content = form.board_content.value;

		if (!board_subject) {
			alert("제목을 입력해주세요.");
			return false;
		} else if (!board_content) {
			alert("내용을 입력해주세요.");
			return false;
		}
	}
	function listForm() {
		location.href = "board_list.do";
	}
</script>
</head>
<body>


	<form method="post" action="BoardWriteAction.do" name="boardForm" enctype="multipart/form-data" onsubmit="return checkValue()">
		<div class="container">
			<input type="hidden" name="board_id" value="${sessionScope.sessionID}">
			<table class="table table-bordered table-hover">
				<tr>
					<th colspan="2">BOARD WRITE</th>
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
				<tr>
					<td id="title">파일첨부</td>
					<td>
						<input type="file" name="board_file">
					</td>
				</tr>

				<tr align="center" valign="middle">
					<td colspan="5">
						<input type="submit" class="btn btn-success" value="등록">
						<input type="reset" class="btn btn-danger" value="작성취소">
						<input type="button" class="btn btn-default" value="목록" onclick="listForm()">
					</td>
				</tr>
			</table>
		</div>
	</form>
</body>
</html>
<%@ include file="footer.jsp"%>