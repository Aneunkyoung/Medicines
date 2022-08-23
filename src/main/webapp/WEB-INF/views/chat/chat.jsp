<%@page import="com.medicines.dao.ChatDAO"%>
<%@page import="com.medicines.service.ChatService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.7/handlebars.min.js"></script>
<style type="text/css">
.comment-heading{
	color: #333;
    background-color: #fff;
    padding: 10px 15px;
    border-bottom: 1px solid #ddd;
}
.comment-heading-title{
	margin-top: 0;
    margin-bottom: 0;
    font-size: 14px;
    color: inherit;
}
.comments{
	margin-bottom: 20px;
    background-color: #fff;
    border: 1px solid #ddd;
    border-radius: 4px;
}
.comment{
	padding: 15px;
}
.comment-footer{
	padding: 10px 15px;
    background-color: #fff;
    border-top: 1px solid #ddd;
    border-bottom-right-radius: 3px;
    border-bottom-left-radius: 3px;
}
.comment-avatar-mine{
	width: 55px;
    float: right;
    margin-top: 10px;
}
.comment-content-mine{
	padding-top: 5px;
    margin-right: 75px;
    margin-bottom: 30px;
}
.input-message{
	position: relative;
    display: table;
    border-collapse: separate;
}
.form-message{
	width: 100%;
    height: 43px;
    outline: none;
    padding: 6px 12px;
    border-radius: 3px;
    font-size: 12px;
    border: 1px solid #b2b2b2;
}
</style>
</head>
<body>
<div class="wrapper">
		<section class="module">
			<div class="container" >
				<div class="row">
					<div class="col-sm-6 col-sm-offset-3">					
						<div class="comments">
							<div class="comment-heading"><h3 class="comment-heading-title font-alt">${uInfo.name }</h3></div>
							
							<div class="comment-body" style="height: 500px; overflow: scroll;">
		

							</div>
							<div class="comment-footer">
									<div class="input-message">
										<input type="text" id="chatContent" name="chatContent" class="form-message" placeholder="Say something">
										<span class="input-group-btn">
											<button class="btn btn-primary" type="button" id="sendChat" style="background: black; border-color: black;">SEND</button>
										</span>
									</div>
							</div>
							
						</div>
						
					</div>
				</div>
			</div> 
		</section>
	</div>	
	<script id="template" type="text/x-handlebars-template">
		{{#each .}}
			<div class="comment clearfix">		
				<div class="comment-avatar">
					<img src="${pageContext.request.contextPath}/userProfile/{{fromProfile}}" class="user-img" width="50">
				</div>
				<div class="comment-content clearfix">
					<div class="comment-body">											
						<a>{{fromName}}</a>
						<div><p style="float: left;">{{chatContent}}</p><p style="float: right;">{{chatTime}}</p></div>
					</div>
				</div>							
			</div>
		{{/each}}
	</script>
	<script type="text/javascript">
		var id = '${uInfo.id}';

		/* $(document).ready(function(){
			setInterval(() => {
				displayChat(id);
			}, 1000);
		}); */
		
		
		displayChat(id);
		
		function displayChat(yourId) {
			id=yourId;
			
			$.ajax({
				type: "get",
				url: "/medicines/chatList/"+yourId,	
				dataType: "json",
				success: function(json){
					var source=$("#template").html();
					
					var template=Handlebars.compile(source);
					 
					$(".comment-body").html(template(json.chatList));
					$('.comment-body').scrollTop($('.comment-body')[0].scrollHeight);
				},
				error: function(xhr) {
					/* alert(xhr.status+"대화내용 없음"); */
				}
			});
		}
		
		$("#sendChat").click(function() {
			var fromId = "${loginUser.id }";
			var fromName = "${loginUser.name }";
			var fromProfile = "${loginUser.profile }";
			var toId = "${uInfo.id }";
			var toName = "${uInfo.name }";
			var toProfile = "${uInfo.profile }";
			var chatContent = $('#chatContent').val();
			var chatRoom = (fromId+toId).split('').sort().reverse().join('');
			
			if (chatContent==null || chatContent=='') {
				return false;
			}
			
			$.ajax({
				type:"post",
				url: "/medicines/chat_send",
				contentType: "application/json",
				data: JSON.stringify({"fromId":fromId,"fromName":fromName, "fromProfile":fromProfile, "toId":toId, "toName":toName, "toProfile":toProfile,"chatContent":chatContent, "chatRoom":chatRoom}),
				dateType: "text",
				success: function(text) {
					if(text=="success") {
						$('#chatContent').val('');
						displayChat(toId);
					}
				},
				error: function(xhr) {
					/* alert(xhr.status); */
				}
			});
		});
		
		
		$('.comment-body').scrollTop($('.comment-body')[0].scrollHeight);
	</script>
</body>
</html>