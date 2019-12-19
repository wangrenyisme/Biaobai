package org.java.dao;

import java.util.List;

import org.java.pojo.Famous;

/**
 * 统计表白热度榜
 * @author DELL
 *
 */
public interface IFamousDao{
	public void add(String name);//增加一条记录，如果已经存在，那么给它的频率加1
	public void update(String name);//更新这条记录，如果有表白被删掉了，对应的表白热度棒上的数据也要有变化
	public List<Famous>load();//获取所有的数据
}