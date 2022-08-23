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
                <h2 class="module-title align-center font-alt" onclick="location.href='${pageContext.request.contextPath}/admin_board'" style="cursor: pointer;">Board Page</h2>
                <div class="module-subtitle align-center font-inc">
                    <p>게시판 관리 페이지 입니다.</p>
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
        <div class="col-sm-12 col-sm-offset-0" style="margin-top: 30px;">
            <h4 class="font-alt m-t-0 m-b-0">게시판
                <i class="fa fa-fw" onclick="location.href='/medicines/admin_boardList'" style="cursor: pointer;"></i>
            </h4>
            <hr class="divider-w m-t-10 m-b-30">
                <table border="1" style="width: 100%; border: 1px solid #ddd; border-spacing: 10px 10px;">
                    <tbody>
                    	<tr>
                    		<th>아이디</th>
                    		<th>작성자</th>
                    		<th>제목</th>
                    		<th>내용</th>
                   			<th>작성날짜</th>
                   		</tr>
                    	<c:forEach items="${board}" var="board">
	                        <tr onclick="location.href='/medicines/board_view?num=${board.num}'" style="cursor: pointer;">
	                            <td>${board.id }</td>
	                            <td>${board.writer}</td>
	                            <td>${board.title}</td>
	                            <td>${board.content}</td>
	                            <td>${board.regdate}</td>
	                        </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
            <div class="col-sm-12 col-sm-offset-0" style="margin-top: 30px;">
                <h4 class="font-alt m-t-0 m-b-0">게시판 댓글
                    <i class="fa fa-fw" onclick="location.href='/medicines/admin_boardCommentList'" style="cursor: pointer;"></i>
                </h4>
                <hr class="divider-w m-t-10 m-b-30">
                    <table border="1" style="width: 100%; border: 1px solid #ddd; border-spacing: 10px 10px;">
                        <tbody>
                    	<tr>
                    		<th>아이디</th>
                    		<th>작성자</th>
                    		<th>내용</th>
                   			<th>작성날짜</th>
                   		</tr>
                    	<c:forEach items="${boardComment}" var="boardComment">
	                        <tr onclick="location.href='/medicines/board_view?num=${boardComment.boardNo}'" style="cursor: pointer;">
	                            <td>${boardComment.id }</td>
	                            <td>${boardComment.writer}</td>
	                            <td>${boardComment.content}</td>
	                            <td>${boardComment.regdate}</td>
	                        </tr>
                        </c:forEach>
                    </tbody>
                    </table>
                </div>
            </div>
        </section>