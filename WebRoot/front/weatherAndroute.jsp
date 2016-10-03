<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/front/";%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'weatherAndroute.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
<link href="css/styles.css" rel="stylesheet" type="text/css" />
  </head>
<body >
<jsp:include page="top.jsp"/>
  
  <body>
    <p style="position:absolute; top:43%; left:0; text-align:center; width:100%; *top:0;"><font size="5px">天气查询请打开墨迹天气</font></p>
    
    <p style="position:absolute; top:50%; left:0; text-align:center; width:100%; *top:0;"><font size="5px">路线查询请查询百度地图</font></p>
  </body>
</html>
