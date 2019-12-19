package org.java.dao;

import java.util.List;

import org.java.pojo.Reply;


/**
 * 评论和回复的增删改查
 * @author DELL
 *
 */
public interface IReplyDao {
	public void add(Reply reply);
	public void delete(int id);//删除评论
	public void delete(int m_id,int kind,int r_id);//删除对评论的回复，参数中包含Message的id，Reply的类型和Reply的id
	public void update(Reply reply);//更新Reply
	public List<Reply>list(int m_id,int type);
	public List<Reply> list(String to_uid);//根据用户的id找出所有给这个用户的Reply，为了消息通知
}
