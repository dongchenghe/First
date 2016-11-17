<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>档期管理</title>
<link rel="stylesheet" href="css/easyui.css">
<link rel="stylesheet" href="css/icon.css">
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="js/easyui-lang-zh_CN.js"></script>
<script>
</script>
</head>
<body>
<a onclick="check_schedule()" href="javascript:void(0)"
class="easyui-linkbutton">查询档期
</a>
<table class="easyui-datagrid" id="table_schedele"
		data-options="singleSelect:true,method:'post',pagination:true,resizable:false"
		toolbar="#toolbar_schedule" style="width:900px;height:350px" title="档期列表">
</table>
<div id="toolbar_schedule">
		<a href="javascript:void(0)" class="easyui-linkbutton"
			iconCls="icon-add" plain="true" onclick="addData()">增加</a> <a
			href="javascript:void(0)" class="easyui-linkbutton"
			iconCls="icon-remove" plain="true" onclick="deleteData()">删除</a> <a
			href="javascript:void(0)" class="easyui-linkbutton"
			iconCls="icon-save" plain="true" onclick="updateData()">修改</a> <a
			href="javascript:void(0)" class="easyui-linkbutton"
			iconCls="icon-undo" plain="true" onclick="cancelData()">退出</a>
</div>
<script type="text/javascript">
		var SelectIndex;
		var SelectRow;
		function check_schedule() {
			$("#table_schedule").datagrid({
				pagination : true,
				/* onDblClickRow : updateData_schedule, */
				url : 'scheduleManagerAction!getSchedules',
				queryParams : {					
				},
				columns : [ [ //二维数组，2个中括号
					{
						field : 'scheduleId',
						width : 70,
						title : '档期ID'
					}, {
						field : 'scheduleTime',
						width : 130,
						title : '档期时间'
					}, {
						field : 'ticketPrice',
						width : 70,
						title : '票价'
					}, {
						field : 'overDue',
						width : 70,
						title : '状态'
					}, {
						field : 'film.filmId',
						width : 70,
						title : '电影ID',
						formatter : function(value, row, index) {
							//获取role对象下的role_id
							return row.film.filmId;
						}
					}, {
						field : 'film.filmName',
						width : 70,
						title : '电影名',
						formatter : function(value, row, index) {
							//获取role对象下的role_id
							return row.film.filmName;
						}
					}, {
						field : 'filmHall.filmHallId',
						width : 70,
						title : '影厅ID',
						formatter : function(value, row, index) {
							//获取role对象下的role_id
							return row.filmHall.filmHallId;
						}
					}, {
						field : 'filmHall.filmHallName',
						width : 70,
						title : '影厅名',
						formatter : function(value, row, index) {
							//获取role对象下的role_id
							return row.filmHall.filmHallName;
						}
					}
				] ],
			});
		}
		$("#table_schedule").datagrid({
			onSelect : function(index, row) {
				SelectIndex = index;
				SelectRow = row;
			}
		});
</script>
</body>
</html>