<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/front/";%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<base href="<%=basePath%>"/>
<link href="css/styles.css" rel="stylesheet" type="text/css" />
<script src="js/jquery-1.7.1.min.js"></script>
<script>
function checkLeave(){
	var type = $("input[name='gbook.type']").val();
	if(type==null || type==""){alert("请登录后留言!");return false;}
	var intro = $("textarea[name='gbook.intro']").val();
	if(intro==null || intro==""){alert("请输入留言!");return false;}
}
</script>
</head>
<body >
<jsp:include page="top.jsp"/>
<input type="hidden" id="nav_flag" value="gbook"/>
<div class="container"><div style="float:right"></div>
   	<!-- begin .boxes -->
       <div class="boxes">
		<ul>
		
			<!-- 添加留言 -->
            <s:if test="#session.type != null">
            	<li style="width:700px;"><h2>添加留言</h2></li>
            	<li class="shadowStyle" style="width:700px;float:left;margin-top:30px">
            		<br class="clearfloat" />
            		<form action="front!gbookAdd.action" method="post" onsubmit="return checkLeave()">
            			<input type="hidden" name="gbook.type" value="${type}">
            			<s:if test="#session.type==1"><input type="hidden" name="gbook.user.id" value="${user.id}"></s:if>
            			<s:if test="#session.type==1"><input type="hidden" name="gbook.trader.id" value="${user.id}"></s:if>
            			<textarea name="gbook.intro" rows="1" placeholder="输入留言内容..." style="width: 540px;margin-left: 20px" ></textarea>
            			<input type="submit" value="提交" style="float:right;margin:10px 30px;width:50px;height:30px;background:#E0F4FD;border-radius:10px;"/>
            		</form>
            	</li>
            </s:if>
            
            <!-- 显示留言 -->
			<li style="width:700px;margin-top: 40px"><h2>留言列表</h2></li>
            <s:iterator value="gbooks">
            	<li class="shadowStyle" style="width:700px;float:left;margin-top:30px">
            		<br class="clearfloat" />
            		<span style="margin:30px 0 0 20px"><s:property value="intro"/></span>
            		<span style="float:right;margin:30px">
            			<s:if test="type==1">用户[<s:property value="user.nickname"/>] : </s:if>
            			<s:if test="type==2">商家[<s:property value="trader.company"/>] : </s:if>
            			<s:date name="createtime"/>
            		</span>
            	</li>
            </s:iterator>
	            
        </ul>
		<br class="clearfloat" />
		<div style="width: 200px;margin: 30px 0 0 280px;">
			<a href="front!gbookList.action?page=${page==1 ? 1 : page-1}">上一页</a> [${page}/${pages}] <a href="front!gbookList.action?page=${page==pages ? pages : page+1}">下一页</a>
		</div>
    </div>
    <!-- end .boxes -->
    <br class="clearfloat" />
</div>
<footer>

</footer>
</body>
</html>
