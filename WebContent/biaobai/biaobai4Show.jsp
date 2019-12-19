<%@page import="org.java.helper.ClassifyCommentAndReply"%>
<%@page import="org.java.pojo.Reply"%>
<%@page import="org.java.pojo.User"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="org.java.pojo.Biaobai4"%>
<%@page import="java.util.List"%>
<%@page import="org.java.dao.impl.DaoFactory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>详细信息</title>
<link
	href="<%=request.getContextPath()%>/bootstrap/css/bootstrap.min.css"
	rel="stylesheet" media="screen">
<link
	href="<%=request.getContextPath()%>/css/background.css"
	rel="stylesheet" media="screen">
<link
	href="<%=request.getContextPath()%>/bootstrap/css/bootstrap-responsive.min.css"
	rel="stylesheet" media="screen">
<link
	href="<%=request.getContextPath()%>/vendors/easypiechart/jquery.easy-pie-chart.css"
	rel="stylesheet" media="screen">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
ul li {
	list-style-type: none;
	margin-bottom: 20px;
}
a
{
	text-decoration:none;
}
</style>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-1.8.2.min.js"></script>
<script type="text/javascript">
	$("button").click(function() {
		$(this).attr("disabled", "disabled");
	});
	var kind;
	var type;
	var messageId;
	var replyId;
	var toUId;
	var fromUId;
	function addComment(btn, kind_tmp, type_tmp, messageId_tmp, replyId_tmp,
			toUId_tmp, fromUId_tmp) {
		kind = kind_tmp;
		type = type_tmp;
		messageId = messageId_tmp;
		replyId = replyId_tmp;
		toUId = toUId_tmp;
		fromUId = fromUId_tmp;
		var div = btn.parentNode;
		div.parentNode.innerHTML += "<form action='../CommentForBai1Add' method='post' onsubmit='getValue()'>"
				+ "<input type='text' name='content' style='width:80%;height:23px;margin:0px 0px 0px 10px;'>"
				+ "<input type='hidden' id='messageId' name='messageId' value=''>"
				+ "<input type='hidden' id='kind' name='kind' value=''>"
				+ "<input type='hidden' id='type' name='type' value=''>"
				+ "<input type='hidden' id='replyId' name='replyId' value=''>"
				+ "<input type='hidden' id='fromUId' name='fromUId' value=''>"
				+ "<input type='hidden' id='toUId' name='toUId' value=''>"
				+ "<input type='submit' class='btn btn-info' value='评论'>" + "</form>";
	}
	function getValue() 
	{
		document.getElementById('replyId').value = replyId;
		document.getElementById('fromUId').value = fromUId;
		document.getElementById('toUId').value = toUId;
		document.getElementById('kind').value = kind;
		document.getElementById('type').value = type;
		document.getElementById('messageId').value = messageId;
	}

	function addReply() {
		document.getElementById("RepContent").innerHTML += "<form action='' method='post'><input type='text' name='accessoryfile'/>"
				+ "<input type='button' class='btn btn-info' value='评论' >" + "</form>";
	}
</script>
<style type="text/css">
body{
	background:#EE8262;
	background:url(2.jpg);
}
#md6 {
  background: #FFFFFF; 
  border-color:#bce8f1;
  box-shadow: 7px 7px 4px  #000000;
  padding:5px 5px 5px 10px;
  margin-left:5%;
}
#title {
  background: #d9edf7;
  height:50px;
  padding:5px;
}
</style>
</head>
<body>
<%
	int id=Integer.parseInt(request.getParameter("id"));
	Biaobai4 biaobai4=DaoFactory.getBiaobai4Dao().getById(id);
	User loginUser = (User) session.getAttribute("loginUser");
	if (loginUser == null) {
		request.setAttribute("error", "请您先登录之后再继续操作！");
		request.getRequestDispatcher("/onload.jsp").forward(request, response);
		return;
	}
	SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
%>

