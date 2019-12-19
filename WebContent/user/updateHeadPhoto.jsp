<%@page import="org.java.pojo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link
	href="<%=request.getContextPath()%>/bootstrap/css/bootstrap.min.css"
	rel="stylesheet" media="screen">
<link
	href="<%=request.getContextPath()%>/bootstrap/css/bootstrap-responsive.min.css"
	rel="stylesheet" media="screen">
<link
	href="<%=request.getContextPath()%>/vendors/easypiechart/jquery.easy-pie-chart.css"
	rel="stylesheet" media="screen">
<link href="<%=request.getContextPath()%>/assets/styles.css"
	rel="stylesheet" media="screen">
<script
	src="<%=request.getContextPath()%>/vendors/modernizr-2.6.2-respond-1.1.0.min.js"></script>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/layui/css/layui.css" media="all">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/tcb.css"
	media="all">
<title>修改头像</title>
</head>
<body><%User loginUser=(User)session.getAttribute("loginUser"); %>
<div class="container-fluid">
		<div class="row-fluid">
			<div class="span6" style="width: 100%; height: 100%; float: left;">
				<div class="block">
					<div class="navbar navbar-inner block-header" id="block-header2">
						<div class="muted pull-left" style="color: blue">个人信息</div>
						<div class="pull-right">
							<a href="#"> <span class="badge badge-info"
								style="background: #fff;color:black;"> 
								<%
										if(loginUser.getName()==null)
										{
									%>
										<font style="color:red"><b>还未完善</b></font>
									<%
										}
										else
										{
									%>
										<font style="color:blue"><b><%=loginUser.getName() %></b></font>
									<%
										}
									%>
							</span>
							</a>
						</div>
					</div>
					<div class="block-content collapse in" id="block-content2">
						<table class="table table-striped" id="block-content2">
							<thead>
								<tr>
									<th>我的头像</th>
									<th>修改头像</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td><img style="width:170px;" alt="" src="<%=request.getContextPath()%>/headphoto/<%=loginUser.getHeadphoto()%>"></td>
									<td>
									<form action="../UpdateHeadPhoto" method="post" enctype="multipart/form-data">
										<input type="file" name="photo" ><br />
										<input type="submit" value="修改" class="btn btn-primary">
									</form>
									
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>



	
</body>
</html>