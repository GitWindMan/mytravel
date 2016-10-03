<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/front/";%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<title>游客服务中心</title>
<base href="<%=basePath%>"/>

<title>游客服务系统</title>
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
<jsp:include page="top.jsp"/>

<div class="banner-bottom-strip">	
<div class="welcome">	</div>

<!--works start here-->
	<div class="work">
		<div class="container">
			<div class="work-main">
				<div class="col-md-6 work-wrapper">
					<a href="images/a1.jpg"
						class="b-link-stripe b-animate-go  swipebox" title="法意瑞-德奥捷-比利时7国双飞 ">
						<img src="images/a1.jpg" alt="" class="img-responsive">
					<div class="b-wrapper">
							<h2 class="b-animate b-from-left    b-delay03">
								<i class="glyphicon glyphicon-zoom-in"> </i>
							</h2>
						</div>
					</a> <a href="images/a3.jpg"
						class="b-link-stripe b-animate-go  swipebox" title="莫斯科-谢尔盖耶夫镇-圣彼得堡双飞">
						<img src="images/a3.jpg" alt="" class="img-responsive">
					<div class="b-wrapper1">
							<h2 class="b-animate b-from-left    b-delay03">
								<i class="glyphicon glyphicon-zoom-in"> </i>
							</h2>
						</div>
					</a>
				</div>
				<div class="col-md-6 work-wrapper">
					<a href="images/a2.jpg"
						class="b-link-stripe b-animate-go  swipebox" title="至尊纯玩昆明大理丽江版纳四飞8日 ">
						<img src="images/a2.jpg" alt="" class="img-responsive">
					<div class="b-wrapper">
							<h2 class="b-animate b-from-left    b-delay03">
								<i class="glyphicon glyphicon-zoom-in"> </i>
							</h2>
						</div>
					</a>
					<div class="work wrk1">
						<div class="work-details wrk">
							<h3>
								<i class="glyphicon glyphicon-chevron-up"> </i>酒店信息
							</h3>
							<s:iterator value="newses">
								<p>
									<a
										href="front!newsIntro.action?news.id=<s:property value="id"/>">
										<s:property value="title" />
									</a>
								</p>
							</s:iterator>
						</div>
					</div>
				</div>

				<div class="clearfix"></div>
			</div>
		</div>
	</div>
	<link rel="stylesheet" href="css/swipebox.css">
	<script src="js/jquery.swipebox.min.js"></script> 
	    <script type="text/javascript">
			jQuery(function($) {
				$(".swipebox").swipebox();
			});
</script>
<!--works end here-->
<!--effect-gird-->
		<div class="container">
			<div class="grid">
				<h4>最新游记</h4>
				<s:iterator value="places">					
					
					<figure class="effect-julia">
					<a href="front!placeIntro.action?place.id=<s:property value="id"/>">
					<img src="<s:property value="photo"/>" alt="img21" class="shadowSytle"/>
					</a>					
					<figcaption>
						<h2><span><s:property value="title"/></span>
						</h2>
						<div>
							<p>Julia dances in the deep dark</p>
							<p>She loves the smell of the ocean</p>
							<p>And dives into the morning light one</p>
						</div>
						<a href="#">View more</a>
					</figcaption>
				</figure>
				</s:iterator>
				
				<div class="work wrk1">
					<div class="work-details wrk">
						<s:iterator value="notes">
							<p>
								<a
									href="front!noteIntro.action?note.id=<s:property value="id"/>">
									<s:property value="title" />
								</a>
							</p>
						</s:iterator>
					</div>
				</div>

				<div class="clearfix"></div>
			</div>
		</div>
		<!--/effect-gird-->
<!---End-container---->
<!---->
<script type="text/javascript">
		$(document).ready(function() {
				/*
				var defaults = {
				containerID: 'toTop', // fading element id
				containerHoverID: 'toTopHover', // fading element hover id
				scrollSpeed: 1200,
				easingType: 'linear' 
				};
				*/
		$().UItoTop({ easingType: 'easeOutQuart' });
});
</script>

</body>
</html>
