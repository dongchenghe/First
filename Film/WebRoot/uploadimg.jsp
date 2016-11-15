<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>图片上传</title>
    <link rel="stylesheet" href="css/easyui.css">
	<link rel="stylesheet" href="css/icon.css">
	<script type="text/javascript" src="js/jquery-2.2.4.min.js"></script>
	<script type="text/javascript" src="js/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="js/easyui-lang-zh_CN.js"></script>
  </head>
  
  <body>
  <s:form id="form"  method="post" enctype="multipart/form-data">
<!--   	 <s:textfield label="用户名" name="user.username"></s:textfield> -->
<!--   	 <s:password label="密码" name="user.password"></s:password> -->
	 <s:file name="upload" label="上传图片" id="upload"></s:file>
	 <s:submit value="上传"></s:submit>
    </s:form>
    
   
     
 
  </body>
  
</html>
