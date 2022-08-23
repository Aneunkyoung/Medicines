<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
    #paging {
        text-align: center;
    }
</style>

<section class="module">
    <div class="container">
        <div class="row">
            <div class="col-sm-6 col-sm-offset-3">
                <h2 class="module-title align-center font-alt" onclick="location.href='${pageContext.request.contextPath}/admin_question'" style="cursor: pointer;">Question Page</h2>
                <div class="module-subtitle align-center font-inc">
                    <p>문의사항 관리 페이지 입니다.</p>
                    <div>
                    	<i class="fa fa-fw" onclick="location.href='${pageContext.request.contextPath}/admin_user'" style="cursor: pointer;"></i>
                    	<i class="fa fa-fw" onclick="location.href='${pageContext.request.contextPath}/admin_drugs'" style="cursor: pointer;"></i>
                    	<i class="fa fa-fw" onclick="location.href='${pageContext.request.contextPath}/admin_notice'" style="cursor: pointer;"></i>
                    	<i class="fa fa-fw" onclick="location.href='${pageContext.request.contextPath}/admin_board'" style="cursor: pointer;"></i>
                    	<i class="fa fa-fw" onclick="location.href='${pageContext.request.contextPath}/admin_question'" style="cursor: pointer;"></i>
                    </div>
                </div>
            </div>
        </div>
        <button id="removeBtn" type="button" class="btn btn-border-d btn-round" style="margin-bottom: 10px;">삭제</button>
        <form id="questionCommentForm" action="${pageContext.request.contextPath }/admin_questionCommentRemove" method="post">
	        <table border="1" style="width: 100%; border: 1px solid #ddd; border-spacing: 10px 10px;">
	            <tr style="border-bottom: 1px solid #ddd;">
	            	<th><input type="checkbox" id="allCheck"></th>
	            	<th>아이디</th>
	                <th>작성자</th>
	                <th>내용</th>               
	                <th>작성날짜</th>               
	            </tr>
	            <c:forEach items="${questionCommentList}" var="questionCommentList">
	                <tr style="cursor: pointer;">
	                	<td><input type="checkbox" name="checkNo" value="${questionCommentList.no}" class="check"></td>
	                	<td onclick="location.href='${pageContext.request.contextPath}/question_view?num=${questionCommentList.questionNo}'" >${questionCommentList.id }</td>
	                	<td onclick="location.href='${pageContext.request.contextPath}/question_view?num=${questionCommentList.questionNo}'" >${questionCommentList.writer }</td>
	                	<td onclick="location.href='${pageContext.request.contextPath}/question_view?num=${questionCommentList.questionNo}'" >${questionCommentList.content }</td>
	                	<td onclick="location.href='${pageContext.request.contextPath}/question_view?num=${questionCommentList.questionNo}'" >${questionCommentList.regdate }</td>
	                </tr>
	            </c:forEach>
	        </table>
	    </form>  
        <div style="margin-top: 10px;">
            <div style="float: left;">
                <form method="post" action="${pageContext.request.contextPath}/admin_questionCommentList?pageNum=${pager.pageNum}">
                    <select name="search_option" class="btn btn-border-d btn-round" style="height: 30px; padding: 0px;">
                        <option value="id" <c:if test="${pagerMap.search_option == 'id'?'selected':''}"/>>아이디</option>
                        <option value="writer" <c:if test="${pagerMap.search_option == 'writer'?'selected':''}"/>>작성자</option>
                        <option value="content" <c:if test="${pagerMap.search_option == 'content'?'selected':''}"/>>내용</option>
                        <%-- <option value="regdate" <c:if test="${pagerMap.search_option == 'regdate'?'selected':''}"/>>작성날짜</option> --%>
                        <option value="all" <c:if test="${pagerMap.search_option == 'all'?'selected':''}"/>>전체검색</option>
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
                    <a href="${pageContext.request.contextPath}/admin_questionCommentList?pageNum=1&search_option=${search_option}&keyword=${keyword}">
                        <i class='fa fa-angle-left'></i>
                        First
                    </a>
                    <a href="${pageContext.request.contextPath}/admin_questionCommentList?pageNum=${pager.prevPage}&search_option=${search_option}&keyword=${keyword}">
                        <i class='fa fa-angle-left'></i>
                        Prev
                    </a>
                </c:when>
                <c:otherwise>
                    <a href="${pageContext.request.contextPath}/admin_questionCommentList?pageNum=1&search_option=${search_option}&keyword=${keyword}">
                        <i class='fa fa-angle-left'></i>
                        First
                    </a>
                    <i class='fa fa-angle-left'></i>
                    Prev
                </c:otherwise>
            </c:choose>
            <c:forEach begin="${pager.startPage }" end="${pager.endPage }" var="page">
                <c:choose>
                    <c:when test="${page != pager.pageNum }">
                        <a href="${pageContext.request.contextPath}/admin_questionCommentList?pageNum=${page }&search_option=${search_option}&keyword=${keyword}">[${page}]</a>
                    </c:when>
                    <c:otherwise>
                        [${page}]
                    </c:otherwise>
                </c:choose>
            </c:forEach>
            <c:choose>
                <c:when test="${pager.endPage != pager.totalPage}">
                    <a href="${pageContext.request.contextPath}/admin_questionCommentList?pageNum=${pager.nextPage}&search_option=${search_option}&keyword=${keyword}">
                        Next
                        <i class='fa fa-angle-right'></i>
                    </a>
                    <a href="${pageContext.request.contextPath}/admin_questionCommentList?pageNum=${pager.totalPage}&search_option=${search_option}&keyword=${keyword}">
                        Last
                        <i class='fa fa-angle-right'></i>
                    </a>
                </c:when>
                <c:otherwise>
                    Next
                    <i class='fa fa-angle-right'></i>
                    <a href="${pageContext.request.contextPath}/admin_questionCommentList?pageNum=${pager.totalPage}&search_option=${search_option}&keyword=${keyword}">
                        Last
                        <i class='fa fa-angle-right'></i>
                    </a>
                </c:otherwise>
            </c:choose>
        </div>
    </section>
    <script type="text/javascript">
                $("#allCheck").change(function () {
                    if ($(this).is(":checked")) {
                        $(".check").prop("checked", true);
                    } else {
                        $(".check").prop("checked", false);
                    }
                });
                $("#removeBtn").click(function () {
                    if ($(".check").filter(":checked").length == 0) {
                        alert("선택된 항목이 없습니다.");
                        return;
                    }
                    if (confirm("정말 삭제하시겠습니까?")) {                    	
                   		questionCommentForm.submit();
                    }
                });
            </script>