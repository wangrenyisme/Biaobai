<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>个人信息修改</title>
<link href="<%=request.getContextPath()%>/css/styleofcreate.css"
	rel="stylesheet">
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/jsofupdate.js"></script>
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
<script type="text/javascript">
function $(id) 
{
	return document.getElementById(id);
}
$("#birthday").change(function()
{
    var d1=new Date($(birthday).val());
    d1=FormatDate(d1);
    $("#birthday").attr("value",d1);
});
</script>
</head>
<body>
	<form action="${pageContext.request.contextPath}/servlet/updateServlet"
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
						<label for="name">真 实 姓 名</label> <input id="name"
							name="name" type="text" placeholder="您的真实姓名"> <i></i>
					</div>
					<div class="tip">
						<i></i> <span> </span>
					</div>
				</div>
				<div class="register-box">
					<div class="box default">
						<label for="sex">您 的 性 别</label> <input id="sex" name="sex"
							type="text" placeholder="您的性别"> <i></i>
					</div>
					<div class="tip">
						<i></i> <span></span>
					</div>
				</div>
				<div class="register-box">
					<div class="box default">
						<label for="telephone">您 的 电 话</label> <input id="telephone"
							name="telephone" type="text"  placeholder="您的电话">
						<i></i>
					</div>
					<div class="tip">
						<i></i> <span></span>
					</div>
				</div>
				<div class="register-box">
					<div class="box default">
						<label for="qq">您 的    Q  Q</label> <input id="qq"
							name="qq" type="text"  placeholder="您的QQ号码">
						<i></i>
					</div>
					<div class="tip">
						<i></i> <span></span>
					</div>
				</div>
				<div class="register-box">
					<div class="box default">
						<label for="school">您 的 学 校</label> <input id="school"
							name="school" type="text"  placeholder="您的学校">
						<i></i>
					</div>
					<div class="tip">
						<i></i> <span></span>
					</div>
				</div>
				<div class="register-box">
					<div class="box default">
						<label for="college">您 的 学 院</label> <input id="college"
							name="college" type="text"  placeholder="您的学院">
						<i></i>
					</div>
					<div class="tip">
						<i></i> <span></span>
					</div>
				</div>
				<div class="register-box">
					<div class="box default">
						<label for="grade">您 的 年 级</label> <input id="grade"
							name="grade" type="text"  placeholder="您的年级">
						<i></i>
					</div>
					<div class="tip">
						<i></i> <span></span>
					</div>
				</div>
				<div class="register-box">
					<div class="box default">
						<label for="birthday">您 的 生 日</label> <input id="birthday"
							name="birthday" type="date" placeholder="您的生日">
						<i></i>
					</div>
					<div class="tip">
						<i></i> <span></span>
					</div>
				</div>
				<div class="register-box xieyi">
					<div class="box default">
						<input id="ck" name="ck" type="checkbox"> 
						<span>确认修改</span> 
					</div>
					<div class="tip">
						<i></i> <span></span>
					</div>
				</div>
				<span style="color: red;"><b>${failure }</b></span>
				<center>
					<br />
					<div class="submit_btn">
						<button id="btn" class="submit_btn" type="submit" value="注册">立即修改</button>
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
