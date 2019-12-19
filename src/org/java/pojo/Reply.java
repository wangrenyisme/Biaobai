package org.java.pojo;

import java.sql.Timestamp;

/**
 * 这个类是用来存放用户的所有评论和回复信息
 * @author DELL
 *
 */
public class Reply {
	private int id;
	private String content;//评论或回复内容
	private int message_id;//对应的Message的id
	private Timestamp postDate;//评论或回复的时间
	private String to_uid;//评论或回复的目标用户
	private String from_uid;//评论或回复的用户
	private int readed;//是否已经阅读
	private int reply_id;//评论或回复的id
	private int kind;//类型，1代表评论 2代表评论的回复
	private int see;//是否可见
	private int type;
	public int getSee() {
		return see;
	}
	public void setSee(int see) {
		this.see = see;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}

	public int getMessage_id() {
		return message_id;
	}
	public void setMessage_id(int message_id) {
		this.message_id = message_id;
	}
	public Timestamp getPostDate() {
		return postDate;
	}
	public void setPostDate(Timestamp timestamp) {
		this.postDate = timestamp;
	}
	public String getTo_uid() {
		return to_uid;
	}
	public void setTo_uid(String to_uid) {
		this.to_uid = to_uid;
	}
	public String getFrom_uid() {
		return from_uid;
	}
	public void setFrom_uid(String from_uid) {
		this.from_uid = from_uid;
	}
	public int getReaded() {
		return readed;
	}
	public void setReaded(int readed) {
		this.readed = readed;
	}
	public int getReply_id() {
		return reply_id;
	}
	public void setReply_id(int reply_id) {
		this.reply_id = reply_id;
	}
	public int getKind() {
		return kind;
	}
	public void setKind(int kind) {
		this.kind = kind;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	
}
