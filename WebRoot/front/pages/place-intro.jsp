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
<body>
<jsp:include page="../top.jsp"/>
<input type="hidden" id="nav_flag" value="place"/>
<div class="container">
   	<!-- begin .boxes -->
       <div class="boxes">
			<ul>
	           	<li class="shadowStyle" style="width:900px;float:left;">
	               	<h2>${place.title}</h2>					
					<div class="col-md-5 about-top-left">
						<div><img src="${place.photo}" class="boxPic shadowStyle" style="max-width: 94%"><div class="leftList" style="margin-left:20px;width:94%;line-height:20px;">
						</div>
						</div>
					</div>
		            <div class="col-md-7 about-top-right">
						<h4><s:property value="place.intro"/></h4>
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
