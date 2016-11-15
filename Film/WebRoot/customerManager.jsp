<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html >
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
<script>
	$(function() {
		dialogClose();
	});
</script>
</head>
<body>
	<table class="easyui-datagrid" id="dg"
		data-options="singleSelect:true,method:'post',pagination:true,resizable:false"
		toolbar="#toolbar" style="width:300px;height:350px" title="用户列表">
	</table>
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
	<div id="dd" class="easyui-dialog" title="用户管理"
		style="width:300px;height:200px;"
		data-options="resizable:true,modal:true,buttons:'#bb'">
		<form id="ff" method="post">

			<div>
				<label for="userId">用 户 I D:</label> <input
					class="easyui-validatebox" type="text" name="customer.customerId"
					data-options="required:true" disabled="disabled" />
			</div>
			<div>
				<label for="phone">手机号码:</label> <input class="easyui-validatebox"
					type="text" name="customer.phone" data-options="required:true" />
			</div>
			<div>
				<label for="password">密&emsp;&emsp;码:</label> <input
					class="easyui-validatebox" type="text" name="customer.pwd"
					data-options="required:true" />
			</div>
		</form>

	</div>
	<div id="bb">
		<a href="javascript:void(0)" class="easyui-linkbutton"
			iconCls="icon-save" id="submitData">确认</a> <a
			href="javascript:void(0)" class="easyui-linkbutton"
			iconCls="icon-undo" onclick="dialogClose()">退出</a>
	</div>


	<a onclick="check()" href="javascript:void(0)"
		class="easyui-linkbutton">查询用户</a>
	

		<div>
			<label for="selectId">用 户 I D:</label> <input
				class="easyui-validatebox" type="text" id="selectId"/>
		</div>
		<div>
			<label for="selectPhone">手机号码:</label> <input class="easyui-validatebox"
				type="text" id="selectPhone" />
		</div>


	<script type="text/javascript">
		var SelectIndex;
		var SelectRow;
		function check() {
			formClear();
			$("#dg").datagrid({
				pagination : true,
				queryParams : {
					'customer.customerId' : $("#selectId").val(),
					'customer.phone' : $("#selectPhone").val()
				},
				onDblClickRow:updateData,
				url : 'customerManagerAction!getCustomers',
				columns : [ [ //二维数组，2个中括号
					{
						field : 'customerId',
						width : 97,
						title : '用户ID'
					}, {
						field : 'phone',
						width : 97,
						title : '用户手机号'
					}, {
						field : 'pwd',
						width : 97,
						title : '用户密码',
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
				formLoad();
				$("#dd input[name='customer.customerId']").prop("disabled", false);
				$.messager.confirm("确认删除", "是否删除", function(r) {
					if (r) {
						$("#ff").form("submit", {
							url : "customerManagerAction!deleteCustomer",
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
	
	
	
		function addData() {
			formClear();
			$("#dd").dialog('open');
			$("#dd input[name='customer.customerId']").prop("disabled", true);
			$("#dd").dialog({
				iconCls : 'icon-add'
			});
			$("#submitData").unbind("click");
			$('#submitData').bind("click", function() {
				$("#dd input[name='customer.customerId']").prop("disabled", false);
				$("#dd").dialog("close");
				$.messager.progress();
				$("#ff").form("submit", {
					url : "customerManagerAction!addCustomer",
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
	
		}
		function updateData() {
			if (SelectRow) {
				formClear();
				$("#dd").dialog('open');
				formLoad();
				$("#dd input[name='customer.customerId']").prop("disabled", true);
				$("#dd").dialog({
					iconCls : 'icon-save'
				});
				$("#submitData").unbind("click");
				$('#submitData').bind("click", function() {
					$("#dd input[name='customer.customerId']").prop("disabled", false);
					$("#dd").dialog("close");
					$.messager.progress();
					$("#ff").form("submit", {
						url : "customerManagerAction!updateCustomer",
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
	
			} else {
				$.messager.alert("温馨提示", "没有找到可修改的数据");
			}
	
	
	
		}
	
		function formLoad() {
			$("#dd input[name='customer.customerId']").val(SelectRow.customerId);
			$("#dd input[name='customer.phone']").val(SelectRow.phone);
			$("#dd input[name='customer.pwd']").val(SelectRow.pwd);
		}
		function formClear() {
			$("#ff").form("clear");
		}
		function dialogClose() {
			$("#dd").dialog('close');
		}
	</script>
</body>
</html>