<div style="float: left; width: 80%;margin-top:10px;" id="md6">
		<div style="width: 100%;">
			<div id="title">
				<div
					style="width: 45px; height: 45px; border-radius: 100%; overflow: hidden; float: left;">
					<img src="<%=request.getContextPath()%>/headphoto/<%=DaoFactory.getUserDao().getByUserName(biaobai4.getUsername()).getHeadphoto()%>" width="45" height="45" />
				</div>
				<div style="height: 45px; float: left; padding: 10px;"><a href="<%=request.getContextPath()%>/personl.jsp?username=<%=biaobai4.getUsername()%>" style="color:#000;"><%=biaobai4.getUsername()%></a></div>
			</div>
			<hr style=" clear: both;"/>
			<div style="margin: 5px 5px 5px 5px; clear: both;">
				<b>姓名：</b>
				<%=biaobai4.getName()%><br>
				<b>性别:</b>
				<%=biaobai4.getGender()%><br>
				<b>学院:</b>
				<%=biaobai4.getDepartment()%><br>
				<b>年级：</b>
				<%=biaobai4.getGrade()%><br>
				<b>联系方式：</b>
				<%=biaobai4.getContact()%><br>
				<b>性格描述：</b>
				<%=biaobai4.getCharacter()%><br>
				<b>个人爱好：</b>
				<%=biaobai4.getPreference()%><br>
				<b>家庭住址：</b>
				<%=biaobai4.getAddress()%><br>
				<b>喜欢的类型：</b>
				<%=biaobai4.getFavoredType()%><br>
				<%
					int hashcode = biaobai4.getPhoto().hashCode();
	        		int dir1 = hashcode&0xf;  //0--15
	        		int dir2 = (hashcode&0xf0)>>4;  //0-15 %>
					<b>照片</b>
					<br>
					<img alt="" src="<%=request.getContextPath()%>/fileUpload/<%=dir1+"/" + dir2 + "/" %><%=biaobai4.getPhoto()%>"
			style="border: 0px solid black;width:150px;"><br>
			</div>
			<hr style=" clear: both;"/>
			<div style="clear: both;">
				<i class="icon-thumbs-up"></i><%=biaobai4.getLiketimes()%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<i class="icon-comment"></i><%=biaobai4.getComtimes()%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<i class="icon-calendar"></i><%=format.format(biaobai4.getIssuedate())%>
			</div>
			<hr style="background-color:#fff;;height:5px;" />
			<div style="margin: 10px 10px 10px 10px;">
				<h3>评论</h3>
				<form action="<%=request.getContextPath()%>/CommentForBai1Add"
					method="post">
					<input type="hidden" name="kind" value="1" />
					<input type="hidden" name="type" value="<%=biaobai4.getType()%>" />
					<input type="hidden" name="messageId" value="<%=id%>" />
					<input type="hidden" name="toUId"
						value="<%=biaobai4.getUsername()%>" />
					<input type="hidden" name="fromUId"
						value="<%=loginUser.getUsername()%>"> <input type="hidden"
						name="replyId" value="<%=id%>">
					<div
						style="width: 45px; height: 45px; border-radius: 100%; overflow: hidden; float: left;">
						<img src="<%=request.getContextPath()%>/headphoto/<%=loginUser.getHeadphoto()%>" width="45" height="45" />
					</div>
					<input type="text" name="content"
						style="width: 80%; height: 23px; margin: 0px 0px 0px 10px;"
						required>
					<input class="btn btn-info" type="submit" value="评论" />
				</form>
			</div>
			<hr>
			<div id="ComContent"
				style="clean: both; margin: 10px 50px 0px -20px;">
				<ul>
					<%
						List<Reply> comsAndReply = DaoFactory.getReplyDao().list(id, biaobai4.getType());
						List<Reply> comments = ClassifyCommentAndReply.GetComment(comsAndReply);
						List<Reply> replys = null;
						for (Reply reply : comments) 
						{
							replys = ClassifyCommentAndReply.GetReply(comsAndReply, reply.getId());
					%>
					<li><div style="clear: both; width:100%;" >
							<div
								style="width: 7%; height: 7%; border-radius: 100%; overflow: hidden; float: left;">
								<img src="<%=request.getContextPath()%>/headphoto/<%=DaoFactory.getUserDao().getByUserName(reply.getFrom_uid()).getHeadphoto()%>" width="45" height="45" />
							</div>
							<div style="float: left;width:90%;">
								<%=reply.getFrom_uid()%>：<%=reply.getContent()%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<button id="button" style="float: right;"  class="btn btn-info" 
									onclick="addComment(this,'2','<%=biaobai4.getType()%>','<%=id%>','<%=reply.getId()%>','<%=reply.getFrom_uid()%>','<%=loginUser.getUsername()%>')">回复</button>
								<span style="float:right;font-size:16px;color:gray;">------<%=format.format(reply.getPostDate())%>&nbsp;&nbsp;&nbsp;&nbsp;</span>
								<br />
								<div style="clear: both; float: none;">
									<%
										for (Reply reply2 : replys) 
										{//这条评论对应的回复
									%><div style="margin: 15px 0px 10px 10px; margin-left: 20px;">
										<%=reply2.getFrom_uid()%><b>&nbsp;回复&nbsp;</b><%=reply2.getTo_uid()%>:
										<%=reply2.getContent()%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<button style="float: right;"  class="btn btn-info" 
											onclick="addComment(this,'2','<%=biaobai4.getType()%>','<%=id%>','<%=reply.getId()%>','<%=reply2.getFrom_uid()%>','<%=loginUser.getUsername()%>')">回复</button>
									</div>

									<%
	  		 			}
	  		 		%>
								</div>
							</div>
						</div></li>
					<%
  				}
  				%>
				</ul>
			</div>
		</div>
	</div>
</body>
</html>