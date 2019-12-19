function $(id) 
{
	return document.getElementById(id);
}
var regs = {
		userNameReg: /^(([\u4e00-\u9fa5])|[a-zA-Z0-9-_]){4,20}$/,
		pwdReg: /^.{6,20}$/,
		numReg: /\d/,
		strReg: /[a-zA-Z]/,
		tsReg: /[^\u4e00-\u9fa5a-zA-Z0-9]/
			}
window.onload = function() 
{
	var userName = $("username");
	var pwd = $("pwd");
	var pwd2 = $("pwd2");
	var ck = $("ck");
	var btn = $("btn");
	userName.onkeyup=userName.onfocus=userName.onblur=function(evt) {
		var e = evt || window.event;//e记录了当前事件的信息
		checkUserName(e);
	}
	function checkUserName(_e) {
		var type;
		if(_e) {//如果参数有事件信息就获得type(有onkeyup,onfocus,onblur)
			type = _e.type;
		}
		var value = userName.value;
		var box = userName.parentNode;//获得父节点
		var tip = box.nextElementSibling;//返回元素节点之后的兄弟元素节点
		var span = tip.lastElementChild;//指定元素节点最后的子元素
		if(type=="focus") {//聚焦事件
			if(value=="") {
				box.className = "box";
				tip.className = "tip default";
				span.innerHTML = "支持汉字、字母、数字、“-”“_”的组合，4-20个字符";
				return false;
			}
		}
		if(type=="blur") {//失焦事件
			if(value=="") {
				box.className = "box";
				tip.className = "tip hide";
				return false;//不继续往下走
			}
		}

		if(value=="") {//空值事件
			box.className = "box error";
			tip.className = "tip error";
			span.innerHTML = "用户名不能为空";
			return false;
		} else if(regs.userNameReg.test(value)) {//符合格式要求
			box.className = "box right";
			tip.className = "tip hide";
			return true;
		} else {
			box.className = "box error";//不符合格式要求
			tip.className = "tip error";
			span.innerHTML = "格式错误，仅支持汉字、字母、数字、“-”“_”的组合，4-20个字符";
			return false;
		}
	}

	pwd.onkeyup=pwd.onfocus=pwd.onblur=function(evt) {
		var e = evt || window.event;
		checkPwd(e);
	}
	function checkPwd(_e) {
		var type;
		if(_e) {
			type = _e.type;
		}
		var value = pwd.value;
		var box = pwd.parentNode;
		var tip = box.nextElementSibling;
		var span = tip.lastElementChild;
		if(type=="focus") {
			if(value=="") {
				box.className = "box";
				tip.className = "tip default";
				span.innerHTML = "建议使用字母、数字和符号两种以上的组合,6-20个字符";
				return false;
			}
		}
		if(type=="blur") {
			if(value=="") {
				box.className = "box";
				tip.className = "tip hide";
				return false;
			}
		}

		if(value=="") {
			box.className = "box error";
			tip.className = "tip error";
			span.innerHTML = "密码不能为空";
			return false;
		} else if(regs.pwdReg.test(value)) {
			box.className = "box right";
			tip.className = "tip hide";
			return true;
		} else {
			box.className = "box error";
			tip.className = "tip error";
			span.innerHTML = "密码长度应在6-20个字符之间";
			return false;
		}
	}
	pwd2.onkeyup=pwd2.onfocus=pwd2.onblur=function(evt) {
		var e = evt || window.event;
		checkPwd2(e);
	}
	function checkPwd2(_e) {
		var type;
		if(_e) {
			type = _e.type;
		}
		var value1 = pwd.value;
		var value = pwd2.value;
		var box = pwd2.parentNode;
		var tip = box.nextElementSibling;
		var span = tip.lastElementChild;
		if(type=="focus") {
			if(value=="") {
				box.className = "box";
				tip.className = "tip default";
				span.innerHTML = "请再次输入密码";
				return false;
			}
		}
		if(type=="blur") {
			if(value=="") {
				box.className = "box";
				tip.className = "tip hide";
				return false;
			}
		}
		if(value == "") {
			box.className = "box error";
			tip.className = "tip error";
			span.innerHTML = "请再次输入密码";
			return false;
		} else if(value1 == value) {
			box.className = "box right";
			tip.className = "tip hide";
			return true;
		} else {
			box.className = "box error";
			tip.className = "tip error";
			span.innerHTML = "两次密码不一致";
			return false;
		}
	}
	btn.onclick = function() {
		var box = ck.parentNode;
		var tip = box.nextElementSibling;
		var span = tip.lastElementChild;
		if(ck.checked) {
			if(checkUserName()&&checkPwd()&&checkPwd2()) {
				alert("注册成功！");
			} else {
				return false;
			}
		} else {
			tip.className = "tip error";
			span.innerHTML = "请同意协议";
			return false;
		}
	}
	ck.onclick = function() {
		var box = ck.parentNode;
		var tip = box.nextElementSibling;
		var span = tip.lastElementChild;
		if(ck.checked) {
			tip.className = "tip hide";
		}
	}
}
function getPwdLevel(pwd) {
	var level = 0;
	var numReg=true, strReg=true, tsReg=true;
	for(var i=0; i<pwd.length; i++) {
		if(numReg&&regs.numReg.test(pwd[i])) {//test测试参数是否匹配正则表达式
			level++;
			numReg = false;
			continue;
		}
		if(strReg&&regs.strReg.test(pwd[i])) {
			level++;
			strReg = false;
			continue;
		}
		if(tsReg&&regs.tsReg.test(pwd[i])) {
			level++;
			tsReg = false;
		}
	}
	return level;
}