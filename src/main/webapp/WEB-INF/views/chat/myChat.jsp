<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
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
.comment-content {
    padding-top: 5px;
    margin-left: 75px;
    margin-bottom: 0px;
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
							<div class="comment-heading"><h3 class="comment-heading-title font-alt">ChatList
								<a class="uk-button uk-button-default" href="#modal-center" uk-toggle style="float: right;">친구찾기</a>
								<div id="modal-center" class="uk-flex-top" uk-modal>
	   								<div class="uk-modal-dialog uk-modal-body uk-margin-auto-vertical">
	       			 					<button class="uk-modal-close-default" type="button" uk-close></button>
	       			 					<div class="uk-modal-header">
											<input type="text" id="findfriend" placeholder="친구찾기">
								        </div>
							
								        <div class="uk-modal-body" uk-overflow-auto>
											<div>
												<div id="findfriendDiv">
													<div id="findfriendList">
														<table class='searchTable2' border="1">
															<tbody></tbody>
														</table>
													</div>
												</div>
												
												<div id="choice2"></div>
											</div>
								        </div>
						 			</div>
								</div>
							</h3></div>
							<div id="commentBody" style="overflow: scroll;height: 400px;">
								<c:forEach items="${chatList}" var="chatList">
									<c:choose>
										<c:when test="${chatList.fromId == userInfo.id }">
											<div class="comment clearfix" onclick="location.href='${pageContext.request.contextPath}/chat/${chatList.toId }'" style="cursor: pointer;">
												<div class="comment-avatar">
													<img src="${pageContext.request.contextPath}/userProfile/${chatList.toProfile}" class="user-img" width="50">
												</div>
												<div class="comment-content clearfix">
													<div class="comment-body">											
														<a>${chatList.toName }</a> 
														<div><p style="float: left;">나: ${chatList.chatContent }</p><p style="float: right;">${chatList.chatTime }</p></div>
													</div>
												</div>							
											</div>
										</c:when>
										
										<c:otherwise>
											<div class="comment clearfix" onclick="location.href='${pageContext.request.contextPath}/chat/${chatList.fromId }'" style="cursor: pointer;">
												<div class="comment-avatar">
													<img src="${pageContext.request.contextPath}/userProfile/${chatList.fromProfile}" class="user-img" width="50">
												</div>
												<div class="comment-content clearfix">
													<div class="comment-body">											
														<a>${chatList.toName }</a> 
														<c:if test="${chatList.chatRead==0}">
															<span class="note-num" style="height: 10px;width: 10px;line-height: 20px;text-align: center;background-color: #32d296;border-radius: 15px;display: inline-block;color: white;">&nbsp;</span>
															
														</c:if>	
														<div><p style="float: left;">${chatList.chatContent }</p><p style="float: right;">${chatList.chatTime }</p></div>
													</div>
												</div>							
											</div>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
	</div>	
</body>
<script type="text/javascript">
/* var toId="${loginUser.id }";
var fromId="${chatList }";
for(var i=0; i<fromId.length; i++) {
	console.log(fromId);
}
function showUnread() {
	$.ajax({
		url:"chatUnreadNumById",
		type:"get",
		data:"fromId="+fromId+"?toId="+toId,
	});
} */

document.getElementById("findfriend").focus();
document.getElementById("findfriend").onkeyup=function(){
	var findfriend=document.getElementById("findfriend").value;
	if (findfriend==null || findfriend=="") {
		document.getElementById("findfriendDiv").style.display="none";
		return;
	}
	$.ajax({
		url: "findFriends",
		type: "get",
		data: "findfriend="+findfriend,
		success: function(data) {
			var html="";
			
			for(var i=0; i<data.length; i++) {
				html+="<table class='searchTable2'>"+"<tr>"+"<td style='width: 50px;'>"+"<img src=/medicines/userProfile/"+data[i].profile+" width='50' style='height:50px; '>"+"</td>"+"<td style='text-align:center; width:200px;'>"+data[i].name+"("+data[i].id+")"+"</td>"+"<td style='text-align:center;'>"+'<button onclick="chatBtn(\''+data[i].id+'\')" class="btn btn-border-d btn-round" style="float: right;">대화하기</button>'+"</td>"+"</tr>"+"</table>"
			}
			document.getElementById("findfriendList").innerHTML=html;
			document.getElementById("findfriendDiv").style.display="block";
			
		},
		error: function(xhr) {
			alert(xhr.status);
		}
	});
	
}

function chatBtn(id){
	location.href="chat/"+id;
}
</script>
</html>