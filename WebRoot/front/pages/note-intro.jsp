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
           	<li class="shadowStyle" style="width:700px;float:left;">
               	<h2><s:property value="note.title"/></h2> 
               	<img src="${note.photo}" class="boxPic shadowStyle" style="max-width: 94%">
				<div class="leftList" style="margin-left:20px;width:600px;line-height:20px;">
					<s:property value="note.intro"/>
					<br class="clearfloat" />
				</div>
               </li>
           </ul>
           <br class="clearfloat" />
       </div>
       <!-- end .boxes -->
    <br class="clearfloat" />
</div>
</body>
</html>
