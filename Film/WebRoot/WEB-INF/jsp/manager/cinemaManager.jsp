<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">   
    <title>影城管理界面</title>  
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
 <div  class="easyui-panel" title="影城信息管理" >
 	<form id="formquery">
		<a href="javascript:void(0)" iconCls="icon-search"  class="easyui-linkbutton" onclick="queryData()">查询</a>
	 	<label>影城id：</label>
		<input style="width:30px;" class="easyui-validatebox" id="querycinemaId" name="cinema.cinemaId"/>
		<label>影城名：</label>
		<input style="width:70px;" class="easyui-validatebox" id="querycinemaName" name="cinema.cinemaName"/>
		<label>影城位置：</label>
		<input style="width:90px;" class="easyui-passwordbox" id="querycinemaLocation" name="cinema.cinemaLocation"> 
		<label>影城电话：</label>
		<input style="width:80px;" class="easyui-validatebox" id="querycinemaTel" name="cinema.cinemaTel">
		<label>影城照片：</label>
		<input style="width:80px;" class="easyui-validatebox" id="queryimgSrc" name="cinema.imgSrc">
  	 </form>
		<table id="bg" class="easyui-datagrid" toolbar="#toolbar" data-options="singleSelect:true,method:'get',resizable:false,pagination:true" 
		style="width:700px;height:260px"
		>
		</table>
	</div>
	<div id="dlg" class="easyui-dialog"  iconCls="icon-cut" buttons="#updatebuttons" title="影城信息修改">
		<form id="form1">
			<table>
				<tr>
					<td><label>影城id：</label></td>
					<td><input   id="updatecinemaId" name="cinema.cinemaId"/></td>
				</tr>
				<tr>
					<td><label>影城名：</label></td>
					<td><input id="updatecinemaName"   name="cinema.cinemaName"/></td>
				</tr>
				<tr>
					<td><label>影城位置：</label></td>
					<td><input   id="updatecinemaLocation" name="cinema.cinemaLocation"></td>
				</tr>
				<tr>
					<td><label>影城电话：</label></td>
					<td><input   id="updatecinemaTel" name="cinema.cinemaTel"></td>
				</tr>
				<tr>
					<td><label>影城照片：</label></td>
					<td>					
						<input  class="easyui-validatebox" id="updateimgSrc" name="cinema.imgSrc">
					</td>
				</tr>
				
			</table>
		</form>
	</div>
	<div id="dlgadd" class="easyui-dialog"  iconCls="icon-add" buttons="#addbuttons" title="增加影城">
		<form id="form2">
			<table>
				<tr>
					<td><label>影城id：</label></td>
					<td><input   id="addcinemaId" name="cinema.cinemaId"/></td>
				</tr>
				<tr>
					<td><label>影城名：</label></td>
					<td><input id="addcinemaName"   name="cinema.cinemaName"/></td>
				</tr>
				<tr>
					<td><label>影城位置：</label></td>
					<td><input   id="addcinemaLocation" name="cinema.cinemaLocation"></td>
				</tr>
				<tr>
					<td><label>影城电话：</label></td>
					<td><input   id="addcinemaTel" name="cinema.cinemaTel"></td>
				</tr>
				<tr>
					<td><label>影城照片：</label></td>
					<td>					
						<input  class="easyui-validatebox" id="addimgSrc" name="cinema.imgSrc">
					</td>
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
			url:'cinemaAction!getCinemas',
			queryParams: {
				'cinema.cinemaId':$('#querycinemaId').val(),
				'cinema.cinemaName':$('#querycinemaName').val(),
				'cinema.cinemaLocation':$('#querycinemaLocation').val(),
				'cinema.cinemaTel':$('#querycinemaTel').val(),
				'cinema.imgSrc':$('#queryimgSrc').val()
				
			},	
			rowStyler: function(index,row){
			if (index%2!=0){
			return 'background-color:#FDD929;color:red;'; 			
				}
			},
			onDblClickRow:updateData,
			columns:[[  //二维数组，两个中括号
				{field:'cinemaId',title:'影城ID',width:30},
				{field:'cinemaName',title:'影城名字',width:180},
				{field:'cinemaLocation',title:'影城位置',width:220,
					formatter:function(value,row,index){
						return value;
					},
				},
				{field:'cinemaTel',title:'影城电话',width:100},
				{field:'imgSrc',title:'影城图片',width:160,
				},
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
			url:"cinemaAction!deleteCinema",
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
			$("#updatecinemaId").prop("disabled",true);	
			$("#dlg").dialog("open");
			$("#form1").form("clear");		
			formLoad(selectRow);		
		}else{
			$.messager.alert("温馨提示","没有可修改的数据!");
		}	
	}
	function formLoad(selectRow){
			$("#updatecinemaId").prop("value",selectRow.cinemaId);
			$("#updatecinemaName").prop("value",selectRow.cinemaName);
			$("#updatecinemaLocation").prop("value",selectRow.cinemaLocation);
			$("#updatecinemaTel").prop("value",selectRow.cinemaTel);
			$("#updateimgSrc").prop("value",selectRow.imgSrc);
	}
	function addData(){	
			$("#addcinemaId").prop("disabled",true);	
			$("#form2").form("clear");
			$("#dlgadd").dialog("open"); 
				
	}
	function confrim(action){
		if(action=='update'){
		$("#updatecinemaId").prop("disabled",false);	
			$("#dlg").dialog("close"); 
			$.messager.progress();
			$("#form1").form("submit",{
				url:"cinemaAction!updateCinema",
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
			$("#dlgadd").dialog("close");
			$("#addcinemaId").prop("disabled",false);	 	 
			$.messager.progress();
			$("#form2").form("submit",{
				url:"cinemaAction!addCinema",
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
