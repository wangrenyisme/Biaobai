package org.java.pojo;
import java.sql.Timestamp;
/**
 * 帮舍友表白
 * @author DELL
 *
 */
public class Biaobai3 extends BiaobaiBase{
	private String roommateName;//舍友姓名
	private String gender;//性别
	private String department;//学院
	private String grade;//年级
	private String contact;//舍友联系方式
	private String content;//内容
	private String contentwithouthtml;//去掉格式的内容
	private String imgUrl;//图片路径

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
	public String getRoommateName() {
		return roommateName;
	}
	public void setRoommateName(String roommateName) {
		this.roommateName = roommateName;
	}
	public String getContact() {
		return contact;
	}
	public void setContact(String contact) {
		this.contact = contact;
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
