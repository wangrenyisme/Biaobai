<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/bootstrap/css/bootstrap.min.css" />
<script src="<%=request.getContextPath()%>/js/jquery.min.js"
	type="text/javascript" charset="utf-8"></script>
<script
	src="<%=request.getContextPath()%>/bootstrap/js/bootstrap.min.js"
	type="text/javascript" charset="utf-8"></script>

<style>
.side-nav-item {
	display: block;
	padding: 10px 15px 10px 15px;
	background-color: #FFFFFF;
	cursor: pointer;
	box-shadow: 0 1px 1px rgba(0, 0, 0, .05);
	-webkit-box-shadow: 0 1px 1px rgba(0, 0, 0, .05);
}

.item-title {
	background-color: #FFFFFF;
	border-top-left-radius: 3px;
	border-top-right-radius: 3px;
	border-bottom: 1px solid #DDDDDD;
		text-align:center;
}

.panel-heading {
	margin-top: 5px;
	padding: 0;
	border-radius: 3px;
	border: 1px solid transparent;
	border-color: #DDDDDD;
	background:#ffffff;
}

.item-body {
	padding: 10px 15px 5px 15px;
	border-bottom: 1px solid #DDDDDD;
}

.item-second {
	margin-top: 5px;
	cursor: pointer;
}

.item-second a {
	display: block;
	height: 100%;
	width: 100%;
}

.at {
	color: red;
}
#md7 {
   background:#d9edf7;
}
</style>
</head>
<body id="md7">
	<div class="col-md-2 side-nav" style="width:98%">
		<div class="panel-group" id="accordion" >
			<div class="panel-heading panel">
				<a id="headcangku" class="side-nav-item item-title" href="<%=request.getContextPath()%>/biaobai/biaobai1Add.jsp" target="mainFrame">希望在一起❤</a>
			</div>
			<div class="panel-heading panel">
				<a id="headcangku" class="side-nav-item item-title" href="<%=request.getContextPath()%>/biaobai/biaobai2Add.jsp" target="mainFrame">求认识</a>
			</div>
			<div class="panel-heading panel">
				<a id="headcangku" class="side-nav-item item-title" href="<%=request.getContextPath()%>/biaobai/biaobai4Add.jsp" target="mainFrame">为自己脱单</a>
			</div>		
			<div class="panel-heading panel">
				<a id="headcangku" class="side-nav-item item-title" href="<%=request.getContextPath()%>/biaobai/biaobai3Add.jsp" target="mainFrame">给舍友脱单</a>
			</div>
			<div class="panel-heading panel">
				<a id="headcangku" class="side-nav-item item-title" href="<%=request.getContextPath()%>/biaobai/biaobai5Add.jsp" target="mainFrame">其他类型</a>
			</div>
		</div>
	</div>
	<script>
		$(document).ready(function() {
			var path = window.location.pathname; //先得到地址栏内容
			var regExp = /[\/\.\?]+/;
			str = path.split(regExp);
			var node = str.slice(-2, -1); //截取地址栏信息得到文件名
			$('#' + node + ' a').addClass('at'); //提前写好对应的id,菜单加亮
			$('#' + node).parent().parent().parent().addClass('in'); //id父级的父级的父级添加展开class 
		})
	</script>
</body>
</html>