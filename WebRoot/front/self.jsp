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
<jsp:include page="top.jsp"/>
<input type="hidden" id="nav_flag" value="login"/>
<div class="container">
   	<!-- begin .boxes -->
       <div class="boxes">
		<ul>
           	<li class="shadowStyle" style="width:240px;float:right;">
           	<h2>个人资料</h2> 
           		<form action="login!userSave.action" method="post">
           			<input type="hidden" name="type" value="${type}">
           			<div style="margin: 20px 0 0 20px;"> 
	           			<s:if test="#session.type==1">
	           				<input type="hidden" name="user.id" value="${user.id}"/>
	           				<input type="hidden" name="user.username" value="${user.username}"/>
	           				用户: ${user.username}<br><br>
	           				密码: <input type="password" name="user.password" value="${user.password}"/><br><br>
	           				昵称: <input type="text" name="user.nickname" value="${user.nickname}"/><br><br>
	           				电话: <input type="text" name="user.phone" value="${user.phone}"/><br><br>
	           			</s:if>
	           			<s:if test="#session.type==2">
	           				<input type="hidden" name="trader.id" value="${user.id}"/>
	           				<input type="hidden" name="trader.username" value="${user.username}"/>
	           				用户: ${user.username}<br><br>
	           				密码: <input type="password" name="trader.password" value="${user.password}"/><br><br>
	           				公司: <input type="text" name="trader.company" value="${user.company}"/><br><br>
	           				电话: <input type="text" name="trader.phone" value="${user.phone}"/><br><br>
	           			</s:if>
           			</div><div style="color:red;margin-left:10px"><s:actionmessage/></div>
					<input type="submit" value="保存" style="float:left;margin:20px 0 20px 150px;width:60px;height:30px;background:#00ADFF;border-radius:10px;"/>
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
