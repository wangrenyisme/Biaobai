<%@page import="org.java.pojo.Biaobai5"%>
<%@page import="org.java.pojo.Biaobai4"%>
<%@page import="org.java.pojo.Biaobai3"%>
<%@page import="org.java.pojo.Biaobai2"%>
<%@page import="org.java.pojo.BiaobaiBase"%>
<%@page import="org.java.pojo.Reply"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="org.java.pojo.Biaobai1"%>
<%@page import="org.java.pojo.BiaobaiMessage"%>
<%@page import="java.util.List"%>
<%@page import="org.java.dao.impl.DaoFactory"%>
<%@page import="org.java.pojo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link
	href="<%=request.getContextPath()%>/bootstrap/css/bootstrap.min.css"
	rel="stylesheet" media="screen">
<script
	src="<%=request.getContextPath()%>/vendors/modernizr-2.6.2-respond-1.1.0.min.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/layui/css/layui.css" media="all">
<title>消息通知</title>
</head>
<body>
<div style="folat:left;width:200px;height:600px;">
	<ul>
	<li><a href="updateHeadPhoto.jsp">个人信息</a></li>
	<li><a href="updateHeadPhoto.jsp">修改个人信息</a></li>
	<li><a href="updateHeadPhoto.jsp">修改头像</a></li>
	<li><a href="messageInform.jsp">消息通知</a></li>
	</ul>
</div>
<div style="folat:left;width:900px;height:900px;">
	<h3>我收到的表白</h3>
	<%
	User loginUser=(User)session.getAttribute("loginUser");
	SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
	User user=(User)session.getAttribute("loginUser");
	user.setMessage(0);
	DaoFactory.getUserDao().updateUser(user);
	List<BiaobaiMessage> messages = DaoFactory.getMessageDao().list(user.getName());
 	User user2=null;
 	Biaobai1 biaobai1=null;
	for(BiaobaiMessage message:messages){
		user2=DaoFactory.getUserDao().getByUserName(message.getFrom_uid());
		biaobai1=DaoFactory.getBiaobai1Dao().getById(message.getMessage_id());
			%>
			<div class="layui-card" id="md6">
				<div class="layui-card-header">
					<div style="width:40px;height:40px;border-radius:100%;overflow:hidden;float:left;">
					<img src="<%=request.getContextPath()%>/images/<%=user2.getHeadphoto()%>" width="40" height="40"/></div><!-- 头像 -->
					<!--  -->
					<div style="height:40px;padding:10px;"><%=biaobai1.getUsername()%></div>
				</div>
				<div class="layui-card-body">
					我要表白<%=biaobai1.getDepartment()%>的 <a href=""> <%=biaobai1.getLovename()%></a>
					<%=biaobai1.getGender()%><br> 我想说:<%=biaobai1.getContentwithouthtml()%><br>
					<a
						href="<%=request.getContextPath()%>/biaobai/biaobai1Show.jsp?id=<%=biaobai1.getId()%>"
						style="float: right">
						<button class="btn btn-info btn-mini">详细信息</button>
					</a><br>
					<div class="layui-card-header"></div>
					<div style="margin: 5px 5px 5px 5px;">
					<%
					if(biaobai1.getImgUrl()!=null&&!"".equals(biaobai1.getImgUrl().trim()))
						for(String photos:biaobai1.getImgUrl().split(",")){
						
						%>
						<div style="margin: 5px 5px 5px 5px; float: left;">
							<img src="<%=photos %>" width="100" height="100" />
						</div>
						<%
						}
						%>
					</div>
					<div style="clear: both;">
						<i class="icon-thumbs-up"></i><%=biaobai1.getLiketimes()%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<i class="icon-comment"></i><%=biaobai1.getComtimes()%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<i class="icon-calendar"></i><%=format.format(biaobai1.getIssuedate())%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<%
						if(message.getReaded()==1){
							%><i class="icon-calendar">已读</i><%
						}else{
							%><i class="icon-calendar">未读</i><%
							message.setReaded(1);
							DaoFactory.getMessageDao().update(message);
						}
						%>
					</div>
				</div>
				</div>
			<br>
			<hr>
<%
	}
%>
</div>

