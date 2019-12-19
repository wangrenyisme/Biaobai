
<%@page import="org.java.pojo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>个人主页</title>
</head>
<body>
<%
		User user=new User();
		user=(User)request.getSession().getAttribute("loginUser");
%>
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
										if(user.getName()==null)
										{
									%>
										<font style="color:red"><b>还未完善</b></font>
									<%
										}
										else
										{
									%>
										<font style="color:blue"><b><%=user.getName() %></b></font>
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
									<th>个人信息</th>
									<th></th>
									<th>个人照片</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>姓名：</td>
									<td>
									<%
										if(user.getName()==null)
										{
									%>
										<font style="color:red"><b>还未完善</b></font>
									<%
										}
										else
										{
									%>
										<font style="color:blue"><b><%=user.getName() %></b></font>
									<%
										}
									%>
									</td>
									<td rowspan="8">
										<%
										if(user.getHeadphoto()==null)
										{
									%>
										<font style="color:red"><b>还未完善</b></font>
									<%
										}
										else
										{
									%>
										<img src="<%=request.getContextPath() %>/headphoto/<%=user.getHeadphoto()%>" width="100px" height="100px" />
									<%
										}
									%>
									</td>
								</tr>
								<tr>
									<td>性别：</td>
									<td>
									<%
										if(user.getSex()==null)
										{
									%>
										<font style="color:red"><b>还未完善</b></font>
									<%
										}
										else
										{
									%>
										<font style="color:blue"><b><%=user.getSex() %></b></font>
									<%
										}
									%>
									</td>
								</tr>
								<tr>
									<td>电话号码：</td>
									<td>
									<%
										if(user.getTelephone()==null)
										{
									%>
										<font style="color:red"><b>还未完善</b></font>
									<%
										}
										else
										{
									%>
										<font style="color:blue"><b><%=user.getTelephone() %></b></font>
									<%
										}
									%>
									</td>
								</tr>
								<tr>
									<td>qq号码:</td>
									<td>
									<%
										if(user.getQq()==null)
										{
									%>
										<font style="color:red"><b>还未完善</b></font>
									<%
										}
										else
										{
									%>
										<font style="color:blue"><b><%=user.getQq() %></b></font>
									<%
										}
									%>
									</td>
								</tr>
								<tr>
									<td>所在学校:</td>
									<td>
									<%
										if(user.getSchool()==null)
										{
									%>
										<font style="color:red"><b>还未完善</b></font>
									<%
										}
										else
										{
									%>
										<font style="color:blue"><b><%=user.getSchool() %></b></font>
									<%
										}
									%>
									</td>
								</tr>
								<tr>
									<td>所在学院：</td>
									<td>
									<%
										if(user.getCollege()==null)
										{
									%>
										<font style="color:red"><b>还未完善</b></font>
									<%
										}
										else
										{
									%>
										<font style="color:blue"><b><%=user.getCollege() %></b></font>
									<%
										}
									%>
									</td>
								</tr>
								<tr>
									<td>所在年级：</td>
									<td>
									<%
										if(user.getGrade()==null)
										{
									%>
										<font style="color:red"><b>还未完善</b></font>
									<%
										}
										else
										{
									%>
										<font style="color:blue"><b><%=user.getGrade() %></b></font>
									<%
										}
									%>
									</td>
								</tr>
								<tr>
									<td>我的生日：</td>
									<td>
									<%
										if(user.getBirthday()==null)
										{
									%>
										<font style="color:red"><b>还未完善</b></font>
									<%
										}
										else
										{
									%>
										<font style="color:blue"><b><%=user.getBirthday() %></b></font>
									<%
										}
									%>
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