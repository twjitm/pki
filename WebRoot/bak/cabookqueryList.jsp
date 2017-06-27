<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<%@taglib prefix="s" uri="/struts-tags"%>
<title>My JSP 'index.jsp' starting page</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
</head>

<body>
	<form action="CABookAction!adminquery.action">
		<select id="proviace" name="adcaState">
			<option value="通过">通过</option>
			<option value="未通过">未通过</option>

		</select>
		<input value="查询" type="submit"/>
	</form>

	<table>
		<tr>
			<th>组织单位名称:</th>
			<th>省份</th>
			<th>市</th>
			<th>公司</th>
			<th>部门</th>
			<th>emil</th>
			<th>用户名</th>

			<th>操作</th>
		</tr>
		<s:iterator value="list" var="lis">

			<td>${lis.caCn}</td>
			<td>${lis.caOu}</td>
			<td>${lis.caO}</td>
			<td>${lis.caL}</td>
			<td>${lis.caSt}</td>
			<td>${lis.caStart}</td>
			<td>${lis.UId}</td>
			<a href="CABookAction!adminsetCAbook.action?caBookId=${lis.caId}" >签发证书</a>
		</s:iterator>

	</table>

</body>
</html>