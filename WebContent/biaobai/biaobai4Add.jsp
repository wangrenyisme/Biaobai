<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link
	href="<%=request.getContextPath()%>/bootstrap/css/bootstrap.min.css"
	rel="stylesheet" media="screen">
<script
	src="<%=request.getContextPath()%>/vendors/modernizr-2.6.2-respond-1.1.0.min.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
<script type="text/javascript">
	function aa(){
		var content=UE.getEditor('editor').getContentTxt();
		document.getElementById("hiddneContent").value=content;
		alert(content);
	}
</script>
<title>为自己脱单</title>
</head>
<body>
<div style="margin-left:10%;margin-top:10px;">
<form action="../Biaobai4Add" method="post" enctype="multipart/form-data">
		<div class="input-group">
			<span class="input-group-addon">姓名</span> 
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="text"
				name="name" class="form-control">
		</div>
	<div>
			<label for="name" style="float: left">性别&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
			<label class="radio-inline" style="float: left"><input
				type="radio" name="gender" id="gender1" value="小哥哥"
				checked="checked">小哥哥&nbsp;&nbsp;&nbsp;&nbsp;</label> <label
				class="radio-inline" style="float: left"><input type="radio"
				name="gender" id="gender2" value="小姐姐">小姐姐&nbsp;&nbsp;&nbsp;&nbsp;</label>
		</div>
		<br /> <br />
	
		<div>
			<label for="name" style="float: left">学院</label>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <select
				name="department">
				<option value="信息科学与技术学院">信息科学与技术学院</option>
				<option value="土木工程学院">土木工程学院</option>
				<option value="马克思主义学院">马克思主义学院</option>
				<option value="外语学院">外语学院</option>
				<option value="经济管理学院">经济管理学院</option>
			</select>
		</div>
		<div>
			<label for="name" style="float: left">年级</label>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <select name="grade">
				<option value="大一">大一</option>
				<option value="大二">大二</option>
				<option value="大三">大三</option>
				<option value="大四">大四</option>
				<option value="研一">研一</option>
				<option value="研二">研二</option>
				<option value="研三">研三</option>
				<option value="其他">其他</option>
			</select>
		</div>
		<label for="name" style="float: left">联系方式</label>
		&nbsp; <input type="text" name="contact">
		<div style="clear: both"></div>
		<label for="name"  style="float: left">性格描述&nbsp;&nbsp;</label>
		<textarea  style="float: left" name="character" style="width:100%;height:10%"></textarea>
		<div style="clear: both"></div>
		<label for="name" style="float: left">个人爱好&nbsp;&nbsp;</label>
		<textarea   style="float: left" name="preference" style="width:100%;height:10%"></textarea>
		<div style="clear: both"></div>
		<label for="name" style="float: left">家庭住址&nbsp;&nbsp;</label>
		<textarea   style="float: left"name="address" style="width:100%;height:10%"></textarea>
		<div style="clear: both"></div>
		<label for="name" style="float: left">喜欢类型&nbsp;&nbsp;</label>
		<textarea   style="float: left"name="favoredType" style="width:100%;height:10%"></textarea>
		<div style="clear: both"></div>
		<div>
		<label for="name" style="float: left">我的照片&nbsp;&nbsp;</label>
		<input type="file" name="custom-file-input" id="customFile" name="filename">
		</div>
		<div style="clear: both">
			<div style="float: left;">
				<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
			</div>
			<br /> <input class="btn btn-primary" type="submit" value="表白">
		</div>
</form>
</div>
</body>
</html>