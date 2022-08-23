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
                <h2 class="module-title align-center font-alt" onclick="location.href='${pageContext.request.contextPath}/admin_user'" style="cursor: pointer;">User Page</h2>
                <div class="module-subtitle align-center font-inc">
                    <p>회원 관리 페이지 입니다.</p>
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
        <table border="1" style="width: 100%; border: 1px solid #ddd; border-spacing: 10px 10px;">
            <tr style="border-bottom: 1px solid #ddd;">
            	<th>구분</th>
                <th>아이디</th>
                <th>이름</th>
                <th>이메일</th>
                <th>전화번호</th>
                <th>인증상태</th>
                <th>가입일자</th>
                <th>회원상태</th>
            </tr>
            <c:forEach items="${userList}" var="userList">
                <tr>
                	<c:choose>
                		<c:when test="${userList.userStatus == 9 && userList.authStatus == 0}">
                			<td>관리자</td>
		                    <td>${userList.id }</td>
		                    <td>${userList.name }</td>
		                    <td>${userList.email }</td>
		                    <td>${userList.phone }</td>
		                    <td>
		                    	<select class="authStatus" name="${userList.id }">
									<option value="1" <c:if test="${userList.authStatus==1 }"/>selected>1 [인증]</option>
									<option value="0" <c:if test="${userList.authStatus==0 }"/>selected>0 [미인증]</option>
								</select>
		                    </td>		                   
		                    <td>${userList.joinDate }</td>
		                    <td>
		                    	<select class="status" name="${userList.id }">
									<option value="1" <c:if test="${userList.userStatus==1 }"/>selected>1 [일반회원]</option>
									<option value="5" <c:if test="${userList.userStatus==5 }"/>selected>5 [탈퇴회원]</option>
									<option value="9" <c:if test="${userList.userStatus==9 }"/>selected>9 [관리자]</option>
								</select>
		                    </td>
                		</c:when>
                		<c:when test="${userList.userStatus == 9 && userList.authStatus == 1}">
                			<td>관리자</td>
		                    <td>${userList.id }</td>
		                    <td>${userList.name }</td>
		                    <td>${userList.email }</td>
		                    <td>${userList.phone }</td>
		                    <td>
		                    	<select class="authStatus" name="${userList.id }">
									<option value="0" <c:if test="${userList.authStatus==0 }"/>selected>0 [미인증]</option>
									<option value="1" <c:if test="${userList.authStatus==1 }"/>selected>1 [인증]</option>
								</select>
		                    </td>		                   
		                    <td>${userList.joinDate }</td>
		                    <td>
		                    	<select class="status" name="${userList.id }">
									<option value="1" <c:if test="${userList.userStatus==1 }"/>selected>1 [일반회원]</option>
									<option value="5" <c:if test="${userList.userStatus==5 }"/>selected>5 [탈퇴회원]</option>
									<option value="9" <c:if test="${userList.userStatus==9 }"/>selected>9 [관리자]</option>
								</select>
		                    </td>
                		</c:when>
                		
                		<c:when test="${userList.userStatus == 5 && userList.authStatus == 0}">
                			<td>탈퇴회원</td>
		                    <td>${userList.id }</td>
		                    <td>${userList.name }</td>
		                    <td>${userList.email }</td>
		                    <td>${userList.phone }</td>
		                    <td>
		                    	<select class="authStatus" name="${userList.id }">
									<option value="1" <c:if test="${userList.authStatus==1 }"/>selected>1 [인증]</option>
									<option value="0" <c:if test="${userList.authStatus==0 }"/>selected>0 [미인증]</option>
								</select>
		                    </td>		                   
		                    <td>${userList.joinDate }</td>
		                    <td>
		                    	<select class="status" name="${userList.id }">
									<option value="1" <c:if test="${userList.userStatus==1 }"/>selected>1 [일반회원]</option>
									<option value="9" <c:if test="${userList.userStatus==9 }"/>selected>9 [관리자]</option>
									<option value="5" <c:if test="${userList.userStatus==5 }"/>selected>5 [탈퇴회원]</option>
								</select>
		                    </td>
                		</c:when>
                		
                		<c:when test="${userList.userStatus == 5 && userList.authStatus == 1}">
                			<td>탈퇴회원</td>
		                    <td>${userList.id }</td>
		                    <td>${userList.name }</td>
		                    <td>${userList.email }</td>
		                    <td>${userList.phone }</td>
		                    <td>
		                    	<select class="authStatus" name="${userList.id }">
									<option value="0" <c:if test="${userList.authStatus==0 }"/>selected>0 [미인증]</option>
									<option value="1" <c:if test="${userList.authStatus==1 }"/>selected>1 [인증]</option>
								</select>
		                    </td>		                   
		                    <td>${userList.joinDate }</td>
		                    <td>
		                    	<select class="status" name="${userList.id }">
									<option value="1" <c:if test="${userList.userStatus==1 }"/>selected>1 [일반회원]</option>
									<option value="9" <c:if test="${userList.userStatus==9 }"/>selected>9 [관리자]</option>
									<option value="5" <c:if test="${userList.userStatus==5 }"/>selected>5 [탈퇴회원]</option>
								</select>
		                    </td>
                		</c:when>
                		
                		<c:when test="${userList.userStatus == 1 && userList.authStatus == 0}">
                			<td>일반회원</td>
		                    <td>${userList.id }</td>
		                    <td>${userList.name }</td>
		                    <td>${userList.email }</td>
		                    <td>${userList.phone }</td>
		                    <td>
		                    	<select class="authStatus" name="${userList.id }">
									<option value="1" <c:if test="${userList.authStatus==1 }"/>selected>1 [인증]</option>
									<option value="0" <c:if test="${userList.authStatus==0 }"/>selected>0 [미인증]</option>
								</select>
		                    </td>		                   
		                    <td>${userList.joinDate }</td>
		                    <td>
		                    	<select class="status" name="${userList.id }">
									<option value="9" <c:if test="${userList.userStatus==9 }"/>selected>9 [관리자]</option>
									<option value="5" <c:if test="${userList.userStatus==5 }"/>selected>5 [탈퇴회원]</option>
									<option value="1" <c:if test="${userList.userStatus==1 }"/>selected>1 [일반회원]</option>
								</select>
		                    </td>
                		</c:when>
                		
                		<c:otherwise>
                			<td>일반회원</td>
		                    <td>${userList.id }</td>
		                    <td>${userList.name }</td>
		                    <td>${userList.email }</td>
		                    <td>${userList.phone }</td>
		                    <td>
		                    	<select class="authStatus" name="${userList.id }">
									<option value="0" <c:if test="${userList.authStatus==0 }"/>selected>0 [미인증]</option>
									<option value="1" <c:if test="${userList.authStatus==1 }"/>selected>1 [인증]</option>
								</select>
		                    </td>
		                    <td>${userList.joinDate }</td>
		                    <td>
		                    	<select class="status" name="${userList.id }">
									<option value="9" <c:if test="${userList.userStatus==9 }" />selected>9 [관리자]</option>
									<option value="5" <c:if test="${userList.userStatus==5 }" />selected>5 [탈퇴회원]</option>
									<option value="1" <c:if test="${userList.userStatus==1 }" />selected>1 [일반회원]</option>
								</select>
		                    </td>
                		</c:otherwise>
                	</c:choose>
                	
                </tr>
            </c:forEach>
        </table>
        <!-- <div id="userList"></div> -->
        <div style="margin-top: 10px;">
            <div style="float: left;">
                <form method="post" action="${pageContext.request.contextPath}/admin_user?pageNum=${pager.pageNum}"> 
                    <select name="search_option" class="btn btn-border-d btn-round" style="height: 30px; padding: 0px;">
                        <option value="id" <c:if test="${pagerMap.search_option == 'id'?'selected':''}"/>>아이디</option>
                        <option value="name" <c:if test="${pagerMap.search_option == 'name'?'selected':''}"/>>이름</option>
                        <option value="email" <c:if test="${pagerMap.search_option == 'email'?'selected':''}"/>>이메일</option>
                        <option value="phone" <c:if test="${pagerMap.search_option == 'phone'?'selected':''}"/>>전화번호</option>
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
                    <a href="${pageContext.request.contextPath}/admin_user?pageNum=1&search_option=${search_option}&keyword=${keyword}">
                        <i class='fa fa-angle-left'></i>
                        First
                    </a>
                    <a href="${pageContext.request.contextPath}/admin_user?pageNum=${pager.prevPage}&search_option=${search_option}&keyword=${keyword}">
                        <i class='fa fa-angle-left'></i>
                        Prev
                    </a>
                </c:when>
                <c:otherwise>
                    <a href="${pageContext.request.contextPath}/admin_user?pageNum=1&search_option=${search_option}&keyword=${keyword}">
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
                        <a href="${pageContext.request.contextPath}/admin_user?pageNum=${page }&search_option=${search_option}&keyword=${keyword}">[${page}]</a>
                    </c:when>
                    <c:otherwise>
                        [${page}]
                    </c:otherwise>
                </c:choose>
            </c:forEach>
            <c:choose>
                <c:when test="${pager.endPage != pager.totalPage}">
                    <a href="${pageContext.request.contextPath}/admin_user?pageNum=${pager.nextPage}&search_option=${search_option}&keyword=${keyword}">
                        Next
                        <i class='fa fa-angle-right'></i>
                    </a>
                    <a href="${pageContext.request.contextPath}/admin_user?pageNum=${pager.totalPage}&search_option=${search_option}&keyword=${keyword}">
                        Last
                        <i class='fa fa-angle-right'></i>
                    </a>
                </c:when>
                <c:otherwise>
                    Next
                    <i class='fa fa-angle-right'></i>
                    <a href="${pageContext.request.contextPath}/admin_user?pageNum=${pager.totalPage}&search_option=${search_option}&keyword=${keyword}">
                        Last
                        <i class='fa fa-angle-right'></i>
                    </a>
                </c:otherwise>
            </c:choose>
        </div>
    </section>
    
    <script type="text/javascript">
    $(".status").change(function() {
    	var id=$(this).attr("name");
    	var status=$(this).val();
    	
    	location.href="${pageContext.request.contextPath}/admin_userStatusChange?status="+status+"&id="+id; 
    });
    $(".authStatus").change(function() {
    	var id=$(this).attr("name");
    	var authStatus=$(this).val();
    	
    	location.href="${pageContext.request.contextPath}/admin_authStatusChange?status="+authStatus+"&id="+id; 
    });
	</script>