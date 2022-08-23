<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
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
.content {
    height: 100px;
    vertical-align: middle;
}
.detail{
	padding: 30px 20px;
    margin: -9px 0 0;
    word-break: break-all;
    line-height: normal;
}
	</style>
</head>
<body>
	<div class="wrapper">
		<section class="module">
			<div class="container" >
				<div class="row">
					<div class="col-sm-12 col-sm-offset-0">
						<div><button onclick="location.href='${pageContext.request.contextPath}/drugs'" type="button" class="btn btn-border-d btn-round" style="margin-bottom: 10px; float: right;">목록</button></div>
						<table style="width: 100%; border: 1px solid #ddd; border-spacing: 10px 10px;">
							<tbody>
								<c:if test="${drug.entpName ne 'null'}">
									<tr>
										<th>업체명</th>
										<td>${drug.entpName }</td>
									</tr>
								</c:if>
								<c:if test="${drug.itemName ne 'null'}">
									<tr>
										<th>제품명</th>
										<td>${drug.itemName }</td>
									</tr>
								</c:if>
								<c:if test="${drug.efcyQesitm ne 'null'}">
									<tr>
										<th>효능</th>
										<td>${drug.efcyQesitm }</td>
									</tr>
								</c:if>
								<c:if test="${drug.useMethodQesitm ne 'null'}">
									<tr>
										<th>사용법</th>
										<td>${drug.useMethodQesitm }</td>
									</tr>
								</c:if>
								<c:if test="${drug.atpnWarnQesitm ne 'null'}">
									<tr>
										<th>주의사항(경고)</th>
										<td>${drug.atpnWarnQesitm }</td>
									</tr>
								</c:if>
								<c:if test="${drug.atpnQesitm ne 'null'}">
									<tr>
										<th>주의사항</th>
										<td>${drug.atpnQesitm }</td>
									</tr>
								</c:if>
								<c:if test="${drug.intrcQesitm ne 'null'}">
									<tr>
										<th>상호작용</th>
										<td>${drug.intrcQesitm }</td>
									</tr>
								</c:if>
								<c:if test="${drug.seQesitm ne 'null'}">
									<tr>
										<th>부작용</th>
										<td>${drug.seQesitm }</td>
									</tr>
								</c:if>
								<c:if test="${drug.depositMethodQesitm ne 'null'}">
										<tr>
										<th>보관법</th>
										<td>${drug.depositMethodQesitm }</td>
									</tr>
								</c:if>
								<c:if test="${drug.itemImage ne 'null'}">
									<tr>
										<th>이미지</th>
										<td><img src="${drug.itemImage }" style="width: 300px;"></td>
									</tr>
								</c:if>
							</tbody>
						</table>
						<div style="float: right; margin-top: 10px;">
							<c:if test="${loginUser.userStatus==9 }">
							<button onclick="removeDrug(${drug.itemSeq})" type="button" class="btn btn-border-d btn-round">삭제</button>
							<button id="drugModifyBtn" onclick="updateDrug(${drug.itemSeq})" type="button" class="btn btn-border-d btn-round">변경</button>
						</c:if>
						</div>
					</div>
				</div>
			</div>
		</section>
	</div>
</body>
<script type="text/javascript">
	var id=${drug.itemSeq}
	function removeDrug(id){
		location.href="removeDrug/"+id;
	}
	function updateDrug(id){
		location.href="drug_modify/"+id;
	}
</script>
</html>