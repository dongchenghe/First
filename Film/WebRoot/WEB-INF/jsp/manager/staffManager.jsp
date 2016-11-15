<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">   
    <title>职工管理界面</title>  
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" href="css/easyui.css">
	<link rel="stylesheet" href="css/icon.css">
	<script type="text/javascript" src="js/jquery-2.2.4.min.js"></script>
	<script type="text/javascript" src="js/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="js/easyui-lang-zh_CN.js"></script>
  </head>
  
  <body>
 <div  class="easyui-panel" title="职工信息管理" >
 	<form id="formquery">
		<a href="javascript:void(0)" iconCls="icon-search"  class="easyui-linkbutton" onclick="queryData()">查询</a>
	 	<label>职工id：</label>
		<input style="width:30px;" class="easyui-validatebox" id="empno" name="staff.staffId"/>
		<label>职工名：</label>
		<input style="width:70px;" class="easyui-validatebox" id="ename" name="staff.userName"/>
		<label>职工密码：</label>
		<input style="width:90px;" class="easyui-passwordbox" id="emppwd"/ name="staff.pwd"> 
		<label>职工电话：</label>
		<input style="width:80px;" class="easyui-validatebox" id="empphone"/ name="staff.phone">
		<label>职位名：</label>
		<input style="width:90px;" id="queryjobName" class="easyui-combobox" data-options="
					        valueField:'jobId',  
            				textField:'jobName',  
					        url: 'staffAction!getJobs',
					        onSelect: function(rec){
					            $('#queryjobId').val(rec.jobId);
					        }"/>
		<input type="hidden"  id="queryjobId" name="staff.job.jobId"> 	
  	 </form>
		<table id="bg" class="easyui-datagrid" toolbar="#toolbar" data-options="singleSelect:true,method:'get',resizable:false,pagination:true" 
		style="width:700px;height:260px"
		>
		</table>
	</div>
	<div id="dlg" class="easyui-dialog"  iconCls="icon-cut" buttons="#updatebuttons" title="用户信息修改">
		<form id="form1">
			<table>
				<tr>
					<td><label>职工id：</label></td>
					<td><input   id="staffId" name="staff.staffId"/></td>
				</tr>
				<tr>
					<td><label>职工名：</label></td>
					<td><input id="userName"   name="staff.userName"/></td>
				</tr>
				<tr>
					<td><label>职工密码：</label></td>
					<td><input   id="pwd" name="staff.pwd"></td>
				</tr>
				<tr>
					<td><label>职工电话：</label></td>
					<td><input   id="phone" name="staff.phone"></td>
				</tr>
				<tr>
					<td><label>职位id：</label></td>
					<td>					
						<input disabled="disabled"  id="jobId" >
					</td>
				</tr>
				<tr>
					<td><label>职位名：</label></td>
					<td>
						<input id="updatejobId11" class="easyui-combobox" >
					<input type="hidden"    id="updatejobId" name="staff.job.jobId"></td>
				</tr>			
			</table>
		</form>
	</div>
	<div id="dlgadd" class="easyui-dialog"  iconCls="icon-add" buttons="#addbuttons" title="增加职员">
		<form id="form2">
			<table>
				<tr>
					<td><label>职工id：</label></td>
					<td><input   id="addstaffId" name="staff.staffId"/></td>
				</tr>
				<tr>
					<td><label>职工名：</label></td>
					<td><input id="adduserName"   name="staff.userName"/></td>
				</tr>
				<tr>
					<td><label>职工密码：</label></td>
					<td><input   id="addpwd" name="staff.pwd"></td>
				</tr>
				<tr>
					<td><label>职工电话：</label></td>
					<td><input   id="addphone" name="staff.phone"></td>
				</tr>
				<tr>
					<tr>
					<td><label>职位id：</label></td>
					<td>					
						<input disabled="disabled"  id="jobIdadd" >
					</td>
				</tr>
				<tr>
					<td><label>职位名：</label></td>
					<td>
						<input id="addjobId11" class="easyui-combobox" >
					<input type="hidden"    id="addjobId" name="staff.job.jobId"></td>
				</tr>			
			</table>
		</form>
	</div>
	<div id="toolbar">
	     	<a href="javascript:void(0)" iconCls="icon-remove"  class="easyui-linkbutton" onclick="deleteData()">删除</a>
	     	<a href="javascript:void(0)"  iconCls="icon-cut" class="easyui-linkbutton" onclick="updateData()">修改</a>
	     	<a href="javascript:void(0)" iconCls="icon-add" class="easyui-linkbutton" onclick="addData()">新增</a>
	</div>
	<div id="updatebuttons">
			<a href="javascript:void(0)"  iconCls="icon-save"   class="easyui-linkbutton" onclick="confrim('update')">保存</a>
	     	<a href="javascript:void(0)" iconCls="icon-undo" class="easyui-linkbutton" onclick="$('#dlg').dialog('close')">取消</a>
	</div>
	<div id="addbuttons">
			<a href="javascript:void(0)"  iconCls="icon-save"   class="easyui-linkbutton" onclick="confrim('add')">保存</a>
	     	<a href="javascript:void(0)" iconCls="icon-undo" class="easyui-linkbutton" onclick="$('#dlgadd').dialog('close')">取消</a>
	</div>
