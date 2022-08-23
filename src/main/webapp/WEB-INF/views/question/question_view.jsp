<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.7/handlebars.min.js"></script>
<style type="text/css">
th{
	padding: 11px 0 10px 18px;
    border: 1px solid #dfdfdf;
    border-bottom-width: 0;
    color: #353535;
    text-align: left;
    font-weight: normal;
    background-color: #fbfafa;
    font-size: 12px;
    width: 100px;
}
td{
	padding: 11px 10px 10px;
    border-top: 1px solid #dfdfdf;
    color: #353535;
    vertical-align: middle;
    word-break: break-all;
    word-wrap: break-word;
    font-size: 12px;
}
.etcArea{
	padding: 0;
}
.etcArea li{
	display: inline-block;
    padding: 8px 20px;
    vertical-align: top;
    line-height: 22px;
    color: #666;
}
span{
	display: inline-block;
    font-size: 11px;
    color: #939393;
    word-break: normal;
}
.content {
    height: 100px;
    vertical-align: middle;
}
.detail{
	padding: 30px 20px;
    border-top: 1px solid #eaeaea;
    margin: -9px 0 0;
    word-break: break-all;
    line-height: normal;
}
#updateDiv { 
	border: 1px solid black; 
	position: absolute; 
	top: 50%;
	left: 50%; 
	margin-top: -40px; 
	margin-left: -120px; 
	padding: 5px; 
	z-index: 100; 
	display: none; 
}
#updateTable td{
    padding: 11px 10px 10px;
    color: #353535;
    vertical-align: middle;
    word-break: break-all;
    word-wrap: break-word;
    font-size: 12px;
    border: 0;
}
#updateContent{
	resize: none;
}
</style>
</head>
    <div class="wrapper">
		<section class="module">
			<div class="container" >
				<div class="row">
					<div class="col-sm-12 col-sm-offset-0">
					<div><button onclick="location.href='${pageContext.request.contextPath}/question'" type="button" class="btn btn-border-d btn-round" style="margin-bottom: 10px; float: right;">목록</button></div>
						<table style="width: 100%; border: 1px solid #ddd; border-spacing: 10px 10px;">
							<tbody>
								<tr>
									<th>제목</th>
									<td>${question.title }</td>
								</tr>
								<tr>
									<th>작성자</th>
									<td>${question.writer }</td>
								</tr>
								<tr>
									<th>작성일</th>
									<td>${question.regdate }</td>
								</tr>
								<tr>
									<td colspan="2" class="contnet">
										<ul class="etcArea">
						                	<li>
						                    	<strong>조회수</strong> <span>${question.readcount }</span>
						                    </li>
						                </ul>
						                <div class="detail">
						                	<div>
						                		<c:if test="${question.img != null}">
						                		<img src="${pageContext.request.contextPath}/questionImg/${question.img}" style="width: 200px; margin-bottom:10px;">	
						                		</c:if>
						                	</div>
						                	<div>
						                		<p style="white-space: pre;">${question.content }</p>
						                	</div>
						                </div>
									</td>
								</tr>	
							</tbody>
						</table>
						<c:if test="${loginUser.id == question.id  || loginUser.userStatus==9}">		
							<div style="margin-top: 10px; float: right;">			
								<button onclick="removeQuestion(${question.num})" type="button" class="btn btn-border-d btn-round">삭제</button>
								<button id="commentModifyBtn" onclick="updatequestion(${question.num})" type="button" class="btn btn-border-d btn-round">변경</button>
							</div>
						</c:if>
					</div>
					
					<div class="col-sm-12 col-sm-offset-0" style="margin-top: 20px;">
						<h4 class="comment-title font-alt">${commentcount} comments</h4>
						
						<form id="commentForm" action="question_comment_write/${question.num }" method="post">							
							<div class="form-group">
								<textarea id="content" name="content" class="form-control" rows="6" style="resize: none;" placeholder="내용" maxlength="1000"></textarea>
								<div id = "contentErr"></div>
								<div>${message }</div>
								<c:if test="${loginUser.id==question.id || loginUser.userStatus==9 }">
									<div>
										<button id="commentWriteBtn" type="button" class="btn btn-border-d btn-round" style="margin-top: 10px; float: right;">등록</button>
									</div>
								</c:if>
							</div>
						</form>
						
						<c:forEach var="comment" items="${commentList }" varStatus="status">
							<div class="col-sm-12 col-sm-offset-0">
								<div class="comments">
								<div id="comment_${comment.no }"></div>
								
									<div class="comment clearfix">
										<div class="comment-avatar">
											<%-- <img src="${pageContext.request.contextPath}/userProfile/${comment.profile}" style="border-radius: 50%;"> --%>
											<ul class="nav navbar-nav">
													<li class="dropdown">
														<div class="comment-avatar">
															<a href="#" class="dropdown-toggle binded" data-toggle="dropdown"><img src="${pageContext.request.contextPath}/userProfile/${comment.profile}" style="border-radius: 50%; height: 50px; width: 50px;"></a>
															<ul class="dropdown-menu leftauto" role="menu">
																<li><a href="${pageContext.request.contextPath}/chat/${comment.id }"><i class="icon-chat"></i> ${comment.writer }님과 대화하기</a></li>								
															</ul>
														</div>
													</li>
												</ul>
										</div>
										
										<div class="comment-content clearfix">
											<div class="comment-author font-inc">
												<a>${comment.writer }</a>
											</div>
											<div class="comment-body">
												<p>${comment.content }</p>
											</div>
											<div class="comment-meta font-inc">
												${comment.regdate }
											</div>
										</div>
											<c:if test="${loginUser.id == comment.id  || loginUser.userStatus==9}">		
												<div style="margin-top: 10px; float: left;">			
													<button onclick="removeComment(${comment.no })" type="button" class="btn btn-border-d btn-round">삭제</button>
													<button onclick="updateComment(${comment.no })" type="button" class="btn btn-border-d btn-round">변경</button>
												</div>
											</c:if>
									</div>
								</div>
							</div>
						</c:forEach>  						
						<div id="updateDiv"> 
							<input type="hidden" name="no" id="updateNum"> 
							<table id="updateTable"> 
								<tr> 
									<td><textarea name="content" id="updateContent" class="form-control"></textarea></td> 
								</tr> 
								<tr> 
									<td colspan="2"> 
										<button type="button" id="updateBtn" class="btn btn-border-d btn-round">변경</button>
										<button type="button" id="cancelUpdateBtn" class="btn btn-border-d btn-round">취소</button>
									</td> 
								</tr> 
							</table> 
						</div>
						
						
					</div>
				</div>
				<div id="paging" class="pagination font-inc text-uppercase">
							<c:choose>
								<c:when test="${pager.startPage > pager.blockSize}">
									<a href="${pageContext.request.contextPath}/question_view?num=${question.num }&pageNum=1"><i class='fa fa-angle-left'></i> First </a> 
									<a href="${pageContext.request.contextPath}/question_view?num=${question.num }&pageNum=${pager.prevPage}"><i class='fa fa-angle-left'></i> Prev </a>
								</c:when>
								
								<c:otherwise>
									<a href="${pageContext.request.contextPath}/question_view?num=${question.num }&pageNum=1"><i class='fa fa-angle-left'></i> First </a> <i class='fa fa-angle-left'></i> Prev 
								</c:otherwise>
							</c:choose>
							
							<c:forEach begin="${pager.startPage }" end="${pager.endPage }" var="page">
								<c:choose>
									<c:when test="${page != pager.pageNum }">
										<a href="${pageContext.request.contextPath}/question_view?num=${question.num }&pageNum=${page }">[${page}]</a>
									</c:when>
									<c:otherwise>
										[${page}]
									</c:otherwise>
								</c:choose>
							</c:forEach>
							
							<c:choose>
								<c:when test="${pager.endPage != pager.totalPage}">
									<a href="${pageContext.request.contextPath}/question_view?num=${question.num }&pageNum=${pager.nextPage}"> Next <i class='fa fa-angle-right'></i></a>
									<a href="${pageContext.request.contextPath}/question_view?num=${question.num }&pageNum=${pager.totalPage}"> Last <i class='fa fa-angle-right'></i></a>
								</c:when>
								
								<c:otherwise>
									Next <i class='fa fa-angle-right'></i> <a href="${pageContext.request.contextPath}/question_view?num=${question.num }&pageNum=${pager.totalPage}"> Last <i class='fa fa-angle-right'></i></a>	
								</c:otherwise>
							</c:choose>
						</div>
			</div>
		</section>
	</div>
	<script type="text/javascript">
		function removeQuestion(num){
			if (confirm("정말 삭제하시겠습니까?")) {
				location.href="removeQuestion/"+num;	
			}
		}
		function updatequestion(num){
			location.href="question_modify/"+num;	
		}
		
		/*댓글 작성*/
		$('#commentWriteBtn').click(function() {
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
			commentForm.submit();
		});
		
		/*댓글삭제*/
		function removeComment(no){
			if (confirm("정말 삭제하시겠습니까?")) {
				location.href="removeQuestionComment/"+no;	
			}
		}
		/*댓글변경 버튼*/
		var num=${question.num}
		function updateComment(no){
			$(".insert").val(""); 
			$("#updateDiv").show().appendTo("#comment_"+no);
			
			$.ajax({
				type: "get",
				url:"question_comment_view/"+no,
				dataType: "json",
				success:function(json){
					$("#updateNum").val(json.no); 
					$("#updateWriter").val(json.writer); 
					$("#updateContent").val(json.content);
				},
				error:function(xhr){
					$("#updateDiv").hide();
					alert("잘못된 접근입니다.");
				}
			});
		}
		
		/*취소 버튼*/
		$("#cancelUpdateBtn").click(function() { 
			$(".form-control").val(""); 
			$("#updateDiv").hide(); 
		});
		
		/*댓글 변경의 변경 버튼*/
		$("#updateBtn").click(function() { 
			var no=$("#updateNum").val(); 
			var writer=$("#updateWriter").val(); 
			var content=$("#updateContent").val(); 
			if(content=="") { 
				alert("내용을 입력해 주세요."); 
				return; 
			} 
			$.ajax({ 
				type: "put", 
				url: "question_comment_modify", 
				contentType: "application/json", 
				data: JSON.stringify({"no":no,"content":content}), 
				dateType: "text", 
				success: function(text) { 
					if(text=="success") { 
						$(".form-control").val(""); 
						$("#updateDiv").hide(); 
						location.reload();
					} 
				}, error: function(xhr) { 
					alert("에러코드 = "+xhr.status); 
					} 
			}); 
		});
		
		
		
	</script>