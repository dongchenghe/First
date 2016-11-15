<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
  <base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>管理员登录</title>
</head>
<script src="js/jquery-2.2.4.min.js" type="text/javascript"></script>
<script src="js/layer.js" type="text/javascript"></script>
<link type="text/css" rel="stylesheet" href="css/mainlogin.css" />
<script type="text/javascript">

	function testManager() {
		$.ajax({
		type : "post",
		url : "jsonkpi/staffLoginAction!login",
		data : $("#loginForm").serialize(),
		cache : false,
		dataType : "json",
		success : function(dta) {
			layer.msg(dta.msg);
			return;
		},
		error : function(dta) {
			$("#loginForm").submit();
		}
	});
	}

	</script>
<body oncontextmenu="return false">
	<div style="margin: 120px auto 0 auto;">
		<h1>时光网管理员登录</h1>
		<form id="loginForm" action="staffLoginAction!login" method="post">
			<div>
				<input id = "name" type="text" name="staff.userName" class="username"
					placeholder="员工名" autocomplete="off" />
			</div>
			<div>
				<input id = "pwd" type="password" name="staff.pwd" class="password"
					placeholder="密码" oncontextmenu="return false"
					/>
			</div>
			<button id="sub" type="button" onclick="testManager()">登录</button>
		</form>
	</div>
</body>
</html>