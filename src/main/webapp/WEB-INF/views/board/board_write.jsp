<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<form id="boardForm" action="${pageContext.request.contextPath }/board_write" method="post" enctype="multipart/form-data">
	<div class="wrapper">
		<section class="module">
			<div class="container">
				<div class="row">
					<div class="col-sm-8 col-sm-offset-2">
						<h4 class="font-alt m-t-0 m-b-0">BOARD</h4>
						<hr class="divider-w m-t-10 m-b-20">
						<div class="form-group">
							<img id="boardImg" src="${pageContext.request.contextPath}/images/upload.png" style="width: 70px; cursor: pointer;">
						</div>
						<div class="form-group">
							<input name="id" class="form-control" type="hidden" placeholder="아이디" value="${loginUser.id }">
							<input name="writer" class="form-control" type="hidden" placeholder="작성자" value="${loginUser.name }">
							<input id="title" name="title" class="form-control" type="text" placeholder="제목" maxlength="200">
							<div id = "titleErr"></div>
						</div>
						<div class="form-group">
							<textarea id="content" name="content" class="form-control" rows="10" style="resize: none;" placeholder="내용" maxlength="1000"></textarea>
							<div id = "contentErr"></div>
						</div>
						<p><button id="boardBtn" type="submit" class="btn btn-border-d btn-round btn-block">Submit</button></p>
					</div>
				</div>
			</div>
		</section>
	</div>
	<input type="file" id="fileUpload" name="uploadBoardFile" accept="image/*" onchange="readURL(this);" style="opacity: 0;">
</form>	
<script type="text/javascript">
$("#boardBtn").click(function(){
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
	boardForm.submit();
});
$('#boardImg').click(function() {
	$('#fileUpload').click();
});
function readURL(input) {
	if (input.files && input.files[0]) {
		var reader = new FileReader();
		reader.onload = function(e) {
		document.getElementById('boardImg').src = e.target.result;
	};
	reader.readAsDataURL(input.files[0]);
	} else {
		document.getElementById('boardImg').src = "";
	}
	
}	
</script>