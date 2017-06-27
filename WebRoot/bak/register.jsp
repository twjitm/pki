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

<form action="UserAction!register.action" method="post">
	      <input name="UName" type="text" placeholder="用户名"/>
	      <input name="UPsd" type="password" placeholder="密码"/>
	       <select id="proviace" name="UType">
		   <option value="">角色</option>
		   <option value="管理员">管理员</option>
		  <option value="普通用户">普通用户</option>
		 
	</select>
	<input type="submit" value="提交"/>

</html>
