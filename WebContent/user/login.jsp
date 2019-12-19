<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>系统登录</title>
<link href="<%=request.getContextPath()%>/css/login.css"
	rel="stylesheet" rev="stylesheet" type="text/css" media="all" />
<link href="<%=request.getContextPath()%>/css/demo.css"
	rel="stylesheet" rev="stylesheet" type="text/css" media="all" />
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/jquery1.42.min.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/jquery.SuperSlide.js"></script>
<script>
		function change() 
		{
			var charactors = "ab1cd2ef3gh4ij5kl6mn7opq8rst9uvw0xyz";
			var value = '', i;
			for (var j = 1; j <= 4; j++) {
				i = Math.ceil(35 * (Math.random()) + 1);
				value = value + charactors.charAt(i);
			}
			document.getElementById('yanzhengma').value = value;
			document.getElementById("text_yzm").value=value;
		}
</script>
<script>
	$(function() {
		$(".i-text").focus(function() {
			$(this).addClass('h-light');
		});
		$(".i-text").focusout(function() {
			$(this).removeClass('h-light');
		});
		$("#username").focus(function() {
			var username = $(this).val();
			if (username == '输入账号') {
				$(this).val('');
			}
		});
		$("#username").focusout(function() {
			var username = $(this).val();
			if (username == '') {
				$(this).val('输入账号');
			}
		});
		$("#password").focus(function() {
			var username = $(this).val();
			if (username == '输入密码') {
				$(this).val('');
			}
		});
		$("#yzm").focus(function() {
			var username = $(this).val();
			if (username == '输入验证码') {
				$(this).val('');
			}
		});
		$("#yzm").focusout(function() {
			var username = $(this).val();
			if (username == '') {
				$(this).val('输入验证码');
			}
		});
		$(".registerform").Validform({
			tiptype : function(msg, o, cssctl) {
				var objtip = $(".error-box");
				cssctl(objtip, o.type);
				objtip.text(msg);
			},
			ajaxPost : true
		});
	});
</script>
</head>
<body>
	<%
		//防止中文乱码
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
	%>
	<div class="header">
		<h1 class="headerLogo">
			<a title="石家庄铁道大学表白墙" target="_blank"> <img title="logo"
				src="<%=request.getContextPath()%>/images/logo.png" />
			</a>
		</h1>
		<div class="headerNav">
			<a target="_blank" href="http://www.stdu.edu.cn/">铁大官网</a>
			<a target="_blank" href="<%=request.getContextPath() %>/regist.jsp">前往注册</a>
			<a target="_blank" href="<%=request.getContextPath() %>/we.jsp">开发团队</a> 
			<a target="_blank" href="#">意见反馈</a>
			<a target="_blank" href="#">帮助</a>
		</div>
	</div>
	<div class="banner">
		<div class="login-aside">
			<div id="o-box-up"></div>
			<div id="o-box-down" style="table-layout: fixed;">
				<div class="error-box">
					<span style="color: red">${error }</span>
				</div>
				<form class="registerform"
					action="${pageContext.request.contextPath}/servlet/loginServlet">
					<div class="fm-item">
						<label for="logonId" class="form-label">铁大表白墙用户名：</label> <input
							type="text" maxlength="100" name="username"
							id="username" class="i-text" required placeholder="请输入用户名" oninvalid="setCustomValidity('请输入用户名');"oninput="setCustomValidity('');" />
						<div class="ui-form-explain"></div>
					</div>
					<div class="fm-item">
						<label for="logonId" class="form-label">登录密码：</label> <input
							type="password" value="" maxlength="100" name="password"
							id="password" class="i-text" required placeholder="请输入密码" oninvalid="setCustomValidity('请输入密码');"oninput="setCustomValidity('');" />
						<div class="ui-form-explain"></div>
					</div>
					<div class="fm-item pos-r" style="float:left">
						<label for="logonId" class="form-label">验证码</label> 
						<input
							type="text" maxlength="100" name="yanzheng"  style="float:left"
							id="yanzheng" class="i-text yzm" required placeholder="请输入验证码" oninvalid="setCustomValidity('请输入验证码');"oninput="setCustomValidity('');" />
							<div id="check-code" style="float:left">
								<div class="code" id="data_code">
									<input type="button" id="yanzhengma" style="color: blue; font-size: 18px; width:125px;height: 40px;" name="yanzhengma" onclick="change()" value="3d2y" />
									<input type="hidden" id="text_yzm" name="text_yzm" value="3d2y" />
								</div>
							</div>
					</div>
					<div class="fm-item">
						<label for="logonId" class="form-label"></label> <input
							type="submit" value="" tabindex="4" name="submit" id="send-btn"
							class="btn-login" />
						<div class="ui-form-explain"></div>
					</div>
				</form>
			</div>
		</div>
		<div class="bd">
			<ul>
				<li
					style="background: url(<%=request.getContextPath()%>/images/theme-pic1.jpg) #ffaad5 center 0 no-repeat;"><a
					target="_blank"></a></li>
				<li
					style="background: url(<%=request.getContextPath()%>/images/theme-pic2.jpg) #ffaad5 center 0 no-repeat;"><a
					target="_blank"></a></li>
			</ul>
		</div>
		<div class="hd">
			<ul></ul>
		</div>
	</div>
	<script type="text/javascript">
		jQuery(".banner").slide({
			titCell : ".hd ul",
			mainCell : ".bd ul",
			effect : "fold",
			autoPlay : true,
			autoPage : true,
			trigger : "click"
		});
	</script>
	<div class="footer">
		<br />
		<p>&copy;版权所有：石家庄铁道大学信息科学与技术学院软件工程系</p>
		<br />
	</div>
</body>
</html>