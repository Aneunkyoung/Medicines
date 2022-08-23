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
figure.fileblock, #tt-body-page figure.fileblock {
    margin-top: 28px;
    margin-bottom: 20px;
    width: 470px;
    height: 71px;
    border: 1px solid #e9e9e9;
    position: relative;
    border-radius: 1px;
}
figure[data-ke-align=alignCenter].fileblock {
    margin-left: auto;
    margin-right: auto;
}
figure.fileblock a, #tt-body-page figure.fileblock a {
    display: block;
    height: 71px;
}
.article-view a {
    display: inline-block;
    color: #3d62ce;
}
figure.fileblock .image, #tt-body-page figure.fileblock .image {
    position: absolute;
    left: 0;
    top: 0;
    width: 30px;
    height: 30px;
    background-image: url(https://t1.daumcdn.net/tistory_admin/static/manage/post-editor/img_editor_content.svg);
    background-position: 0 0;
    margin: 21px 17px 20px 22px;
}
figure.fileblock .desc, #tt-body-page figure.fileblock .desc {
    position: absolute;
    left: 70px;
    right: 60px;
    top: 0;
    bottom: 0;
}
figure.fileblock .filename, #tt-body-page figure.fileblock .filename {
    color: #333333;
    font-size: 14px;
    text-overflow: ellipsis;
    height: 20px;
    margin: 17px 0 0;
}
figure.fileblock .name, #tt-body-page figure.fileblock .name {
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
    max-width: 272px;
    height: 20px;
    display: block;
}
figure.fileblock .size, #tt-body-page figure.fileblock .size {
    font-family: Avenir Next, sans-serif;
    font-size: 12px;
    color: #777;
    height: 16px;
    margin: 2px 0 0;
}
</style>
</head>
    <div class="wrapper">
		<section class="module">
			<div class="container" >
				<div class="row">
					<div class="col-sm-12 col-sm-offset-0">
					<div><button onclick="location.href='${pageContext.request.contextPath}/notice'" type="button" class="btn btn-border-d btn-round" style="margin-bottom: 10px; float: right;">목록</button></div>
						<table style="width: 100%; border: 1px solid #ddd; border-spacing: 10px 10px;">
							<tbody>
								<tr>
									<th>제목</th>
									<td>${notice.title }</td>
								</tr>
								<tr>
									<th>작성자</th>
									<td>${notice.writer }</td>
								</tr>
								<tr>
									<th>작성일</th>
									<td>${notice.regdate }</td>
								</tr>
								<tr>
									<td colspan="2" class="contnet">
										<ul class="etcArea">
						                	<li>
						                    	<strong>조회수</strong> <span>${notice.readcount }</span>
						                    </li>
						                </ul>
						                <div class="detail">
						                	<div>
						                		<p style="white-space: pre;">${notice.content }</p>
						                	</div>
						                	<c:if test="${notice.origin!=null}">
							                	<div>
							                		<figure class="fileblock" data-ke-align="alignCenter">
							                			<a onclick="fileDownload(${notice.num});" style="cursor: pointer;">
								                			<div class="image"></div>
								                			<div class="desc">
								                			<div class="filename">
								                				<span class="name">${notice.origin }</span>
								                			</div>
								                			<div class="size">다운로드</div>
								                			</div>
							                			</a>
							                		</figure>
							                	</div>
						                	</c:if>
						                </div>
									</td>
								</tr>
							</tbody>
						</table>
						<c:if test="${loginUser.id == notice.id  || loginUser.userStatus==9}">		
							<div style="margin-top: 10px; float: right;">			
								<button onclick="removenotice(${notice.num})" type="button" class="btn btn-border-d btn-round">삭제</button>
								<button id="commentModifyBtn" onclick="updatenotice(${notice.num})" type="button" class="btn btn-border-d btn-round">변경</button>
							</div>
						</c:if>
					</div>
				</div>
			</div>
		</section>
	</div>
	<script type="text/javascript">
		function removenotice(num){
			if (confirm("정말 삭제하시겠습니까?")) {
				location.href="remove_notice/"+num;	
			}
		}
		function updatenotice(num){
			location.href="notice_modify/"+num;	
		}
		
		function fileDownload(num) { 
			location.href="file_download/"+num; 
		}
	</script>