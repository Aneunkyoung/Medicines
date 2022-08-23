<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<form id="updateForm" method="post" action="${pageContext.request.contextPath}/userInfo" enctype="multipart/form-data">
	<div class="wrapper">
		<section class="module">
			<div class="container" >
				<div class="row">
					<div class="col-sm-6 col-sm-offset-3">
						<h4 class="font-alt m-t-0 m-b-0">UPDATE</h4>
						<hr class="divider-w m-t-10 m-b-20">
						<div class="form-group" style="text-align: center;">
							<img src="${pageContext.request.contextPath}/userProfile/${user.profile}" class="user-img-content" id="userImg" style="width: 200px;">						
						</div>
						<div class="form-group">
							<input id="name" name="name" class="form-control input-lg" type="text" placeholder="이름" value="${user.name }">
							<div id = "nameErr"></div>
						</div>
						<div class="form-group">
							<input type="hidden" name="id" value="${user.id }">
							<input id="id" class="form-control input-lg" type="text" readonly="readonly" placeholder="아이디" value="${user.id }">
							<div id = "idErr"></div>
						</div>
						<div class="form-group">							
							<input id="password" name="password" class="form-control input-lg" type="password" placeholder="비밀번호">
							<div id = "passwordErr"></div>
						</div>
						<div class="form-group">
							<input id="repassword" class="form-control input-lg" type="password" placeholder="비밀번호 재확인">
							<div id = "repasswordErr"></div>
						</div>
						<div class="form-group">
							<input id="email" name="email" class="form-control input-lg" type="email" readonly="readonly" placeholder="본인인증 이메일" value="${user.email }">
							<div id = "emailErr"></div>
						</div>
						<div class="form-group">
							<input id="phone" name="phone" class="form-control input-lg" type="tel" readonly="readonly" placeholder="휴대전화(-를 제외하고 입력해주세요.)" value="${user.phone }">
							<div id = "phoneErr"></div>
						</div>
						<p><button id="updateBtn" type="submit" class="btn btn-border-d btn-round btn-block">Update</button></p>
						
						<div style="text-align: center;">${message }</div>			
						<div style="float: right; cursor: pointer;" onclick="deleteAccount('${user.id}', '${user.password}')">회원 탈퇴</div>			
					</div>
				</div>
			</div>
		</section>
	</div>
	<input type="file" id="fileUpload" name="uploadFile" accept="image/*" style="opacity: 0;" onchange="readURL(this);">
</form>
<script type="text/javascript">
$('#updateBtn').click(function () { 	
	var nameVal = $("#name").val();
	var nameRegExp = /^[가-힣]{2,10}$/;
	var pwVal = $("#password").val();
	var pwRegExp = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,20}$/;
	
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
	
	/*비밀번호 에러 체크*/
	
	if ($("#password").val()!="" && !pwRegExp.test($('#password').val())) {
		$('#password').focus();
		document.getElementById("passwordErr").innerHTML="숫자, 영문자, 특수문자 포함 8~20자리 이내로 입력해 주세요.";
		return false;
	} else {
		document.getElementById("passwordErr").innerHTML="";
	}
	
	/*비밀번호 재확인 에러 체크 */
	if($("#password").val()!="" && $("#repassword").val()==""){
		$('#repassword').focus();
		document.getElementById("repasswordErr").innerHTML="비밀번호 재확인을 입력해 주세요.";
		return false;
	} else if ($('#password').val()!=$('#repassword').val()) {
		$('#repassword').focus();
		document.getElementById("repasswordErr").innerHTML="입력한 비밀번호와 재입력한 비밀번호가 일치하지 않습니다. 다시 확인해 주세요.";			
		return false;
	} else {
		document.getElementById("repasswordErr").innerHTML="";
	}
	
	updateForm.submit();
});

$('#userImg').click(function() {
	$('#fileUpload').click();
});

function readURL(input) {
	if (input.files && input.files[0]) {
		var reader = new FileReader();
		reader.onload = function(e) {
		document.getElementById('userImg').src = e.target.result;
	};
	reader.readAsDataURL(input.files[0]);
	} else {
		document.getElementById('userImg').src = "";
	}
}	

function deleteAccount(id, password) {
	if($('#password').val()=='') { 
		$('#password').focus();
		document.getElementById("passwordErr").innerHTML="비밀번호를 입력해 주세요.";
		return false;
	} else {
		document.getElementById("passwordErr").innerHTML="";
	}
	
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
	
	if (confirm("${user.name}님의 회원 탈퇴를 진행하시겠습니까?")) {
		password=$('#password').val();
		location.href="userDeleteAccount/"+id+"/"+password;
	}
}
</script>