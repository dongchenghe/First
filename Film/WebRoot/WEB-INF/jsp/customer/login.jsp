<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="css/easyui.css" rel="stylesheet" type="text/css">
<link href="css/login.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.easyui.min.js"></script>
<script src="js/layer/layer.js" type="text/javascript"></script>
<title>用户登录</title>
</head>
<body>
	<div class="fixed" id="topbar">
	<div id="headbar" class="headbar">
		<h1><a title="Mtime时光网" href="#">Mtime时光网</a></h1>
		<dl class="headbarnav">
			<dd>
				<a>首页</a>
			</dd>
			<dd>
				<a>购票</a>
			</dd>
		</dl>
		<div class="headtool" id="loginbox"><i class="line"></i>
			<div class="headunlogin">
				<a>登录<i></i></a><em></em>
				<a>个人中心</a>
			</div>
		</div>
	</div>
</div>
<div style="margin: 120px auto 0 auto;">
	<h1>用户登录</h1>
	<form action="login" method="post">
	<div>
		<p id="tip" style="color: red">${tip}</p>
		<input id="name" type="text" name="cus.phone" placeholder="输入用户名" value='${cus.phone}'/>
	</div>
	<div>
		<input id="pwd" type="password" name="cus.pwd" placeholder="输入密码" value='${cus.pwd}'/>
	</div>
		<input type="button" value="登录" class="btn btn-success" onclick="doQuery()">
		<input type="submit" value="免费注册" class="btn btn-warning" onclick="doOperate()">
	</form>
</div>
<!--底部-->
<div class="footout">
	<div class="topline"></div>
	<div class="foot">
		<div class="fotlogo">
			<dl style="padding: 0 20px;">
				<dt style="padding-bottom: 10px;">
					<a class="foota">Mtime时光网</a>
				</dt>
				<dd>
					<a href="#">加入我们</a>
					<a href="#" class="m130">联系我们</a>
				</dd>
				<dd>
					<a href="#">站务论坛</a>
					<a href="#" class="m130">问题反馈</a>
				</dd>
				<dd>
					<a href="#">社区准则</a>
					<a href="#" class="m130">网站地图</a>
				</dd>
				<dd>
					<a href="#">隐私政策</a>
					<a href="#" class="m130">English</a>
				</dd>
			</dl>
			<i class="line"></i>
		</div>
		<div class="fotmap">
			<dl style="width:42px;"><dt>栏目</dt>
				<dd>
					<a href="#">新闻</a>
				</dd>
				<dd>
					<a href="#">影院</a>
				</dd>
				<dd>
					<a href="#">商城</a>
				</dd>
				<dd>
					<a href="#">社区</a>
				</dd>
			</dl>
			<dl style="width:185px;"><dt>推荐</dt>
				<dd>
					<a href="#">观影指南</a>
					<a href="#" class="ml30">电影票房</a>
				</dd>
				<dd>
					<a href="#">时光对话</a>
					<a href="#" class="ml30">新片预告</a>
				</dd>
				<dd>
					<a href="#">特色榜单</a>
					<a href="#" class="ml30">电影猜猜猜</a>
				</dd>
				<dd>
					<a href="#">全球拾趣</a>
					<a href="#" class="ml30">卡片大富翁</a>
				</dd>
			</dl>
			<dl><dt>关注我们</dt>
				<dd>
					<a href="#" target="_blank" class="sina" title="新浪">新浪</a>
				</dd>
				<dd>
					<a id="aWeiXinPicButton" href="javascript:void(0)" class="sina" title="微信" style="background-position: -170px -9px">微信</a>
				</dd>
				<dd>
					<a href="#" target="_blank" class="sina" title="RSS" style="background-position: -200px -9px">RSS</a>
				</dd>
			</dl>
			<i class="line"></i>
		</div>
		<div class="fotweek">
			<dl><dt class="clearfix"><span class="fr">第183期</span><strong>时光周刊</strong></dt>
				<dd>
					<a href="#" target="_blank" title="时光周刊"><img src="images/184708.28533510.jpg" width="170" alt="时光周刊"></a>
				</dd>
				<dd class="input"><input id="iptEMail" type="text" value="邮箱地址" class="c_a5">
					<a id="btnSubscribe" href="javascript:void(0)">订阅</a>
				</dd>
			</dl>
		</div>
		<div class="fothr">
			<dl><dt><strong>手机购票</strong> 方便 实惠</dt>
				<dd>
					<a href="#" target="_blank"><i></i></a>
				</dd>
				<dd>扫描二维码 下载客户端</dd>
			</dl>

		</div>
	</div>
</div>
</body>
<script>
function doQuery(){
	var name = $("#name").prop("value");
	var pwd = $("#pwd").prop("value");
	var regphone = /^1[34578]\d{9}$/
	if(name==""){
		layer.msg("手机号码不能为空");
		return false;
	}
	if(!regphone.test(name)){
		layer.msg("手机号码格式不正确");
		return false;
	}
	if(pwd==""){
		layer.msg("密码不能为空");
		return false;
	}
  document.forms[0].submit();
}

function doOperate(id, type){
  document.forms[0].action = "toregister";
  document.forms[0].submit();
}
</script>
</html>