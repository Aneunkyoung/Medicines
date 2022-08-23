<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
						<h1>목록</h1>
							<form action="displayDrug" method="post">
							<input type="submit" value="디비저장"> <div>${message }</div>
								<table border="1">
									<thead>
										<tr>
											<th>업체명</th>
											<th>제품명</th>
											<th>품목기준코드</th>
											<th>효능</th>
											<th>사용법</th>
											<th>주의사항(경고)</th>
											<th>주의사항</th>
											<th>상호작용</th>
											<th>부작용</th>
											<th>보관법</th>
											<th>이미지</th>
										</tr>
									</thead>
									<tbody></tbody>
								</table>
							</form>
							</div>
							</div></div></section></div>
<script>
      $.ajax({           
            url: 'drugInfo',
            type: 'get',
            success: function(data){
              $.each(data.body.items, function(i, item) {    
            	  if (!item.entpName) item.entpName="null"; 
            	  if (!item.itemName) item.itemName="null"; 
            	  if (!item.itemSeq) item.itemSeq="null"; 
            	  if (!item.efcyQesitm) item.efcyQesitm="null";
            	  if (!item.useMethodQesitm) item.useMethodQesitm= "null";
            	  if (!item.atpnWarnQesitm) item.atpnWarnQesitm= "null"; 
            	  if (!item.atpnQesitm) item.atpnQesitm= "null"; 
            	  if (!item.intrcQesitm) item.intrcQesitm= "null"; 
            	  if (!item.seQesitm) item.seQesitm= "null";
            	  if (!item.depositMethodQesitm) item.depositMethodQesitm= "null"; 
            	  if (!item.itemImage) item.itemImage= "null"; 
                  $("tbody").append(
                		  "<tr>" + 
	                		  "<td id='entpName'>" + item.entpName.replace(/(<([^>]+)>)/ig, "") + "</td>" +
	                		  "<td id='itemName'>" + item.itemName.replace(/(<([^>]+)>)/ig, "") + "</td>" +
	                		  "<td id='itemSeq'>" + item.itemSeq.replace(/(<([^>]+)>)/ig, "") + "</td>" +
	                		  "<td id='efcyQesitm'>" + item.efcyQesitm.replace(/(<([^>]+)>)/ig, "") + "</td>" +
	                		  "<td id='useMethodQesitm'>" + item.useMethodQesitm.replace(/(<([^>]+)>)/ig, "") + "</td>" +
	                		  "<td id='atpnWarnQesitm'>" + item.atpnWarnQesitm.replace(/(<([^>]+)>)/ig, "") + "</td>" +
	                		  "<td id='atpnQesitm'>" + item.atpnQesitm.replace(/(<([^>]+)>)/ig, "") + "</td>" +
	                		  "<td id='intrcQesitm'>" + item.intrcQesitm.replace(/(<([^>]+)>)/ig, "") + "</td>" +
	                		  "<td id='seQesitm'>" + item.seQesitm.replace(/(<([^>]+)>)/ig, "") + "</td>" +
	                		  "<td id='depositMethodQesitm'>" + item.depositMethodQesitm.replace(/(<([^>]+)>)/ig, "") + "</td>" +
	                		  "<td id='itemImage'>" + item.itemImage.replace(/(<([^>]+)>)/ig, "") + "</td>" +
	                		  "<input type=hidden name='drugVal' value='" + item.entpName.replace(/(<([^>]+)>)/ig, "") + "#"  + item.itemName.replace(/(<([^>]+)>)/ig, "") + "#" + item.itemSeq.replace(/(<([^>]+)>)/ig, "") + "#" + item.efcyQesitm.replace(/(<([^>]+)>)/ig, "") + "#" + item.useMethodQesitm.replace(/(<([^>]+)>)/ig, "") + "#" + item.atpnWarnQesitm.replace(/(<([^>]+)>)/ig, "") + "#" + item.atpnQesitm.replace(/(<([^>]+)>)/ig, "") + "#" + item.intrcQesitm.replace(/(<([^>]+)>)/ig, "") + "#" + item.seQesitm.replace(/(<([^>]+)>)/ig, "") + "#" + item.depositMethodQesitm.replace(/(<([^>]+)>)/ig, "") + "#" + item.itemImage + "'>" + 
                		  "</tr>"
               	  )
				});
            },
            error: function(data) {
				alert("오류 = " + data.status);
			}
        });  
</script>
</body>
</html>