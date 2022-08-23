<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style type="text/css">
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
}
#paging{
	text-align: center;
}
</style>
</head>
    <div class="wrapper">
		<section class="module">
			<div class="container" >
				<div class="row">
					<div class="col-sm-12 col-sm-offset-0">
						<h4 class="font-alt m-t-0 m-b-0" style="text-align: center;">나의 문의사항 댓글</h4>
						<hr class="divider-w m-t-10 m-b-20">
						<table border="1" style="width: 100%; border: 1px solid #ddd; border-spacing: 10px 10px;">
								<tr style="border-bottom: 1px solid #ddd;">
									<th>작성자</th>
									<th>내용</th>
									<th>등록일자</th>
								</tr>							
								<c:forEach items="${myQuestionCommentList}" var="myQuestionCommentList">
									<tr onclick="location.href='${pageContext.request.contextPath}/question_view?num=${myQuestionCommentList.questionNo }'" style="cursor: pointer;">
										<td>${myQuestionCommentList.writer }</td>
										<td style="text-align: left;">${myQuestionCommentList.content }</td>
										<td>${myQuestionCommentList.regdate }</td>
									</tr>
								</c:forEach>
						</table>
						
						<div>
							<div style="float: left; margin-top: 10px;">
								<form method="post" action="${pageContext.request.contextPath}/myQuestionComment?id=${loginUser.id }&pageNum=${pager.pageNum}" id="searchKeywordForm">
									<select name="search_option" class="btn btn-border-d btn-round" style="height: 30px; padding: 0px;">										
										<option value="content" <c:if test="${pagerMap.search_option == 'content'?'selected':''}"/>>내용</option>
									</select>
									<input name="keyword" class="btn btn-border-d btn-round" value="${pagerMap.keyword }" style="height: 30px; width: 150px; outline: none;">
									<button type="submit" class="btn btn-border-d btn-round" style="height: 30px; padding: 0px 20px;">검색</button>
								</form>
							</div>
						</div>
					</div>
						<div id="paging" class="pagination font-inc text-uppercase">
							<c:choose>
								<c:when test="${pager.startPage > pager.blockSize}">
									<a href="${pageContext.request.contextPath}/myQuestionComment?id=${loginUser.id }&pageNum=1&search_option=${search_option}&keyword=${keyword}"><i class='fa fa-angle-left'></i> First </a> 
									<a href="${pageContext.request.contextPath}/myQuestionComment?id=${loginUser.id }&pageNum=${pager.prevPage}&search_option=${search_option}&keyword=${keyword}"><i class='fa fa-angle-left'></i> Prev </a>
								</c:when>
								
								<c:otherwise>
									<a href="${pageContext.request.contextPath}/myQuestionComment?id=${loginUser.id }&pageNum=1&search_option=${search_option}&keyword=${keyword}"><i class='fa fa-angle-left'></i> First </a> <i class='fa fa-angle-left'></i> Prev 
								</c:otherwise>
							</c:choose>
							
							<c:forEach begin="${pager.startPage }" end="${pager.endPage }" var="page">
								<c:choose>
									<c:when test="${page != pager.pageNum }">
										<a href="${pageContext.request.contextPath}/myQuestionComment?id=${loginUser.id }&pageNum=${page }&search_option=${search_option}&keyword=${keyword}">[${page}]</a>
									</c:when>
									<c:otherwise>
										[${page}]
									</c:otherwise>
								</c:choose>
							</c:forEach>
							
							<c:choose>
								<c:when test="${pager.endPage != pager.totalPage}">
									<a href="${pageContext.request.contextPath}/myQuestionComment?id=${loginUser.id }&pageNum=${pager.nextPage}&search_option=${search_option}&keyword=${keyword}"> Next <i class='fa fa-angle-right'></i></a>
									<a href="${pageContext.request.contextPath}/myQuestionComment?id=${loginUser.id }&pageNum=${pager.totalPage}&search_option=${search_option}&keyword=${keyword}"> Last <i class='fa fa-angle-right'></i></a>
								</c:when>
								
								<c:otherwise>
									Next <i class='fa fa-angle-right'></i> <a href="${pageContext.request.contextPath}/myQuestionComment?id=${loginUser.id }&pageNum=${pager.totalPage}&search_option=${search_option}&keyword=${keyword}"> Last <i class='fa fa-angle-right'></i></a>	
								</c:otherwise>
							</c:choose>
						</div>
				</div>
			</div>
		</section>
	</div>