<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<title>系统登录</title>
<jsp:include page="inc.jsp"></jsp:include>
<link rel="stylesheet" href="style/login.css">
<script type="text/javascript">
/**
$(function() {
	var loginFun = function() {
		var loginTabs = $('#loginTabs').tabs('getSelected');//当前选中的tab
		var $form = loginTabs.find('form');//选中的tab里面的form
		if ($form.length == 1 && $form.form('validate')) {
			$('#loginBtn').linkbutton('disable');
			$.post(frm.contextPath + '/base/frmUser!doNotNeedSessionAndSecurity_login.do', $form.serialize(), function(result) {
				if (result.success) {
					location.replace(frm.contextPath + '/index.jsp');
				} else {
					$.messager.alert('提示', result.msg, 'error', function() {
						$('#loginBtn').linkbutton('enable');
					});
				}
			}, 'json');
		}
	};

	$('#loginDialog').show().dialog({
		modal : false,
		closable : false,
		iconCls : 'ext-icon-lock_open',
		buttons : [ {
			id : 'loginBtn',
			text : '登录',
			handler : function() {
				loginFun();
			}
		} ],
		onOpen : function() {
			$('form :input:first').focus();
			$('form :input').keyup(function(event) {
				if (event.keyCode == 13) {
					loginFun();
				}
			});
		}
	});
});
*/
$(function(){
	$("#login").slideDown(1000);
});

function verify_login(){
	var loginname = $("#loginname").val();
	var pwd = $("#pwd").val();
	$.post(frm.contextPath + '/base/frmUser!doNotNeedSessionAndSecurity_login.do', { 'data.loginname': loginname, 'data.pwd': pwd }, function(result) {
		if (result.success) {
			location.replace('${pageContext.request.contextPath}/index.jsp');
		} else {
			$.messager.alert('提示', result.msg, 'error', function() {
				$('#loginBtn').linkbutton('enable');
			});
		}
	},'json');
}
</script>
</head>
<body>
<div class="login" id="login" style="display: none;">
<form method="post" >
<div class="user"><input id="loginname" name="data.username" value=""></div>
<div class="psw"><input id="pwd" name="data.password" type="password" value=""></div>
<div class="dl">
<input id="but_login" type="button" onclick="verify_login()" value="" class="denglu">
<input type="reset" value="" class="chongzhi">
</div>
</form>
</div>
<!-- 
<div id="loginDialog" title="系统登录" style="display: none; width: 320px; height: 180px; overflow: hidden;">
	<div id="loginTabs" class="easyui-tabs" data-options="fit:true,border:false">
		<div title="用户输入模式" style="overflow: hidden; padding: 10px;">
			<form method="post" class="form">
				<table class="table" style="width: 100%; height: 100%;">
					<tr>
						<th width="50">登录名</th>
						<td><input name="data.loginname" class="easyui-validatebox" data-options="required:true" value="nh" style="width: 210px;" /></td>
					</tr>
					<tr>
						<th>密码</th>
						<td><input name="data.pwd" type="password" class="easyui-validatebox" data-options="required:true" value="123456" style="width: 210px;" /></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</div>
-->
</body>
</html>