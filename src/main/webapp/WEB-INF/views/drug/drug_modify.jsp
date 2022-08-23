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
						<form id="drugModifyForm" action="${pageContext.request.contextPath }/drug_modify/${drug.itemSeq}" method="post" enctype="multipart/form-data">
						<table style="width: 100%; border: 1px solid #ddd; border-spacing: 10px 10px;">
							<tbody>
								<c:if test="${drug.entpName ne 'null'}">
									<tr>
										<th>업체명</th>
										<td><input name="entpName" class="form-control" value="${drug.entpName }"></td>
									</tr>
								</c:if>
								<c:if test="${drug.itemName ne 'null'}">
									<tr>
										<th>제품명</th>
										<td><input name="itemName" class="form-control" value="${drug.itemName }"></td>
									</tr>
								</c:if>
								<c:if test="${drug.efcyQesitm ne 'null'}">
									<tr>
										<th>효능</th>
										<td><input name="efcyQesitm" class="form-control" value="${drug.efcyQesitm }"></td>
									</tr>
								</c:if>
								<c:if test="${drug.useMethodQesitm ne 'null'}">
									<tr>
										<th>사용법</th>
										<td><textarea name="useMethodQesitm" class="form-control" rows="5">${drug.useMethodQesitm }</textarea></td>
									</tr>
								</c:if>
								<c:if test="${drug.atpnWarnQesitm ne 'null'}">
									<tr>
										<th>주의사항(경고)</th>
										<td><textarea name="atpnWarnQesitm" class="form-control" rows="5">${drug.atpnWarnQesitm }</textarea></td>
									</tr>
								</c:if>
								<c:if test="${drug.atpnQesitm ne 'null'}">
									<tr>
										<th>주의사항</th>
										<td><textarea name="atpnQesitm" class="form-control" rows="5">${drug.atpnQesitm }</textarea></td>										
									</tr>
								</c:if>
								<c:if test="${drug.intrcQesitm ne 'null'}">
									<tr>
										<th>상호작용</th>
										<td><textarea name="intrcQesitm" class="form-control" rows="5">${drug.intrcQesitm }</textarea></td>
									</tr>
								</c:if>
								<c:if test="${drug.seQesitm ne 'null'}">
									<tr>
										<th>부작용</th>
										<td><textarea name="seQesitm" class="form-control" rows="5">${drug.seQesitm }</textarea></td>
									</tr>
								</c:if>
								<c:if test="${drug.depositMethodQesitm ne 'null'}">
										<tr>
										<th>보관법</th>
										<td><input name="depositMethodQesitm" value="${drug.depositMethodQesitm }" class="form-control"></td>
									</tr>
								</c:if>
								<c:if test="${drug.itemImage ne 'null'}">
									<tr>
										<th>이미지</th>
										<td><img src="${drug.itemImage }" style="width: 300px;"><input name="itemImage" value="${drug.itemImage }" hidden="hidden"></td>
									</tr>
								</c:if>
							</tbody>
						</table>
						<div style="float: right; margin-top: 10px;">
							<button id="drugModifyBtn" type="submit" class="btn btn-border-d btn-round btn-block">변경</button>							
						</div>
						</form>
					</div>
				</div>
			</div>
		</section>
	</div>
</body>
<script type="text/javascript">
$("#boardModifyBtn").click(function(){
	drugModifyForm.submit();
});
</script>
</html>