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
	<title>管理员证书列表</title>
	<link rel="stylesheet" type="text/css" href="css/normalize.css" />
	<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.2.0/css/font-awesome.min.css" />
	<link rel="stylesheet" type="text/css" href="css/lrtk.css" />
	<link rel="stylesheet" type="text/css" href="css/sidebar.css" />
	<link rel="stylesheet" type="text/css" href="css/main.css">
	<script src="js/jquery-2.1.1.min.js"></script>
	<script src="js/snap.svg-min.js"></script>
   <%@taglib prefix="s" uri="/struts-tags"%>
</head>
<body>
	<nav id="menu" class="menu">
				<button class="menu__handle"><span>Menu</span></button>
				<div class="menu__inner">
					<ul>
						<li><a href="CABookAction!adminQueryNoParams.action"><span ><p align=center ><font size='5' color='blue'>证书查询<span></font></p></a></li>
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
			<span>用户名：安尧</span>
			<span>用户类型：管理员</span>
		</div>
		<div class="top">
			<h3>管理证书列表</h3>
		</div>
		 <div class="top_cha">
		 <form action="CABookAction!adminquery.action" method="post">
			<label>搜索条件</label>
			<select id="proviace" name="adcaState">
					<option value="0">通过</option>
					<option value="1">未通过</option>
			</select>
			<!-- <input id="chaxunbtn" type="submit" value="查询" /> -->
			<a href="javascript:;" class="chaxunbtn">查询</a>
		</form>
		</div> 
		<div class="con">
			<table >
				<tr class="testtr">
					<th>申请人</th>
					<th>单位</th>
					<th>部门</th>
					<th>国家代码</th>
					<th>地区</th>
					<th>省份</th>
					<th>状态</th>
					<th>查看信息</th>
					<th>审核</th>
					<th>删除</th>
				</tr>
				<%-- <s:iterator value="list" var="lis"> --%>
				<tr >
					<%-- <td class="caCn">${lis.caCn}</td>
					<td class="caOu">${lis.caOu}</td>
					<td class="caO">${lis.caO}</td>
					<td class="caC">${lis.caC}</td>
					<td class="caL">${lis.caL}</td>
					<td class="caSt">${lis.caSt}</td>
					<td class="caStart">${lis.caStart}</td> --%>
					<!-- 
					<td class="caCn"></td>
					<td class="caOu"></td>
					<td class="caO"></td>
					<td class="caC"></td>
					<td class="caL"></td>
					<td class="caSt"></td>
					<td class="caStart"></td>
					 -->
					
					<%-- <td>
					<a href="CABookAction!adminselectCaInfor.action?caBookId=${lis.caId}">详情</a></td>
					<td>
					<s:if test="#lis.caStart=='通过'"></s:if>
					<s:else>
					<a href="CABookAction!adminsetCAbook.action?caBookId=${lis.caId}">签发证书</a>
					</s:else>					
					</td>
					<td>
					<a href="CABookAction!deleteca.action?caBookId=${lis.caId}">删除</a>
					</td> --%>
				</tr>
				<%-- </s:iterator> --%>
			</table>
		</div>
	</div>
	<script src="js/classie.js"></script>
<script src="js/lrtk.js"></script>
<script>
	$(document).ready(function () {
	setInterval("testchaxun()",5000);
	});
	function testchaxun(){
	
		var selectId = $('#proviace').val();
		var selectText="通过";
		if(selectId==0){
		selectText="通过"}else{
		selectText="未通过";
		}
		$.ajax({
        type : "POST",
        url : "CABookAction!adminquery.action?adcaState=" + selectText,
        dataType : "json",
        success : function(data) {
      //  console.log(data);
        	$('tr').remove('.datatr');
        	if(selectId==0){
        	for(var i=0;i<data.length-1;i++){
	        $('.testtr').after('<tr class="datatr">'+'<td>'+data[i].caCn+'</td>'+
			  '<td>'+data[i].caOu+'</td>'+
			  '<td>'+data[i].caO+'</td>'+
			  '<td>'+data[i].caC+'</td>'+
			  '<td>'+data[i].caL+'</td>'+
			  '<td>'+data[i].caSt+'</td>'+
			  '<td>'+data[i].caStart+'</td>'+
			   '<td>'+'<a href="CABookAction!adminselectCaInfor.action?caBookId='+data[i].caId+'\""+>查看信息</a></td>'+
			  '<td>'+'<a href="CABookAction!adminsetCAbook.action?caBookId='+data[i].caId+'\""+></a></td>'+
			'<td>'+'<a href="CABookAction!deleteca.action?caBookId='+data[i].caId+'\""+>删除</a></td>'+
			  '</tr>');
	          }
        	}else{
        	for(var i=0;i<data.length-1;i++){
	        $('.testtr').after('<tr class="datatr">'+'<td>'+data[i].caCn+'</td>'+
			  '<td>'+data[i].caOu+'</td>'+
			  '<td>'+data[i].caO+'</td>'+
			  '<td>'+data[i].caC+'</td>'+
			  '<td>'+data[i].caL+'</td>'+
			  '<td>'+data[i].caSt+'</td>'+
			  '<td>'+data[i].caStart+'</td>'+
			   '<td>'+'<a href="CABookAction!adminselectCaInfor.action?caBookId='+data[i].caId+'\""+>查看信息</a></td>'+
			  '<td>'+'<a href="CABookAction!adminsetCAbook.action?caBookId='+data[i].caId+'\""+>颁发证书</a></td>'+
			'<td>'+'<a href="CABookAction!deleteca.action?caBookId='+data[i].caId+'\""+>删除</a></td>'+
			  '</tr>');
	          }
        	}
        	
         }
        });
      };
</script>
</body>
</html>