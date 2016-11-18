<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="http://12631.com/jsp" prefix="w" %>
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
		<link href="css/film.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="js/jquery.min.js"></script>
		<script type="text/javascript" stc="js/bootstrap.min.js"></script>
		<script src="js/layer/layer.js" type="text/javascript"></script>
		<title >电影详情</title>
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
		<div class="center">
			<div class="center-left">
				<div class="center-left-top">
					<div class="col-xs-6 col-md-3" style="width: 100%;height: auto;">
					    <a href="#" class="thumbnail" >
					      <img src="images/${filmshow.imgSrc}" style="border-radius:10px;">
					    </a>
					</div>
					<h5><span>上映：</span><s:date name="#session.filmshow.releaseTime" format="yyyy-MM-dd"/>   </h5>
					<h5><span>类型：</span>${filmshow.filmStorySort.sorts}</h5>
					<h5><span>时长：</span>${filmshow.totalTime}分钟</h5>
					<h5><span>主演：</span>${filmshow.actor}</h5>
					<h5><span>导演：</span>${filmshow.director}</h5>
					<h5><span>编剧：</span>${filmshow.scriptWriter}</h5>
					<h5><span>发行公司：</span>${filmshow.filmCompany}</h5>
					<p><span>剧情：</span>
						${filmshow.story}
					</p>
					<br />
				</div>
				<div class="center-left-center">
					<h4>电影评论</h4>
					<div class="center-left-center-comen">
						<p>
							&emsp;&emsp;作为一个全新的起源故事很成功，人物塑造，世界观构建虽然有点匆忙但也算完成了任务。最大的亮点的确是炫目华丽的特效，那场灵魂之旅确实脑洞大开视效很棒.
						</p>
						<h5 style="text-align: right;"><font style="margin-right: 20px;">2016-11-13</font><span>尘埃落定_绝尘</span></h5>
						<hr />
					</div>
					<div class="center-left-center-comen">
						<p>
							&emsp;&emsp;可能是不如复仇者联盟那么熟悉吧 总体感觉 如果不是卷福演的就不去看了
						</p>
						<h5 style="text-align: right;"><font style="margin-right: 20px;">2016-11-13</font><span>尘埃落定_绝尘</span></h5>
						<hr />
					</div>
					<textarea class="form-control" rows="2" placeholder="我要评论.."></textarea><br>
					<input type="submit" class="btn btn-success" value="提交" style="margin-left: 80%;"/>
				</div>
			</div>
			<div class="center-right">
				<h1 style="font-weight: bold;">${filmshow.filmName}</h1>
				<ul style="margin-top: 20px;width: 100%;" class="nav nav-tabs" role="tablist" id="ul">
				  <li role="presentation" id="li1" class="active"><a href="javascript:fun1(1)">今天&emsp;<w:time time="day1"/>&emsp;</a></li>
				  <li role="presentation"  id="li2"><a href="javascript:fun1(2)"> 明天&emsp;<w:time time="day2"/>&emsp;</a></li>
				  <li role="presentation"  id="li3"><a href="javascript:fun1(3)"> 后天&emsp;<w:time time="day3"/>&emsp;</a></li>
				</ul>
				<br>
				<div class="day">
					<s:iterator value="#session.filmSchedule1" var="cinemesud">
						<div class="cinema">
							<a href="#"><h2>${cinemesud.cinema.cinemaName}</h2></a>
							<h5>${cinemesud.cinema.cinemaLocation}</h5>
							<h3>&emsp;影讯</h3>
							<ul class="clearfix1">
								<s:iterator value="#cinemesud.schedule" var="sch">
									<li class="curr">
										<a data-selector="buy" href="#">
											<div class="timebox fl">
												<p class="only"><s:date name="#sch.scheduleTime" format="HH:mm"/><span class="nextday"></span></p>
											</div>
											<div id="price_1553855127" class="pricebox fl" newprice="25" oldprice="60">
												<p class="fprice">${sch.ticketPrice}</p>
											</div>
											<div style="background: orangered; display: none;width: 30%;position: static;height: 70px;float: left;">
												<p class="fprice">购买</p>
											</div>
										</a>
									</li>
								</s:iterator>
							</ul>
						</div>
					</s:iterator>
				</div>
				<!--一天-->
				<div class="day" style="display: none;">
					<div class="cinema">
						<a href="#"><h2>橙天嘉禾影城景德镇金鼎店2</h2></a>
						<h5>景德镇市珠山区广场南路金鼎百货购物中心四楼</h5>
						<h3>&emsp;影讯</h3>
						<ul class="clearfix1">
							<li class="curr">
								<a data-selector="buy" href="#">
									<div class="timebox fl">
										<p class="only">11:00<span class="nextday"></span></p>
									</div>
									<div id="price_1553855127" class="pricebox fl" newprice="25" oldprice="60">
										<p class="fprice">¥25</p>
									</div>
									<div style="background: orangered; display: none;width: 30%;">
										<p class="fprice">购买</p>
									</div>
								</a>
							</li>
							<li class="curr">
								<div class="timebox fl">
									<p class="only">13:00<span class="nextday"></span></p>
								</div>
								<div class="pricebox fl"><p class="fprice">¥30</p>
								</div>
							</li>
							<li class="curr">
									<div class="timebox fl">
										<p class="only">15:20<span class="nextday"></span></p>
									</div>
									<div class="pricebox fl">
										<p class="fprice">¥30</p>
									</div>
									<div style="background: orangered; display: none;width: 30%;">
										<p class="fprice">购买</p>
									</div>
							</li>
							<li class="curr">
										<div class="timebox fl">
											<p class="only">15:50<span class="nextday"></span></p>
										</div><div class="pricebox fl">
											<p class="fprice">¥30</p>
										</div>
										<div style="background: orangered; display: none;width: 30%;">
											<p class="fprice">购买</p>
										</div>
							</li>
							<li class="curr">
								<div class="timebox fl">
									<p class="only">17:40<span class="nextday"></span></p>
								</div>
								<div class="pricebox fl">
									<p class="fprice">¥30</p>
								</div>
								<div style="background: orangered; display: none;width: 30%;">
									<p class="fprice">购买</p>
								</div>
							</li>
						</ul>
					</div>
				</div>
				<div class="day" style="display: none;">
					<div class="cinema">
						<a href="#"><h2>橙天嘉禾影城景德镇金鼎店3</h2></a>
						<h5>景德镇市珠山区广场南路金鼎百货购物中心四楼</h5>
						<h3>&emsp;影讯</h3>
						<ul class="clearfix1">
							<li class="curr">
								<a data-selector="buy" href="#">
									<div class="timebox fl">
										<p class="only">11:00<span class="nextday"></span></p>
									</div>
									<div id="price_1553855127" class="pricebox fl" newprice="25" oldprice="60">
										<p class="fprice">¥25</p>
									</div>
									<div style="background: orangered; display: none;width: 30%;">
										<p class="fprice">购买</p>
									</div>
								</a>
							</li>
							<li class="curr">
								<div class="timebox fl">
									<p class="only">13:00<span class="nextday"></span></p>
								</div>
								<div class="pricebox fl"><p class="fprice">¥30</p>
								</div>
								<div style="background: orangered; display: none;width: 30%;">
									<p class="fprice">购买</p>
								</div>
							</li>
							<li class="curr">
									<div class="timebox fl">
										<p class="only">15:20<span class="nextday"></span></p>
									</div>
									<div class="pricebox fl">
										<p class="fprice">¥30</p>
									</div>
									<div style="background: orangered; display: none;width: 30%;">
										<p class="fprice">购买</p>
									</div>
							</li>
							<li class="curr">
										<div class="timebox fl">
											<p class="only">15:50<span class="nextday"></span></p>
										</div><div class="pricebox fl">
											<p class="fprice">¥30</p>
										</div>
										<div style="background: orangered; display: none;width: 30%;">
											<p class="fprice">购买</p>
										</div>
							</li>
							<li class="curr">
								<div class="timebox fl">
									<p class="only">17:40<span class="nextday"></span></p>
								</div>
								<div class="pricebox fl">
									<p class="fprice">¥30</p>
								</div>
								<div style="background: orangered; display: none;width: 30%;">
									<p class="fprice">购买</p>
								</div>
							</li>
						</ul>
					</div>
				</div>
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
	<script>
		function fun1(a){
			$("#ul").children(".active").removeClass("active");
			$("#li"+a).addClass("active");
			$(".day").css("display", "none");
			$(".day")[a-1].style.display="block";
		}
		function hover(){
			var a= this.firstChild.nextSibling.firstChild.nextSibling.nextSibling.nextSibling;//.lastChild.previousSibling;
			a.style.display="none";
			a.nextSibling.nextSibling.style.display="block";
		}
		function out(){
			var a = this.firstChild.nextSibling.firstChild.nextSibling.nextSibling.nextSibling;
			a.style.display="block";
			a.nextSibling.nextSibling.style.display="none";
		}
		var pri = document.getElementsByClassName("curr");
		for(var i=0;i<pri.length;i++){
			pri[i].onmouseover = hover;
			pri[i].onmouseout = out;
			//pri[i].onclick = hover;
		}
	</script>
</html>