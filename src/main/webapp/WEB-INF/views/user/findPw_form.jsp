<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<form id="findPasswordForm" method="post" action="${pageContext.request.contextPath }/findPw">
	<div class="wrapper">
		<section class="module">
			<div class="container" >
				<div class="row">
					<div class="col-sm-6 col-sm-offset-3">
						<h4 class="font-alt m-t-0 m-b-0">FIND PASSWORD</h4>
						<hr class="divider-w m-t-10 m-b-20">
						<div class="form-group">
							<input id="id" name="id" class="form-control input-lg" type="text" placeholder="아이디" value="${id }">
							<div id = "idErr"></div>
						</div>
						<div class="form-group">
							<input id="email" name="email" class="form-control input-lg" type="email" placeholder="이메일" value="${email }">
							<div id = "emailErr"></div>
						</div>
						<div class="form-group">
							${message }
						</div>
						<p><button id="findPasswordBtn" type="submit" class="btn btn-border-d btn-round btn-block">Submit</button></p>
					</div>
				</div>
			</div>
		</section>
	</div>
</form>
<script type="text/javascript">
$("#findPasswordBtn").click(function(){
	if($("#id").val() == ''){
		$("#id").focus();
		document.getElementById("idErr").innerHTML="아이디를 입력해주세요.";
		return false;
	} else{
		document.getElementById("idErr").innerHTML="";			
	}
	if($("#email").val() == ''){
		$("#email").focus();
		document.getElementById("emailErr").innerHTML="이메일을 입력해주세요.";
		return false;
	} else{
		document.getElementById("emailErr").innerHTML="";			
	}		
	findPasswordForm.submit();
});
</script>