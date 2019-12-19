package org.java.dao;

import java.util.List;

import org.java.pojo.Biaobai2;
public interface Biaobai2Dao {
	public void addBiaobai2(Biaobai2 biaobai2);
	public void deleteBiaobai2(int id);
	public void updateBiaobai2(Biaobai2 biaobai2);
	public List<Biaobai2> getAll();
	public Biaobai2 getById(int id);
	//更新评论数量
	public void updateComs(int messageId);
	public void updateLikes(int messageId);
}
