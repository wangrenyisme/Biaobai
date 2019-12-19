package org.java.pojo;

import java.sql.Timestamp;

public abstract class BiaobaiBase {
	private int id;
	private String username;
	private int comtimes;//评论数
	private int liketimes;//点赞数
	private Timestamp issuedate;//发布时间
	private int type;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public int getComtimes() {
		return comtimes;
	}
	public void setComtimes(int comtimes) {
		this.comtimes = comtimes;
	}
	public int getLiketimes() {
		return liketimes;
	}
	public void setLiketimes(int liketimes) {
		this.liketimes = liketimes;
	}
	public Timestamp getIssuedate() {
		return issuedate;
	}
	public void setIssuedate(Timestamp issuedate) {
		this.issuedate = issuedate;
	}
	
}
