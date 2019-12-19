package org.java.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.java.dao.Biaobai5Dao;
import org.java.pojo.Biaobai5;
import org.java.util.DBUtil;

public class Biaobai5DaoImpl implements Biaobai5Dao {

	@Override
	public void addBiaobai5(Biaobai5 biaobai5) {
		// TODO Auto-generated method stub
		Connection connection = null;
		PreparedStatement preparedStatement= null;
		try {
			connection = DBUtil.getConnection();
			String sql = "insert into biaobai5(userId,bobject,title,content,contentwithouthtml,imgUrl,issuedate,comtimes,liketimes) values (?,?,?,?,?,?,?,?,?)";
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, biaobai5.getUsername());
			preparedStatement.setString(2, biaobai5.getBobject());
			preparedStatement.setString(3, biaobai5.getTitle());
			preparedStatement.setString(4, biaobai5.getContent());
			preparedStatement.setString(5, biaobai5.getContentwithouthtml());
			preparedStatement.setString(6, biaobai5.getImgUrl());
			preparedStatement.setTimestamp(7, biaobai5.getIssuedate());
			preparedStatement.setInt(8, biaobai5.getComtimes());
			preparedStatement.setInt(9, biaobai5.getLiketimes());
			preparedStatement.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(preparedStatement);
			DBUtil.close(connection);
		}
	}

	@Override
	public void deleteBiaobai5(int id) {
		// TODO Auto-generated method stub
		Connection connection = null;
		PreparedStatement preparedStatement= null;
		try {
			connection = DBUtil.getConnection();
			String sql = "delete from biaobai5 where id = '"+ id +"'";
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(preparedStatement);
			DBUtil.close(connection);
		}
	}

	@Override
	public void updateBiaobai5(Biaobai5 biaobai5) {
		// TODO Auto-generated method stub
		Connection connection = null;
		PreparedStatement preparedStatement= null;
		try {
			connection = DBUtil.getConnection();
			String sql = "update biaobai5 set bobject = '" + biaobai5.getBobject() + "', title = '" + biaobai5.getTitle() + "', content = '" + biaobai5.getContent() + "' ,contentwithouthtml = '" + biaobai5.getContentwithouthtml() + "' ,imgUrl = '" + biaobai5.getImgUrl() + "' where id = '" + biaobai5.getId() + "'";
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(preparedStatement);
			DBUtil.close(connection);
		}
	}

	@Override
	public List<Biaobai5> getAll() {
		// TODO Auto-generated method stub
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		ArrayList<Biaobai5> list = new ArrayList<Biaobai5>(); 
		Biaobai5 biaobai5 = null;
		try {
			connection = DBUtil.getConnection();
			String sql = "select * from biaobai5 order by id desc";
			preparedStatement = connection.prepareStatement(sql);
			resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				biaobai5 = new Biaobai5();
				biaobai5.setId(resultSet.getInt("id"));
				biaobai5.setUsername(resultSet.getString("userId"));
				biaobai5.setBobject(resultSet.getString("bobject"));
				biaobai5.setTitle(resultSet.getString("title"));
				biaobai5.setContent(resultSet.getString("content"));
				biaobai5.setContentwithouthtml(resultSet.getString("contentwithouthtml"));
				biaobai5.setImgUrl(resultSet.getString("imgUrl"));
				biaobai5.setLiketimes(resultSet.getInt("liketimes"));
				biaobai5.setComtimes(resultSet.getInt("comtimes"));
				biaobai5.setIssuedate(resultSet.getTimestamp("issuedate"));
				list.add(biaobai5);
			}
		}catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(resultSet);
			DBUtil.close(preparedStatement);
			DBUtil.close(connection);
		}
		return list;
	}

	@Override
	public Biaobai5 getById(int id) {
		// TODO Auto-generated method stub
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		Biaobai5 biaobai5 = null;
		try {
			connection = DBUtil.getConnection();
			String sql = "select * from biaobai5 where id = '"+ id +"'";
			preparedStatement = connection.prepareStatement(sql);
			resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				biaobai5 = new Biaobai5();
				biaobai5.setId(resultSet.getInt("id"));
				biaobai5.setUsername(resultSet.getString("userId"));
				biaobai5.setBobject(resultSet.getString("bobject"));
				biaobai5.setTitle(resultSet.getString("title"));
				biaobai5.setContent(resultSet.getString("content"));
				biaobai5.setContentwithouthtml(resultSet.getString("contentwithouthtml"));
				biaobai5.setImgUrl(resultSet.getString("imgUrl"));
				biaobai5.setLiketimes(resultSet.getInt("liketimes"));
				biaobai5.setComtimes(resultSet.getInt("comtimes"));
				biaobai5.setIssuedate(resultSet.getTimestamp("issuedate"));
				biaobai5.setType(5);
			}
		}catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(resultSet);
			DBUtil.close(preparedStatement);
			DBUtil.close(connection);
		}
		return biaobai5;
	}

	@Override
	public List<Biaobai5> getAllByUsername(String username) {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		ArrayList<Biaobai5> list = new ArrayList<Biaobai5>(); 
		Biaobai5 biaobai5 = null;
		try {
			connection = DBUtil.getConnection();
			String sql = "select * from biaobai5 where bobject = '"+username+"' order by id desc";
			preparedStatement = connection.prepareStatement(sql);
			resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				biaobai5 = new Biaobai5();
				biaobai5.setId(resultSet.getInt("id"));
				biaobai5.setUsername(resultSet.getString("userId"));
				biaobai5.setBobject(resultSet.getString("bobject"));
				biaobai5.setTitle(resultSet.getString("title"));
				biaobai5.setContent(resultSet.getString("content"));
				biaobai5.setContentwithouthtml(resultSet.getString("contentwithouthtml"));
				biaobai5.setImgUrl(resultSet.getString("imgUrl"));
				biaobai5.setLiketimes(resultSet.getInt("liketimes"));
				biaobai5.setComtimes(resultSet.getInt("comtimes"));
				biaobai5.setIssuedate(resultSet.getTimestamp("issuedate"));
				list.add(biaobai5);
			}
		}catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(resultSet);
			DBUtil.close(preparedStatement);
			DBUtil.close(connection);
		}
		return list;
	}

	@Override
	public void updateComs(int messageId) {
		Connection connection = null;
		Biaobai5 biaobai5=DaoFactory.getBiaobai5Dao().getById(messageId);
		PreparedStatement preparedStatement= null;
		try {
			connection = DBUtil.getConnection();
			String sql = "update biaobai5 set comtimes = '" + (biaobai5.getComtimes()+1) + "' "
					+ "where id = '" + biaobai5.getId() + "'";
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(preparedStatement);
			DBUtil.close(connection);
		}
	}

	@Override
	public void updateLikes(int messageId) {
		// TODO Auto-generated method stub
		Connection connection = null;
		Biaobai5 biaobai5=DaoFactory.getBiaobai5Dao().getById(messageId);
		PreparedStatement preparedStatement= null;
		try {
			connection = DBUtil.getConnection();
			String sql = "update biaobai5 set liketimes = '" + (biaobai5.getLiketimes()+1) + "' "
					+ "where id = '" + biaobai5.getId() + "'";
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(preparedStatement);
			DBUtil.close(connection);
		}
	}

}
