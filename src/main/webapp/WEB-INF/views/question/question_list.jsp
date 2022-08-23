<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style type="text/css">
th {
    padding: 11px 0 10px;
    color: #353535;
    vertical-align: middle;
    font-weight: normal;
    background: #fbfafa;
    font-size: 12px;
    text-align: center;
}
td {
    padding: 8px 10px 7px;
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
						<h4 class="font-alt m-t-0 m-b-0" style="text-align: center;">문의하기</h4>
						<hr class="divider-w m-t-10 m-b-20">
						<table border="1" style="width: 100%; border: 1px solid #dfdfdf; border-spacing: 10px 10px;">
								<tr>
									<th>제목</th>
									<!-- <th>내용</th> -->
									<th>작성자</th>
									<th>조회수</th>
									<th>등록일자</th>
								</tr>							
								<c:forEach items="${questionList}" var="questionList">
										<tr>
											<td style="text-align: left;">
												<c:if test="${questionList.status==0 }"><a onclick="location.href='${pageContext.request.contextPath}/question_view?num=${questionList.num }'" style="cursor: pointer;">${questionList.title }</a></c:if>
												<c:if test="${questionList.status==1 }">
													<i class="fa fa-fw"></i> 비밀글
													<c:if test="${loginUser!=null && loginUser.id==questionList.id || loginUser.userStatus==9 }">
														<a onclick="location.href='${pageContext.request.contextPath}/question_view?num=${questionList.num }'" style="cursor: pointer;">${questionList.title }</a>
													</c:if>
												</c:if>
											</td> 				
											<td>${questionList.writer }</td>
											<td>${questionList.readcount }</td>
											<td>${questionList.regdate }</td>
										</tr>
								</c:forEach>
						</table>
						<div id="questionList"></div>
						
						<div>
							<div style="float: left;">
								<form method="post" action="${pageContext.request.contextPath}/question?pageNum=${pager.pageNum}" id="searchKeywordForm">
									<select name="search_option" class="btn btn-border-d btn-round" style="height: 30px; padding: 0px;">
										<option value="title" <c:if test="${pagerMap.search_option == 'title'?'selected':''}"/>>제목</option>										 
										<option value="content" <c:if test="${pagerMap.search_option == 'content'?'selected':''}"/>>내용</option>
										<option value="writer" <c:if test="${pagerMap.search_option == 'writer'?'selected':''}"/>>작성자</option>
										<option value="all" <c:if test="${pagerMap.search_option == 'all'?'selected':''}"/>>전체검색</option>
									</select>
									<input name="keyword" class="btn btn-border-d btn-round" value="${pagerMap.keyword }" style="height: 30px; width: 150px; outline: none;">
									<button type="submit" class="btn btn-border-d btn-round" style="height: 30px; padding: 0px 20px;">검색</button>
								</form>
							</div>
							
							<form id="writequestionForm" action="${pageContext.request.contextPath }/question_write">
								<div style="margin-top: 10px;">
									<button id="writequestion" type="submit" class="btn btn-border-d btn-round" style="float: right;">글쓰기</button>
								</div>
								<div style="float: right; margin-right: 10px; margin-top: 10px;">${message }</div>
							</form>
						</div>
					</div>
						<div id="paging" class="pagination font-inc text-uppercase">
							<c:choose>
								<c:when test="${pager.startPage > pager.blockSize}">
									<a href="${pageContext.request.contextPath}/question?pageNum=1&search_option=${search_option}&keyword=${keyword}"><i class='fa fa-angle-left'></i> First </a> 
									<a href="${pageContext.request.contextPath}/question?pageNum=${pager.prevPage}&search_option=${search_option}&keyword=${keyword}"><i class='fa fa-angle-left'></i> Prev </a>
								</c:when>
								
								<c:otherwise>
									<a href="${pageContext.request.contextPath}/question?pageNum=1&search_option=${search_option}&keyword=${keyword}"><i class='fa fa-angle-left'></i> First </a> <i class='fa fa-angle-left'></i> Prev 
								</c:otherwise>
							</c:choose>
							
							<c:forEach begin="${pager.startPage }" end="${pager.endPage }" var="page">
								<c:choose>
									<c:when test="${page != pager.pageNum }">
										<a href="${pageContext.request.contextPath}/question?pageNum=${page }&search_option=${search_option}&keyword=${keyword}">[${page}]</a>
									</c:when>
									<c:otherwise>
										[${page}]
									</c:otherwise>
								</c:choose>
							</c:forEach>
							
							<c:choose>
								<c:when test="${pager.endPage != pager.totalPage}">
									<a href="${pageContext.request.contextPath}/question?pageNum=${pager.nextPage}&search_option=${search_option}&keyword=${keyword}"> Next <i class='fa fa-angle-right'></i></a>
									<a href="${pageContext.request.contextPath}/question?pageNum=${pager.totalPage}&search_option=${search_option}&keyword=${keyword}"> Last <i class='fa fa-angle-right'></i></a>
								</c:when>
								
								<c:otherwise>
									Next <i class='fa fa-angle-right'></i> <a href="${pageContext.request.contextPath}/question?pageNum=${pager.totalPage}&search_option=${search_option}&keyword=${keyword}"> Last <i class='fa fa-angle-right'></i></a>	
								</c:otherwise>
							</c:choose>
						</div>
				</div>
			</div>
		</section>
	</div>
	<script type="text/javascript">
		$('#writequestion').click(function() {
			writequestionForm.submit;
		});
	</script>