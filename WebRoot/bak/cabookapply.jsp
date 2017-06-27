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
	<%@taglib prefix="s" uri="/struts-tags"%>
	<form action="CABookAction!apply.action" method="post">
	    <label>证书申请人</label> <br/>
		<input type="text" name="caCn" placeholder="名字与姓氏"/> <br/>
		 <label>组织单位名称</label> <br/>
		<input type="text" name="caOu" placeholder="组织单位名称"/><br/>
		<label>组织名称</label> <br/>
		<input type="text" name="caO" placeholder="组织名称"/><br/>
		<label>城市或区域名称</label> <br/>
		<input type="text" name="caL" placeholder="城市或区域名称"/><br/>
		<label>州或省份名称</label> <br/>
		<input type="text" name="caSt" placeholder="州或省份名称"/><br/>
		<label>单位的两字母国家代码</label> <br/>
		<input type="text" name="caC" placeholder="单位的两字母国家代码"/><br/>
		<label>密钥库的密码</label> <br/>
		<input type="text" name="caStorepass" placeholder="密钥库的密码"/><br/>
		<label>私钥的密码</label> <br/>
		<input type="text" name="caKeypass" placeholder="私钥的密码"/><br/>
		<input type="submit" value="提交" />
	</form>
</body>
</html>