<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
	<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
	<link href="css/index.css" rel="stylesheet" type="text/css" />
	<link type="text/css" rel="stylesheet" href="css/luara.left.css" />
	<script type="text/javascript" src="js/jquery.min.js"></script>
	<script src="js/layer/layer.js" type="text/javascript"></script>
	<script src="js/jquery.luara.0.0.1.min.js" type="text/javascript"></script>
	<title >时光电影网</title>
</head>

	<body>
		<div class="fixed" id="topbar">
			<div id="headbar" class="headbar">
				<h1><a title="Mtime时光网" href="#">Mtime时光网</a></h1>
				<dl class="headbarnav">
					<dd>
						<a href="index">首页</a>
					</dd>
					<dd>
						<a href="index">购票</a>
					</dd>
				</dl>
				<div class="headtool" id="loginbox"><i class="line"></i>
					<div class="headunlogin">
						<s:if test="#session.user">
							<a href="#">个人中心<i></i></a><em></em>
							<a href="logout">注销</a>
						</s:if>
						<s:else>
							<a href="tologin">登录<i></i></a><em></em>
							<a href="toregister">注册</a>
						</s:else>
					</div>
				</div>
			</div>
		</div>
		<div class="dao-right">
			<div class="example2">
				<ul>
					<li><img src="images/lunbo11.jpg" alt="1" /></li>
					<li><img src="images/lunbo22.jpg" alt="2" /></li>
					<li><img src="images/lunbo33.jpg" alt="3" /></li>
					<li><img src="images/lunbo44.jpg" alt="4" /></li>
				</ul>
				<ol>
					<li></li>
					<li></li>
					<li></li>
					<li></li>
				</ol>
			</div>
			<!--Luara图片切换骨架end-->
			<script>
				$(function() {
					<!--调用Luara示例-->
					$(".example2").luara({
						width: "1400",
						height: "390",
						interval: 4500,
						selected: "seleted",
						deriction: "left"
					});
	
				});
			</script>
		</div>
		<div class="center-bur">
			<div class="dropdown">
			  <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown">
			    Dropdown
			    <span class="caret"></span>
			  </button>
			  <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
			    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Action</a></li>
			    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Another action</a></li>
			    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Something else here</a></li>
			    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Separated link</a></li>
			  </ul>
			</div>
		</div>
		<div class="list1">
			<ul>
				<s:iterator value="#session.listFilm" var="film">
					<li class="one">
						<a title="${film.filmName }" href="#" >
							<img src="images/${film.imgSrc}" alt="${film.filmName }" style="width: 100px;height: 140px"/>
						</a>
						<dl>
							<dt><a href="#" class="one">${film.filmName }</a></dt>
							<dd>${film.totalTime}分钟- <a href="#">${film.filmSort}</a></dd>
							<dd>5家影院上映20场</dd>
							<dd><a href="#" class="ticket">选座购票</a></dd>
						</dl>
					</li>
				</s:iterator>
				<li class="one">
					<a title="邻家大贱谍" href="#" >
						<img src="images/linjiadajiandie.jpg" alt="邻家大贱谍" />
					</a>
					<dl>
						<dt><a href="#" class="one_name">邻家大贱谍</a></dt>
						<dd>101分钟- <a href="#">动作</a> / <a href="#">喜剧</a></dd>
						<dd>13家影院上映26场</dd>
						<dd class="hot">
							<i class="ico_dot"></i>
							平凡夫妇的不平凡之路
						</dd>
						<dd><a href="#" class="ticket">选座购票</a></dd>
					</dl>
				</li>
				<li class="one">
					<a title="邻家大贱谍" href="#" >
						<img src="images/linjiadajiandie.jpg" alt="邻家大贱谍" />
					</a>
					<dl>
						<dt><a href="#" class="one_name">邻家大贱谍</a></dt>
						<dd>101分钟- <a href="#">动作</a> / <a href="#">喜剧</a></dd>
						<dd>13家影院上映26场</dd>
						<dd class="hot">
							<i class="ico_dot"></i>
							平凡夫妇的不平凡之路
						</dd>
						<dd><a href="#" class="ticket">选座购票</a></dd>
					</dl>
				</li>
				<li class="one">
					<a title="邻家大贱谍" href="#" >
						<img src="images/linjiadajiandie.jpg" alt="邻家大贱谍" />
					</a>
					<dl>
						<dt><a href="#" class="one_name">邻家大贱谍</a></dt>
						<dd>101分钟- <a href="#">动作</a> / <a href="#">喜剧</a></dd>
						<dd>13家影院上映26场</dd>
						<dd class="hot">
							<i class="ico_dot"></i>
							平凡夫妇的不平凡之路
						</dd>
						<dd><a href="#" class="ticket">选座购票</a></dd>
					</dl>
				</li>
				<li class="one">
					<a title="邻家大贱谍" href="#" >
						<img src="images/linjiadajiandie.jpg" alt="邻家大贱谍" />
					</a>
					<dl>
						<dt><a href="#" class="one_name">邻家大贱谍</a></dt>
						<dd>101分钟- <a href="#">动作</a> / <a href="#">喜剧</a></dd>
						<dd>13家影院上映26场</dd>
						<dd class="hot">
							<i class="ico_dot"></i>
							平凡夫妇的不平凡之路
						</dd>
						<dd><a href="#" class="ticket">选座购票</a></dd>
					</dl>
				</li>
				<li class="one">
					<a title="邻家大贱谍" href="#" >
						<img src="images/linjiadajiandie.jpg" alt="邻家大贱谍" />
					</a>
					<dl>
						<dt><a href="#" class="one_name">邻家大贱谍</a></dt>
						<dd>101分钟- <a href="#">动作</a> / <a href="#">喜剧</a></dd>
						<dd>13家影院上映26场</dd>
						<dd class="hot">
							<i class="ico_dot"></i>
							平凡夫妇的不平凡之路
						</dd>
						<dd><a href="#" class="ticket">选座购票</a></dd>
					</dl>
				</li>
				<li class="one">
					<a title="邻家大贱谍" href="#" >
						<img src="images/linjiadajiandie.jpg" alt="邻家大贱谍" />
					</a>
					<dl>
						<dt><a href="#" class="one_name">邻家大贱谍</a></dt>
						<dd>101分钟- <a href="#">动作</a> / <a href="#">喜剧</a></dd>
						<dd>13家影院上映26场</dd>
						<dd class="hot">
							<i class="ico_dot"></i>
							平凡夫妇的不平凡之路
						</dd>
						<dd><a href="#" class="ticket">选座购票</a></dd>
					</dl>
				</li>
			</ul>
			<img src="images/guanggao.jpg" style="margin-left: 80px;"/>
			<div class="title">
				<h2>即将上映 －11月14日~2月11日</h2>
			</div>
			<div class="i_swwantlister">
				<dl class="future">
					<dd class="a">
						<ul>
							<li class="day">
								<strong>11月20日</strong>
								即将上映
							</li>
							<li class="i_wantmovie">
								<a href="#"><img src="images/hongyanrong.jpg" /></a>
								<div class="desc">
									<h3>
										<a href="#">红颜容</a>
									</h3>
									<p>
										<span>3人想看 - </span>
										<a href="#">爱情</a> / 
										<a href="#">剧情</a>
									</p>
									<p class="director">
										<b>导演</b>
										<a href="#">曹利民</a>
									</p>
								</div>
								<p>
									<a href="#">预告片</a>
									<i class="icon_ivideo"></i>
								</p>
							</li>
						</ul>
					</dd>
					<dd class="a">
						<ul>
							<li class="day">
								<strong>11月20日</strong>
								即将上映
							</li>
							<li class="i_wantmovie">
								<a href="#"><img src="images/hongyanrong.jpg" /></a>
								<div class="desc">
									<h3>
										<a href="#">红颜容</a>
									</h3>
									<p>
										<span>3人想看 - </span>
										<a href="#">爱情</a> / 
										<a href="#">剧情</a>
									</p>
									<p class="director">
										<b>导演</b>
										<a href="#">曹利民</a>
									</p>
								</div>
								<p>
									<a href="#">预告片</a>
									<i class="icon_ivideo"></i>
								</p>
							</li>
						</ul>
					</dd>
					<dd class="a">
						<ul>
							<li class="day">
								<strong>11月20日</strong>
								即将上映
							</li>
							<li class="i_wantmovie">
								<a href="#"><img src="images/hongyanrong.jpg" /></a>
								<div class="desc">
									<h3>
										<a href="#">红颜容</a>
									</h3>
									<p>
										<span>3人想看 - </span>
										<a href="#">爱情</a> / 
										<a href="#">剧情</a>
									</p>
									<p class="director">
										<b>导演</b>
										<a href="#">曹利民</a>
									</p>
								</div>
								<p>
									<a href="#">预告片</a>
									<i class="icon_ivideo"></i>
								</p>
							</li>
						</ul>
					</dd>
				</dl>
				
			</div>
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
</html>