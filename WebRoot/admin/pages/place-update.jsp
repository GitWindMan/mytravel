<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/admin/";
%><%@taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath %>"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>

	<form action="place!update.action" method="post" enctype="multipart/form-data">

		<input type="hidden" name="place.id" value="${place.id}"/>
		<input type="hidden" name="place.photo" value="${place.photo}"/>
		
		标题：<input type="text" name="place.title" style="width: 600px" value="${place.title}"/><br><br>
		介绍：<textarea name="place.intro" rows="6" style="width: 600px">${place.intro}</textarea><br><br>
		图片: <img src="../front/${place.photo}" width="600px" height="240px"><br><br>
		替换图片: <input type="file" name="photo"/>
		<input type="submit" value="保存"/>
		
	</form>
	
</body>
</html>
