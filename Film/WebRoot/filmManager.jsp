<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>EasyUI测试页</title>
<link rel="stylesheet" href="css/easyui.css">
<link rel="stylesheet" href="css/icon.css">
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="js/easyui-lang-zh_CN.js"></script>
<!-- 加载完成后，关闭对话框 -->
<script>
	$(function() {
		dialogClose();
		$.ajax({
				url: 'filmStorySortManagerAction!getAllFilmStorySorts',
				type:'post',
				success:function(data){
					var  blankoption=[{'sorts':'all','sId':''}];//设置第一个选项为空
					var o=eval(data);//将json数据类型的字符串解析成对象					
					for (var i=0;i<o.length;++i){
						blankoption.push({'sId':o[i].sId,'sorts':o[i].sorts});
				}						
					$("#film_filmStorySort_sorts").combobox("loadData",blankoption);
				},			
			});
		
	});
</script>
</head>
<body>
	<!-- 组合查询 -->
	<a onclick="check()" href="javascript:void(0)"
		class="easyui-linkbutton">查询电影</a>
	<div>
		<label for="film_filmId">电影编号:</label> <input
			class="easyui-validatebox" type="text" id="film_filmId" />
	</div>
	<div>
		<label for="film_filmName">电影名称:</label> <input
			class="easyui-validatebox" type="text" id="film_filmName" />
	</div>
	<div>
		<label for="film_filmSort">放映类型:</label> <input
			class="easyui-validatebox" type="text" id="film_filmSort" />
	</div>
	<div>
		<label for="film_filmStorySort_sorts">剧情分类:</label> <input
			id="film_filmStorySort_sorts"
			class="easyui-combobox"
			data-options="eidtable:false,
					        valueField:'sId',  
            				textField:'sorts'
		" />
	</div>
		<div>
		<label for="film_releaseTime">上映时间:</label> <input  id="film_releaseTime"  type= "text" class= "easyui-datebox" >  
	</div>
	<div>
		<label for="film_filmCompany">制片公司:</label> <input
			class="easyui-validatebox" type="text" id="film_filmCompany" />
	</div>
	<div>
		<label for="film_totalTime">时长:</label> <input
			class="easyui-validatebox" type="text" id="film_totalTime" />
	</div>

	

	<div>
		<label for="film_director">导演:</label> <input
			class="easyui-validatebox" type="text" id="film_director" />
	</div>
	<div>
		<label for="film_scriptWriter">编剧:</label> <input
			class="easyui-validatebox" type="text" id="film_scriptWriter" />
	</div>
	<div>
		<label for="film_actor">演员:</label> <input class="easyui-validatebox"
			type="text" id="film_actor" />
	</div>
	<div>
		<label for="film_country">国家:</label> <input
			class="easyui-validatebox" type="text" id="film_country" />
	</div>
	
	<div>
		<label for="film_story">剧情:</label> <input class="easyui-validatebox"
			type="text" id="film_story" />
	</div>
	<div>
		<label for="film_imgSrc">封面:</label> <input class="easyui-validatebox"
			type="text" id="film_imgSrc" />
	</div>
	<div>
		<label for="film_filmScore">评分:</label> <input
			class="easyui-validatebox" type="text" id="film_filmScore" />
	</div>

	<!-- 显示的表数据 -->
	<table class="easyui-datagrid" id="dg"
		data-options="singleSelect:true,method:'post',pagination:true,resizable:false"
		toolbar="#toolbar" style="width:300px;height:350px" title="电影列表">
	</table>
	<!-- 表数据所拥有的工具条 -->
	<div id="toolbar">
		<a href="javascript:void(0)" class="easyui-linkbutton"
			iconCls="icon-add" plain="true" onclick="addData()">增加</a> <a
			href="javascript:void(0)" class="easyui-linkbutton"
			iconCls="icon-remove" plain="true" onclick="deleteData()">删除</a> <a
			href="javascript:void(0)" class="easyui-linkbutton"
			iconCls="icon-save" plain="true" onclick="updateData()">修改</a> <a
			href="javascript:void(0)" class="easyui-linkbutton"
			iconCls="icon-undo" plain="true" onclick="cancelData()">退出</a>
	</div>
	<!-- 增加职位的对话框 -->
	<div id="add_dialog" class="easyui-dialog" title="增加职位"
		style="width:300px;height:200px;"
		data-options="resizable:true,modal:true,buttons:'#add_button'"
		iconCls="icon-add">
		<form id="add_form" method="post">

			<div>
				<label for="job.jobId">职位编号:</label> <input
					class="easyui-validatebox" type="text" name="job.jobId"
					data-options="required:true" disabled="disabled" />
			</div>
			<div>
				<label for="job.jobName">职位名称:</label> <input
					class="easyui-validatebox" type="text" name="job.jobName"
					data-options="required:true" />
			</div>
		</form>
	</div>
	<!-- 修改职位的对话框 -->
	<div id="update_dialog" class="easyui-dialog" title="修改管理"
		style="width:300px;height:200px;"
		data-options="resizable:true,modal:true,buttons:'#update_button'"
		iconCls="icon-save">
		<form id="update_form" method="post">
			<div>
				<label for="job.jobId">职位编号:</label> <input
					class="easyui-validatebox" type="text" name="job.jobId"
					data-options="required:true" disabled="disabled" />
			</div>
			<div>
				<label for="job.jobName">职位名称:</label> <input
					class="easyui-validatebox" type="text" name="job.jobName"
					data-options="required:true" />
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
		function check() {
			$("#dg").datagrid({
				pagination : true,
				queryParams : {
					'job.jobId' : $("#job_jobId").val(),
					'job.jobName' : $("#job_jobName").val()
				},
				onDblClickRow : updateData,
				url : 'jobManagerAction!getJobs',
				columns : [ [ //二维数组，2个中括号
					{
						field : 'jobId',
						width : 140,
						title : '职位编号'
					}, {
						field : 'jobName',
						width : 140,
						title : '职位名称'
					},
				] ],
			});
		}
	
		$("#dg").datagrid({
			onSelect : function(index, row) {
				SelectIndex = index;
				SelectRow = row;
			}
		});
		function cancelData() {
		}
		function deleteData() {
			if (SelectRow) {
	
				formLoad_add();
				$("#add_form input[name='job.jobId']").prop("disabled", false);
	
				$.messager.confirm("确认删除", "是否删除", function(r) {
					if (r) {
						$("#add_form").form("submit", {
							url : "jobManagerAction!deleteJob",
							onSubmit : function() {
								return true;
							},
							success : function() {
								$.messager.alert("温馨提示", "操作成功!");
								check();
							}
						});
						$("#dg").datagrid('deleteRow', SelectRow);
	
					}
				});
			}
		}
		$('#add_buttonData').bind("click", function() {
			$("#add_dialog").dialog("close");
			$("#add_form input[name='job.jobId']").prop("disabled", false);
			$.messager.progress();
			$("#add_form").form("submit", {
				url : "jobManagerAction!addJob",
				onSubmit : function() {
					var isValid = $(this).form("validate");
					if (!isValid) {
						$.messager.progress("close");
					}
	
					return true;
				},
				success : function() {
					$.messager.progress("close");
					check();
				},
			});
		});
		function addData() {
			formClear();
			$("#add_dialog").dialog('open');
			$("#add_dialog").dialog({
				iconCls : 'icon-add'
			});
			$("#add_form input[name='job.jobId']").prop("disabled", true);
	
		}
		function updateData() {
			if (SelectRow) {
				formClear();
				$("#update_dialog").dialog('open');
				formLoad_update();
				$("#update_form input[name='job.jobId']").prop("disabled", true);
				$("#update_dialog").dialog({
					iconCls : 'icon-save'
				});
	
			} else {
				$.messager.alert("温馨提示", "没有找到可修改的数据");
			}
		}
		$('#update_buttonData').bind("click", function() {
			$("#update_dialog").dialog("close");
			$("#update_form input[name='job.jobId']").prop("disabled", false);
			$.messager.progress();
			$("#update_form").form("submit", {
				url : "jobManagerAction!updateJob",
				onSubmit : function() {
					var isValid = $(this).form("validate");
					if (!isValid) {
						$.messager.progress("close");
					}
					return true;
				},
				success : function() {
					$.messager.progress("close");
					check();
				},
			});
		});
		function formLoad_add() {
			$("#add_form input[name='job.jobId']").val(SelectRow.jobId);
			$("#add_form input[name='job.jobName']").val(SelectRow.jobName);
		}
	
		function formLoad_update() {
			$("#update_form input[name='job.jobId']").val(SelectRow.jobId);
			$("#update_form input[name='job.jobName']").val(SelectRow.jobName);
		}
		function formClear() {
			$("#add_form").form("clear");
			$("#update_form").form("clear");
		}
		function dialogClose() {
			$("#add_dialog").dialog('close');
			$("#update_dialog").dialog('close');
		}
	</script>
</body>
</html>