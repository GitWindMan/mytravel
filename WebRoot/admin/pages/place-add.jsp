<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/admin/";%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath %>"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>

	<form action="place!add.action" method="post" enctype="multipart/form-data">

		标题：<input type="text" name="place.title" style="width: 600px"/><br><br>
		介绍：<textarea name="place.intro" rows="6" style="width: 600px"></textarea><br><br>
		图片: <input type="file" name="photo" />
		<input type="submit" value="添加"/><s:actionerror/>
		
	</form>
	
</body>
</html>
