<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<head><script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
</head>
	<div class="wrapper">
		<section class="module">
			<div class="container" >
				<div class="row">
					<div class="col-sm-6 col-sm-offset-3">
						<form id="loginForm" method="post">
							<h4 class="font-alt m-t-0 m-b-0">LOGIN</h4>
							<hr class="divider-w m-t-10 m-b-20">
							<div class="form-group">
								<input id="id" name="id" class="form-control input-lg" type="text" placeholder="아이디" value="${id}">
								<div id = "idErr"></div>
							</div>
							<div class="form-group">
								<input id="password" name="password" class="form-control input-lg" type="password" placeholder="비밀번호">
								<div id = "pwErr"></div>
							</div>
							<div class="form-group">
								<div>${message }</div>
							</div>
							<p><button id="loginBtn" type="submit" class="btn btn-border-d btn-round btn-block">Login</button></p>
					    	<input type="hidden" name="kakaoemail" id="kakaoemail" value="" />
					    	<input type="hidden" name="kakaoname" id="kakaoname" value="" />
					    	<input type="hidden" name="kakaoprofile" id="kakaoprofile" value="" />
						</form>	 
						<p>
							<a href="javascript:kakaoLogin();"><img src="${pageContext.request.contextPath }/images/kakao_login_medium.png" id="kakaoLogin" style="cursor: pointer;"></a>
						</p>
						<form action="https://tistory1.daumcdn.net/tistory/0/MobileWeb/kakaologin" method="post" hidden>
					    </form>
						<div style="text-align: center;">
							<a href="findId" class="font-alt m-t-0 m-b-0" style="cursor: pointer;">아이디 찾기</a>
							<span class="bar" aria-hidden="true">|</span>
							<a href="findPw" class="font-alt m-t-0 m-b-0" style="cursor: pointer;">비밀번호 찾기</a>
							<span class="bar" aria-hidden="true">|</span>
							<a href="join" class="font-alt m-t-0 m-b-0" style="cursor: pointer;">회원가입</a>
						</div>
					</div>
				</div>
			</div>
		</section>
	</div>
<script type="text/javascript">
$("#loginBtn").click(function(){
	if($("#id").val() == ''){
		$("#id").focus();
		document.getElementById("idErr").innerHTML="아이디를 입력해주세요.";
		return false;
	} else{
		document.getElementById("idErr").innerHTML="";			
	}
	if($("#password").val() == ''){
		$("#password").focus();
		document.getElementById("pwErr").innerHTML="비밀번호를 입력해주세요.";
		return false;
	} else{
		document.getElementById("pwErr").innerHTML="";			
	}		
	loginForm.action="${pageContext.request.contextPath }/login";
	loginForm.submit();
});

window.Kakao.init("");
function kakaoLogin(){
	window.Kakao.Auth.login({
		scope:'profile_nickname,profile_image,account_email',
		success: function(authObj){
			window.Kakao.API.request({
				url: '/v2/user/me',
				success: res => {
					const email = res.kakao_account.email;
					const name = res.properties.nickname;
					const profile = res.properties.profile_image;
					
					$('#kakaoemail').val(email);
					$('#kakaoname').val(name);
					$('#kakaoprofile').val(profile);
					
					loginForm.action="${pageContext.request.contextPath }/kakaologin";
					loginForm.submit();			
				}
			});
			
		}
	});
}
</script>