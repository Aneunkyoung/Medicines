<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<section class="module module-header bg-dark bg-dark-50" data-background="assets/images/section-5.jpg" style="background-image: url(&quot;assets/images/section-5.jpg&quot;);">
	<div class="container">
		<div class="row">
			<div class="col-sm-6 col-sm-offset-3">
				<h1 class="module-title font-alt align-center">About</h1>
				<div class="module-subtitle font-inc align-center">
					다양한 의약품 정보를 제공해주는 MEDICINES 입니다. 이 곳에서 다양한 정보를 얻으시고 다른사람과 자유롭게 이야기 해보아요!
				</div>

			</div>

		</div>
	</div>

</section>

<section class="module">
	<div class="container">
		<div class="row">
			<div class="col-sm-6 col-sm-offset-3">
				<h2 class="module-title align-center font-alt">Services</h2>
				<div class="module-subtitle align-center font-inc">
					클릭후 원하는 정보에 바로가서 확인해보세요!
				</div>
			</div>

		</div>
		
	<div class="row multi-columns-row">
		<div class="col-sm-6 col-md-3 col-lg-3">
			<div class="content-box" onclick="location.href='${pageContext.request.contextPath}/drugs'" style="cursor: pointer;">
				<div class="content-box-icon">
					<i class="fa fa-fw"></i>
				</div>
				<div class="content-box-title font-inc font-uppercase">
					의약품
				</div>
				<div class="content-box-text">
					다양한 의약품 정보를 얻어보세요.
				</div>
			</div>
		</div>
					
		<div class="col-sm-6 col-md-3 col-lg-3">
			<div class="content-box" onclick="location.href='${pageContext.request.contextPath}/notice'" style="cursor: pointer;">
				<div class="content-box-icon">
					<i class="fa fa-fw"></i>
				</div>
				<div class="content-box-title font-inc font-uppercase">
					공지사항
				</div>
				<div class="content-box-text">
					공지사항을 확인해보세요.
				</div>
			</div>
		</div>
			
		<div class="col-sm-6 col-md-3 col-lg-3">
			<div class="content-box" onclick="location.href='${pageContext.request.contextPath}/board'" style="cursor: pointer;">
				<div class="content-box-icon">
					<i class="fa fa-fw"></i>
				</div>
				<div class="content-box-title font-inc font-uppercase">
					게시판
				</div>
				<div class="content-box-text">
					자유로운 의견을 남겨보세요.
				</div>
			</div>
		</div>
					
		<div class="col-sm-6 col-md-3 col-lg-3">
			<div class="content-box" onclick="location.href='${pageContext.request.contextPath}/question'" style="cursor: pointer;">
				<div class="content-box-icon">
					<i class="fa fa-fw"></i>
				</div>
			<div class="content-box-title font-inc font-uppercase">
				문의사항
			</div>
			<div class="content-box-text">
				궁금한점을 물어보세요.
			</div>
			</div>
		</div>
					
	</div>
</div>
</section>