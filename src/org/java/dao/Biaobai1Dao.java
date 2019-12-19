package org.java.dao;

import java.util.List;

import org.java.pojo.Biaobai1;
public interface Biaobai1Dao {
	public void addBiaobai1(Biaobai1 biaobai1);
	public void deleteBiaobai1(int id);
	public void updateBiaobai1(Biaobai1 biaobai1);
	
	public List<Biaobai1> getAll();
	public Biaobai1 getById(int id);
	//根据用户的名字获取一条关于他的表白的id
	public int getIdByUsername(String username);
	//更新评论数量
	public void updateComs(int messageId);
	public void updateLikes(int messageId);
}
