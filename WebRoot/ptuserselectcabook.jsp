<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>

<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>普通用户证书列表</title>
	<link rel="stylesheet" type="text/css" href="css/normalize.css" />
	<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.2.0/css/font-awesome.min.css" />
	<link rel="stylesheet" type="text/css" href="css/lrtk.css" />
	<link rel="stylesheet" type="text/css" href="css/sidebar.css" />
	<link rel="stylesheet" type="text/css" href="css/main.css">
	<script src="js/snap.svg-min.js"></script>
	<%@taglib prefix="s" uri="/struts-tags"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
</head>
<body>
	<nav id="menu" class="menu">
				<button class="menu__handle"><span>Menu</span></button>
				<div class="menu__inner">
					<ul>
						<li><a href="cabookapply.jsp"><span ><p align=center ><font size='5' color='blue'>证书申请<span></font></p></a></li>
						<li><a href="CABookAction!selectdef.action"><span ><p align=center ><font size='5' color='blue'>证书查询<span></font></p></a></li>
					   <li><a href="login.jsp"><span ><p align=center ><font size='5' color='blue'>退出登录<span></font></p></a></li>
					</ul>
				</div>
				<div class="morph-shape" data-morph-open="M300-10c0,0,295,164,295,410c0,232-295,410-295,410" data-morph-close="M300-10C300-10,5,154,5,400c0,232,295,410,295,410">
					<svg width="100%" height="100%" viewBox="0 0 600 800" preserveAspectRatio="none">
						<path fill="none" d="M300-10c0,0,0,164,0,410c0,232,0,410,0,410"/>
					</svg>
				</div>
			</nav>
	<div class="big">
		<div class="userinfo" style="color:black">
			<span>用户名：${user.UName}</span>
			<span>用户类型：${user.UType}</span>
		</div>
		<div class="top">
			<h3>普通用户证书列表</h3>
		</div>
		<div class="top_cha">
			
			<form action="CABookAction!select.action" method="post">
			<label>搜索条件</label>
			<select id="proviace" name="caselecttype" >
					<option>通过</option>
					<option>未通过</option>
			</select>
			<input type="submit" value="搜索"/>
			</form>
		</div>
		<div class="con">
			<table>
				<tr>
					<th>申请人</th>
					<th>单位</th>
					<th>部门</th>
					<th>国家代码</th>
					<th>地区</th>
					<th>省份</th>
					<th>状态</th>
					<th>下载</th>
					
				</tr>
				<s:iterator value="list" var="lis">
				<tr>
					<td>${lis.caCn}</td>
					<td>${lis.caOu}</td>
					<td>${lis.caO}</td>
					<td>${lis.caC}</td>
					<td>${lis.caL}</td>
					<td>${lis.caSt}</td>
					<td>${lis.caStart}</td>
					<td>
					<s:if test="#lis.caStart=='未通过'"></s:if>
					<s:else>
						<a href="CABookAction!getDownloadFile.action?downCaBookId=${lis.caId}">下载证书</a>
					</s:else>
					</td>
				</tr>
				</s:iterator>
				
			</table>
		</div>
	</div>
	<script src="js/classie.js"></script>
<script src="js/lrtk.js"></script>
</body>
</html>