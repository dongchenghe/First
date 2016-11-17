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
			url : 'filmStorySortManagerAction!getAllFilmStorySorts',
			type : 'post',
			success : function(data) {
				var blankoption = [ {
					'sorts' : '请选择',
					'sId' : ''
				} ]; //设置第一个选项为空
				var o = eval(data); //将json数据类型的字符串解析成对象					
				for (var i = 0; i < o.length; ++i) {
					blankoption.push({
						'sId' : o[i].sId,
						'sorts' : o[i].sorts
					});
				}
				$("#film_filmStorySort_sorts").combobox("loadData", blankoption);
				$("#add_film_filmStorySort_sorts").combobox({
					valueField : 'sId',
					textField : 'sorts',
					url : 'filmStorySortManagerAction!getAllFilmStorySorts',
					onLoadSuccess : function() {
						//$('#update_film_filmStorySort_sorts').combobox('select','3');
						var datas = $("#add_film_filmStorySort_sorts").combobox('getData');
						$('#add_film_filmStorySort_sorts').combobox('select', o[0].sId);
					}
				});

			}
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
			id="film_filmStorySort_sorts" class="easyui-combobox"
			data-options="eidtable:false,
					        valueField:'sId',  
            				textField:'sorts'
		" />
	</div>
	<div>
		<label for="film_releaseTime">上映时间:</label> <input
			id="film_releaseTime" type="text" class="easyui-datebox">
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
		toolbar="#toolbar" style="width:900px;height:350px" title="电影列表">
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
	<div id="add_dialog" class="easyui-dialog" title="增加电影"
		style="width:350px;height:400px;"
		data-options="resizable:true,modal:true,buttons:'#add_button'"
		iconCls="icon-add">
		<form id="add_form" method="post">
			<div> <label for="film_filmId">电影编号:</label> <input
					class="easyui-validatebox" type="text" name="film.filmId" disabled="disabled"/>
			</div>
			<div>
				<label for="film_filmName">电影名称:</label> <input
					class="easyui-validatebox" type="text" name="film.filmName" />
			</div>
			<div>
				<label for="film_filmSort">放映类型:</label> <input
					class="easyui-validatebox" type="text" name="film.filmSort" />
			</div>
			<div>
				<label for="add_film_filmStorySort_sorts">剧情分类:</label> <input
					id="add_film_filmStorySort_sorts" class="easyui-combobox" name="film.filmStorySort.sid"
					
		 />
			</div>
			<div>
				<label for="add_datebox">上映时间:</label> <input
					id="add_datebox" type="text" class="easyui-datebox" name="film.releaseTime">
			</div>
			<div>
				<label for="film_filmCompany">制片公司:</label> <input
					class="easyui-validatebox" type="text" name="film.filmCompany" />
			</div>
			<div>
				<label for="film_totalTime">时长:</label> <input
					class="easyui-validatebox" type="text" name="film.totalTime" />
			</div>
			
			<div>
				<label for="film_director">导演:</label> <input
					class="easyui-validatebox" type="text" name="film.director" />
			</div>
			<div>
				<label for="film_scriptWriter">编剧:</label> <input
					class="easyui-validatebox" type="text" name="film.scriptWriter" />
			</div>
			<div>
				<label for="film_actor">演员:</label> <input
					class="easyui-validatebox" type="text" name="film.actor" />
			</div>
			<div>
				<label for="film_country">国家:</label> <input
					class="easyui-validatebox" type="text" name="film.country" />
			</div>

			<div>
				<label for="film_story">剧情:</label> <input
					class="easyui-validatebox" type="text" name="film.story" />
			</div>
			<div>
				<label for="film_imgSrc">封面:</label><input class="easyui-filebox" style="width:300px" name="picture">
			</div>
		</form>
		
	</div>
	<!-- 修改职位的对话框 -->
	<div id="update_dialog" class="easyui-dialog" title="修改管理"
		style="width:350px;height:400px;"
		data-options="resizable:true,modal:true,buttons:'#update_button'"
		iconCls="icon-save">
		<form id="update_form" method="post" enctype="multipart/form-data">
			<div>
				<label for="film_filmId">电影编号:</label> <input
					class="easyui-validatebox" type="text" name="film.filmId" disabled="disabled"/>
			</div>
			<div>
				<label for="film_filmName">电影名称:</label> <input
					class="easyui-validatebox" type="text" name="film.filmName" />
			</div>
			<div>
				<label for="film_filmSort">放映类型:</label> <input
					class="easyui-validatebox" type="text" name="film.filmSort" />
			</div>
			<div>
				<label for="update_film_filmStorySort_sorts">剧情分类:</label> <input
					id="update_film_filmStorySort_sorts" class="easyui-combobox" name="film.filmStorySort.sid"
					
		/>
			</div>
			<div>
				<label for="update_datebox">上映时间:</label> <input
					id="update_datebox" type="text" class="easyui-datebox" name="film.releaseTime">
			</div>
			<div>
				<label for="film_filmCompany">制片公司:</label> <input
					class="easyui-validatebox" type="text" name="film.filmCompany" />
			</div>
			<div>
				<label for="film_totalTime">时长:</label> <input
					class="easyui-validatebox" type="text" name="film.totalTime" />
			</div>
			
			<div>
				<label for="film_director">导演:</label> <input
					class="easyui-validatebox" type="text" name="film.director" />
			</div>
			<div>
				<label for="film_scriptWriter">编剧:</label> <input
					class="easyui-validatebox" type="text" name="film.scriptWriter" />
			</div>
			<div>
				<label for="film_actor">演员:</label> <input
					class="easyui-validatebox" type="text" name="film.actor" />
			</div>
			<div>
				<label for="film_country">国家:</label> <input
					class="easyui-validatebox" type="text" name="film.country" />
			</div>

			<div>
				<label for="film_story">剧情:</label> <input
					class="easyui-validatebox" type="text" name="film.story" />
			</div>
			<div>
				<label for="film_imgSrc">封面:</label><input class="easyui-filebox" style="width:300px" name="picture">
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
				onDblClickRow : updateData,
				url : 'filmManagerAction!getFilms',
				columns : [ [ //二维数组，2个中括号
					{
						field : 'filmId',
						width : 70,
						title : '电影编号'
					}, {
						field : 'filmName',
						width : 130,
						title : '电影名称'
					}, {
						field : 'totalTime',
						width : 70,
						title : '总时长'
					}, {
						field : 'filmSort',
						width : 70,
						title : '放映类型'
					}, {
						field : 'filmStorySort.sorts',
						width : 70,
						title : '剧情类型',
						formatter : function(value, row, index) {
							//获取role对象下的role_id
							return row.filmStorySort.sorts;
						}
					}, {
						field : 'releaseTime',
						width : 100,
						title : '上映时间'
					}, {
						field : 'director',
						width : 70,
						title : '导演'
					}, {
						field : 'scriptWriter',
						width : 70,
						title : '编剧'
					}, {
						field : 'actor',
						width : 70,
						title : '演员'
					}, {
						field : 'country',
						width : 70,
						title : '国家'
					}, {
						field : 'filmCompany',
						width : 70,
						title : '制片公司'
					}, {
						field : 'story',
						width : 70,
						title : '剧情'
					}, {
						field : 'imgSrc',
						width : 70,
						title : '封面路径'
					}, {
						field : 'filmScore',
						width : 70,
						title : '评分'
					}
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
			$("#add_form input[name='film.filmId']").prop("disabled", true);
			$.messager.progress();
			$("#add_form").form("submit", {
				url : "filmManagerAction!addFilm",
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
			$("#add_form input[name='film.filmId']").prop("disabled", true);
			$("#add_dialog").dialog('open');
			$("#add_dialog").dialog({
				iconCls : 'icon-add'
			});
		}
		function updateData() {
			if (SelectRow) {
				formClear();
				$("#update_dialog").dialog('open');
				formLoad_update();
				$("#update_form input[name='film.filmId']").prop("disabled", true);
				$("#update_dialog").dialog({
					iconCls : 'icon-save'
				});
	
			} else {
				$.messager.alert("温馨提示", "没有找到可修改的数据");
			}
		}
		$('#update_buttonData').bind("click", function() {
			$("#update_dialog").dialog("close");
			$("#update_form input[name='film.filmId']").prop("disabled", false);
			$.messager.progress();
			$("#update_form").form("submit", {
				url : "filmManagerAction!updateFilm",
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
	
	
		function formLoad_update() {
			$("#update_form input[name='film.filmId']").val(SelectRow.filmId);
			$("#update_form input[name='film.filmName']").val(SelectRow.filmName);
			$("#update_form input[name='film.filmSort']").val(SelectRow.filmSort);
			$("#update_film_filmStorySort_sorts").combobox({
				valueField : 'sid',
				textField : 'sorts',
				url : 'filmStorySortManagerAction!getAllFilmStorySorts',
				onLoadSuccess : function() {
					$('#update_film_filmStorySort_sorts').combobox('select', SelectRow.filmStorySort.sid);
				}
			});
			var mydate=SelectRow.releaseTime;
			$("#update_datebox").datebox('setValue', mydate);
			$("#update_form input[name='film.filmCompany']").val(SelectRow.filmCompany);
			$("#update_form input[name='film.totalTime']").val(SelectRow.totalTime);
			$("#update_form input[name='film.director']").val(SelectRow.director);
			$("#update_form input[name='film.scriptWriter']").val(SelectRow.scriptWriter);
			$("#update_form input[name='film.actor']").val(SelectRow.actor);
			$("#update_form input[name='film.country']").val(SelectRow.country);
			$("#update_form input[name='film.story']").val(SelectRow.story);
	
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