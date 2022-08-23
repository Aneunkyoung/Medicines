<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="">
	<meta name="author" content="">
	
	<title>Medicines</title>
	
	<!-- Bootstrap core CSS -->
	<link href="<c:url value="/bootstrap/css/bootstrap.min.css"/>" rel="stylesheet">
	<!-- Plugins -->
	<link href="<c:url value="/css/simpletextrotator.css"/>" rel="stylesheet">
	<link href="<c:url value="/css/font-awesome.min.css"/>" rel="stylesheet">
	<link href="<c:url value="/css/et-line-font.css"/>" rel="stylesheet">
	<link href="<c:url value="/css/magnific-popup.css"/>" rel="stylesheet">
	<link href="<c:url value="/css/flexslider.css"/>" rel="stylesheet">
	<link href="<c:url value="/css/animate.css"/>" rel="stylesheet">
	
	<!-- Template core CSS -->
	<link href="<c:url value="/css/style.css"/>" rel="stylesheet">
	
	<!-- Custom css -->
	<link href="<c:url value="/css/custom.css"/>" rel="stylesheet">
	<style id="fit-vids-style">.fluid-width-video-wrapper{width:100%;position:relative;padding:0;}.fluid-width-video-wrapper iframe,.fluid-width-video-wrapper object,.fluid-width-video-wrapper embed {position:absolute;top:0;left:0;width:100%;height:100%;}</style>
	<script type="text/javascript" charset="UTF-8" src="http://maps.google.com/maps-api-v3/api/js/46/4/intl/ko_ALL/common.js"></script>
	<script type="text/javascript" charset="UTF-8" src="http://maps.google.com/maps-api-v3/api/js/46/4/intl/ko_ALL/util.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/uikit@3.7.3/dist/js/uikit.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/uikit@3.7.3/dist/js/uikit-icons.min.js"></script>
	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
	<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
	
	<script src="<c:url value="/js/jquery-2.1.3.min.js"/>"></script>
	<script src="<c:url value="/bootstrap/js/bootstrap.min.js"/>"></script>
	<script src="<c:url value="/js/jquery.mb.YTPlayer.min.js"/>"></script>
	<script src="<c:url value="/js/appear.js"/>"></script>
	<script src="<c:url value="/js/jquery.simple-text-rotator.min.js"/>"></script>
	<script src="<c:url value="/js/jqBootstrapValidation.js"/>"></script>
	<script src="http://maps.google.com/maps/api/js?sensor=true"/></script>
	<script src="<c:url value="/js/gmaps.js"/>"></script>
	<script src="<c:url value="/js/isotope.pkgd.min.js"/>"></script>
	<script src="<c:url value="/js/imagesloaded.pkgd.js"/>"></script>
	<script src="<c:url value="/js/jquery.flexslider-min.js"/>"></script>
	<script src="<c:url value="/js/jquery.magnific-popup.min.js"/>"></script>
	<script src="<c:url value="/js/jquery.fitvids.js"/>"></script>
	<script src="<c:url value="/js/smoothscroll.js"/>"></script>
	<script src="<c:url value="/js/wow.min.js"/>"></script>
	<script src="<c:url value="/js/contact.js"/>"></script>
	<script src="<c:url value="/js/custom.js"/>"></script>
