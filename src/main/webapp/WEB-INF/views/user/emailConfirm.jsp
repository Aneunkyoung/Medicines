<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
		<section class="module">
			<div class="container" >
				<div class="row">
					<div class="col-sm-6 col-sm-offset-3">
						<!-- CONTENT BOXES -->
						<h4 class="font-alt m-t-0 m-b-0" style="text-align: center;">이메일 인증</h4>
						<hr class="divider-w m-t-10 m-b-20">
						<div class="row multi-columns-row">
							
							<!-- CONTENT BOX -->
							<div>
								<div class="content-box">
									<div class="content-box-icon">
										<span class="icon-envelope"></span>
									</div>
									<div class="content-box-title font-inc font-uppercase">
										인증완료
									</div>
									<div class="content-box-text">
										${name}님의 이메일 인증이 완료되었습니다.
									</div>
								</div>
								<div style="text-align: center;">
									<a href="${pageContext.request.contextPath }/login" class="font-alt m-t-0 m-b-0" style="cursor: pointer;">LOGIN</a>
								</div>
							</div>
							<!-- /CONTENT BOX -->
						</div>
						<!-- /CONTENT BOXES -->
					</div>
				</div>
			</div>
		</section>