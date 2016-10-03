<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/front/";%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML>
<html>
<head>
<!--css-->
<link href="css/bootstrap.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<!--/css-->
<!-- for-mobile-apps -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Travels Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- //for-mobile-apps -->
<!-- js -->
<script src="js/jquery.min.js"> </script>
<script src="js/bootstrap.js"></script>
<script type="text/javascript" src="js/move-top.js"></script>
<script type="text/javascript" src="js/easing.js"></script>
<!-- /js -->
<!--fonts-->
<link href='http://fonts.useso.com/css?family=Ubuntu:300,400,500,700,300italic,400italic,500italic,700italic' rel='stylesheet' type='text/css'>
<link href='http://fonts.useso.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,700,300,600,800,400' rel='stylesheet' type='text/css'>
<!--/fonts-->
<!--script-->
<script type="text/javascript">
			jQuery(document).ready(function($) {
				$(".scroll").click(function(event){		
					event.preventDefault();
					$('html,body').animate({scrollTop:$(this.hash).offset().top},900);
				});
			});
</script>
<!--/script-->
</head>
<body>
<header>
    <!--header-->
<div class="header">
<div class="header-nav">
	<div class="container">
		<div class="logo">
			<h1><a href="front!index.action">游客服务系统</a></h1>
			<img src="images/logo1.png" alt="" /></a>
		</div>
		<div class="navigation">
			<nav class="navbar navbar-default">
				<div class="navbar-header">
					  <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"> </span>
						<span class="icon-bar"> </span>
						<span class="icon-bar"> </span>
					  </button>
					</div>
					<div class="collapse navbar-collapse nav-wil" id="bs-example-navbar-collapse-1">
							<ul class="nav navbar-nav">
								<li><a href="front!index.action">首页</a></li>
								<li><a href="front!placeList.action">景点</a></li>
								<li><a href="front!newsList.action">优惠信息</a></li>
								<li><a href="front!noteList.action">游记</a></li>
								<li><a href="front!gbookList.action">投诉建议</a></li>
								<s:if test="#session.type==null">
									<li><a href="login.jsp">登录</a></li>
									<li><a href="reg.jsp">注册</a></li>
								</s:if>
								<s:else>
									<li><a href="self.jsp"> <s:if test="#session.type==1">用户[${user.username}]个人信息</s:if>
											<s:if test="#session.type==2">商家[${user.username}]个人信息</s:if>
									</a></li>
									<li><a href="MapAndWeather.jsp">天气和路线</a></li>
									<li><a href="../login!logout.action">退出</a></li>
								</s:else>
							</ul>
							<div class="clearfix"> </div>
			</div><!-- /.navbar-collapse -->
		</nav>
	</div>
	</div>
	</div>
</div>
			  <!-- script-for-menu -->
		 <script>
				$("span.menu").click(function(){
					$(".top-nav ul").slideToggle("slow" , function(){
					});
				});
		 </script>
		 <!-- script-for-menu -->
<div class="banner">
<script src="js/responsiveslides.min.js"></script>
 <script>
    $(function () {
      $("#slider").responsiveSlides({
      	auto: true,
      	nav: true,
      	speed: 500,
        namespace: "callbacks",
        pager: true,
      });
    });
  </script>
<div class="slider">
	
		   <div class="container">
			  <ul class="rslides" id="slider">
				 <li>	          
					<div class="banner-info">
						<h2>美景无处不在</h2>
						<p>世界不是没有美，而是没有发现美的眼睛。</p>
					</div>
				 </li>
				 <li>	          
					 <div class="banner-info">
						<h2>在旅途中，你会有意向不到的收获</h2>
						<p>想想还有点小激动哦...</p>
					</div>
				 </li>
				 <li>	          
					 <div class="banner-info">
						<h2>快来加入我们</h2>
						<p>有打折有优惠！！！</p>
					</div>
				 </li>
			  </ul>
		  </div>
</div>


</div>	
<!--/header-->	
</header>
<script type="text/javascript">
$(function(){
	var flag = $("#nav_flag").val();
	switch (flag) {
	case "index":
		$("#navlist li").eq(0).attr("id","active");
		break;
	case "place":
		$("#navlist li").eq(1).attr("id","active");
		break;
	case "news":
		$("#navlist li").eq(2).attr("id","active");
		break;
	case "note":
		$("#navlist li").eq(3).attr("id","active");
		break;
	case "gbook":
		$("#navlist li").eq(4).attr("id","active");
		break;
	case "login":
		$("#navlist li").eq(5).attr("id","active");
		break;
	case "reg":
		$("#navlist li").eq(6).attr("id","active");
		break;
	}
})


</script>
</body>
</html>
