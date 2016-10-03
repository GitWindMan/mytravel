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
           	<h2>编辑游记</h2> 
           		<form action="front!noteSave.action" method="post" enctype="multipart/form-data">
           			<input type="hidden" name="userid" value="${user.id}">
           			<input type="hidden" name="note.user.id" value="${user.id}">
           			<input type="hidden" name="note.id" value="${note.id}"/>
	               	<input type="text" name="note.title" value="${note.title}" placeholder="标题..." style="margin: 20px 0 0 20px;width: 90%"/>
					<div class="leftList" style="margin-left:20px;width:600px;line-height:20px;">
						<textarea name="note.intro" rows="10"  style="width: 90%" placeholder="介绍...">${note.intro}</textarea><br><br>
						<img src="${note.photo}" height="240px" style="width: 90%"><br><br>
						替换图片: <input type="file" name="photo"/>
						<br class="clearfloat" />
						<input type="submit" value="保存" style="float:right;margin:20px 50px;width:60px;height:30px;background:#00ADFF;border-radius:10px;"/>
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
