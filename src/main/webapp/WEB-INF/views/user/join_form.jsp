<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<form id="joinForm" method="post" action="${pageContext.request.contextPath}/join" >
	<div class="wrapper">
		<section class="module">
			<div class="container" >
				<div class="row">
					<div class="col-sm-6 col-sm-offset-3">
						<h4 class="font-alt m-t-0 m-b-0">JOIN</h4>
						<hr class="divider-w m-t-10 m-b-20">
						<div class="form-group">
							<input id="name" name="name" class="form-control input-lg" type="text" placeholder="이름" value="${user.name}">							
							<div id = "nameErr"></div>
						</div>
						<div class="form-group">
							<input id="id" name="id" class="form-control input-lg" type="text" placeholder="아이디" value="${user.id}">
							<div id = "idErr"></div>
						</div>
						<div class="form-group">
							<input id="password" name="password" class="form-control input-lg" type="password" placeholder="비밀번호">
							<div id = "passwordErr"></div>
						</div>
						<div class="form-group">
							<input id="repassword" name="repassword" class="form-control input-lg" type="password" placeholder="비밀번호 재확인">
							<div id = "repasswordErr"></div>
						</div>
						<div class="form-group">
							<input id="email" name="email" class="form-control input-lg" type="email" placeholder="본인인증 이메일" value="${user.email}">
							<div id = "emailErr"></div>
						</div>
						<div class="form-group">
							<input id="phone" name="phone" class="form-control input-lg" type="tel" placeholder="휴대전화(-를 제외하고 입력해주세요.)" value="${user.phone}">
							<div id = "phoneErr"></div>
						</div>
						<div class="form-group">
							<div>${message }</div>
						</div>
						<p><button id="joinBtn" type="submit" class="btn btn-border-d btn-round btn-block">Join</button></p>
					</div>
				</div>
			</div>
		</section>
	</div>
</form>
<script type="text/javascript">
$('#joinBtn').click(function () { 
	var emailVal = $("#email").val();
	var emailRegExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	var idVal = $("#id").val();
	var idRegExp = /^[a-z0-9]{3,14}$/g;
	var idRegExp2 = /^(?=.*[a-z])(?=.*[0-9])[a-z0-9]{3,14}$/
	var nameVal = $("#name").val();
	var nameRegExp = /^[가-힣]{2,10}$/;
	var pwVal = $("#password").val();
	var pwRegExp = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,20}$/;
	var phoneVal = $("#phone").val();
	var phoneRegExp = /^\d{3}\d{3,4}\d{4}$/;
	
	/*이름 에러 체크*/
	if($('#name').val()=='') { 
		$('#name').focus();
		document.getElementById("nameErr").innerHTML="이름을 입력해 주세요.";
		return false;
	} else if (nameVal.match(nameRegExp) == null) {
		$('#name').focus();
		document.getElementById("nameErr").innerHTML="2자 이상 10자까지 한글로만 입력해주세요.";
		return false;
		} else {
		document.getElementById("nameErr").innerHTML="";
	}

	/*아이디 에러 체크*/
	if($('#id').val()=='') { 
		$('#id').focus();
		document.getElementById("idErr").innerHTML="아이디를 입력해 주세요.";
		return false;
	} else if($('#id').val().length>15 || $('#id').val().length<3){
		$('#id').focus();
		document.getElementById("idErr").innerHTML="3자 이상 15자까지 사용할 수 있습니다.";
		return false;
	} else if (idVal.match(idRegExp) == null) {
		$('#id').focus();
		document.getElementById("idErr").innerHTML="아이디는 영문 소문자, 숫자만 3자 이상 15자까지 사용할 수 있습니다.";
		return false;
	} else if (idVal.match(idRegExp2) == null) {
		$('#id').focus();
		document.getElementById("idErr").innerHTML="아이디는 영문 소문자, 숫자가 하나 이상 포함되어야 합니다.";
		return false;
	} else {
		document.getElementById("idErr").innerHTML="";
	} 
	
	
	/*비밀번호 에러 체크*/
	if($('#password').val()=='') { 
		$('#password').focus();
		document.getElementById("passwordErr").innerHTML="비밀번호를 입력해 주세요.";
		return false;
	} else if (pwVal.match(pwRegExp) == null) {
		$('#password').focus();
		document.getElementById("passwordErr").innerHTML="숫자, 영문자, 특수문자 포함 8~20자리 이내로 입력해 주세요.";
		return false;
		} else {
		document.getElementById("passwordErr").innerHTML="";
	}
	
	/*비밀번호 재확인 에러 체크 */
	if($('#repassword').val()=='') { 
		$('#repassword').focus();
		document.getElementById("repasswordErr").innerHTML="비밀번호 재확인을 입력해 주세요.";
		return false;
	} else if($('#repassword').val()!=$('#password').val()){
		document.getElementById("repasswordErr").innerHTML="입력한 비밀번호와 재입력한 비밀번호가 일치하지 않습니다. 다시 확인해 주세요.";
		return false;
	} else {
		document.getElementById("repasswordErr").innerHTML="";
	}
	
	/*이메일 에러 체크*/
	if($('#email').val()=='') { 
		$('#email').focus();
		document.getElementById("emailErr").innerHTML="이메일을 입력해 주세요.";
		return false;
	} else if($('#email').val()!=''&& $('#email').val().length>254){
		$('#email').focus();
		document.getElementById("emailErr").innerHTML="254자까지 사용할 수 있습니다.";
		return false;
	} else if (emailVal.match(emailRegExp) == null) {
		$('#email').focus();
		document.getElementById("emailErr").innerHTML="이메일 형식에 맞게 입력해 주세요.";
		return false;
		} else {
		document.getElementById("emailErr").innerHTML="";
	}
	
	/*전화번호 에러 체크 */
	if($('#phone').val()=='') { 
		$('#phone').focus();
		document.getElementById("phoneErr").innerHTML="전화번호를 입력해 주세요.";
		return false;
	} else if (phoneVal.match(phoneRegExp) == null) {
		$('#phone').focus();
		document.getElementById("phoneErr").innerHTML="잘못된 형식의 전화번호입니다. 정확한 전화번호를 입력해 주세요.";
		return false;
		} else {
		document.getElementById("phoneErr").innerHTML="";
	}
	
	joinForm.submit();
});
</script>