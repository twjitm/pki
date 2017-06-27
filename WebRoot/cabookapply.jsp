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
	<title>证书申请</title>
	<link rel="stylesheet" type="text/css" href="css/normalize.css" />
	<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.2.0/css/font-awesome.min.css" />
	<link rel="stylesheet" type="text/css" href="css/lrtk.css" />
	<link rel="stylesheet" type="text/css" href="css/sidebar.css" />
	<link rel="stylesheet" type="text/css" href="css/main.css">
	<script src="js/snap.svg-min.js"></script>

</head>
<body>
	<nav id="menu" class="menu">
				<button class="menu__handle"><span>Menu</span></button>
				<div class="menu__inner">
					<ul>
						<li><a href="cabookapply.jsp"><span ><p align=center ><font size='5'>证书申请<span></font></p></a></li>
						<li><a href="CABookAction!selectdef.action"><span ><p align=center ><font size='5'>证书查询<span></font></p></a></li>
					    <li><a href="login.jsp"><span ><p align=center ><font size='5'>退出登录<span></font></p></a></li>
					</ul>
				</div>
				<div class="morph-shape" data-morph-open="M300-10c0,0,295,164,295,410c0,232-295,410-295,410" data-morph-close="M300-10C300-10,5,154,5,400c0,232,295,410,295,410">
					<svg width="100%" height="100%" viewBox="0 0 600 800" preserveAspectRatio="none">
						<path fill="none" d="M300-10c0,0,0,164,0,410c0,232,0,410,0,410"/>
					</svg>
				</div>
			</nav>
	<div class="big">
		<div class="userinfo">
			<span>用户名：${user.Uname}</span>
			<span>用户类型：${user.UType}</span>
		</div>
		<div class="top">
			<h3>证书申请</h3>
		</div>
		<div class="con">
			<form action="CABookAction!apply.action">
				<p><label>申请人</label><input type="text" name="caCn"></input></p>
				<p><label>单位</label><input type="text" name="caOu"></input></p>
				<p><label>部门</label><input type="text" name="caO"></input></p>
				<p><label>国家代码</label><input type="text" name="caC"></input></p>
				<p><label>地区（市、区）</label><input type="text" name="caL"></input></p>
				<p><label>省份</label><input type="text" name="caSt"></input></p>
				<!-- <p><label>公钥</label><input type="text" name="caStorepass"></input></p> -->
				<p><label>私钥密码</label><input type="text" name="caKeypass"></input></p>
				<p><label></label><input type="submit" value="提交"></input></p>
			</form>
		</div>
	</div>
	<script src="js/classie.js"></script>
<script src="js/lrtk.js"></script>
</body>
</html>、