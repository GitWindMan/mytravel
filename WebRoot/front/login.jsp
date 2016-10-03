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
<div class="welcome">	</div>
<input type="hidden" id="nav_flag" value="login"/>
<div class="contact">
	<div class="container">
		<h3>用户登录</h3>
			<div class="contact-main">
				<div class="contact-top">
					<div class="col-md-6 contact-top-left">
					
					</div>
					<div class="col-md-6 contact-top-right">
						<div class="contact-textarea">
							<form action="login!login.action" method="post">
								<h4>用户名</h4><input type="text" name="username"	onfocus="this.value = '';"/> 
								<h4>密码：</h4><input type="password" name="password" onfocus="this.value = '';" />
								<h4>用户类型</h4>
								<select name="type" >
									<option value="1">用户</option>
									<option value="2">商家</option>
								</select> 
								<input type="submit" value="登录" /> 
								<input type="reset"	value="清除所有">
							</form>
						</div>						
						<h3>
							<s:actionerror />
						</h3>
					</div>
					<div class="clearfix"></div>
				</div>
			</div>
		</div>
	</div>
	</div>
</div>

</body>
</html>
