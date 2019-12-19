package org.java.pojo;

import java.util.Date;
/**
 * 这个类用来给用户发消息提醒，如果被表白的对象是个用户，则发消息给他
 * @author DELL
 *
 */
public class BiaobaiMessage {
	private int id;
	private int type;
	private int message_id;//对应的Message的id
	private Date post_date;//评论或回复的时间
	private int readed;//是否已经阅读
	private String from_uid;//评论或回复的用户
	private String to_uid;//评论或回复的目标用户
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public int getMessage_id() {
		return message_id;
	}
	public void setMessage_id(int message_id) {
		this.message_id = message_id;
	}
	public Date getPost_date() {
		return post_date;
	}
	public void setPost_date(Date post_date) {
		this.post_date = post_date;
	}
	public int getReaded() {
		return readed;
	}
	public void setReaded(int readed) {
		this.readed = readed;
	}
	public String getFrom_uid() {
		return from_uid;
	}
	public void setFrom_uid(String from_uid) {
		this.from_uid = from_uid;
	}
	public String getTo_uid() {
		return to_uid;
	}
	public void setTo_uid(String to_uid) {
		this.to_uid = to_uid;
	}
}
