<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>


<section id="contact">
	<div class="container">
		<div class="row">

			<div class="col-md-offset-1 col-md-10 col-sm-12">
				<div class="section-title">
					<h3>QUESTION &amp; ANSWER</h3>
				</div>

				<form action="#" method="post">
					<div class="col-md-6 col-sm-6">
						<input type="text" class="form-control" placeholder="이름">
					</div>
					<div class="col-md-6 col-sm-6">
						<input type="email" class="form-control" placeholder="이메일">
					</div>
					<div class="col-md-6 col-sm-6">
						<input type="tel" class="form-control" placeholder="전화번호">
					</div>
					<div class="col-md-6 col-sm-6">
						<select class="form-control">
							<option>계정 문의</option>
							<option>커뮤니티 문의</option>
							<option>게임전적 문의</option>
							<option>그외</option>
						</select>
					</div>
					<div class="col-md-12 col-sm-12">
						<textarea class="form-control" rows="5" placeholder="문의사항"></textarea>
					</div>
					<div class="col-md-3 col-sm-4" style="margin-left: 38%; margin-top: 5%;">
						<input type="submit" class="form-control" value="전송">
					</div>
				</form>
			</div>

		</div>
	</div>
</section>



<%@ include file="footer.jsp"%>