</head>
<body>
	<div id="header">
		<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
	<nav class="navbar navbar-custom navbar-fixed-top navbar-transparent" role="navigation">
			<div class="container">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#custom-collapse" aria-expanded="false">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="${pageContext.request.contextPath}">Medicines</a>
				</div>
		
				<div class="navbar-collapse collapse" id="custom-collapse" aria-expanded="false" style="height: 1px;">
		
					<ul class="nav navbar-nav navbar-right">
						<c:if test="${loginUser.userStatus==9}">
							<li><a href="${pageContext.request.contextPath}/admin"> Admin</a></li>
						</c:if>	
						<li><a href="${pageContext.request.contextPath }/drugs">drugs</a></li>
						
						<li class="dropdown">
							<a href="#" class="dropdown-toggle binded" data-toggle="dropdown">board</a>
							<ul class="dropdown-menu leftauto" role="menu">
								<li><a href="${pageContext.request.contextPath}/notice"><i class="fa fa-fw"></i> 공지사항</a></li>								
								<li><a href="${pageContext.request.contextPath}/board"><i class="fa fa-fw"></i> 게시판</a></li>
								<li><a href="${pageContext.request.contextPath}/question"><i class="fa fa-fw"></i> 문의사항</a></li>
							</ul>
						</li>

						<c:choose>
							<c:when test="${empty(loginUser) }">						
								<li><a href="${pageContext.request.contextPath }/login"><i class="fa fa-fw"></i></a></li>
							</c:when>
							<c:otherwise>				
								<li class="dropdown">
									<a href="#" class="dropdown-toggle binded" data-toggle="dropdown"><img src="${pageContext.request.contextPath}/userProfile/${loginUser.profile}" class="user-img-header"><div style="display: contents;">${loginUser.name } <span id="unreadnumtwo" class="note-num" style="position: absolute;top: 0;right: 0;z-index: 3;height: 20px;width: 20px;line-height: 20px;text-align: center;background-color: #32d296;border-radius: 15px;display: inline-block;color: white;"></span></div></a>
									<ul class="dropdown-menu leftauto" role="menu">
										<li><a href="${pageContext.request.contextPath}/userInfo?id=${loginUser.id}"><i class="icon-profile-male"></i> Edit Profile</a></li>
										<li><a href="${pageContext.request.contextPath}/userActivity?id=${loginUser.id}"><i class="fa fa-fw"></i> My Activity</a></li>
										<li><a href="${pageContext.request.contextPath}/myChat"><i class="icon-chat"></i> Chat <span id="unreadnum" class="uk-label uk-label-success" style="display: inline-block;padding: 0 10px;background: #1e87f0;line-height: 1.5;font-size: 12px;color: #fff;vertical-align: middle;white-space: nowrap;border-radius: 2px;text-transform: uppercase;background-color: #32d296;color: #fff;float: right;"></span></a></li>
										<li><a href="${pageContext.request.contextPath}/logout"><i class="fa fa-fw"></i> Log out</a></li>
									</ul>
								</li>
							</c:otherwise>
						</c:choose>
						<li><a href="#modal-overflow" uk-toggle><i class="fa fa-fw"></i></a></li> 
					</ul>
				</div>
			</div>
	</nav>
	
	
	<div id="modal-overflow" uk-modal>
	    <div class="uk-modal-dialog uk-margin-auto-vertical">
	        <button class="uk-modal-close-default" type="button" uk-close></button>
	        <div class="uk-modal-header">
				<input type="text" id="keyword" placeholder="검색">
	        </div>

	        <div class="uk-modal-body" uk-overflow-auto>
				<div>

					<div id="suggestDiv">
						<div id="suggestList">
							<table class='searchTable' border="1">
								<tbody></tbody>
							</table>
						</div>
					</div>
					
					<div id="choice"></div>
				</div>
	        </div>
	    </div>
	</div>
	<script type="text/javascript">
			document.getElementById("keyword").focus();
			document.getElementById("keyword").onkeyup=function(){
				var keyword=document.getElementById("keyword").value;
				if (keyword==null || keyword=="") {
					document.getElementById("suggestDiv").style.display="none";
					return;
				}
				$.ajax({
					url: "drugSearch",
					type: "get",
					data: "keyword="+keyword,
					success: function(data) {
						var html="";
						
						for(var i=0; i<data.length; i++) {
							if (data[i].img=="null") data[i].img= "https://www.bcm-institute.org/wp-content/uploads/2020/11/No-Image-Icon.png";
							html+="<table class='searchTable'>"+"<tr onclick=\"location.href='"+data[i].url+"'\">"+"<td style='width: 50px;'>"+"<img src='"+data[i].img+"' width='50'>"+"</td>"+"<td style='text-align:center; width:200px;'>"+data[i].entpName+"</td>"+"<td style='text-align:center;'>"+data[i].itemName+"</td>"+"</tr>"+"</table>"
						}
						document.getElementById("suggestList").innerHTML=html;
						document.getElementById("suggestDiv").style.display="block";
						
					},
					error: function(xhr) {
						alert(xhr.status);
					}
				});
			}
			
			var uid="${loginUser.id}";
			chatUnread(uid);
			
			function chatUnread(uuid) {
				uid=uuid;
				$.ajax({
					type: "get",
					url:"/medicines/chatUnreadNum",
					data:"uid="+uuid,
					success: function(result) {
						if (result>=1) {
							document.getElementById("unreadnum").innerHTML=result;
							document.getElementById("unreadnumtwo").innerHTML=result;
							console.log(result);
						} else {
							console.log(result);
							document.getElementById("unreadnumtwo").style.display="none";
						}
					},
					error: function(xhr) {
						/* alert(xhr.status);  */
					}
				});
			}
		</script>
	<div class="scroll-up" style="display: block;">
		<a href="#totop"><i class="fa fa-angle-double-up"></i></a>
	</div>
	</div>
	
	<div id="content">
		<section class="module">
	<div class="container">
		<div class="row">
			<div class="col-sm-6 col-sm-offset-3">
				<h2 class="module-title align-center font-alt">500 Page</h2>
				<div class="module-subtitle align-center font-inc">
					알 수 없는 오류가 생겼습니다.
				</div>
			</div>

		</div>
		
		<div class="alert alert-danger" role="alert"style="text-align: center;">
			<strong>500 Error!</strong> 알 수 없는 오류가 생겼습니다. 
		</div>
		
	<div class="row multi-columns-row">
		<div class="col-sm-6 col-md-3 col-lg-3">
			<div class="content-box" onclick="location.href='/medicines/drugs'" style="cursor: pointer;">
				<div class="content-box-icon">
					<i class="fa fa-fw"></i>
				</div>
				<div class="content-box-title font-inc font-uppercase">
					의약품
				</div>
				<div class="content-box-text">
					다양한 의약품 정보를 얻어보세요.
				</div>
			</div>
		</div>
					
		<div class="col-sm-6 col-md-3 col-lg-3">
			<div class="content-box" onclick="location.href='/medicines/notice'" style="cursor: pointer;">
				<div class="content-box-icon">
					<i class="fa fa-fw"></i>
				</div>
				<div class="content-box-title font-inc font-uppercase">
					공지사항
				</div>
				<div class="content-box-text">
					공지사항을 확인해보세요.
				</div>
			</div>
		</div>
			
		<div class="col-sm-6 col-md-3 col-lg-3">
			<div class="content-box" onclick="location.href='/medicines/board'" style="cursor: pointer;">
				<div class="content-box-icon">
					<i class="fa fa-fw"></i>
				</div>
				<div class="content-box-title font-inc font-uppercase">
					게시판
				</div>
				<div class="content-box-text">
					자유로운 의견을 남겨보세요.
				</div>
			</div>
		</div>
					
		<div class="col-sm-6 col-md-3 col-lg-3">
			<div class="content-box" onclick="location.href='/medicines/question'" style="cursor: pointer;">
				<div class="content-box-icon">
					<i class="fa fa-fw"></i>
				</div>
			<div class="content-box-title font-inc font-uppercase">
				문의사항
			</div>
			<div class="content-box-text">
				궁금한점을 물어보세요.
			</div>
			</div>
		</div>
					
	</div>
</div>
</section>
	</div>
	
	<div id="footer">
		<footer class="footer">
	<div class="container">
		<div class="row">
			<div class="col-sm-12 text-center">
				<p class="copyright font-inc m-b-0">© <a href="${pageContext.request.contextPath}">MEDICINES</a>, All Rights Reserved.</p>
			</div>
		</div>
	</div>	
</footer>
	</div>	
</body>
</html>