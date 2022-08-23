<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
		
					<!-- 	<li class="dropdown">
							<a href="#" class="dropdown-toggle binded" data-toggle="dropdown">Home</a>
							<ul class="dropdown-menu">
								<li><a href="index.html">Image Parallax 1</a></li>
								<li><a href="index-2.html">Image Parallax 2</a></li>
								<li><a href="index-3.html">Slider Parallax 1</a></li>
								<li><a href="index-4.html">Slider Parallax 2</a></li>
								<li><a href="index-5.html">Text rotator 1</a></li>
								<li><a href="index-6.html">Text rotator 2</a></li>
								<li><a href="index-7.html">Video background 1</a></li>
								<li><a href="index-8.html">Video background 2</a></li>
							</ul>
						</li>
		
						<li><a href="about.html">About</a></li>
		
						<li class="dropdown">
							<a href="#" class="dropdown-toggle binded" data-toggle="dropdown">Portfolio</a>
							<ul class="dropdown-menu" role="menu">
		
								<li class="dropdown">
									<a href="#" class="dropdown-toggle binded" data-toggle="dropdown">Boxed</a>
									<ul class="dropdown-menu">
										<li><a href="portfolio-boxed-col2.html">2 Columns</a></li>
										<li><a href="portfolio-boxed-col3.html">3 Columns</a></li>
										<li><a href="portfolio-boxed-col4.html">4 Columns</a></li>
										<li><a href="portfolio-boxed-hover-black.html">Hover Black</a></li>
										<li><a href="portfolio-boxed-hover-gradient.html">Hover Gradient</a></li>
									</ul>
								</li>
		
								<li class="dropdown">
									<a href="#" class="dropdown-toggle binded" data-toggle="dropdown">Boxed - Gutter</a>
									<ul class="dropdown-menu">
										<li><a href="portfolio-boxed-gutter-col2.html">2 Columns</a></li>
										<li><a href="portfolio-boxed-gutter-col3.html">3 Columns</a></li>
										<li><a href="portfolio-boxed-gutter-col4.html">4 Columns</a></li>
										<li><a href="portfolio-boxed-gutter-hover-black.html">Hover Black</a></li>
										<li><a href="portfolio-boxed-gutter-hover-gradient.html">Hover Gradient</a></li>
									</ul>
								</li>
		
								<li class="dropdown">
									<a href="#" class="dropdown-toggle binded" data-toggle="dropdown">Boxed - Masonry</a>
									<ul class="dropdown-menu">
										<li><a href="portfolio-boxed-masonry-col2.html">2 Columns</a></li>
										<li><a href="portfolio-boxed-masonry-col3.html">3 Columns</a></li>
										<li><a href="portfolio-boxed-masonry-col4.html">4 Columns</a></li>
										<li><a href="portfolio-boxed-masonry-hover-black.html">Hover Black</a></li>
										<li><a href="portfolio-boxed-masonry-hover-gradient.html">Hover Gradient</a></li>
									</ul>
								</li>
		
								<li class="dropdown">
									<a href="#" class="dropdown-toggle binded" data-toggle="dropdown">Wide</a>
									<ul class="dropdown-menu">
										<li><a href="portfolio-wide-col2.html">2 Columns</a></li>
										<li><a href="portfolio-wide-col3.html">3 Columns</a></li>
										<li><a href="portfolio-wide-col4.html">4 Columns</a></li>
										<li><a href="portfolio-wide-hover-black.html">Hover Black</a></li>
										<li><a href="portfolio-wide-hover-gradient.html">Hover Gradient</a></li>
									</ul>
								</li>
		
								<li class="dropdown">
									<a href="#" class="dropdown-toggle binded" data-toggle="dropdown">Wide - Gutter</a>
									<ul class="dropdown-menu">
										<li><a href="portfolio-wide-gutter-col2.html">2 Columns</a></li>
										<li><a href="portfolio-wide-gutter-col3.html">3 Columns</a></li>
										<li><a href="portfolio-wide-gutter-col4.html">4 Columns</a></li>
										<li><a href="portfolio-wide-gutter-hover-black.html">Hover Black</a></li>
										<li><a href="portfolio-wide-gutter-hover-gradient.html">Hover Gradient</a></li>
									</ul>
								</li>
		
								<li class="dropdown">
									<a href="#" class="dropdown-toggle binded" data-toggle="dropdown">Wide - Masonry</a>
									<ul class="dropdown-menu">
										<li><a href="portfolio-wide-masonry-col2.html">2 Columns</a></li>
										<li><a href="portfolio-wide-masonry-col3.html">3 Columns</a></li>
										<li><a href="portfolio-wide-masonry-col4.html">4 Columns</a></li>
										<li><a href="portfolio-wide-masonry-hover-black.html">Hover Black</a></li>
										<li><a href="portfolio-wide-masonry-hover-gradient.html">Hover Gradient</a></li>
									</ul>
								</li>
		
								<li class="dropdown">
									<a href="#" class="dropdown-toggle binded" data-toggle="dropdown">Single</a>
									<ul class="dropdown-menu">
										<li><a href="portfolio-single-1.html">Single 1</a></li>
										<li><a href="portfolio-single-2.html">Single 2</a></li>
										<li><a href="portfolio-single-3.html">Single 3</a></li>
										<li><a href="portfolio-single-4.html">Single 4</a></li>
										<li><a href="portfolio-single-5.html">Single 5</a></li>
										<li><a href="portfolio-single-6.html">Single 6</a></li>
										<li><a href="portfolio-single-7.html">Single 7</a></li>
									</ul>
								</li>
		
							</ul>
						</li>
		
						<li class="dropdown">
							<a href="#" class="dropdown-toggle binded" data-toggle="dropdown">Blog</a>
							<ul class="dropdown-menu" role="menu">
		
								<li class="dropdown">
									<a href="#" class="dropdown-toggle binded" data-toggle="dropdown">Grid</a>
									<ul class="dropdown-menu">
										<li><a href="blog-grid-2col.html">2 Columns</a></li>
										<li><a href="blog-grid-3col.html">3 Columns</a></li>
										<li><a href="blog-grid-4col.html">4 Columns</a></li>
									</ul>
								</li>
		
								<li class="dropdown">
									<a href="#" class="dropdown-toggle binded" data-toggle="dropdown">Standart</a>
									<ul class="dropdown-menu">
										<li><a href="blog-standart-1.html">Standart 1</a></li>
										<li><a href="blog-standart-2.html">Standart 2</a></li>
									</ul>
								</li>
		
								<li class="dropdown">
									<a href="#" class="dropdown-toggle binded" data-toggle="dropdown">Single</a>
									<ul class="dropdown-menu">
										<li><a href="blog-single.html">Single 1</a></li>
										<li><a href="blog-single-2.html">Single 2</a></li>
									</ul>
								</li>
		
							</ul>
						</li>-->
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
							/* console.log(result); */
						} else {
							/* console.log(result); */
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