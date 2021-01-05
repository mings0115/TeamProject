<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>댓글 답변</title>

<style>
#wrap {
	width: 550px;
	margin: 0 auto 0 auto;
	text-align: center;
}

#commentReplyForm {
	text-align: center;
}
</style>
<link rel="stylesheet" href="css/bootstrap.min.css">

<script>
	var httpRequest = null;

	function getXMLHttpRequest() {
		var httpRequest = null;

		if (window.ActiveXObject) {
			try {
				httpRequest = new ActiveXObject("Msxml2.XMLHTTP");
			} catch (e) {
				try {
					httpRequest = new ActiveXObject("Microsoft.XMLHTTP");
				} catch (e2) {
					httpRequest = null;
				}
			}
		} else if (window.XMLHttpRequest) {
			httpRequest = new window.XMLHttpRequest();
		}
		return httpRequest;
	}

	function checkValue() {
		var form = document.forms[0];	
		var comment_num = "${comment.comment_num}";
		var comment_board = "${comment.comment_board}";
		var comment_id = "${sessionScope.sessionID}";
		var comment_content = form.comment_content.value

		if (!comment_content) {
			alert("내용을 입력하세요");
			return false;
		} else {
			var param = "comment_num=" + comment_num + "&comment_board="
					+ comment_board + "&comment_id=" + comment_id
					+ "&comment_content=" + comment_content;

			httpRequest = getXMLHttpRequest();
			httpRequest.onreadystatechange = checkFunc;
			httpRequest.open("POST", "CommentReplyAction.do", true);
			httpRequest.setRequestHeader('Content-Type',
					'application/x-www-form-urlencoded;charset=UTF-8');
			httpRequest.send(param);
		}
	}

	function checkFunc() {
		if (httpRequest.readyState == 4) {
			var resultText = httpRequest.responseText;
			if (resultText == 1) {
				if (opener != null) {
					window.opener.document.location.reload();
					opener.replyForm = null;
					self.close();
				}
			}
		}
	}
</script>

</head>
<body>
	<div id="wrap" class="container">
		<hr size="1" width="550">
		<br>
		<h2 style="text-align: center;">COMMENT REPLY</h2>
		<div id="commentReplyForm">
			<form name="replyInfo" target="parentForm">
				<textarea rows="7" cols="70" name="comment_content" class="input"></textarea>
				<br> <br>
				<input type="button" class="btn btn-success" value="등록" onclick="checkValue()">
				<input type="button" class="btn btn-danager" value="창닫기" onclick="window.close()">
			</form>
		</div>
	</div>
</body>
</html>