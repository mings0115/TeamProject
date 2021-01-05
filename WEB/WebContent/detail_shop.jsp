<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>

<style>
.col-md-4 p {
	margin-top: 80px;
}

.media {
	min-height: 300px;
}
</style>

<section id="about">
	<div class="container">
		<div class="row">

			<div class="col-md-offset-1 col-md-10 col-sm-12">
				<div class="section-title">
					<h3>DETAIL POINT SHOP</h3>
				</div>

				<div class="col-md-8 col-sm-12">
					<img src="img/item-img4.jpg" class="img-responsive" alt="About">
				</div>

				<div class="col-md-4 col-sm-12">
					<h1>ITEM NAME</h1>
					<p>ITEM PRICE</p>
					<p>
						<input type="button" value="구매하기" size="20">
					</p>
				</div>

				<div class="clearfix"></div>

				<div class="blog-post-title">
					<h2>
						ITEM NAME
					</h2>
				</div>

				<div class="blog-post-des" style="min-height: 500px;">
					<p>상세내용</p>
				</div>

				<div class="blog-comment">
					<h3>(값) Comments</h3>
					<div class="media">
						<div class="media-object pull-left">
							<img>
						</div>
						<div class="media-body">
							<h3 class="media-heading">
								Name
								<!--(${id})-->
							</h3>
							<span>Time</span>
							<p>Content</p>
						</div>
					</div>
					<div class="media">
						<div class="media-object pull-left">
							<img>
						</div>
						<div class="media-body">
							<h3 class="media-heading">
								Name
								<!--(${id}) -->
							</h3>
							<span>Time</span>
							<p>Content</p>
						</div>
					</div>
				</div>

				<div class="blog-comment-form">
					<h3>Leave a Comment</h3>
					<form action="#" method="post">
						<input type="text" class="form-control" placeholder="이름" name="name" required>
						<textarea class="form-control" placeholder="댓글내용" rows="5" name="Your Comments" required></textarea>
						<div class="col-md-3 col-sm-4">
							<input type="submit" class="form-control" value="Post Your Comment">
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</section>

<%@ include file="footer.jsp"%>