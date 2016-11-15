<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
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
		<link href="css/register.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="js/jquery.min.js"></script>
		<script src="js/layer/layer.js" type="text/javascript"></script>
		<title >注册</title>
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
		<h3>欢迎注册</h3>
			  <form action="register" method="post">
			  <label for="name" id="lab" style="color: red"><s:property value="tip"/></label>
			  <input style="margin-top: 10px;" id="phone" type="text" name="cus.phone" placeholder="输入手机号码" onchange="testName(this.value)"/>
			  <input id="pwd" type="password" name="cus.pwd" placeholder="密码"/>
			  <input id="rpwd" type="password" name="cus.pwd1" placeholder="确认密码"/>
			  <input class="btn btn-success" type="button" value="注册" onclick="btn()">
			  </form>
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
		var der = false;
		function testName(name){
		var lab = $("#lab");
			$.ajax({
					url:"isPhoneExitAjax",
					data:"&cus.phone="+$("#phone").prop("value"),
					dataType:"json", 
					success:function(json){
						var result = eval("("+json+")").result;
						if(result=="no"){
							lab.text("用户名已经存在");
							return 0;
						}
						lab.text("");
						der = true;
					},
				});
		}
		function btn(){
			var pwd=$("#pwd").prop("value");
			var phone=$("#name").prop("value");
			var rpwd = $("#rpwd").prop("value");
			var regphone =/^1[3|4|5|7|8]\d{9}$/;
			if(phone==""){
				layer.msg("手机不能为空");
				return false;
			}
			if(pwd==""){
				layer.msg("密码不能为空");
				return false;
			}
			if(pwd!=rpwd){
				layer.msg("两次输入的密码不一样哦");
				return false;
			}
			if(!der){
				layer.msg("用户名已经存在请重新输入");
				return false;
			}
			document.forms[0].submit();
		}
	</script>

</html>