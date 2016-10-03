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

	<form action="trader!update.action" method="post" >

		<input type="hidden" name="trader.id" value="${trader.id}"/>
		<input type="hidden" name="trader.username" value="${trader.username}"/>
		
		用户：${trader.username}<br>
		密码：<input type="text" name="trader.password" value="${trader.password}"/><br>
		公司：<input type="text" name="trader.company" value="${trader.company}"/><br>
		电话：<input type="text" name="trader.phone" value="${trader.phone}"/>
		<input type="submit" value="修改"/><s:actionerror/>
		
	</form>
	
</body>
</html>
