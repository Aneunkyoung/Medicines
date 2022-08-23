<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<form id="findIdForm" method="post" action="${pageContext.request.contextPath }/findId">	
	<div class="wrapper">
		<section class="module">
			<div class="container" >
				<div class="row">
					<div class="col-sm-6 col-sm-offset-3">
						<h4 class="font-alt m-t-0 m-b-0">FIND ID</h4>
						<hr class="divider-w m-t-10 m-b-20">
						<div class="form-group">
							<input id="name" name="name" class="form-control input-lg" type="text" placeholder="이름" value="${name }">
							<div id = "nameErr"></div>
						</div>
						<div class="form-group">
							<input id="email" name="email" class="form-control input-lg" type="email" placeholder="이메일" value="${email }">
							<div id = "emailErr"></div>
						</div>
						<div class="form-group">
							${message }
						</div>
						<p><button id="findIdBtn" type="submit" class="btn btn-border-d btn-round btn-block">Submit</button></p>
					</div>
				</div>
			</div>
		</section>
	</div>
</form>
<script type="text/javascript">
$("#findIdBtn").click(function(){
	if($("#name").val() == ''){
		$("#name").focus();
		document.getElementById("nameErr").innerHTML="이름을 입력해주세요.";
		return false;
	} else{
		document.getElementById("nameErr").innerHTML="";			
	}
	if($("#email").val() == ''){
		$("#email").focus();
		document.getElementById("emailErr").innerHTML="비밀번호를 입력해주세요.";
		return false;
	} else{
		document.getElementById("emailErr").innerHTML="";			
	}		
	findIdForm.submit();
});
</script>