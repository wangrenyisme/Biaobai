package org.java.pojo;
/**
 * 之前认识
 * @author DELL
 *
 */
public class Biaobai1 extends BiaobaiBase{
	private String lovename;//姓名
	private String gender;//性别
	private String department;//学院
	private String grade;//年级
	private String knowtime;//认识时间
	
	private String content;//内容
	private String contentwithouthtml;//去掉格式的内容
	private String imgUrl;//图片路径
	
	public String getLovename() {
		return lovename;
	}
	public void setLovename(String lovename) {
		this.lovename = lovename;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getDepartment() {
		return department;
	}
	public void setDepartment(String department) {
		this.department = department;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public String getKnowtime() {
		return knowtime;
	}
	public void setKnowtime(String knowtime) {
		this.knowtime = knowtime;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getContentwithouthtml() {
		return contentwithouthtml;
	}
	public void setContentwithouthtml(String contentwithouthtml) {
		this.contentwithouthtml = contentwithouthtml;
	}
	public String getImgUrl() {
		return imgUrl;
	}
	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}

}
