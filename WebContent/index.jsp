<%@page import="org.java.pojo.Famous"%>
<%@page import="org.java.pojo.Biaobai3"%>
<%@page import="org.java.pojo.Biaobai2"%>
<%@page import="org.java.pojo.Biaobai1"%>
<%@page import="org.java.pojo.Biaobai4"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="org.java.pojo.Biaobai5"%>
<%@page import="java.util.List"%>
<%@page import="org.java.dao.impl.DaoFactory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="no-js">
<head>
<title>主页</title>
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
</head>
<body>
	<%
		String string = request.getContextPath();
	%>
	<jsp:include page="top.jsp"></jsp:include>
	<div style="width: 100%; height: 100%;" id="myDiv">
		<div id="myCarousel" class="carousel slide"
			style="width: 50%; height: 50%;" data-interval="4000">
			<ol class="carousel-indicators" data-interval="4000">
				<li data-target="#myCarousel" data-slide-to="0" class="active"
					data-interval="4000" data-wrap="true"></li>
				<li data-target="#myCarousel" data-slide-to="1" data-interval="4000"></li>
				<li data-target="#myCarousel" data-slide-to="2" data-interval="4000"></li>
			</ol>
			<div class="carousel-inner" style="left: 50%;">
				<div class="item active">
					<img src="<%=request.getContextPath()%>/images/theme-pic1.jpg"
						alt="First slide">
				</div>
				<div class="item">
					<img src="<%=request.getContextPath()%>/images/test1.jpg"
						alt="Second slide">
				</div>
				<div class="item">
					<img src="<%=request.getContextPath()%>/images/11.png"
						alt="Third slide">
				</div>
			</div>
			<a class="carousel-control left" href="#myCarousel" data-slide="prev">
				&lsaquo;</a> <a class="carousel-control right" href="#myCarousel"
				data-slide="next">&rsaquo;</a>
		</div>
	</div>
	<div class="container-fluid">
		<div class="row-fluid">

			<div class="span6" style="width: 31%; height: 100%; float: left;">
				<!-- block -->
				<div class="block">
					<div class="navbar navbar-inner block-header" id="block-header1">
						<div class="muted pull-left" style="color: blue">表白热度榜</div>
						<div class="pull-right">
							<a href="#"> <span class="badge badge-info"
								style="background: #fff"> <img
									src="<%=request.getContextPath()%>/images/more.png" />
							</span>
							</a>
						</div>
					</div>
					<div class="block-content collapse in" >
						<table class="table table-striped" id="block-content2">
							<thead>
								<tr>
									<th>排名</th>
									<th>表白对象</th>
									<th>热度</th>
								</tr>
							</thead>
							<tbody>
								<%
								List<Famous> good=DaoFactory.getFamousDao().load();
								int top=1;
								for(Famous s:good){
									%>
									<tr>
									<td>
									<%
									if(top==1){
										%><font style="color: red"><b><%=top++ %></b></font><%
									}else{
										%><%=top++ %><%
									}
									%></td>
									<td><font style="color: red"><b><a href="<%=request.getContextPath() %>/ShowMore/redubang.jsp?username=<%=s.getName()%>">
									<%=s.getName() %></a></b></font></td>
									<td><font style="color: red"><b><%=s.getN() %></b></font></td>
									</tr>
									<%
									if(top==9)
										break;
								}
							%>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<div class="span6" style="width: 31%; height: 40%; float: left;">
				<!-- block -->
				<div class="block">
					<div class="navbar navbar-inner block-header" id="block-header2">
						<div class="muted pull-left" style="color: #ff69b4">希望在一起❤</div>
						<div class="pull-right">
							<a href="<%=request.getContextPath() %>/ShowMore/biaobaiMore.jsp?type=1" target="_top">
								<span class="badge badge-info" style="background: #fff"><img
									src="<%=request.getContextPath()%>/images/more.png" /></span>
							</a>
						</div>
					</div>
					<div class="block-content collapse in">
						<table class="table table-striped" id="block-content2">
							<%
								SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
								int i = 3;
								List<Biaobai1> biaobai1list = DaoFactory.getBiaobai1Dao().getAll();
								for (Biaobai1 biaobai1 : biaobai1list) 
								{
									if (i++ > 5)
										break;
							%>
							<tbody>
								<tr>
									<td colspan="2"><b>表&nbsp;白：&nbsp;</b><%=biaobai1.getDepartment()%>的 <a
										href="#"> <%=biaobai1.getLovename()%></a> <%=biaobai1.getGender()%>
										<br> <b>我想说:</b>	<%=biaobai1.getContentwithouthtml()%> <br>
										<a
										href="<%=request.getContextPath() %>/biaobai/biaobaiShow.jsp?type=1&id=<%=biaobai1.getId()%>"
										style="float: right">
											<button class="btn btn-info btn-mini">详细信息</button>
									</a><br> <i class="icon-thumbs-up"></i><%=biaobai1.getLiketimes()%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<i class="icon-comment"></i><%=biaobai1.getComtimes()%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<i class="icon-calendar"></i><%=format.format(biaobai1.getIssuedate())%><br>

									</td>
								</tr>
							</tbody>
							<%
								}
								i = 3;
							%>
						</table>
					</div>
				</div>
				<!-- /block -->
			</div>
			<div class="span6" style="width: 31%; height: 40%; float: left;">
				<!-- block -->
				<div class="block">
					<div class="navbar navbar-inner block-header" id="block-header2">
						<div class="muted pull-left" style="color: #ff69b4">求认识</div>
						<div class="pull-right">
							<a href="<%=request.getContextPath() %>/ShowMore/biaobaiMore.jsp?type=2" target="_top"> <span class="badge badge-info"
								style="background: #fff"><img
									src="<%=request.getContextPath()%>/images/more.png" /></span>
							</a>
						</div>
					</div>
					<div class="block-content collapse in">
						<table class="table table-striped" id="block-content2">
							<%
								List<Biaobai2> biaobai2list = DaoFactory.getBiaobai2Dao().getAll();
								for (Biaobai2 biaobai2 : biaobai2list) {
									if (i++ > 5)
										break;
							%>
							<tbody>
								<tr>
									<td colspan="2"><b>表&nbsp;白：&nbsp;</b>一个<%=biaobai2.getGender()%><br>
										<b>我想说:</b><%=biaobai2.getContentwithouthtml()%><br> <a
										href="<%=request.getContextPath() %>/biaobai/biaobaiShow.jsp?type=2&id=<%=biaobai2.getId()%>"
										style="float: right"><button class="btn btn-info btn-mini">详细信息</button></a><br>
										<i class="icon-thumbs-up"></i><%=biaobai2.getLiketimes()%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<i class="icon-comment"></i><%=biaobai2.getComtimes()%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<i class="icon-calendar"></i><%=format.format(biaobai2.getIssuedate())%><br>
									</td>
								</tr>
							</tbody>
							<%
								}
								i = 3;
							%>
						</table>
					</div>
				</div>
				<!-- /block -->
			</div>
		</div>
		<div class="row-fluid">
			<div class="span6" style="width: 31%; height: 40%; float: left;">
				<div class="block">
					<div class="navbar navbar-inner block-header" id="block-header2">
						<div class="muted pull-left" style="color: #ff69b4">为自己脱单</div>
						<div class="pull-right">
							<a href="<%=request.getContextPath() %>/ShowMore/biaobaiMore.jsp?type=3" target="_top"> <span class="badge badge-info"
								style="background: #fff"><img
									src="<%=request.getContextPath()%>/images/more.png" /></span>
							</a>
						</div>
					</div>
					<div class="block-content collapse in">
						<table class="table table-striped" id="block-content2">
							<%
								List<Biaobai4> biaobai4list = DaoFactory.getBiaobai4Dao().getAll();
								for (Biaobai4 biaobai4 : biaobai4list) {
									if (i++ > 5)
										break;
									String chara = biaobai4.getCharacter();
									String favor = biaobai4.getFavoredType();
							%>
							<tbody>
								<tr>
									<td colspan="2"><b>我是一个</b>"<%=chara.length() > 20 ? chara.substring(0, 20) + "..." : chara%>"的<%=biaobai4.getGender()%>
										<br />
										<b>想找一个</b>"<%=favor.length() > 20 ? favor.substring(0, 20) + "..." : favor%>"的<%=biaobai4.getGender().equals("小哥哥") ? "小姐姐" : "小哥哥"%>
										<br> <br />
									<a
										href="<%=request.getContextPath() %>/biaobai/biaobaiShow.jsp?type=4&id=<%=biaobai4.getId()%>"
										style="float: right"><button class="btn btn-info btn-mini">详细信息</button></a><br>
										<i class="icon-thumbs-up"></i><%=biaobai4.getLiketimes()%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<i class="icon-comment"></i><%=biaobai4.getComtimes()%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<i class="icon-calendar"></i><%=format.format(biaobai4.getIssuedate())%><br>
									</td>
								</tr>
							</tbody>
							<%
								}
								i = 3;
							%>
						</table>
					</div>
				</div>
				<!-- /block -->
			</div>
			<div class="span6" style="width: 31%; height: 40%; float: left;">
				<!-- block -->
				<div class="block">
					<div class="navbar navbar-inner block-header" id="block-header2">
						<div class="muted pull-left" style="color: #ff69b4">给舍友脱单</div>
						<div class="pull-right">
							<a href="<%=request.getContextPath() %>/ShowMore/biaobaiMore.jsp?type=4" target="_top"> <span class="badge badge-info"
								style="background: #fff"><img
									src="<%=request.getContextPath()%>/images/more.png" /></span>
							</a>
						</div>
					</div>
					<div class="block-content collapse in">
						<table class="table table-striped" id="block-content2">
							<%
								List<Biaobai3> biaobai3list = DaoFactory.getBiaobai3Dao().getAll();
								for (Biaobai3 biaobai3 : biaobai3list) {
									if (i++ > 5)
										break;
							%>
							<tbody>
								<tr>
									<td colspan="2"><b>我舍友是</b><%=biaobai3.getDepartment()%>的一个<%=biaobai3.getGender()%><br>
										<%=biaobai3.getContentwithouthtml()%><br> <a
										href="<%=request.getContextPath() %>/biaobai/biaobaiShow.jsp?type=3&id=<%=biaobai3.getId()%>"
										style="float: right"><button class="btn btn-info btn-mini">详细信息</button></a><br>
										<i class="icon-thumbs-up"></i><%=biaobai3.getLiketimes()%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<i class="icon-comment"></i><%=biaobai3.getComtimes()%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<i class="icon-calendar"></i><%=format.format(biaobai3.getIssuedate())%><br>
									</td>
								</tr>
							</tbody>
							<%
								}
								i = 3;
							%>
						</table>
					</div>
				</div>
			</div>
			<div class="span6" style="width: 31%; height: 40%; float: left;">
				<!-- block -->
				<div class="block">
					<div class="navbar navbar-inner block-header" id="block-header2">
						<div class="muted pull-left" style="color: #ff69b4">其他类型</div>
						<div class="pull-right">
							<a href="<%=request.getContextPath() %>/ShowMore/biaobaiMore.jsp?type=5" target="_top"> <span class="badge badge-info"
								style="background: #fff"><img
									src="<%=request.getContextPath()%>/images/more.png" /></span>
							</a>
						</div>
					</div>
					<div class="block-content collapse in">
						<table class="table table-striped" id="block-content2">
							<%
								List<Biaobai5> biaobai5list = DaoFactory.getBiaobai5Dao().getAll();
								for (Biaobai5 biaobai5 : biaobai5list) {
									if (i++ > 5)
										break;
							%>
							<tbody>
								<tr>
									<td colspan="2">表白<a
										href="#"><%=biaobai5.getBobject()%></a>:<b><%=biaobai5.getTitle()%></b><br>
										<%=biaobai5.getContentwithouthtml()%><br> <a
										href="<%=request.getContextPath() %>/biaobai/biaobaiShow.jsp?type=5&id=<%=biaobai5.getId()%>"
										style="float: right"><button class="btn btn-info btn-mini">详细信息</button></a><br>
										<i class="icon-thumbs-up"></i><%=biaobai5.getLiketimes()%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<i class="icon-comment"></i><%=biaobai5.getComtimes()%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<i class="icon-calendar"></i><%=format.format(biaobai5.getIssuedate())%>
									</td>
								</tr>
							</tbody>
							<%
								}
								i = 3;
							%>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	<hr>
	<script src="<%=request.getContextPath()%>/vendors/jquery-1.9.1.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/vendors/easypiechart/jquery.easy-pie-chart.js"></script>
	<script src="<%=request.getContextPath() %>/assets/scripts.js"></script>
	<script>
		$(function() {
			$('.chart').easyPieChart({
				animate : 1000
			});
		});
	</script>
	<jsp:include page="bottom.jsp"></jsp:include>
</body>
</html>