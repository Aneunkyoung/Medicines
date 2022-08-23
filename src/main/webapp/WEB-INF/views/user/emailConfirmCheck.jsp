<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
		<section class="module">
			<div class="container" >
				<div class="row">
					<div class="col-sm-6 col-sm-offset-3">
						<!-- CONTENT BOXES -->
						<h4 class="font-alt m-t-0 m-b-0" style="text-align: center;">이메일 인증하기</h4>
						<hr class="divider-w m-t-10 m-b-20">
						<div class="row multi-columns-row">
							
							<!-- CONTENT BOX -->
							<div>
								<div class="content-box">
									<div class="content-box-icon">
										<span class="icon-envelope"></span>
									</div>
									<div class="content-box-title font-inc font-uppercase">
										인증하기
									</div>
									<div class="content-box-text">
										안녕하세요 ${name}님. 로그인을 하기위해 이메일(${email }) 인증을 해주세요.
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