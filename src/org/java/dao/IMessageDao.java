package org.java.dao;


import java.util.List;

import org.java.pojo.BiaobaiMessage;

/**
 * 对评论和表白进行消息提醒的操作
 * 
 * @author DELL
 *
 */
public interface IMessageDao {
	public void add(BiaobaiMessage biaobai);//添加
	public void delete(int id);//删除
	public void update(BiaobaiMessage biaobai);//更新数据库中原有的BiaobaiMessage对象
	public BiaobaiMessage load(int id);//通过自己的id获取到BiaobaiMessage对象
	public List<BiaobaiMessage> list();//查询数据库中对这个用户表白的数据
	public List<BiaobaiMessage> list(String username);//根据用户id查询数据库中对这个用户表白的数据
}
