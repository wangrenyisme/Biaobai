<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" charset="utf-8" src="../Ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="../Ueditor/ueditor.all.min.js"> </script>
<script type="text/javascript" charset="utf-8" src="../Ueditor/lang/zh-cn/zh-cn.js"></script>
<link
	href="<%=request.getContextPath()%>/bootstrap/css/bootstrap.min.css"
	rel="stylesheet" media="screen">
<script
	src="<%=request.getContextPath()%>/vendors/modernizr-2.6.2-respond-1.1.0.min.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
<script type="text/javascript">
	function aa(){
		var content=UE.getEditor('editor').getContentTxt();
		document.getElementById("hiddneContent").value=content;
	}
    var compbobject = function() {  
        //1.创建XMLHttpRequest对象  
        var xmlRequest = new XMLHttpRequest();  
        //alert(xmlRequest);  
        //2.发送请求  
        var bobject = document.getElementById("bobject").value;  
        if (bobject == '') {  
            return;  
        }  
        xmlRequest.open("POST", "/Biaobai/FindBiaobai5Object", true); //第三个参数必须   
        xmlRequest.setRequestHeader("Content-type",  
                "application/x-www-form-urlencoded");  
        xmlRequest.send("bobject=" + bobject + "&r=" + new Date());  
  
        xmlRequest.onreadystatechange = function() {  
            if (xmlRequest.readyState == 4) {//如果响应状态为4,说明响应成功  
                var resp = xmlRequest.responseText;  
                var rst = eval("(" + resp + ")");//转换json字符串为js对象  
                var nameArray = rst.list;  
                var i;  
                var nameList = document.getElementById("nameList");  
                nameList.innerHTML = '';  
                for (i = 0; i < nameArray.length; i++) {  
                    //alert(nameArray[i]);  
                    var newP = document.createElement("p");  
                    newP.innerHTML = nameArray[i];  
                    newP.onclick = function() { //给每一个添加点击事件  
                        //alert();  
                        document.getElementById("bobject").value = this.innerHTML;  
                        nameList.style.display = 'none';  
                    };  
                    nameList.appendChild(newP);  
                }  
                nameList.style.display = 'block';  
                //解析  
                //alert(resp);  
  
            }  
        };  
    };  
    function selectName(html) {  
        document.getElementById("bobject").value = html;  
        var nameList = document.getElementById("nameList");  
        nameList.style.display = 'none';  
    }  
</script>  
<title>其他类型</title>
</head>
<body>
<div style="margin-left:10%;margin-top:10px;">
<form action="../Biaobai5Add" method="post" onsubmit="aa()">
	<label for="name" style="float: left">表白对象</label>
		&nbsp;<input type="text" id="bobject" name="bobject" autocomplete="off" onkeyup="compbobject()">  
    <div id="nameList"  
        style="width: 200px; height: auto; position: relative; left: 65px; top: -10px; display:none;background:#E6E6FA;">  
        <p onclick="selectName(this.innerHTML)">Abel1</p>
    </div>
		<div style="clear: both"></div>
		<label for="name" style="float: left">表白主题</label>
		&nbsp; <input type="text" name="title">
		<div style="clear: both"></div>
		<div>
			<div style="float: left;">
				<p>表白内容&nbsp;&nbsp;</p>
			</div>
			<div style="float: left;">
				<input id="hiddneContent" type="hidden" name="contentwithouthtml"
					value="">
				<textarea id="editor" style="width: 800px; height: 400px"
					name="content"></textarea>
				<script type="text/javascript" charset="utf-8">
						UE.getEditor('editor');
				</script>
			</div>
		</div>
		<br />
		<div style="clear: both">
			<div style="float: left;">
				<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
			</div>
			<br /> <input class="btn btn-primary" type="submit" value="表白">
		</div>
</form>
</div>
</body>
</html>