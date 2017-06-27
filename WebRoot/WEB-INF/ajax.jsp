<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@taglib prefix="s" uri="/struts-tags" %><!-- 导入struct标签 -->
<%@taglib  prefix="sx"  uri="/struts-dojo-tags" %><!-- ajax依赖标签 -->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<!-- 每隔5000ms刷星 -->
<s:url id="ajaxTest" value="">
<sx:div href="%{}" errorNotifyTopics="错误提示" updateFreq="5000"/>
</s:url>

</head>
</html>