<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/admin/";%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="css/style.css" rel="stylesheet" type="text/css" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" type="text/css" href="login/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="login/font-awesome/css/font-awesome.min.css" />
<title>登录后台管理</title>

<style>
	body{
		font-family: 'microsoft yahei',Arial,sans-serif;
		background-color: #222;
	}

	.redborder {
		border:2px solid #f96145;
		border-radius:2px;
	}

	.row {
		padding: 20px 0px;
	}

	.bigicon {
		font-size: 97px;
		color: #f08000;
	}

	.loginpanel {
		text-align: center;
		width: 300px;
		border-radius: 0.5rem;
		top: 0;
		bottom: 0;
		left: 0;
		right: 0;
		margin: 10px auto;
		background-color: #555;
		padding: 20px;
	}

	input {
		width: 100%;
		margin-bottom: 17px;
		padding: 15px;
		background-color: #ECF4F4;
		border-radius: 2px;
		border: none;
	}

	h2 {
		margin-bottom: 20px;
		font-weight: normal;
		color: #EFEFEF;
	}

	.btn {
		border-radius: 2px;
		padding: 10px;
	}

	.btn span {
		font-size: 27px;
		color: white;
	}

	.buttonwrapper{
		position:relative;
		overflow:hidden;
		height:50px;
	}

	.lockbutton {
		font-size: 27px;
		color: #f96145;
		padding: 10px;
		width:100%;
		position:absolute;
		top:0;
		left:0;
	}

	.loginbutton {
		background-color: #f08000;
		width: 100%;
		-webkit-border-top-right-radius: 0;
		-webkit-border-bottom-right-radius: 0;
		-moz-border-radius-topright: 0;
		-moz-border-radius-bottomright: 0;
		border-top-right-radius: 0;
		border-bottom-right-radius: 0;
		left: -260px;
		position:absolute;
		top:0;
	}
	</style>
    <script type="text/javascript" src="login/js/jquery-1.10.2.min.js"></script>
    <script type="text/javascript" src="login/bootstrap/js/bootstrap.min.js"></script>

</head>

<body>
<!-- Interactive Login - START -->
<div class="container-fluid">
    <div class="row">
        <div class="loginpanel">
			<i id="loading" class="hidden fa fa-spinner fa-spin bigicon"></i>
            <h2>
				<span class="fa fa-quote-left "></span> 登录 <span class="fa fa-quote-right "></span>
			</h2>
            <div>
				<form action="login!login.action" method="post" id="form_login">
					<input type="hidden" name="type" value="3"/>
					<input id="username" name="username" type="text" placeholder="登录账号" onkeypress="check_values();">
					<input id="password" name="password" type="password" placeholder="输入密码" onkeypress="check_values();">
					<div class="buttonwrapper">
						<button id="loginbtn" class="btn btn-warning loginbutton">
							<span class="fa fa-check"></span>
						</button>
						<span id="lockbtn" class="fa fa-lock lockbutton redborder"></span>
					</div>
				</form>
            </div>
            <h3>
            	<s:actionerror />
            </h3>
        </div>
    </div>
</div>

<script type="text/javascript">
    function check_values() {
        if ($("#username").val().length > 0 && $("#password").val().length > 0) {
            $("#loginbtn").animate({ left: '0' , duration: 'slow'});;
            $("#lockbtn").animate({ left: '260px' , duration: 'slow'});;
        }
    }

			
	$("#loginbtn").click(function(){
		$('#loading').removeClass('hidden');
		//这里书写登录相关后台处理，例如: Ajax请求用户名和密码验证
	});

</script>

</body>
</html>
