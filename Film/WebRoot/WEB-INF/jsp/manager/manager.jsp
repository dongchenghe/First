<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<base href="<%=basePath%>">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>首页</title>
<link rel="stylesheet" type="text/css" href="css/style.css" />
<script type="text/javascript" src="js/jquery-1.6.min.js"></script>
<script type="text/javascript" src="js/index.js"></script>
</head>
<script type="text/javascript">
function cinema(){
	$("#show_jsp").prop("src","cinemaManager.jsp");
}
function filmHall(){
	$("#show_jsp").prop("src","filmHallManager.jsp");
}
function film(){
	$("#show_jsp").prop("src","filmManager.jsp");
}
function schedule(){
	$("#show_jsp").prop("src","scheduleManager.jsp");
}
function customer(){
	$("#show_jsp").prop("src","customerManager.jsp");
}
function staff(){
	$("#show_jsp").prop("src","staffManager.jsp");
}
function job(){
	$("#show_jsp").prop("src","jobManager.jsp");
}
</script>
<body>
	<div class="nav-top">
		<span>个人后台管理系统</span>
		<div class="nav-topright">
			<p>上次登陆时间：2015-04-15 22:33:50 登陆IP：192.168.1.1</p>
			<span>您好：管理员</span><span>注销</span>
		</div>
	</div>
	<div class="nav-down">
		<div class="leftmenu1">
			<div class="menu-oc">
				<img src="images/menu-all.png" />
			</div>
			<ul>
				<li><a class="a_list a_list1">电影相关</a>
					<div class="menu_list menu_list_first">
						<a class="lista_first" href="javascript:void(0)" onclick="cinema()">影院管理</a> <a
							href="javascript:void(0)" onclick="filmHall()">影厅管理</a> <a href="javascript:void(0)" onclick="film()">电影管理</a> <a href="javascript:void(0)" onclick="schedule()">档期管理</a>
					</div></li>
				<li><a class="a_list a_list2">账号管理</a>
					<div class="menu_list">
						<a href="javascript:void(0)" onclick="customer()">用户管理</a> <a href="javascript:void(0)" onclick="staff()">员工管理</a>
					</div></li>
				<li><a class="a_list a_list3">权限管理</a>
					<div class="menu_list">
						<a href="javascript:void(0)" onclick="job()">员工权限</a>
					</div></li>
			</ul>
		</div>
		<div class="leftmenu2">
			<div class="menu-oc1">
				<img src="images/menu-all.png" />
			</div>
			<ul>
				<li><a class="j_a_list j_a_list1"></a>
					<div class="j_menu_list j_menu_list_first">
						<span class="sp1"><i></i>电影相关</span> <a class="j_lista_first"
							href="javascript:void(0)" onclick="cinema()">影院管理</a> <a href="javascript:void(0)" onclick="filmHall()">影厅管理</a> <a href="javascript:void(0)" onclick="film()">电影管理</a> <a
							href="javascript:void(0)" onclick="schedule()">档期管理</a>
					</div></li>
				<li><a class="j_a_list j_a_list2"></a>
					<div class="j_menu_list">
						<span class="sp2"><i></i>账号管理</span> <a href="javascript:void(0)" onclick="customer()">用户管理</a> <a
							href="javascript:void(0)" onclick="staff()">员工管理</a>
					</div></li>
				<li><a class="j_a_list j_a_list3"></a>
					<div class="j_menu_list">
						<span class="sp3"><i></i>权限管理</span> <a href="javascript:void(0)" onclick="job()">员工权限</a>
					</div></li>
			</ul>
		</div>
		<div class="rightcon">
			<div class="right_con" style="margin-left: 100px;">
			<br />
				<iframe src="" id="show_jsp" height="600px" width="1000px"></iframe>
			</div>
		</div>
	</div>
	<div style="text-align:center;">		
	</div>

</body>
</html>
