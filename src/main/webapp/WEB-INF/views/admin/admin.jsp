<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<section class="module">
	<div class="container">
		<div class="row">
			<div class="col-sm-6 col-sm-offset-3">
				<h2 class="module-title align-center font-alt" onclick="location.href='${pageContext.request.contextPath}/admin'" style="cursor: pointer;">Admin Page</h2>
				<div class="module-subtitle align-center font-inc">
					관리자 페이지 입니다.
				</div>
			</div>

		</div>
		
		<div class="alert alert-info" role="alert" style="text-align: center;">
				<div class="row multi-columns-row">
		<div class="col-sm-6 col-md-3 col-lg-3">
			<div class="content-box" onclick="location.href='/medicines/admin_user'" style="cursor: pointer;">
				<div class="content-box-icon">
					<i class="fa fa-fw"></i>
				</div>
				<div class="content-box-title font-inc font-uppercase">
					회원관리
				</div>
				<div class="content-box-text">
					회원정보를 관리하는 공간입니다.
				</div>
			</div>
		</div>
		<div class="col-sm-6 col-md-3 col-lg-3">
			<div class="content-box" onclick="location.href='/medicines/admin_drugs'" style="cursor: pointer;">
				<div class="content-box-icon">
					<i class="fa fa-fw"></i>
				</div>
				<div class="content-box-title font-inc font-uppercase">
					의약품관리
				</div>
				<div class="content-box-text">
					의약품 정보를 관리하는 공간입니다.
				</div>
			</div>
		</div>
					
		<div class="col-sm-6 col-md-3 col-lg-3">
			<div class="content-box" onclick="location.href='/medicines/admin_notice'" style="cursor: pointer;">
				<div class="content-box-icon">
					<i class="fa fa-fw"></i>
				</div>
				<div class="content-box-title font-inc font-uppercase">
					공지사항
				</div>
				<div class="content-box-text">
					공지사항을 관리하는 공간입니다.
				</div>
			</div>
		</div>
			
		<div class="col-sm-6 col-md-3 col-lg-3">
			<div class="content-box" onclick="location.href='/medicines/admin_board'" style="cursor: pointer;">
				<div class="content-box-icon">
					<i class="fa fa-fw"></i>
				</div>
				<div class="content-box-title font-inc font-uppercase">
					게시판
				</div>
				<div class="content-box-text">
					게시판을 관리하는 공간입니다.
				</div>
			</div>
		</div>
					
		<div class="col-sm-6 col-md-3 col-lg-3">
			<div class="content-box" onclick="location.href='/medicines/admin_question'" style="cursor: pointer;">
				<div class="content-box-icon">
					<i class="fa fa-fw"></i>
				</div>
			<div class="content-box-title font-inc font-uppercase">
				문의사항
			</div>
			<div class="content-box-text">
				문의사항을 관리하는 공간입니다.
			</div>
			</div>
		</div>
					
	</div>
		</div>

</div>
</section>