<div style="folat:left;width:900px;height:900px;">
	<h3>其他消息</h3>
	<%
	List<Reply> replys = DaoFactory.getReplyDao().list(user.getUsername());
 	User user3=null;
 	BiaobaiBase biaobai=null;
	for(Reply reply:replys){
		user3=DaoFactory.getUserDao().getByUserName(reply.getFrom_uid());
		%>
			<%=user3.getUsername() %>:<%=reply.getContent() %>
			<hr>
		<%
		int type=reply.getType();
		if(type==1){
			biaobai=DaoFactory.getBiaobai1Dao().getById(reply.getMessage_id());
			%>
			<div style="margin:10px 10px 10px 10px;">
			<div class="layui-col-md6" style="width:100%;">
			<div class="layui-card" id="md6">
				<div class="layui-card-header">
					<div style="width:40px;height:40px;border-radius:100%;overflow:hidden;float:left;">
					<img src="a.jpg" width="40" height="40"/></div><!-- 头像 -->
					<!--  -->
					<div style="height:40px;padding:10px;"><%=biaobai1.getUsername()%></div>
				</div>
				<div class="layui-card-body">
					我要表白<%=((Biaobai1)biaobai).getDepartment()%>的 <a href=""> <%=((Biaobai1)biaobai).getLovename()%></a>
					<%=((Biaobai1)biaobai).getGender()%><br> 我想说:<%=((Biaobai1)biaobai).getContentwithouthtml()%><br>
					<a
						href="<%=request.getContextPath()%>/biaobai/biaobai1Show.jsp?id=<%=biaobai.getId()%>"
						style="float: right">
						<button class="btn btn-info btn-mini">详细信息</button>
					</a><br>
					<div style="clear: both;">
						<i class="icon-thumbs-up"></i><%=biaobai.getLiketimes()%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<i class="icon-comment"></i><%=biaobai.getComtimes()%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<i class="icon-calendar"></i><%=format.format(biaobai.getIssuedate())%>
					</div>
				</div>
			</div>
		</div>
			</div>
			<%
		}else if(type==2){
			biaobai=DaoFactory.getBiaobai2Dao().getById(reply.getMessage_id());
			%>
			<div style="margin:10px 10px 10px 10px;">
			<div class="layui-col-md6" style="width:100%;">
			<div class="layui-card" id="md6">
				<div class="layui-card-header">
					<div style="width:40px;height:40px;border-radius:100%;overflow:hidden;float:left;">
					<img src="a.jpg" width="40" height="40"/></div><!-- 头像 -->
					<!--  -->
					<div style="height:40px;padding:10px;"><%=biaobai1.getUsername()%></div>
				</div>
				<div class="layui-card-body">
					表白一个<%=((Biaobai2)biaobai).getGender()%><br>
					我想说:<%=((Biaobai2)biaobai).getContentwithouthtml()%><br>
					<a
						href="<%=request.getContextPath()%>/biaobai/biaobai2Show.jsp?id=<%=biaobai.getId()%>"
						style="float: right">
						<button class="btn btn-info btn-mini">详细信息</button>
					</a><br>
					<div style="clear: both;">
						<i class="icon-thumbs-up"></i><%=biaobai.getLiketimes()%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<i class="icon-comment"></i><%=biaobai.getComtimes()%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<i class="icon-calendar"></i><%=format.format(biaobai.getIssuedate())%>
					</div>
				</div>
			</div>
		</div>
			</div>
			<%
		}else if(type==3){
			biaobai=DaoFactory.getBiaobai3Dao().getById(reply.getMessage_id());
			%>
			<div style="margin:10px 10px 10px 10px;">
			<div class="layui-col-md6" style="width:100%;">
			<div class="layui-card" id="md6">
				<div class="layui-card-header">
					<div style="width:40px;height:40px;border-radius:100%;overflow:hidden;float:left;">
					<img src="a.jpg" width="40" height="40"/></div><!-- 头像 -->
					<!--  -->
					<div style="height:40px;padding:10px;"><%=biaobai1.getUsername()%></div>
				</div>
				<div class="layui-card-body">
					我舍友是<%=((Biaobai3)biaobai).getDepartment()%>的一个<%=((Biaobai3)biaobai).getGender()%><br>
					<%=((Biaobai3)biaobai).getContentwithouthtml()%><br>
					<a
						href="<%=request.getContextPath()%>/biaobai/biaobai3Show.jsp?id=<%=biaobai.getId()%>"
						style="float: right">
						<button class="btn btn-info btn-mini">详细信息</button>
					</a><br>
					<div style="clear: both;">
						<i class="icon-thumbs-up"></i><%=biaobai.getLiketimes()%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<i class="icon-comment"></i><%=biaobai.getComtimes()%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<i class="icon-calendar"></i><%=format.format(biaobai.getIssuedate())%>
					</div>
				</div>
			</div>
		</div>
			</div>
			<%
		}else if(type==4){
			biaobai=DaoFactory.getBiaobai4Dao().getById(reply.getMessage_id());
			%>
			<div style="margin:10px 10px 10px 10px;">
			<div class="layui-col-md6" style="width:100%;">
			<div class="layui-card" id="md6">
				<div class="layui-card-header">
					<div style="width:40px;height:40px;border-radius:100%;overflow:hidden;float:left;">
					<img src="a.jpg" width="40" height="40"/></div><!-- 头像 -->
					<!--  -->
					<div style="height:40px;padding:10px;"><%=biaobai1.getUsername()%></div>
				</div>
				<div class="layui-card-body">
				<%	String chara = ((Biaobai4)biaobai).getCharacter();
					String favor = ((Biaobai4)biaobai).getFavoredType(); %>
					一个"<%=chara.length() > 20 ? chara.substring(0, 20) + "..." : chara%>"的<%=((Biaobai4)biaobai).getGender()%>
					想找一个"<%=favor.length() > 20 ? favor.substring(0, 20) + "..." : favor%>"的<%=((Biaobai4)biaobai).getGender().equals("小哥哥") ? "小姐姐" : "小哥哥"%>
					<br>
					<a
						href="<%=request.getContextPath()%>/biaobai/biaobai4Show.jsp?id=<%=biaobai.getId()%>"
						style="float: right">
						<button class="btn btn-info btn-mini">详细信息</button>
					</a><br>
					<div style="clear: both;">
						<i class="icon-thumbs-up"></i><%=biaobai.getLiketimes()%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<i class="icon-comment"></i><%=biaobai.getComtimes()%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<i class="icon-calendar"></i><%=format.format(biaobai.getIssuedate())%>
					</div>
				</div>
			</div>
		</div>
			</div>
			<%
		}else if(type==5){
			biaobai=DaoFactory.getBiaobai5Dao().getById(reply.getMessage_id());
			%>
			<div style="margin:10px 10px 10px 10px;">
			<div class="layui-col-md6" style="width:100%;">
			<div class="layui-card" id="md6">
				<div class="layui-card-header">
					<div style="width:40px;height:40px;border-radius:100%;overflow:hidden;float:left;">
					<img src="a.jpg" width="40" height="40"/></div><!-- 头像 -->
					<!--  -->
					<div style="height:40px;padding:10px;"><%=biaobai1.getUsername()%></div>
				</div>
				<div class="layui-card-body">
					表白<%=((Biaobai5)biaobai).getBobject()%>:<%=((Biaobai5)biaobai).getTitle()%><br>
					<%=((Biaobai5)biaobai).getContentwithouthtml()%><br>
					<a
						href="<%=request.getContextPath()%>/biaobai/biaobai5Show.jsp?id=<%=biaobai.getId()%>"
						style="float: right">
						<button class="btn btn-info btn-mini">详细信息</button>
					</a><br>
					<div style="clear: both;">
						<i class="icon-thumbs-up"></i><%=biaobai.getLiketimes()%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<i class="icon-comment"></i><%=biaobai.getComtimes()%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<i class="icon-calendar"></i><%=format.format(biaobai.getIssuedate())%>
					</div>
				</div>
			</div>
		</div>
			</div>
			<%
		}
		
		%>
			<%
			if(reply.getReaded()==1){
				%>
				已读
				<%
			}else{
				%>
				未读
				<%
				reply.setReaded(1);
				DaoFactory.getReplyDao().update(reply);
			}
			%><br><hr>
			

<%
	}
%>
</div>
</body>
</html>