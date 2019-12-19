package org.java.dao.impl;

import org.java.dao.Biaobai1Dao;
import org.java.dao.Biaobai2Dao;
import org.java.dao.Biaobai3Dao;
import org.java.dao.Biaobai4Dao;
import org.java.dao.Biaobai5Dao;
import org.java.dao.DepartmentDao;
import org.java.dao.IFamousDao;
import org.java.dao.IMessageDao;
import org.java.dao.IReplyDao;
import org.java.dao.IUserDao;

public class DaoFactory {
	public static Biaobai1Dao getBiaobai1Dao(){
		return new Biaobai1DaoImpl();
	}
	public static Biaobai2Dao getBiaobai2Dao(){
		return new Biaobai2DaoImpl();
	}
	public static Biaobai3Dao getBiaobai3Dao(){
		return new Biaobai3DaoImpl();
	}
	public static Biaobai4Dao getBiaobai4Dao(){
		return new Biaobai4DaoImpl();
	}
	public static Biaobai5Dao getBiaobai5Dao(){
		return new Biaobai5DaoImpl();
	}
	public static DepartmentDao getDepartmentDao(){
		return new DepartmentDaoImpl();
	}
	public static IReplyDao getReplyDao(){
		return new ReplyDao();
	}
	public static IUserDao getUserDao(){
		return new UserDao();
	}
	public static IMessageDao getMessageDao(){
		return new MessageDao();
	}
	public static IFamousDao getFamousDao(){
		return new FamousDao();
	}
}
