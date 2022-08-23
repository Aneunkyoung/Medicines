<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<head>
<style type="text/css">
.fa-fw{
	cursor: pointer;
}
th {
    padding: 11px 0 10px;
    border-left: 1px solid #dfdfdf;
    border-bottom: 1px solid #dfdfdf;
    color: #353535;
    vertical-align: middle;
    font-weight: normal;
    background: #fbfafa;
    font-size: 12px;
    text-align: center;
}
td {
    padding: 8px 10px 7px;
    border-top: 1px solid #dfdfdf;
    color: #353535;
    vertical-align: middle;
    word-break: break-all;
    word-wrap: break-word;
    font-size: 12px;
    text-align: center;
    width: 100px;
}
</style>
</head>
<form id="updateForm" method="post" action="${pageContext.request.contextPath}/userInfo" enctype="multipart/form-data">
	<div class="wrapper">
		<section class="module">
			<div class="container" >
				<div class="row">
					<div class="col-sm-12 col-sm-offset-0">
						<h4 class="font-alt m-t-0 m-b-0">게시글 <i class="fa fa-fw" onclick="location.href='${pageContext.request.contextPath}/myBoard?id=${loginUser.id }'"></i></h4>
						<hr class="divider-w m-t-10 m-b-30">
						<table border="1" style="width: 100%; border: 1px solid #ddd; border-spacing: 10px 10px;">			
								<c:forEach items="${myBoard}" var="myBoard" begin="0" end="4">
									<tr onclick="location.href='${pageContext.request.contextPath}/board_view?num=${myBoard.num }'" style="cursor: pointer;">
										<td style="text-align: left;">${myBoard.title }</td> 				
										<%-- <td style="text-align: left;">${myBoard.content }</td>
										<td>${myBoard.writer }</td>
										<td>${myBoard.readcount }</td> --%>
										<td>${myBoard.regdate }</td>
									</tr>
								</c:forEach>
						</table>
					</div>
					
					<div class="col-sm-12 col-sm-offset-0" style="margin-top: 30px;">
						<h4 class="font-alt m-t-0 m-b-0">문의사항 <i class="fa fa-fw" onclick="location.href='${pageContext.request.contextPath}/myQuestion?id=${loginUser.id }'"></i></h4>
						<hr class="divider-w m-t-10 m-b-30">
						<table border="1" style="width: 100%; border: 1px solid #ddd; border-spacing: 10px 10px;">			
								<c:forEach items="${myQuestion}" var="myQuestion" begin="0" end="4">
									<tr onclick="location.href='${pageContext.request.contextPath}/question_view?num=${myQuestion.num }'" style="cursor: pointer;">
										<td style="text-align: left;">${myQuestion.title }</td> 				
										<%-- <td style="text-align: left;">${myQuestion.content }</td>
										<td>${myQuestion.writer }</td>
										<td>${myQuestion.readcount }</td> --%>
										<td>${myQuestion.regdate }</td>
									</tr>
								</c:forEach>
						</table>
					</div>
					
					<div class="col-sm-12 col-sm-offset-0" style="margin-top: 30px;">
						<h4 class="font-alt m-t-0 m-b-0">게시글 댓글 <i class="fa fa-fw" onclick="location.href='${pageContext.request.contextPath}/myBoardComment?id=${loginUser.id }'"></i></h4>
						<hr class="divider-w m-t-10 m-b-30">
						<table border="1" style="width: 100%; border: 1px solid #ddd; border-spacing: 10px 10px;">			
								<c:forEach items="${myBoardComment}" var="myBoardComment" begin="0" end="4">
									<tr onclick="location.href='${pageContext.request.contextPath}/board_view?num=${myBoardComment.boardNo }'" style="cursor: pointer;">
										<%-- <td style="text-align: left;">${myBoardComment.writer }</td> 	 --%>			
										<td style="text-align: left;">${myBoardComment.content }</td>
										<td>${myBoardComment.regdate }</td>
									</tr>
								</c:forEach>
						</table>
					</div>
					
					<div class="col-sm-12 col-sm-offset-0" style="margin-top: 30px;">
						<h4 class="font-alt m-t-0 m-b-0">문의사항 댓글 <i class="fa fa-fw" onclick="location.href='${pageContext.request.contextPath}/myQuestionComment?id=${loginUser.id }'"></i></h4>
						<hr class="divider-w m-t-10 m-b-30">
						<table border="1" style="width: 100%; border: 1px solid #ddd; border-spacing: 10px 10px;">			
								<c:forEach items="${myQuestionComment}" var="myQuestionComment" begin="0" end="4">
									<tr onclick="location.href='${pageContext.request.contextPath}/question_view?num=${myQuestionComment.questionNo }'" style="cursor: pointer;">
										<%-- <td style="text-align: left;">${myQuestionComment.writer }</td> 	 --%>			
										<td style="text-align: left;">${myQuestionComment.content }</td>
										<td>${myQuestionComment.regdate }</td>
									</tr>
								</c:forEach>
						</table>
					</div>
				</div>
			</div>
		</section>
	</div>
</form>