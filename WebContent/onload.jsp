 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%> 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath() %>/css/dandelion.css" media="screen" />
<script type="text/javascript">
window.onload = function()
{
    function autoclick(){
        $("#ab").click();
    }
}
</script>
</head>
<body>
<%
	String str=(String)request.getAttribute("error");
	request.setAttribute("error",str); 
%>
<div id="da-wrapper" class="fluid">
	<div id="da-content">
		<div class="da-container clearfix">
			<div id="da-error-wrapper">
				<div id="da-error-pin"></div>
				<div id="da-error-code">
						error <span style="font-size:50px;">未登录</span>
					</div>
					<h1 class="da-error-heading" >
						<a href="<%=request.getContextPath() %>/login.jsp" target="_top" id="ab">检测到您未登录，无法进行操作！返回登录</a>
					</h1>
				</div>
			</div>
		</div>
	</div>
</body>
</html>