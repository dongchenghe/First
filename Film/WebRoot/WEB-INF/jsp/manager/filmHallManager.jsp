<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">   
    <title>影厅管理界面</title>  
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
 <div  class="easyui-panel" title="影厅信息管理" >
 	<form id="formquery">
		<a href="javascript:void(0)" iconCls="icon-search"  class="easyui-linkbutton" onclick="queryData()">查询</a>
	 	<label>影厅id：</label>
		<input style="width:30px;" class="easyui-validatebox" id="queryfilmHallId" name="filmHall.filmHallId"/>
		<label>影厅名：</label>
		<input style="width:100px;" class="easyui-validatebox" id="queryfilmHallName" name="filmHall.filmHallName"/>
		<label>影城名：</label>
		<input style="width:260px;" id="querycinemaName" class="easyui-combobox" data-options="
							eidtable:false,
					        valueField:'cinemaId',  
            				textField:'cinemaName',  					        				 
					        onSelect: function(rec){
					            $('#querycinemaId').val(rec.cinemaId);
					        }"/>
		<input type="hidden"  id="querycinemaId" name="filmHall.cinema.cinemaId"> 	
  	 </form>
		<table id="bg" class="easyui-datagrid" toolbar="#toolbar" data-options="singleSelect:true,method:'get',resizable:false,pagination:true" 
		style="width:700px;height:260px"
		>
		</table>
	</div>
	<div id="dlg" class="easyui-dialog"  iconCls="icon-cut" buttons="#updatebuttons" title="影厅信息修改">
		<form id="form1">
			<table>
				<tr>
					<td><label>影厅id：</label></td>
					<td><input   id="updatefilmHallId" name="filmHall.filmHallId"/></td>
				</tr>
				<tr>
					<td><label>影厅名：</label></td>
					<td><input id="updatefilmHallName"   name="filmHall.filmHallName"/></td>
				</tr>
				<tr>
					<td><label>影城id：</label></td>
					<td><input   id="updatecinemaId" name="filmHall.cinema.cinemaId"></td>
				</tr>
				<tr>
					<td><label>影城名：</label></td>
					<td>
						<input id="updatecinemaName11" class="easyui-combobox" >
					<input type="hidden"    id="updatecinemaName" name="filmHall.cinema.cinemaName"></td>
				</tr>			
			</table>
		</form>
	</div>
	<div id="dlgadd" class="easyui-dialog"  iconCls="icon-add" buttons="#addbuttons" title="增加影厅">
		<form id="form2">
			<table>
				<tr>
					<td><label>影厅id：</label></td>
					<td><input   id="addfilmHallId" name="filmHall.filmHallId"/></td>
				</tr>
				<tr>
					<td><label>影厅名：</label></td>
					<td><input id="addfilmHallName"   name="filmHall.filmHallName"/></td>
				</tr>
				<tr>
					<tr>
					<td><label>影城id：</label></td>
					<td>					
						<input id="addcinemaId"  name="filmHall.cinema.cinemaId" >
					</td>
				</tr>
				<tr>
					<td><label>影城名：</label></td>
					<td>
						<input id="addcinemaName11" class="easyui-combobox" >
					<input type="hidden"    id="addcinemaName" name="filmHall.cinema.cinemaName"></td>
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
			$.ajax({
				url: 'filmHallAction!getCinemas',
				type:'post',
				success:function(data){
					var  blankoption=[{'cinemaName':'all','cinemaId':''}];//设置第一个选项为空
					var o=eval(data);//将json数据类型的字符串解析成对象					
					for (var i=0;i<o.length;++i){
						blankoption.push({'cinemaName':o[i].cinemaName,'cinemaId':o[i].cinemaId});
				}						
					$("#querycinemaName").combobox("loadData",blankoption);
				},
			
			});
		});
		
	
	function queryData(){
		$("#bg").datagrid({
			url:'filmHallAction!getFilmHalls',
			queryParams: {
				'filmHall.filmHallId':$('#queryfilmHallId').val(),
				'filmHall.filmHallName':$('#queryfilmHallName').val(),
				'filmHall.cinema.cinemaId':$('#querycinemaId').val(),			
			},	
			rowStyler: function(index,row){
			if (index%2!=0){
			return 'background-color:#FDD929;color:red;'; 			
				}
			},
			onDblClickRow:updateData,
			columns:[[  //二维数组，两个中括号
				{field:'filmHallId',title:'影厅ID',width:90},
				{field:'filmHallName',title:'影厅名字',width:120},
				{field:'cinema.cinemaId',title:'影城ID',width:90,
				formatter:function(value,row,index){
					//获取role对象下的role_id
					return row.cinema.cinemaId;
					}
				},
				{field:'cinema.cinemaName',title:'影城名称',width:270,
				formatter:function(value,row,index){
					//获取role对象下的role_name
					return row.cinema.cinemaName;
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
			url:"filmHallAction!deleteFilmHall",
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
			$("#updatefilmHallId").prop("disabled",true);
			$("#updatecinemaId").prop("disabled",true);		
			$("#dlg").dialog("open");
			$("#updatecinemaName11").combobox({
			
					        valueField: 'cinemaId',
					        textField: 'cinemaName',
					        url: 'filmHallAction!getCinemas',
					        onSelect: function(rec){				       					          
					            $('#updatecinemaId').val(rec.cinemaId);					            
					        },
					        onLoadSuccess:function(){
							$('#updatecinemaName11').combobox('select',selectRow.cinema.cinemaId);
							}	
			}); 	
			$("#form1").form("clear");		
			formLoad(selectRow);		
		}else{
			$.messager.alert("温馨提示","没有可修改的数据!");
		}	
	}
	function formLoad(selectRow){
			$("#updatefilmHallId").prop("value",selectRow.filmHallId);
			$("#updatefilmHallName").prop("value",selectRow.filmHallName);
			$("#updatecinemaId").prop("value",selectRow.cinema.cinemaId);
			$("#updatecinemaName").prop("value",selectRow.cinema.cinemaName);
	}
	function addData(){	
			$("#addfilmHallId").prop("disabled",true);
			$("#addcinemaId").prop("disabled",true);			
			$("#form2").form("clear");
			$("#dlgadd").dialog("open"); 
			$("#addcinemaName11").combobox({	
					        valueField: 'cinemaId',
					        textField: 'cinemaName',
					        url: 'filmHallAction!getCinemas',
					        onSelect: function(rec){				       				         
					            $('#addcinemaId').val(rec.cinemaId);					            
					        },
					         onLoadSuccess:function(){
					         var datas=$("#addcinemaName11").combobox('getData');
					         //默认选中第一个
							$('#addcinemaName11').combobox('select',datas[0].cinemaId);
							}						       
			}); 	
		
		
		
	}
	function confrim(action){
		if(action=='update'){
			$("#updatefilmHallId").prop("disabled",false);
			$("#updatecinemaId").prop("disabled",false);					
			$("#dlg").dialog("close"); 
			$.messager.progress();
			$("#form1").form("submit",{
				url:"filmHallAction!updateFilmHall",
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
			$("#addfilmHallId").prop("disabled",false);
			$("#addcinemaId").prop("disabled",false);		
			$("#dlgadd").dialog("close"); 	 
			$.messager.progress();
			$("#form2").form("submit",{
				url:"filmHallAction!addFilmHall",
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
