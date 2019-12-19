package org.java.pojo;

import java.sql.Timestamp;
/**
 * 其他表白
 * @author DELL
 *
 */
public class Biaobai5 extends BiaobaiBase{

	private String bobject;//表白对象
	private String title;//标题
	private String content;//内容
	private String contentwithouthtml;//去掉格式的内容
	private String imgUrl;//图片路径
	public String getImgUrl() {
		return imgUrl;
	}
	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}

	public String getBobject() {
		return bobject;
	}
	public void setBobject(String bobject) {
		this.bobject = bobject;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
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

	
}
