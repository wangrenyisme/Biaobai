<%@page import="org.java.pojo.Famous"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="org.java.dao.impl.DaoFactory"%>
<%@page import="org.java.pojo.Biaobai5"%>
<%@page import="java.util.List"%>
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
	<style type="text/css">
	#md6 {
  background: #FFFFFF; 
  border-color:#bce8f1;
  box-shadow: 7px 7px 4px  #000000;
  margin-left:5%;
}
#title {
   background: #d9edf7;
  height:50px;
}
	</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>热度榜</title>
</head>
<body style="background:url(2.jpg); ">
<jsp:include page="../top.jsp"></jsp:include>
<div class="block" style="float:left;width:20%;margin-top:0;background:#fff;">
	<div class="block-content collapse in">
		<table class="table table-striped" id="block-content2">
			<thead style="background:#d9edf7">
				<tr>
					<th>排名</th>
					<th>表白对象</th>
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
					</tr>
					<%
					if(top==9)
						break;
				}
			%>
			<tr>
			<td>
			&nbsp;
			</td>
			<td>
			&nbsp;
			</td>
			</tr>
			<tr>
			<td>
			&nbsp;
			</td>
			<td>
			&nbsp;
			</td>
			</tr>
			<tr>
			<td>
			&nbsp;
			</td>
			<td>
			&nbsp;
			</td>
			</tr>
			<tr>
			<td>
			&nbsp;
			</td>
			<td>
			&nbsp;
			</td>
			</tr>
			<tr>
			<td>
			&nbsp;
			</td>
			<td>
			&nbsp;
			</td>
			</tr>
			</tbody>
		</table>
		<br />
	</div>
</div>
<div style="float:left;height:100%;width:79%;">
<div style="float:left;width:90%;">
<%
	SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
	String username=request.getParameter("username");
	List<Biaobai5> biaobai5list=DaoFactory.getBiaobai5Dao().getAllByUsername(username);
	for(Biaobai5 biaobai5:biaobai5list){
		%>
		<div class="layui-card" id="md6">
				<div id="title" class="layui-card-header">
					<div style="width:45px;height:45px;border-radius:100%;overflow:hidden;float:left;">
					<img src="<%=request.getContextPath()%>/headphoto/<%=DaoFactory.getUserDao().getByUserName(biaobai5.getUsername()).getHeadphoto()%>" width="45" height="45"/></div><!-- 头像 -->
					<!--  -->
					<div style="height:45px;padding:10px;"><%=biaobai5.getUsername()%></div>
				</div>
				<div class="layui-card-body">
					<font style="color:red;"><b>表白</b></font>
					<%=biaobai5.getBobject()%>:
					<br >
					<b><%=biaobai5.getTitle()%></b><br>
					<%=biaobai5.getContentwithouthtml()%><br>
					<a
						href="<%=request.getContextPath()%>/biaobai/biaobai5Show.jsp?id=<%=biaobai5.getId()%>"
						style="float: right">
						<button class="btn btn-info btn-mini">详细信息</button>
					</a><br>
					<div class="layui-card-header"></div>
					<div style="margin: 0px 5px 5px 5px;">
						<%
					if(biaobai5.getImgUrl()!=null&&!"".equals(biaobai5.getImgUrl().trim()))
						for(String photos:biaobai5.getImgUrl().split(",")){
						
						%>
						<div style="margin: 5px 5px 5px 5px; float: left;">
							<img src="<%=photos%>" width="100" height="100" />
						</div>
						<%
						}
						%>
					</div>
					<div style="clear: both;">
						<i class="icon-thumbs-up"></i><%=biaobai5.getLiketimes()%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<i class="icon-comment"></i><%=biaobai5.getComtimes()%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<i class="icon-calendar"></i><%=format.format(biaobai5.getIssuedate())%>
					</div>
				</div>
			</div>
		<br />
			<%
	}
%>
</div></div>
<div style="clear:both;"></div>
<jsp:include page="../bottom.jsp"></jsp:include>
</body>
</html>