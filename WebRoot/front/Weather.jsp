<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class="no-js fixed-layout"> 
<head> 
<meta charset="utf-8"> 
<meta http-equiv="X-UA-Compatible" content="IE=edge"> 
<title>jQuery自动定位当地天气预报代码</title>
<script src="js/jquery.min.js"></script>
<script src="js/jquery.leoweather.min.js"></script>
<style>
	body  { font:14px/1.5 微软雅黑; text-align:center; }
	#demo { width:680px; margin:150px auto; background:#72af3c; color:#FFF; padding:50px 0 100px 0; overflow:hidden; border-radius:5000px; }
	#demo i { background: no-repeat top left; display:inline-block; height:128px; line-height:128px; margin:0 auto 20px auto; font-size:70px; padding-left:150px; font-style:normal; text-align:center; font-weight:bold; }
	#demo i.icon-xiaoyu { background-image:url(icon/xiaoyu.png); }
	#demo i.icon-zhongyu { background-image:url(icon/zhongyu.png); }
	#demo i.icon-dayu { background-image:url(icon/dayu.png); }
	#demo i.icon-qing { background-image:url(icon/qing.png); }
	#demo i.icon-duoyun { background-image:url(icon/duoyun.png); }
	#demo i.icon-yin { background-image:url(icon/yin.png); }
</style>
</head> 
<body>
<div id="demo">
	<script>$('#demo').leoweather({format:'<i class="icon-{图标}">{气温}℃</i><p>获取的地点：{城市}<span>|</span>{天气}<span>|</span>{风向}{风级}级</p>'});</script>
</div>
</body> 
</html>