package org.java.pojo;
/**
 * 之前不认识
 * @author DELL
 *
 */
public class Biaobai2 extends BiaobaiBase {
	private String gender;//性别
	private String contact;//联系方式
	private String content;//内容
	private String contentwithouthtml;//去掉格式的内容
	private String imgUrl;//图片路径
	

	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
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
