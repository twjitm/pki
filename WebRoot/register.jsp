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

<title>注册</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css"href="styles.css">
	-->
<!-- <link rel="stylesheet" type="text/css"href="css/reset.css" />
<link rel="stylesheet" type="text/css"href="css/default.css">
<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css'>
<link rel="stylesheet" type="text/css"href="css/styles.css"> -->
<style type="text/css">
body {
	background: url("img/bg.jpg") no-repeat;
	background-size: 1400px 750px;
}

* {
	padding: 0px;
	margin: 0px;
}

.test {
	font-size: 30px;
	font-style: italic;
	color:white;
}

.big {
	position: absolute;
	top: 224px;
	left: 525px;
	
	border-radius:3px;
	padding:20px;
	color:white;
}

.big.coninput.account {
	display: block;
	width: 180px;
	height: 20px;
	border: 1px solid #ccc;
	margin-top: 130px;
	margin-left: 204px;
	color:white;
}

.big.coninput.pwd {
	display: block;
	width: 180px;
	height: 20px;
	border: 1px solid #ccc;
	margin-top: 16px;
	margin-left: 204px;
	color:white;
}

.big.coninput.reg {
	width: 100px;
	height: 30px;
	border: 1px solid #C5C1AA;
	background: #C5C1AA;
	border-radius: 3px;
	margin-left: 280px;
	margin-top: 10px;
	color:white;
}

.big .submit {
	width:100px;
			height:30px;
			border:1px solid #C5C1AA;
			background:#C5C1AA;
			border-radius:3px;
			margin-left:99px;
			margin-top:10px;
			color:white;
			cursor:pointer;
}
.shuru{
	width:272px;
	height:30px;
	border-radius:3px;
	border:1px solid white;
	display:inline-block;
	padding:3px 10px;
	color:white;
}
</style>



</head>

<body>
	<div class="test" style="margin-top:82px;text-align: center;">
		<i><font size=7>PKI&nbsp;&nbsp;证&nbsp;&nbsp;书&nbsp;&nbsp;管&nbsp;&nbsp;理&nbsp;&nbsp;系&nbsp;&nbsp;统</font></i>
	</div>


	<div class="big">
		<form action="UserAction!register.action" method="post">

			<div class="con">
				<lable>用户名:</lable>
				<input class="shuru" name="UName" type="text" placeholder="用户名" /> <br /> <br /> <br />
				<lable>密 &emsp;码:</lable>
				<input class="shuru" name="UPsd" type="password" placeholder="密码" /> <br /> <br />
				<br />
				<lable>身&emsp; 份:</lable>


				<select id="proviace" name="UType">
					<option value="">身份</option>

					<option value="管理员">管理员</option>
					<option value="普通用户">普通用户</option>
				</select> <input class="submit" type="submit" value="提交" />

			</div>


		</form>
	</div>

</body>
</html>
