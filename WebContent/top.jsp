<%@ page import="org.java.pojo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>石家庄铁道大学表白墙</title>
<link
	href="<%=request.getContextPath()%>/bootstrap/css/bootstrap.min.css"
	rel="stylesheet" media="screen">
<script
	src="<%=request.getContextPath()%>/vendors/modernizr-2.6.2-respond-1.1.0.min.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/top.css" />
</head>
<body>
	<nav class="navbar navbar-default" id="navbar-default"
		role="navigation">
		<div class="container-fluid">
			<div class="navbar-header"
				style="float: left; width: 30%; height: 30%;">
				<a class="navbar-brand" href="#"> <img
					src="<%=request.getContextPath()%>/images/logoMin.png"
					title="表白墙首页" />
				</a>
			</div>
			<div style="float: left;" id="navbar-nav">
				<ul class="nav navbar-nav">
					<li><a href="<%=request.getContextPath()%>/index.jsp" target="_top" style="color: #000;">表白墙</a></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" style="color: #000;">我要表白<b
							class="caret"></b>
					</a>
						<ul class="dropdown-menu">
							<li><a href="<%=request.getContextPath()%>/biaobai/biaobaiAdd.jsp?type=1" target="_top">希望在一起❤</a></li>
							<li><a href="<%=request.getContextPath()%>/biaobai/biaobaiAdd.jsp?type=2" target="_top">求认识</a></li>
							<li><a href="<%=request.getContextPath()%>/biaobai/biaobaiAdd.jsp?type=4" target="_top">为自己脱单</a></li>
							<li><a href="<%=request.getContextPath()%>/biaobai/biaobaiAdd.jsp?type=3" target="_top">给舍友脱单</a></li>
							<li class="divider"></li>
							<li><a href="<%=request.getContextPath()%>/biaobai/biaobaiAdd.jsp?type=5" target="_top">其他类型</a></li>
						</ul></li>
						<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" style="color: #000;">分类浏览<b
							class="caret"></b>
					</a>
						<ul class="dropdown-menu">
							<li><a href="<%=request.getContextPath() %>/ShowMore/biaobaiMore.jsp?type=1" target="_top">希望在一起❤</a></li>
							<li><a href="<%=request.getContextPath() %>/ShowMore/biaobaiMore.jsp?type=2" target="_top">求认识</a></li>
							<li><a href="<%=request.getContextPath() %>/ShowMore/biaobaiMore.jsp?type=4" target="_top">为自己脱单</a></li>
							<li><a href="<%=request.getContextPath() %>/ShowMore/biaobaiMore.jsp?type=3" target="_top">给舍友脱单</a></li>
							<li class="divider"></li>
							<li><a href="<%=request.getContextPath() %>/ShowMore/biaobaiMore.jsp?type=5" target="_top">其他类型</a></li>
						</ul></li>
				</ul>
			</div>
			<%
				if (request.getSession().getAttribute("loginUser") == null) {
			%>
			<div style="float: right;" id="navbar-nav">
				<ul class="nav navbar-nav">
					<li><a href="<%=request.getContextPath()%>/login.jsp" target="_top">登录</a></li>
					<li><a href="<%=request.getContextPath()%>/regist.jsp" target="_top">注册</a></li>
				</ul>
			</div>
			<%
				} else {
					User user = new User();
					user = (User) request.getSession().getAttribute("loginUser");
			%>
			<div style="float: right;" id="navbar-nav">
				<ul class="nav navbar-nav">
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" style="color: #000;"> 
						<img
							src="<%=request.getContextPath() %>/headphoto/<%=user.getHeadphoto()%>"
							 width="40px" height="40px" />
							  <b
							class="caret"></b>
					</a>
						<ul class="dropdown-menu">
							<li><a href="<%=request.getContextPath() %>/info/biaobaiinfo.jsp?type=1" target="_top">个人主页</a></li>
							<li><a href="<%=request.getContextPath() %>/update.jsp" target="_top">修改信息</a></li>
							<li><a href="<%=request.getContextPath() %>/info/biaobaiinfo.jsp?type=2" target="_top">修改头像</a></li>
							<li><a href="<%=request.getContextPath() %>/info/biaobaiinfo.jsp?type=3" target="_top">我的消息【<%=user.getMessage()%>】</a></li>
							<li class="divider"></li>
							<li><a
								href="${pageContext.request.contextPath}/servlet/loginOutServlet">注销</a></li>
						</ul></li>
				</ul>
			</div>
			<%
				}
			%>
			<div style="float: right;" id="navbar-nav">
				<form class="navbar-form navbar-left" role="search">
					<div class="form-group" style="float: left;">
						<input type="text" class="form-control" placeholder="Search">
					</div>
					<button type="submit" class="btn btn-default btn-sm">
						<i class="icon-search"></i>搜索
					</button>
				</form>
			</div>
		</div>
	</nav>
	<script
		src="<%=request.getContextPath()%>/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>