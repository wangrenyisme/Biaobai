<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link
	href="<%=request.getContextPath()%>/bootstrap/css/bootstrap.min.css"
	rel="stylesheet" media="screen">
<script
	src="<%=request.getContextPath()%>/vendors/modernizr-2.6.2-respond-1.1.0.min.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<frameset rows="12%,*,5%" frameborder="no" border="0" framespacing="0"  >
  <frame src="../top.jsp" name="topFrame" scrolling="No" noresize="noresize" id="topFrame" title="topFrame" />
  <frameset cols="20%,80%" frameborder="no" border="0" framespacing="0">
    <frame src="../left2.jsp" name="leftFrame" marginWidth=0 marginHeight=0 src="" noResize scrolling="yes"/>
    <frame src="biaobai<%=Integer.parseInt(request.getParameter("type")) %>Add.jsp" name="mainFrame" id="mainFrame" title="mainFrame"  marginWidth="0" marginHeight="0" />
  </frameset>
   <frame src="../bottom.jsp" name="bottomFrame" scrolling="No" noresize="noresize" id="bottomFrame" title="bottomFrame" />
</frameset>
</html>