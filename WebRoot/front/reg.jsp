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
	<div class="welcome"></div>
	<div class="contact">
		<div class="container">
			<h3>用户登录</h3>
			<div class="contact-main">
				<div class="contact-top">
					<div class="col-md-6 contact-top-left">
						<div class="contact-textarea">
							<h2>用户注册</h2>
							<form action="login!reg.action" method="post">
								<input type="hidden" name="type" value="1" /> 用 &nbsp; &nbsp;
								&nbsp; &nbsp;户:<input type="text" name="username" /> 密 &nbsp;
								&nbsp; &nbsp; &nbsp;码:<input type="password" name="password" />
								确认密码:<input type="password" name="repassword" /> 公 &nbsp;
								&nbsp; &nbsp; &nbsp;司:<input type="text" name="nickname" /> 电
								&nbsp; &nbsp; &nbsp; &nbsp;话:<input type="text" name="phone" />
								<input type="submit" value="注册用户"
									style="float: right; margin: 20px 120px; width: 80px; height: 30px; background: #E0F4FD; border-radius: 10px;" />
							</form>
						</div>
						<h3>
							<s:actionerror />
						</h3>
					</div>
					<div class="col-md-6 contact-top-right">
						<div class="contact-textarea">
							<h2>商家注册(需审核)</h2>
							<form action="login!reg.action" method="post">
								<input type="hidden" name="type" value="2" /> 用 &nbsp; &nbsp;
								&nbsp; &nbsp;户:<input type="text" name="username" /> 密 &nbsp;
								&nbsp; &nbsp; &nbsp;码:<input type="password" name="password" />
								确认密码:<input type="password" name="repassword" />
								</p>
								公 &nbsp; &nbsp; &nbsp; &nbsp;司:<input type="text" name="company" />
								电 &nbsp; &nbsp; &nbsp; &nbsp;话:<input type="text" name="phone" />
								<input type="submit" value="注册商家"
									style="float: right; margin: 20px 120px; width: 80px; height: 30px; background: #E0F4FD; border-radius: 10px;" />
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
</body>
</html>
