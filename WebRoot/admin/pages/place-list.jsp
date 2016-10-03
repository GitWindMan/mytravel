<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/admin/";%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath %>"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="css/style.css" rel="stylesheet" type="text/css" />
</head>

<body>

<table width="90%" border="0" align="left" cellpadding="0" cellspacing="0">
  <tr>
    <td height="30">
	  <table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
		  <td width="15" height="30"><img src=" " width="15" height="30" /></td>
		  <td background=" "><img src="images/311.gif" width="16" height="16" /> 
		  <span class="STYLE4" >景点列表</span></td>
		  <td width="14"><img src=" " width="14" height="30" /></td>
		</tr>
	  </table>
	</td>
  </tr>
  <tr>
    <td>
	  <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="9" background=" ">&nbsp;</td>
          <td bgcolor="e5f1d6">
			<table width="100%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#CECECE">
				<tr>
					<th width="30%" height="26" background=" " class="STYLE1">
						<div align="center" class="STYLE2 STYLE1">标题</div></th>
					<!-- <th width="10%" height="26" background=" " class="STYLE1">
						<div align="center" class="STYLE2 STYLE1">内容</div></th> -->
					<th width="20%" height="26" background=" " class="STYLE1">
						<div align="center" class="STYLE2 STYLE1">日期</div></th>
						
					<th width="20%" height="26" background=" " class="STYLE1" colspan="2">
						<div align="center" class="STYLE2">操作</div></th>
				</tr>
				
				<!-- 用struts的iterator标签遍历news集合, 并去处每一个name显示 -->
				<s:iterator value="places">
	
					<tr>
						<td height="20" bgcolor="#FFFFFF">
							<div align="center" class="STYLE2 STYLE1">
								<a href="front!placeIntro.action?place.id=<s:property value="id"/>" target="_blank">
									<s:property value="title"/></a></div></td>
						<%-- <td height="20" bgcolor="#FFFFFF">
							<div align="center" class="STYLE2 STYLE1"><s:property value="intro"/></div></td> --%>
						<td height="20" bgcolor="#FFFFFF">
							<div align="center" class="STYLE2 STYLE1"><s:date name="createtime"/></div></td>
														
						<td height="20" bgcolor="#FFFFFF"><div align="center">
							<img src="images/037.gif" width="9" height="9" /><span class="STYLE1"> [</span><a href="place!updatePage.action?place.id=<s:property value="id"/>">修改</a><span class="STYLE1">]</span></div></td>
						<td height="20" bgcolor="#FFFFFF"><div align="center">
							<img src="images/010.gif" width="9" height="9" /><span class="STYLE1">[</span><a href="place!delete.action?place.id=<s:property value="id"/>">删除</a><span class="STYLE1">]</span></div></td>
					</tr>
					
				</s:iterator>
				
			</table>
		  </td>
		  <td width="9" background=" ">&nbsp;</td>
		</tr>
	  </table>
	</td>
  </tr>
  <tr>
    <td height="29">
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
		  <tr>
			<td width="15" height="29"><img src=" " width="15" height="29" /></td>
			<td background=" ">&nbsp;<a href="pages/place-add.jsp">添加景点</a>
			<div style="width: 140px;float: right;">
				<a href="place!list.action?page=${page==1 ? 1 : page-1}">上一页</a> [${page}/${pages}] 
				<a href="place!list.action?page=${page==pages ? pages : page+1}">下一页</a>
			</div></td>
			<td width="14"><img src=" " width="14" height="29" /></td>
		  </tr>
		</table>
	</td>
  </tr>
</table>

</body>
</html>
