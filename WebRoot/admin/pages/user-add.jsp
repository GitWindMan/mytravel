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

	<form action="user!add.action" method="post" >

		用户：<input type="text" name="user.username"/><br>
		密码：<input type="text" name="user.password"/><br>
		昵称：<input type="text" name="user.nickname"/><br>
		电话：<input type="text" name="user.phone"/>
		
		<input type="submit" value="添加"/>
		
	</form><s:actionerror/>
	
</body>
</html>
