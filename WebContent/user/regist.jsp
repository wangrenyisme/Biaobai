<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>注册</title>
<link href="<%=request.getContextPath()%>/css/styleofcreate.css"
	rel="stylesheet">
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/jsofcreate.js"></script>
<link href="<%=request.getContextPath()%>/css/regist.css"
	rel="stylesheet" type="text/css" />
<style type="text/css">
a {
	text-decoration: underline;
}

a:hover {
	color: red;
}

.submit_btn button {
	width: 100%;
	height: 54px;
	color: #fff;
	background: #e22;
	border: 0;
	font-size: 16px;
	font-family: "Microsoft YaHei", "Hiragino Sans GB";
}
</style>
</head>
<body>
	<form action="${pageContext.request.contextPath}/servlet/registServlet"
		method="post">
		<div class="header">
			<a class="logo"> <img title="logo"
				src="<%=request.getContextPath()%>/images/logo.png" />
			</a>
			<div class="desc">
				<span style="color: red; font-size: 30px;"><b>爱</b></span>&nbsp;&nbsp;就勇敢说出来
			</div>
		</div>
		<div class="container">
			<div class="register">
				<div class="register-box">
					<div class="box default">
						<label for="userName">用 户 名 </label> <input id="username"
							name="username" type="text" placeholder="您的用户名"> <i></i>
					</div>
					<div class="tip">
						<i></i> <span> </span>
					</div>
				</div>
				<div class="register-box">
					<div class="box default">
						<label for="pwd">设 置 密 码</label> <input id="pwd" name="password"
							type="password" style="width:60%;" placeholder="建议至少两种字符组合"> <i></i>
					</div>
					<div class="tip">
						<i></i> <span></span>
					</div>
				</div>
				<div class="register-box">
					<div class="box default">
						<label for="pwd2">确 认 密 码</label> <input id="pwd2"
							name="repassword" type="password"  style="width:60%;" placeholder="请再次输入密码">
						<i></i>
					</div>
					<div class="tip">
						<i></i> <span></span>
					</div>
				</div>
				<div class="register-box xieyi">
					<div class="box default">
						<input id="ck" name="ck" type="checkbox"> <span>我已阅读并同意<a
							href="##">《用户注册协议》</a></span> 
							&nbsp;&nbsp;
							<a href="<%=request.getContextPath()%>/login.jsp">已有账户，去登陆</a>
					</div>
					<div class="tip">
						<i></i> <span></span>
					</div>
				</div>
				<span style="color: red;"><b>${failure }</b></span>
				<center>
					<br />
					<div class="submit_btn">
						<button id="btn" class="submit_btn" type="submit" value="注册">立即注册</button>
					</div>
				</center>
			</div>
		</div>
	</form>
	<br />
	<br />
	<br />
	<br />
	<div class="footer">
		<br />
		<p>&copy;版权所有：石家庄铁道大学信息科学与技术学院软件工程系</p>
		<br />
	</div>
</body>
</html>
