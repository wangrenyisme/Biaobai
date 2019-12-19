package org.java.dao;

import java.util.List;

import org.java.pojo.Biaobai3;
public interface Biaobai3Dao {
	public void addBiaobai3(Biaobai3 biaobai3);
	public void deleteBiaobai3(int id);
	public void updateBiaobai3(Biaobai3 biaobai3);
	public List<Biaobai3> getAll();
	public Biaobai3 getById(int id);
	//更新评论数量
	public void updateComs(int messageId);
	public void updateLikes(int messageId);
}
