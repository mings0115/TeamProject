<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>글 수정</title>
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

<script>
	function changeView() {
		location.href = 'board_list.do';
	}
</script>

</head>
<body>


	<form method="post" action="BoardUpdateAction.do?page=${pageNum}" name="boardForm" enctype="multipart/form-data">
		<div class=container>

			<input type="hidden" name="board_num" value="${board.board_num}" />
			<input type="hidden" name="existing_file" value="${board.board_file}" />

			<table class="table table-bordered table-hover">
				<tr>
					<th colspan="2">BOARD MODIFY</th>
				</tr>
				<tr>
					<td id="title">작성자</td>
					<td>${board.board_id}</td>
				</tr>
				<tr>
					<td id="title">제 목</td>
					<td>
						<input name="board_subject" type="text" size="70" maxlength="100" value="${board.board_subject}" class="input">
					</td>
				</tr>
				<tr>
					<td id="title">내 용</td>
					<td>
						<textarea name="board_content" cols="72" rows="20" class="input">${board.board_content}</textarea>
					</td>
				</tr>
				<!-- 답글이 아닐 경우에만 파일 첨부 가능하도록 처리 -->
				<c:if test="${board.board_parent==0}">
					<tr>
						<td id="title">기존 파일</td>
						<td>&nbsp;&nbsp; ${board.board_file}</td>
					</tr>
					<tr>
						<td id="title">첨부파일</td>
						<td>
							<input type="file" name="board_file">
						</td>
					</tr>
				</c:if>

				<tr align="center" valign="middle">
					<td colspan="5">
						<input type="submit" class="btn btn-success" value="수정">
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