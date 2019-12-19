<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">  
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
</head>  
<body>  
    用户名：  
    <input type="text" id="bobject" name="bobject" autocomplete="off" 
        onkeyup="compbobject()">  
    <div id="nameList"  
        style="width: 200px; height: auto; position: relative; left: 65px; top: -18px; display: none;background:#888888;">  
        <p onclick="selectName(this.innerHTML)">Abel1</p>  
    </div>  
</body>
</html>