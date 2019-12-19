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
	text-align:center;
}

.item-title {
	background-color: #FFFFFF;
	border-top-left-radius: 3px;
	border-top-right-radius: 3px;
	border-bottom: 1px solid #DDDDDD;
}

.panel-heading {
	margin-top: 5px;
	padding: 0;
	border-radius: 3px;
	border: 1px solid transparent;
	border-color: #DDDDDD;
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
				<a id="headcangku" class="side-nav-item item-title" href="<%=request.getContextPath()%>/ShowMore/biaobai1More.jsp" target="mainFrame">希望在一起❤</a>
			</div>
			<div class="panel-heading panel">
				<a id="headcangku" class="side-nav-item item-title" href="<%=request.getContextPath()%>/ShowMore/biaobai2More.jsp" target="mainFrame">求认识</a>
			</div>
			<div class="panel-heading panel">
				<a id="headcangku" class="side-nav-item item-title" href="<%=request.getContextPath()%>/ShowMore/biaobai3More.jsp" target="mainFrame">为自己脱单</a>
			</div>		
			<div class="panel-heading panel">
				<a id="headcangku" class="side-nav-item item-title" href="<%=request.getContextPath()%>/ShowMore/biaobai4More.jsp" target="mainFrame">给舍友脱单</a>
			</div>
			<div class="panel-heading panel">
				<a id="headcangku" class="side-nav-item item-title" href="<%=request.getContextPath()%>/ShowMore/biaobai5More.jsp" target="mainFrame">其他类型</a>
			</div>
		</div>
	</div>
</body>
</html>