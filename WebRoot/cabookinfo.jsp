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
	<title>证书详情</title>
	<link rel="stylesheet" type="text/css" href="css/normalize.css" />
	<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.2.0/css/font-awesome.min.css" />
	<link rel="stylesheet" type="text/css" href="css/lrtk.css" />
	<link rel="stylesheet" type="text/css" href="css/sidebar.css" />
	<link rel="stylesheet" type="text/css" href="css/main.css">
	<script src="js/snap.svg-min.js"></script>
	<%@taglib prefix="s" uri="/struts-tags"%>

</head>
<body>
	<nav id="menu" class="menu">
				<button class="menu__handle"><span>Menu</span></button>
				<div class="menu__inner">
					<ul>
						<li><a href="CABookAction!adminQueryNoParams.action"><span ><p align=center ><font size='5' color='blue'>证书查询<span></font></p></a></li>
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
			<span>用户名：郭胜男</span>
			<span>用户类型：管理员</span>
		</div>
		<div class="top">
			<h3>证书详情</h3>
		</div>
		<div class="con">
			<p><label>申请人</label><span>${cabook.caCn}</span></p>
				<p><label>单位</label><span>${cabook.caOu}</span></p>
				<p><label>部门</label><span>${cabook.caO}</span></p>
				<p><label>国家代码</label><span>${cabook.caC}</span></p>
				<p><label>地区（市、区）</label><span>${cabook.caL}</span></p>
				<p><label>省份</label><span>${cabook.caSt}</span></p>
				<p><label>私钥密码</label><span>${cabook.caKeypass}</span></p>
				<p><label>状态</label><span>${cabook.caStart}</span></p>
				<s:if test="cabook.caStart=='通过'"></s:if>
				<s:else><p><label></label><a href="CABookAction!adminsetCAbook.action?caBookId=${cabook.caId}" class="zsbtn">签发证书</a></p></s:else>

					<p><label></label><a href="#" class="zsbtn">删除证书</a></p>
				
		</div>
	</div>
	<script src="js/classie.js"></script>
<script src="js/lrtk.js"></script>
</body>
</html>