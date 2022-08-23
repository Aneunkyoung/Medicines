<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<form id="questionModifyForm" action="${pageContext.request.contextPath }/question_modify/${question.num}" method="post" enctype="multipart/form-data">
	<div class="wrapper">
		<section class="module">
			<div class="container">
				<div class="row">
					<div class="col-sm-8 col-sm-offset-2">
						<h4 class="font-alt m-t-0 m-b-0">question</h4>
						<hr class="divider-w m-t-10 m-b-20">
						<div class="form-group">
						<c:choose>
							<c:when test="${question.img == null }">
								<img id="questionImg" src="${pageContext.request.contextPath}/images/upload.png" style="width: 70px; cursor: pointer;">
							</c:when>
							<c:otherwise>
								<img id="questionImg" src="${pageContext.request.contextPath}/questionImg/${question.img}" style="width: 70px; cursor: pointer;">
							</c:otherwise>
						</c:choose>
						</div>
						<div class="form-group">
							<input name="id" class="form-control" type="hidden" placeholder="아이디" value="${question.id }">
							<input name="img" class="form-control" type="hidden" placeholder="이미지" value="${question.img }">
							<input name="writer" class="form-control" type="hidden" placeholder="작성자" value="${question.writer }">
							<input id="title" name="title" class="form-control" type="text" placeholder="제목" maxlength="200" value="${question.title }">
							<div id = "titleErr"></div>
						</div>
						<div class="form-group">
							<textarea id="content" name="content" class="form-control" rows="10" style="resize: none;" placeholder="내용" maxlength="1000">${question.content }</textarea>
							<div id = "contentErr"></div>
						</div>
						<div class="form-group">
							<input type="checkbox" id="secret_chk" name="status" value="${question.status }">  비밀글
						</div>
						<p><button id="questionModifyBtn" type="submit" class="btn btn-border-d btn-round btn-block">Submit</button></p>
					</div>
				</div>
			</div>
		</section>
	</div>
	<input type="file" id="fileUpload" name="uploadQuestionFile" accept="image/*" onchange="readURL(this);" style="opacity: 0;">
</form>	
<script type="text/javascript">
$("#questionModifyBtn").click(function(){
	if($("#title").val() == ''){
		$("#title").focus();
		document.getElementById("titleErr").innerHTML="제목을 입력해주세요.";
		return false;
	} else if($("#title").val().length>=200){
		$("#title").focus();
		document.getElementById("titleErr").innerHTML="제목은 200글자 이내로 작성해주세요.";
		return false;
	} else{
		document.getElementById("titleErr").innerHTML="";			
	}
	if($("textarea#content").val() == ''){
		$("textarea#content").focus();
		document.getElementById("contentErr").innerHTML="내용을 입력해주세요.";
		return false;
	} else if($("textarea#content").val().length >= 1000){
		$("textarea#content").focus();
		document.getElementById("contentErr").innerHTML="내용은 1000글자 이내로 작성해주세요.";
		return false;
	} else{
		document.getElementById("contentErr").innerHTML="";			
	}	 
	questionModifyForm.submit();
});
$('#questionImg').click(function() {
	$('#fileUpload').click();
});
function readURL(input) {
	if (input.files && input.files[0]) {
		var reader = new FileReader();
		reader.onload = function(e) {
		document.getElementById('questionImg').src = e.target.result;
	};
	reader.readAsDataURL(input.files[0]);
	} else {
		document.getElementById('questionImg').src = "";
	}
	
}	
$("#secret_chk").change(function(){
    if($("#secret_chk").is(":checked")){
		document.getElementById("secret_chk").setAttribute('value', '1');
    } else{
		document.getElementById("secret_chk").setAttribute('value', '0');
    }
});
if ($("#secret_chk").val()==1) {
	$("#secret_chk").prop("checked", true);
} else{
	$("#secret_chk").prop("checked", false);
}
</script>