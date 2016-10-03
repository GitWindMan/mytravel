<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ request.getContextPath() + "/admin/";%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="/css/index.css">
</head>
<body class="mian_bj">
	<div class="mian_top_01">
		<div class="mian_top_r"></div>
		<div class="mian_top_l"></div>
		<div class="mian_top_c">
			<ul>
				<li>
					<p>用户列表</p> </a>
				</li>
			</ul>
		</div>
		<div class="mian_b">
			<div class="mian_b1">
				<a href="pages/user-add.jsp" title="添加用户">
					<p class="mian_b1_a1">添加用户</p>
				</a>
				<p class="mian_b1_sousuo"></p>
				<p class="mian_b1_a9"></p>
				<a href="user!list.action?page=${page==pages ? pages : page+1}"
					title="下一页">
					下一页
				</a>
				[${page}/${pages}]
				<a href="user!list.action?page=${page==1 ? 1 : page-1}" title="上一页">
					上一页
				</a>
			</div>
			<table width="100%" border="0" cellpadding="0" cellspacing="0"
				class="mian_b_bg">
				<tr>
					<td colspan="2" width="10%" class="mian_b_bg_lm"><span></span>用户</td>
					<td colspan="2" width="10%" class="mian_b_bg_lm"><span></span>密码</td>
					<td colspan="2" width="5%" class="mian_b_bg_lm"><span></span>昵称</td>
					<td colspan="2" width="10%" class="mian_b_bg_lm"><span></span>电话</td>
					<td width="10%" class="mian_b_bg_lm"><span></span>状态</td>
					<td></td>
					<td colspan="2" class="mian_b_bg_lm"><span></span>操作</td>
				</tr>

				<!-- 用struts的iterator标签遍历news集合, 并去处每一个name显示 -->
				<s:iterator value="users">

					<tr>
						<td>
							<s:property value="username" />
						</td><td></td>						
						<td>
							<s:property value="password" />
						</td><td></td>
						<td>
							<s:property value="nickname" />
						</td><td></td>
						<td>
							<s:property value="phone" />
						</td><td></td>
						<td>
							<s:if test="status==0">正常</s:if>
							<s:if test="status==1">禁言</s:if>
						</td>

						<td>
								<span> [</span>
								<i class="fa fa-bell-slash" aria-hidden="true"></i>
								<a href="user!forbid.action?user.id=<s:property value="id"/>">禁言</a>
								<span>]</span>
							</div></td>
						<td>
								<span> [</span>
								<i class="fa fa-pencil-square-o" aria-hidden="true"></i>								
								<a href="user!updatePage.action?user.id=<s:property value="id"/>">修改</a>
								<span>]</span>
							</div></td>
						<td>
							<span>[</span>
							<i class="fa fa-times" aria-hidden="true"></i>							
							<a href="user!delete.action?user.id=<s:property value="id"/>">删除</a>
							<span>]</span>
							</div></td>
					</tr>

				</s:iterator>
			</table>
		</div>
	</div>
</body>
</html>
<script src="/common.js"></script>