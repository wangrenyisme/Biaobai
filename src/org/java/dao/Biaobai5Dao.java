package org.java.dao;

import java.util.List;

import org.java.pojo.Biaobai5;
public interface Biaobai5Dao {
	public void addBiaobai5(Biaobai5 biaobai5);
	public void deleteBiaobai5(int id);
	public void updateBiaobai5(Biaobai5 biaobai5);
	public List<Biaobai5> getAll();
	public Biaobai5 getById(int id);
	public List<Biaobai5> getAllByUsername(String username);
	//更新评论数量
	public void updateComs(int messageId);
	public void updateLikes(int messageId);
}
