<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/front/";%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<base href="<%=basePath%>"/>
<link href="css/styles.css" rel="stylesheet" type="text/css" />
</head>
<body >
<jsp:include page="../top.jsp"/>
<input type="hidden" id="nav_flag" value="note"/>
<div class="container">
   	<!-- begin .boxes -->
       <div class="boxes">
		<ul>
           	<li class="shadowStyle" style="width:600px;float:left;">
           	<h2>发布游记</h2> 
           		<form action="front!noteAdd.action" method="post" enctype="multipart/form-data">
           			<input type="hidden" name="userid" value="${user.id}">
           			<input type="hidden" name="note.user.id" value="${user.id}">
	               	<input type="text" name="note.title" placeholder="标题..." style="margin: 20px 0 0 20px;width: 90%"/>
	               	<div style="margin: 20px 0 0 20px;width: 90%">选择图片: <input type="file" name="photo" /></div>
					<div class="leftList" style="margin-left:20px;width:600px;line-height:20px;">
						<textarea name="note.intro" rows="10" placeholder="内容..." style="width: 90%"></textarea>
						<br class="clearfloat" />
						<input type="submit" value="添加" style="float:right;margin:20px 50px;width:60px;height:30px;background:#E0F4FD;border-radius:10px;"/>
					</div>
				</form>
               </li>
           </ul>
           <br class="clearfloat" />
       </div>
       <!-- end .boxes -->
    <br class="clearfloat" />
</div>
</body>
</html>
