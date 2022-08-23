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
		<tiles:insertAttribute name="header"/>
	</div>
	
	<div id="content">
		<tiles:insertAttribute name="content"/>
	</div>
	
	<div id="footer">
		<tiles:insertAttribute name="footer"/>
	</div>	
</body>
</html>