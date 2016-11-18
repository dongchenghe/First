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
	$(function() {
		dialogClose();
		$("#filmHall_cinemaName").combobox({
			onSelect : function(rec) {
				$("#filmHall_Name").combobox({
					valueField : 'filmHallId',
					textField : 'filmHallName',
					url : 'filmHallAction!getFilmHallsByCombobox',
					queryParams : {
						"filmHall.cinema.cinemaId" : rec.cinemaId,
					},
					onLoadSuccess : function() {
						var data = $('#filmHall_Name').combobox('getData');
						$("#filmHall_Name ").combobox('select', data[0].filmHallId);
					}
				});
			}
		});
		$("#filmHall_cinemaName_add").combobox({
			onSelect : function(rec) {
				$("#filmHall_Name_add").combobox({
					valueField : 'filmHallId',
					textField : 'filmHallName',
					url : 'filmHallAction!getFilmHallsByCombobox',
					queryParams : {
						"filmHall.cinema.cinemaId" : rec.cinemaId,
					},
					onLoadSuccess : function() {
						var data = $('#filmHall_Name_add').combobox('getData');
						$("#filmHall_Name_add ").combobox('select', data[0].filmHallId);
					}
				});
			}
		});
	});
</script>
</head>
<body>
	<a onclick="check_schedule()" href="javascript:void(0)"
		class="easyui-linkbutton">查询档期 </a>
	<table class="easyui-datagrid" id="table_schedule"
		data-options="singleSelect:true,method:'post',pagination:true,resizable:false"
		toolbar="#toolbar_schedule" style="width:900px;height:350px"
		title="档期列表">
	</table>
	<div id="toolbar_schedule">
		<a href="javascript:void(0)" class="easyui-linkbutton"
			iconCls="icon-add" plain="true" onclick="schedule_addData()">增加</a> <a
			href="javascript:void(0)" class="easyui-linkbutton"
			iconCls="icon-remove" plain="true" onclick="deleteData()">删除</a> <a
			href="javascript:void(0)" class="easyui-linkbutton"
			iconCls="icon-save" plain="true" onclick="schedule_updateData()">修改</a>
		<a href="javascript:void(0)" class="easyui-linkbutton"
			iconCls="icon-undo" plain="true" onclick="cancelData()">退出</a>
	</div>
	<div id="schedule_add_dialog" class="easyui-dialog" title="新增档期"
		style="width:350px;height:300px;"
		data-options="resizable:true,modal:true,buttons:'#add_button'"
		iconCls="icon-save">
		<form id="shcedule_add_form" method="post"
			enctype="multipart/form-data">
			<div>
				<label for="schedule.scheduleId">档期编号:</label> <input
					class="easyui-validatebox" type="text" name="schedule.scheduleId"
					disabled="disabled" />
			</div>
			<div>
				<label for="schedule.scheduleTime">档期时间:</label> <input
					class="easyui-datetimebox" type="text" name="schedule.scheduleTime"
					/>
			</div>
			<div>
				<label for="schedule.ticketPrice">票价:</label> <input
					class="easyui-validatebox" type="text" name="schedule.ticketPrice" />
			</div>
			<div>
				<label for="schedule.overDue">状态:</label> <input
				 class="easyui-combobox"
					name="schedule.overDue"
					data-options="
		valueField: 'value',
		textField: 'text',
		data: [{
			text: '可用',
			value: '0'
		},{
			text: '过期',
			value: '1'
		}]" />

			</div>
			<div>
				<label for="schedule.film.filmId">电影名:</label> <input
					class="easyui-combobox" type="text" name="schedule.film.filmId"
					
					data-options="    
        valueField: 'filmId',    
        textField: 'filmName',    
        url: 'filmManagerAction!getcombobox',    
        onSelect: function(rec){    
      		
        }" />

			</div>
			<div>
				<label for="schedule.filmHall.cinema.cinemaId">电影院:</label> <input
					class="easyui-combobox" type="text" id="filmHall_cinemaName_add"
					name="schedule.filmHall.cinema.cinemaId" 
					data-options="    
        valueField: 'cinemaId',    
        textField: 'cinemaName',    
        url: 'cinemaAction!getCinemasForCombobox'  
       " />
			</div>
			<div>
				<label for="schedule.filmHall.filmHallId">影院名:</label> <input
					class="easyui-combobox" type="text" id="filmHall_Name_add"
					name="schedule.filmHall.filmHallId"  />
			</div>
		</form>
	</div>
		<div id="schedule_update_dialog" class="easyui-dialog" title="修改管理"
		style="width:350px;height:300px;"
		data-options="resizable:true,modal:true,buttons:'#update_button'"
		iconCls="icon-save">
		<form id="shcedule_update_form" method="post"
			enctype="multipart/form-data">
			<div>
				<label for="schedule.scheduleId">档期编号:</label> <input
					class="easyui-validatebox" type="text" name="schedule.scheduleId"
					disabled="disabled" />
			</div>
			<div>
				<label for="schedule.scheduleTime">档期时间:</label> <input
					class="easyui-datetimebox" type="text" name="schedule.scheduleTime"
					id="schedule_scheduleTime" />
			</div>
			<div>
				<label for="schedule.ticketPrice">票价:</label> <input
					class="easyui-validatebox" type="text" name="schedule.ticketPrice" />
			</div>
			<div>
				<label for="schedule.overDue">状态:</label> <input
					id="schedule_overDue" class="easyui-combobox"
					name="schedule.overDue"
					data-options="
		valueField: 'value',
		textField: 'text',
		data: [{
			text: '可用',
			value: '0'
		},{
			text: '过期',
			value: '1'
		}]" />

			</div>
			<div>
				<label for="schedule.film.filmId">电影名:</label> <input
					class="easyui-combobox" type="text" name="schedule.film.filmId"
					id="film_filmName"
					data-options="    
        valueField: 'filmId',    
        textField: 'filmName',    
        url: 'filmManagerAction!getcombobox',    
        onSelect: function(rec){    
      		
        }" />

			</div>
			<div>
				<label for="schedule.filmHall.cinema.cinemaId">电影院:</label> <input
					class="easyui-combobox" type="text"
					name="schedule.filmHall.cinema.cinemaId" id="filmHall_cinemaName"
					data-options="    
        valueField: 'cinemaId',    
        textField: 'cinemaName',    
        url: 'cinemaAction!getCinemasForCombobox'  
       " />
			</div>
			<div>
				<label for="schedule.filmHall.filmHallId">影院名:</label> <input
					class="easyui-combobox" type="text"
					name="schedule.filmHall.filmHallId" id="filmHall_Name" />
			</div>
		</form>
	</div>
	<!-- 增加职位对话框的底部 -->
	<div id="add_button">
		<a href="javascript:void(0)" class="easyui-linkbutton"
			iconCls="icon-save" id="add_buttonData">确认</a> <a
			href="javascript:void(0)" class="easyui-linkbutton"
			iconCls="icon-undo" onclick="dialogClose()">退出</a>
	</div>

	<!-- 修改职位对话框的底部 -->
	<div id="update_button">
		<a href="javascript:void(0)" class="easyui-linkbutton"
			iconCls="icon-save" id="update_buttonData">确认</a> <a
			href="javascript:void(0)" class="easyui-linkbutton"
			iconCls="icon-undo" onclick="dialogClose()">退出</a>
	</div>
	<script type="text/javascript">
		var SelectIndex;
		var SelectRow;
		$("#table_schedule").datagrid({
			onSelect : function(index, row) {
				SelectIndex = index;
				SelectRow = row;
			}
		});
		function check_schedule() {
			$("#table_schedule").datagrid({
				pagination : true,
				onDblClickRow : schedule_updateData,
				url : 'scheduleManagerAction!getSchedules',
				/* queryParams : {					
				}, */
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
						field : 'film.filmName',
						width : 140,
						title : '电影名',
						formatter : function(value, row, index) {
							//获取role对象下的role_id
							return row.film.filmName;
						}
					}, {
						field : 'filmHall.cinema.cinemaName',
						width : 200,
						title : '电影院名',
						formatter : function(value, row, index) {
							//获取role对象下的role_id
							return row.filmHall.cinema.cinemaName;
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
		$('#update_buttonData').bind("click", function() {
			$("#schedule_update_dialog").dialog("close");
			$("#shcedule_update_form input[name='schedule.scheduleId']").prop("disabled", false);
			$.messager.progress();
			$("#shcedule_update_form").form("submit", {
				url : "scheduleManagerAction!updateSchedule",
				onSubmit : function() {
					var isValid = $(this).form("validate");
					if (!isValid) {
						$.messager.progress("close");
					}
					return true;
				},
				success : function() {
					$.messager.progress("close");
					check_schedule();
				},
			});
		});
		$('#add_buttonData').bind("click", function() {
			$("#schedule_add_dialog").dialog("close");
			$("#schedule_add_form input[name='schedule.scheduleId']").prop("disabled", false);
			$.messager.progress();
			$("#schedule_add_form").form("submit", {
				url : "scheduleManagerAction!addSchedule",
				onSubmit : function() {
					var isValid = $(this).form("validate");
					if (!isValid) {
						$.messager.progress("close");
					}
					return true;
				},
				success : function() {
					$.messager.progress("close");
					check_schedule();
				},
			});
		});
		function schedule_addData() {
			$("#schedule_add_dialog").dialog('open');
			$("#shcedule_add_form input[name='schedule.scheduleId']").prop("disabled", true);
		}
		function schedule_updateData() {
			$("#schedule_update_dialog").dialog('open');
			$("#shcedule_update_form input[name='schedule.scheduleId']").prop("disabled", true);
			schedule_Load();
		}
		function schedule_Load() {
			$("#shcedule_update_form input[name='schedule.scheduleId']").val(SelectRow.scheduleId);
	
			$("#schedule_scheduleTime").datetimebox('setValue', SelectRow.scheduleTime);
	
			$("#shcedule_update_form input[name='schedule.ticketPrice']").val(SelectRow.ticketPrice);
	
			$("#schedule_overDue").combobox('setValue', SelectRow.overDue);
	
			//$("#film_filmName").combobox('setValue', SelectRow.film.filmId);
			$("#film_filmName ").combobox('select', SelectRow.film.filmId);
	
			//$("#filmHall_cinemaName").combobox('setValue', SelectRow.filmHall.cinema.cinemaId);
			$("#filmHall_cinemaName ").combobox('select', SelectRow.filmHall.cinema.cinemaId);
			$("#filmHall_Name").combobox({
				valueField : 'filmHallId',
				textField : 'filmHallName',
				url : 'filmHallAction!getFilmHallsByCombobox',
				queryParams : {
					"filmHall.cinema.cinemaName" : SelectRow.filmHall.cinema.cinemaName,
				},
			});
			//$("#filmHall_Name").combobox('setValue', SelectRow.filmHall.filmHallId);	
			$("#filmHall_Name ").combobox('select', SelectRow.filmHall.filmHallId);
		}
		function dialogClose() {
				$("#schedule_update_dialog").dialog('close');
				$("#schedule_add_dialog").dialog('close');
		}
	</script>
</body>
</html>