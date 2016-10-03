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
<jsp:include page="top.jsp"/>
<input type="hidden" id="nav_flag" value="news"/>
<div class="container">
   	<!-- begin .boxes -->
       <div class="boxes">
		<ul>
           	<li class="shadowStyle" style="width:700px;float:left;">
               	<h2>
               		<span style="float:left;margin: 0 0 20px 10px;">优惠信息</span>
               		<s:if test="#session.type==2 && #session.user.status==0">
	               		<span style="float:right;margin: 0 20px;"><a href="pages/news-add.jsp">发布优惠</a></span>
	               		<span style="float:right;margin: 0 20px;"><a href="front!newsSelf.action?userid=${user.id}">我的优惠</a></span>
               		</s:if>
               	</h2>
               	<br/>
               	<br/>
               	<br/>
				<div class="leftList" style="margin-left:20px;">
					<ul>
						<s:iterator value="newses">
							<li style="width:600px;">
								<a href="front!newsIntro.action?news.id=<s:property value='id'/>"><s:property value="title"/></a>
								<span style="float:right;"><s:date name="createtime"/></span>
							</li>
						</s:iterator>
					</ul>
					<br class="clearfloat" />
					<div style="width: 200px;margin: 20px 0 0 260px;">
						<a href="front!newsList.action?page=${page==1 ? 1 : page-1}">上一页</a> [${page}/${pages}] <a href="front!newsList.action?page=${page==pages ? pages : page+1}">下一页</a>
					</div>
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
