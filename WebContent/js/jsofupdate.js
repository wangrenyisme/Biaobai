function $(id) 
{
	return document.getElementById(id);
}
var regs = {
		nameReg: /^([\u4e00-\u9fa5]){2,10}$/,
		sexReg: /^男|女$/,
		telephoneReg:/^.{11}$/,
		qqReg:/^.{5,12}$/,
		schoolReg:/^([\u4e00-\u9fa5]){4,20}$/,
		collegeReg:/^([\u4e00-\u9fa5]){4,20}$/,
		gradeReg:/^.{4}$/,
		birthday:/^[1-9]\d{3}-(0[1-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1])$/,
		numReg: /\d/,
		strReg: /[a-zA-Z]/,
		tsReg: /[^\u4e00-\u9fa5a-zA-Z0-9]/
			}
window.onload = function() 
{
	var name = $("name");
	var sex = $("sex");
	var telephone = $("telephone");
	var qq= $("qq");
	var school= $("school");
	var college= $("college");
	var grade= $("grade");
	var birthday= $("birthday");
	var ck = $("ck");
	var btn = $("btn");
	name.onkeyup=name.onfocus=name.onblur=function(evt) {
		var e = evt || window.event;//e记录了当前事件的信息
		checkname(e);
	}
	function checkname(_e) {
		var type;
		if(_e) {//如果参数有事件信息就获得type(有onkeyup,onfocus,onblur)
			type = _e.type;
		}
		var value = name.value;
		var box = name.parentNode;//获得父节点
		var tip = box.nextElementSibling;//返回元素节点之后的兄弟元素节点
		var span = tip.lastElementChild;//指定元素节点最后的子元素
		if(type=="focus") {//聚焦事件
			if(value=="") {
				box.className = "box";
				tip.className = "tip default";
				span.innerHTML = "支持汉字,2-10个字符";
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

		if(regs.nameReg.test(value)) 
		{//符合格式要求
			box.className = "box right";
			tip.className = "tip hide";
			return true;
		} else {
			box.className = "box error";//不符合格式要求
			tip.className = "tip error";
			span.innerHTML = "格式错误，仅支持汉字";
			return false;
		}
	}
	sex.onkeyup=sex.onfocus=sex.onblur=function(evt) {
		var e = evt || window.event;//e记录了当前事件的信息
		checksex(e);
	}
	function checksex(_e) {
		var type;
		if(_e) {//如果参数有事件信息就获得type(有onkeyup,onfocus,onblur)
			type = _e.type;
		}
		var value = sex.value;
		var box =sex.parentNode;//获得父节点
		var tip = box.nextElementSibling;//返回元素节点之后的兄弟元素节点
		var span = tip.lastElementChild;//指定元素节点最后的子元素
		if(type=="focus") {//聚焦事件
			if(value=="") {
				box.className = "box";
				tip.className = "tip default";
				span.innerHTML = "支持汉字,“男”或者“女”";
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

		if(regs.sexReg.test(value)) 
		{//符合格式要求
			box.className = "box right";
			tip.className = "tip hide";
			return true;
		} else {
			box.className = "box error";//不符合格式要求
			tip.className = "tip error";
			span.innerHTML = "格式错误，仅支持“男”或者“女”";
			return false;
		}
	}
	telephone.onkeyup=telephone.onfocus=telephone.onblur=function(evt) {
		var e = evt || window.event;//e记录了当前事件的信息
		checktelephone(e);
	}
	function checktelephone(_e) {
		var type;
		if(_e) {//如果参数有事件信息就获得type(有onkeyup,onfocus,onblur)
			type = _e.type;
		}
		var value = telephone.value;
		var box = telephone.parentNode;//获得父节点
		var tip = box.nextElementSibling;//返回元素节点之后的兄弟元素节点
		var span = tip.lastElementChild;//指定元素节点最后的子元素
		if(type=="focus") {//聚焦事件
			if(value=="") {
				box.className = "box";
				tip.className = "tip default";
				span.innerHTML = "支持11位手机号码";
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

		if(regs.telephoneReg.test(value)) 
		{//符合格式要求
			box.className = "box right";
			tip.className = "tip hide";
			return true;
		} else {
			box.className = "box error";//不符合格式要求
			tip.className = "tip error";
			span.innerHTML = "格式错误，仅支持11位手机号码";
			return false;
		}
	}
	
	qq.onkeyup=qq.onfocus=qq.onblur=function(evt) {
		var e = evt || window.event;//e记录了当前事件的信息
		checkqq(e);
	}
	function checkqq(_e) {
		var type;
		if(_e) {//如果参数有事件信息就获得type(有onkeyup,onfocus,onblur)
			type = _e.type;
		}
		var value = qq.value;
		var box = qq.parentNode;//获得父节点
		var tip = box.nextElementSibling;//返回元素节点之后的兄弟元素节点
		var span = tip.lastElementChild;//指定元素节点最后的子元素
		if(type=="focus") {//聚焦事件
			if(value=="") {
				box.className = "box";
				tip.className = "tip default";
				span.innerHTML = "支持5-12位数字格式qq号";
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

		if(regs.qqReg.test(value)) 
		{//符合格式要求
			box.className = "box right";
			tip.className = "tip hide";
			return true;
		} else {
			box.className = "box error";//不符合格式要求
			tip.className = "tip error";
			span.innerHTML = "格式错误，仅支持5-12位数字格式qq号";
			return false;
		}
	}
	
	school.onkeyup=school.onfocus=school.onblur=function(evt) {
		var e = evt || window.event;//e记录了当前事件的信息
		checkschool(e);
	}
	function checkschool(_e) {
		var type;
		if(_e) {//如果参数有事件信息就获得type(有onkeyup,onfocus,onblur)
			type = _e.type;
		}
		var value = school.value;
		var box = school.parentNode;//获得父节点
		var tip = box.nextElementSibling;//返回元素节点之后的兄弟元素节点
		var span = tip.lastElementChild;//指定元素节点最后的子元素
		if(type=="focus") {//聚焦事件
			if(value=="") {
				box.className = "box";
				tip.className = "tip default";
				span.innerHTML = "支持4-20位汉字输入";
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

		if(regs.schoolReg.test(value)) 
		{//符合格式要求
			box.className = "box right";
			tip.className = "tip hide";
			return true;
		} else {
			box.className = "box error";//不符合格式要求
			tip.className = "tip error";
			span.innerHTML = "格式错误，仅支持4-20位汉字输入";
			return false;
		}
	}
	college.onkeyup=college.onfocus=college.onblur=function(evt) {
		var e = evt || window.event;//e记录了当前事件的信息
		checkcollege(e);
	}
	function checkcollege(_e) {
		var type;
		if(_e) {//如果参数有事件信息就获得type(有onkeyup,onfocus,onblur)
			type = _e.type;
		}
		var value = college.value;
		var box = college.parentNode;//获得父节点
		var tip = box.nextElementSibling;//返回元素节点之后的兄弟元素节点
		var span = tip.lastElementChild;//指定元素节点最后的子元素
		if(type=="focus") {//聚焦事件
			if(value=="") {
				box.className = "box";
				tip.className = "tip default";
				span.innerHTML = "支持4-20位汉字输入";
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

		if(regs.collegeReg.test(value)) 
		{//符合格式要求
			box.className = "box right";
			tip.className = "tip hide";
			return true;
		} else {
			box.className = "box error";//不符合格式要求
			tip.className = "tip error";
			span.innerHTML = "格式错误，仅支持4-20位汉字输入";
			return false;
		}
	}
	grade.onkeyup=grade.onfocus=grade.onblur=function(evt) {
		var e = evt || window.event;//e记录了当前事件的信息
		checkgrade(e);
	}
	function checkgrade(_e) {
		var type;
		if(_e) {//如果参数有事件信息就获得type(有onkeyup,onfocus,onblur)
			type = _e.type;
		}
		var value = grade.value;
		var box = grade.parentNode;//获得父节点
		var tip = box.nextElementSibling;//返回元素节点之后的兄弟元素节点
		var span = tip.lastElementChild;//指定元素节点最后的子元素
		if(type=="focus") {//聚焦事件
			if(value=="") {
				box.className = "box";
				tip.className = "tip default";
				span.innerHTML = "支持4位数字，自己所在年级";
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

		if(regs.gradeReg.test(value)) 
		{//符合格式要求
			box.className = "box right";
			tip.className = "tip hide";
			return true;
		} else {
			box.className = "box error";//不符合格式要求
			tip.className = "tip error";
			span.innerHTML = "格式错误，仅支持4位数字，自己所在年级";
			return false;
		}
	}
	birthday.onkeyup=birthday.onfocus=birthday.onblur=function(evt) {
		var e = evt || window.event;//e记录了当前事件的信息
		checkbirthday(e);
	}
	function checkbirthday(_e) {
		var type;
		if(_e) {//如果参数有事件信息就获得type(有onkeyup,onfocus,onblur)
			type = _e.type;
		}
		var value = birthday.value;
		var box = birthday.parentNode;//获得父节点
		var tip = box.nextElementSibling;//返回元素节点之后的兄弟元素节点
		var span = tip.lastElementChild;//指定元素节点最后的子元素
		if(type=="focus") {//聚焦事件
			if(value=="") {
				box.className = "box";
				tip.className = "tip default";
				span.innerHTML = "格式错误，日期支持2000-03-24格式";
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

		if(regs.birthdayReg.test(value)) 
		{//符合格式要求
			box.className = "box right";
			tip.className = "tip hide";
			return true;
		} else {
			box.className = "box error";//不符合格式要求
			tip.className = "tip error";
			span.innerHTML = "格式错误，仅支持2000-03-24格式的日期";
			return false;
		}
	}
	btn.onclick = function() {
		var box = ck.parentNode;
		var tip = box.nextElementSibling;
		var span = tip.lastElementChild;
		if(ck.checked) {
			if(checkname()&&checksex()&&checktelephone()&&checkqq()&&checkschool()&&checkcollege()&&checkgrade()&&checkbirthday()) {
				alert("您已确认要进行修改");
			} else {
				return false;
			}
		} else {
			tip.className = "tip error";
			span.innerHTML = "请核对信息后点击确认修改";
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