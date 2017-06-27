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
<%-- <form action="UserAction!getUser.action" method="post">
	<td>${u.UName}</td>
	<tr>${u.UId}</tr>
	<button type="submit">${u.UName}</button>
</form>
<form action="UserAction!getUserByAccess.action" method="post">

	<input type="text" name="context"><br> <input type="text"
		name="password"><br> <input type="submit" value="我要提交">
	<s:iterator value="listtask" var="list">
		<td>集合数据 ${list.TTitle}<br> <input type="text" name="ipcon"></td>
	</s:iterator>
	<td>${u3.UName}</td>
	<body>
		<td>${u3.UName}</td>
	</body>
	<br>
</form>
<h1>文件上传</h1>
<form action="${pageContext.request.contextPath}/servlet/TestServlet"
	method="post" enctype="multipart/form-data">



	<label>${pageContext.request.contextPath}</label> <input type="file"
		name="file">文件上传</input> <input type="submit"></input>
</form>

<h1>Action中文件上传</h1>
<body>
	<center>
		<s:form action="UpLoadFileAction!upload.action" method="post"
			enctype="multipart/form-data">
			<s:file name="uploadFile" label="选着文件"></s:file>
			<s:submit>提交</s:submit>
		</s:form>
	</center>
</body>
<h1>ajax请求JSON对象(用框架)————————————————————————————————</h1>

<script type="text/javascript">
	var XHR = false;
	function CreateXHR() {
		try {
			XHR = new ActiveXObject("msxml2.XMLHTTP");

		} catch (e1) {
			try {

				XHR = new ActiveXObject("microsoft.XMLHTTP");
			} catch (e2) {
				try {
					XHR = new XMLHttpRequest();
				} catch (e3) {

					XHR = false;
				}
			}
		}
	}

	function sendRequest() {
		CreateXHR();

		if (XHR) {
			XHR.open("POST", "AjaxJsonAction!getUserInformation.action", true);
			XHR.onreadystatechange = resultHander();
			XHR.send(null);//post的请求参数

		}
	}
	function resultHander() {
		if (XHR.readyState == 4 && XHR.status == 200) {
			var userObj = JSON.parse(XHR.responseText);
			var userjson = eval("(" + userObj + ")")
			document.write(userjson)
			var userStr = "<table border=0>";

			userStr += ('<tr><td><b>Name</b></td></tr>' + userObj.USER.UName + '</td></tr>');
			userStr += "</table>"
			document.getElementById("jsonDiv").innerHTML = userStr;
		}
	}
</script>
<body>

	<center>
		<div id="jsonDiv"></div>
		<input type="button" value="OK" onclick="sendRequest();" />
	</center>
</body>
<h1>ajax不用框架====================</h1>
<script type="text/javascript">
	function tanDelete(id) {
		$.ajax({
			type : "POST",
			url : "AjaxJsonAction!getUserInformation.action",
			dataType : "json",
			data : {
				"id" : $("#getid").val()
			},
			success : function() {
				alert("删除成功");
				window.location.reload();
			},
			error : function() {
				window.location.reload();
			}
		});
	};

	function sef() {
		$.post("/UpLoadImageServlet", function(data) {
			alert(data)
		})
	}
</script>
<input type="button" onclick="sef()">cone
</input>
<body>

	<center>

		<input type="button" value="OK" onclick="tanDelete(id=${1});" />
	</center>
</body>
<h1>ajax---------------------test</h1> --%>
<form action="UserAction!register.action" method="post">
	      <input name="UName" type="text" placeholder="用户名"/>
	      <input name="UPsd" type="password" placeholder="密码"/>
	       <select id="proviace" name="UType">
		   <option value="">角色</option>
		   <option value="管理员">管理员</option>
		  <option value="普通用户">普通用户</option>
		 
	</select>
	<input type="submit" value="提交"/>
</form>
<h1>-----------------生成密钥---------------------</h1>
<form action="CABookAction!test.action" method="post">

	<input type="submit" value="提交"/>
</form>
<%-- <h1>上传图片</h1>



<form action="UpLoadFileAction!upload.action" method="post"
	enctype="multipart/form-data">
	<p>
		<label>上传公司图片 </label> 请尽量上传680x340尺寸图片，长宽比例过大将导致图片失真 <span
			id="imgdiv"> <img id="preview" src="" width="1804px"
			height="1024px" style="display: block; width: 164px; height: 163px;" />
		</span> <a href="javascript:" class="file"
			onclick="document.getElementById('doc').click();">选择文件</a> <input
			type="file" name="upload" id="doc" style="display:none"
			onchange="javascript:setImagePreview();" />
	</p>

	<!-- <input  type="file" name="upload"/> -->
	<div class="btns" style="text-align:left;margin-left:100px;">
		<button class="button" type="submit">确定</button>
		<button class="button" type="button"
			onclick="location.href='javascript:history.go(-1) '">返回</button>
	</div>

</form>

<script type="text/javascript">
	//下面用于图片上传预览功能
	function setImagePreview(avalue) {
		var docObj = document.getElementById("doc");

		var imgObjPreview = document.getElementById("preview");
		if (docObj.files && docObj.files[0]) {
			//火狐下，直接设img属性
			imgObjPreview.style.display = 'block';
			imgObjPreview.style.width = '164px';
			imgObjPreview.style.height = '163px';
			//imgObjPreview.src = docObj.files[0].getAsDataURL();

			//火狐7以上版本不能用上面的getAsDataURL()方式获取，需要一下方式
			imgObjPreview.src = window.URL.createObjectURL(docObj.files[0]);
		} else {
			//IE下，使用滤镜
			docObj.select();
			var imgSrc = document.selection.createRange().text;
			var localImagId = document.getElementById("imgdiv");
			//必须设置初始大小
			localImagId.style.width = "164px";
			localImagId.style.height = "163px";
			//图片异常的捕捉，防止用户修改后缀来伪造图片
			try {
				localImagId.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale)";
				localImagId.filters
						.item("DXImageTransform.Microsoft.AlphaImageLoader").src = imgSrc;
			} catch (e) {
				alert("您上传的图片格式不正确，请重新选择!");
				return false;
			}
			imgObjPreview.style.display = 'none';
			document.selection.empty();
		}
		return true;
	}

	
</script>
 --%>
</html>
