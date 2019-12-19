<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" charset="utf-8"
	src="../Ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8"
	src="../Ueditor/ueditor.all.min.js">
</script>
<link
	href="<%=request.getContextPath()%>/bootstrap/css/bootstrap.min.css"
	rel="stylesheet" media="screen">
<script
	src="<%=request.getContextPath()%>/vendors/modernizr-2.6.2-respond-1.1.0.min.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
<script type="text/javascript" charset="utf-8"
	src="../Ueditor/lang/zh-cn/zh-cn.js"></script>
<script type="text/javascript">
	function aa() {
		var content = UE.getEditor('editor').getContentTxt();
		document.getElementById("hiddneContent").value = content;
	}
</script>
<title>表白想认识的人</title>
</head>
<body>
<div style="margin-left:10%;margin-top:10px;">
	<form action="../Biaobai2Add" method="post" onsubmit="aa()">
		<div>
			<label for="name" style="float: left">性别&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
			<label class="radio-inline" style="float: left"><input
				type="radio" name="gender" id="gender1" value="小哥哥"
				checked="checked">小哥哥&nbsp;&nbsp;&nbsp;&nbsp;</label> <label
				class="radio-inline" style="float: left"><input type="radio"
				name="gender" id="gender2" value="小姐姐">小姐姐&nbsp;&nbsp;&nbsp;&nbsp;</label>
		</div>
		<br /> 
		<br /> 
		<label for="name" style="float: left">联系方式</label> 
		&nbsp;&nbsp;&nbsp;&nbsp;
		<input
			type="text" name="contact">
		<div>
			<div style="float: left;">
				<p>想对你说&nbsp;&nbsp;&nbsp;&nbsp;</p>
			</div>
			<div style="float: left;">
				<input id="hiddneContent" type="hidden" name="contentwithouthtml"
					value="">
				<textarea id="editor" style="width: 800px; height: 400px"
					name="content"></textarea>
				<script type="text/javascript" charset="utf-8">
					UE.getEditor('editor');
				</script>
			</div>
		</div>
		<br />
		<div style="clear: both">
			<div style="float: left;">
				<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
			</div>
			<br /> <input class="btn btn-primary" type="submit" value="表白">
		</div>
	</form>
	</div>
</body>
</html>