<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<script>
	function writeForm() {
		location.href = "board_write.do";
	}
</script>
<style>
#wrap {
	width: 800px;
	margin: 0 auto 0 auto;
}

#topForm {
	text-align: right;
}

.row h1, #board, #pageForm, #searchForm {
	text-align: center;
}

#board tbody td {
	border-bottom-color: #f2f2f2;
}

#board {
	margin-top: 10px;
}

#bList {
	text-align: center;
}

table {
	width: 55%;
	margin-left: auto;
	margin-right: auto;
}

.table-hover {
	background-color: #fff;
}

.pagination {
	margin: 0 8px;
}
</style>

<div class="container">
	<div class="row">

		<div class="col-md-offset-1 col-md-10 col-sm-12">
			<h1>BULLETIN BOARD</h1>
		</div>

	</div>
	<div style="border: 1px solid #ccc"></div>
</div>
<div class="container">
	<div id="board">
		<table id="bList" class="table table-bordered table-hover" style="width: 75%">
			<tr height="30">
				<td>글번호</td>
				<td>제목</td>
				<td>작성자</td>
				<td>작성일</td>
				<td>조회수</td>
			</tr>
			<c:forEach var="board" items="${requestScope.list}">
				<tr>
					<td>${board.board_num}</td>
					<td align="left" style="text-align: center;">
						<c:if test="${board.board_re_lev > 1}">
							<c:forEach begin="1" end="${board.board_re_lev}">
							&nbsp;&nbsp;
						</c:forEach>
							<img src="img/reply_icon.gif">
						</c:if>
						<a href="BoardDetailAction.do?num=${board.board_num}&pageNum=${spage}"> ${board.board_subject} </a>
					</td>
					<td>
						<a href="#"> ${board.board_id} </a>
					</td>
					<td>${board.board_date}</td>
					<td>${board.board_count}</td>
				</tr>
			</c:forEach>
		</table>
	</div>

	<br>
	<div id="pageForm" class="text-center">
		<ul class="pagination">

			<c:if test="${startPage > 0 }">
				<c:if test="${startPage != 1}">
					<li><a href='board_list.do?page=${startPage-1}'>Prev&nbsp;</a></li>
				</c:if>
			</c:if>

			<c:choose>
				<c:when test="${startPage > 0 }">
					<c:forEach var="pageNum" begin="${startPage}" end="${endPage}">
						<c:if test="${pageNum == spage}">
				${pageNum}&nbsp;
			</c:if>
						<c:if test="${pageNum != spage}">

							<ul class="pagination">
								<li><a href='board_list.do?page=${pageNum}'>${pageNum}&nbsp;</a></li>
							</ul>

						</c:if>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<div>
						<h2>출력할 게시글이 존재하지 않습니다.</h2>
					</div>
				</c:otherwise>
			</c:choose>


			<c:if test="${endPage != maxPage }">
				<li><a href='board_list.do?page=${endPage+1 }'>Next&nbsp;</a></li>
			</c:if>
		</ul>
	</div>

	<br> <br>
	<div id="searchForm">
		<form class="form-inline my-2 my-lg-0">
			<select name="opt">
				<option value="0">제목</option>
				<option value="1">내용</option>
				<option value="2">작성자</option>
			</select>
			<input type="text" size="20" name="condition" class="form-control mr-sm-2" placeholder="Search"/>
			&nbsp;
			<input type="submit" value="검색" style="margin-right: 20px" class="btn btn-default">
			<input type="button" value="글쓰기" onclick="writeForm()" class="btn btn-default">
		</form>
	</div>
</div>

<%@ include file="footer.jsp"%>