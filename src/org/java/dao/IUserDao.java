package org.java.dao;

import java.util.List;

import org.java.pojo.User;
public interface IUserDao 
{
	public User login(String username, String password);
	public void addUser(User user);
	public void updateUser(User user);
	public User getByUserName(String username);
	//根据受表白人的姓名查找到所有人发送表白通知
	public List<User> getByName(String name);
	
	public void updateMessage(User user);
	public void updateHeadPhoto(User user);
}