</body>
<script type="text/javascript">
	$(function(){	
			$("#dlg").dialog("close");
			$("#dlgadd").dialog("close"); //默认让对话框隐藏
		});
		
	
	function queryData(){
		$("#bg").datagrid({
			url:'staffAction!getStaffs',
			queryParams: {
				'staff.staffId':$('#empno').val(),
				'staff.userName':$('#ename').val(),
				'staff.pwd':$('#emppwd').val(),
				'staff.phone':$('#empphone').val(),
				'staff.job.jobId':$('#queryjobId').val()
				
			},	
			rowStyler: function(index,row){
			if (index%2!=0){
			return 'background-color:#FDD929;color:red;'; 			
				}
			},
			onDblClickRow:updateData,
			columns:[[  //二维数组，两个中括号
				{field:'staffId',title:'职工ID',width:90},
				{field:'userName',title:'职工名字',width:120},
				{field:'pwd',title:'职工密码',width:100,
					formatter:function(value,row,index){
						return value;
					},
				},
				{field:'phone',title:'职工电话',width:120},
				{field:'job.jobId',title:'职位ID',width:90,
				formatter:function(value,row,index){
					//获取role对象下的role_id
					return row.job.jobId;
					}
				},
				{field:'job.jobName',title:'职位名称',width:90,
				formatter:function(value,row,index){
					//获取role对象下的role_name
					return row.job.jobName;
					}
				}
			]]
			
		});
	}
	var selectRow;
	var selectRowIndex;
	$("#bg").datagrid({
		onSelect:function(index,row){
			selectRowIndex=index;
			selectRow=row;
		},
	});
	
	function deleteData(){
		if(selectRow){
			$("#form1").form("clear");
			formLoad(selectRow);		
			$.messager.confirm("确认删除","是否删除",function(r){
			if(r){
				$("#form1").form("submit",{
			url:"staffAction!deleteStaff",
			onSubmit:function(){	
				return true;
			},
			success:function(){
				$.messager.alert("温馨提示","操作成功!");
			},
			
			});
			$("#bg").datagrid('deleteRow',selectRowIndex);
			
			}
		});	
		}else{
			$.messager.alert("温馨提示","没有可删除的数据!");
		}		
	}
	function updateData(){
			if(selectRow){
			$("#staffId").prop("disabled",true);	
			$("#dlg").dialog("open");
			$("#updatejobId11").combobox({
			
					        valueField: 'jobId',
					        textField: 'jobName',
					        url: 'staffAction!getJobs',
					        onSelect: function(rec){				       
					            $('#jobId').val(rec.jobId);
					            $('#updatejobId').val(rec.jobId);					            
					        },
					        onLoadSuccess:function(){
							$('#updatejobId11').combobox('select',selectRow.job.jobName);
							}	
			}); 	
			$("#form1").form("clear");		
			formLoad(selectRow);		
		}else{
			$.messager.alert("温馨提示","没有可修改的数据!");
		}	
	}
	function formLoad(selectRow){
			$("#staffId").prop("value",selectRow.staffId);
			$("#userName").prop("value",selectRow.userName);
			$("#pwd").prop("value",selectRow.pwd);
			$("#phone").prop("value",selectRow.phone);
			$("#jobId").prop("value",selectRow.job.jobId);
			$("#jobName").prop("value",selectRow.job.jobName);
			$("#updatejobId").prop("value",selectRow.job.jobId);
	}
	function addData(){	
			$("#addstaffId").prop("disabled",true);	
			$("#form2").form("clear");
			$("#dlgadd").dialog("open"); 
			$("#addjobId11").combobox({	
					        valueField: 'jobId',
					        textField: 'jobName',
					        url: 'staffAction!getJobs',
					        onSelect: function(rec){				       
					            $('#jobIdadd').val(rec.jobId);
					            $('#addjobId').val(rec.jobId);					            
					        },
					         onLoadSuccess:function(){
					         var datas=$("#addjobId11").combobox('getData');
					         //默认选中第一个
							$('#addjobId11').combobox('select',datas[0].jobId);
							}						       
			}); 	
		
		
		
	}
	function confrim(action){
		if(action=='update'){
			$("#staffId").prop("disabled",false);
			$("#dlg").dialog("close"); 
			$.messager.progress();
			$("#form1").form("submit",{
				url:"staffAction!updateStaff",
				onSubmit:function(){
					var isValid=$(this).form("validate");
					if(!isValid){					
						$.messager.progress("close");
					}					
					return true;
				},
			success:function(){
				$.messager.progress("close");
			},				
			});
		}else if(action=='add'){
			$("#addstaffId").prop("disabled",false);	
			$("#dlgadd").dialog("close"); 	 
			$.messager.progress();
			$("#form2").form("submit",{
				url:"staffAction!addStaff",
				onSubmit:function(){
					var isValid=$(this).form("validate");
					if(!isValid){					
						$.messager.progress("close");
					}					
					return true;
				},
			success:function(){
				$.messager.progress("close");
			},				
			});
		}		
	}
	
</script>
</html>
