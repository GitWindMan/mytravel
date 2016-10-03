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

	<form action="user!update.action" method="post" >

		<input type="hidden" name="user.id" value="${user.id}"/>
		<input type="hidden" name="user.username" value="${user.username}"/>
		
		用户：${user.username}<br>
		密码：<input type="text" name="user.password" value="${user.password}"/><br>
		昵称：<input type="text" name="user.nickname" value="${user.nickname}"/><br>
		电话：<input type="text" name="user.phone" value="${user.phone}"/>
		<input type="submit" value="修改"/><s:actionerror/>
		
	</form>
	
</body>
</html>
