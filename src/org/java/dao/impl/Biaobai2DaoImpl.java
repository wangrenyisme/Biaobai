package org.java.dao.impl;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.java.dao.Biaobai2Dao;
import org.java.pojo.Biaobai2;
import org.java.util.DBUtil;

public class Biaobai2DaoImpl implements Biaobai2Dao {

	@Override
	public void addBiaobai2(Biaobai2 biaobai2) {
		// TODO Auto-generated method stub
		Connection connection = null;
		PreparedStatement preparedStatement= null;
		String sql="";
		try {
			connection = DBUtil.getConnection();
			sql = "insert into biaobai2(userId,gender,issuedate,comtimes,liketimes,content,contentwithouthtml,imgUrl,contact) values (?,?,?,?,?,?,?,?,?)";
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, biaobai2.getUsername());
			preparedStatement.setString(2, biaobai2.getGender());
			preparedStatement.setTimestamp(3, biaobai2.getIssuedate());
			preparedStatement.setInt(4, biaobai2.getComtimes());
			preparedStatement.setInt(5, biaobai2.getLiketimes());
			preparedStatement.setString(6, biaobai2.getContent());
			preparedStatement.setString(7, biaobai2.getContentwithouthtml());
			preparedStatement.setString(8, biaobai2.getImgUrl());
			preparedStatement.setString(9, biaobai2.getContact());
			preparedStatement.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(sql);
		} finally {
			DBUtil.close(preparedStatement);
			DBUtil.close(connection);
		}
	}

	@Override
	public void deleteBiaobai2(int id) {
		// TODO Auto-generated method stub
		Connection connection = null;
		PreparedStatement preparedStatement= null;
		try {
			connection = DBUtil.getConnection();
			String sql = "delete from biaobai2 where id = '"+ id +"'";
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
	public void updateBiaobai2(Biaobai2 biaobai2) {
		// TODO Auto-generated method stub
		Connection connection = null;
		PreparedStatement preparedStatement= null;
		try {
			connection = DBUtil.getConnection();
			String sql = "update biaobai2 set gender = '" + biaobai2.getGender() + "', "
					+ "contact = '" + biaobai2.getContact() + "', "
					+ "content = '" + biaobai2.getContent() + "', "
					+ "contentwithouthtml = '" + biaobai2.getContentwithouthtml() + "', "
					+ "imgUrl = '" + biaobai2.getImgUrl() + "' "
					+ "where id = '" + biaobai2.getId() + "'";
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
	public List<Biaobai2> getAll() {
		// TODO Auto-generated method stub
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		ArrayList<Biaobai2> list = new ArrayList<Biaobai2>(); 
		Biaobai2 biaobai2 = null;
		try {
			connection = DBUtil.getConnection();
			String sql = "select * from biaobai2 order by id desc";
			preparedStatement = connection.prepareStatement(sql);
			resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {
				biaobai2 = new Biaobai2();
				biaobai2.setId(resultSet.getInt("id"));
				biaobai2.setUsername(resultSet.getString("userId"));
				biaobai2.setGender(resultSet.getString("gender"));
				biaobai2.setLiketimes(resultSet.getInt("liketimes"));
				biaobai2.setComtimes(resultSet.getInt("comtimes"));
				biaobai2.setIssuedate(resultSet.getTimestamp("issuedate"));
				biaobai2.setContent(resultSet.getString("contact"));
				biaobai2.setContent(resultSet.getString("content"));
				biaobai2.setContentwithouthtml(resultSet.getString("contentwithouthtml"));
				biaobai2.setImgUrl(resultSet.getString("imgUrl"));
				list.add(biaobai2);
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
	public Biaobai2 getById(int id) {
		// TODO Auto-generated method stub
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		Biaobai2 biaobai2 = null;
		try {
			connection = DBUtil.getConnection();
			String sql = "select * from biaobai2 where id = '"+ id +"'";
			preparedStatement = connection.prepareStatement(sql);
			resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				biaobai2 = new Biaobai2();
				biaobai2.setId(resultSet.getInt("id"));
				biaobai2.setUsername(resultSet.getString("userId"));
				biaobai2.setGender(resultSet.getString("gender"));
				biaobai2.setLiketimes(resultSet.getInt("liketimes"));
				biaobai2.setComtimes(resultSet.getInt("comtimes"));
				biaobai2.setIssuedate(resultSet.getTimestamp("issuedate"));
				biaobai2.setContent(resultSet.getString("contact"));
				biaobai2.setContent(resultSet.getString("content"));
				biaobai2.setContentwithouthtml(resultSet.getString("contentwithouthtml"));
				biaobai2.setImgUrl(resultSet.getString("imgUrl"));
				biaobai2.setType(2);
			}
		}catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(resultSet);
			DBUtil.close(preparedStatement);
			DBUtil.close(connection);
		}
		return biaobai2;
	}
	@Override
	public void updateComs(int messageId) {
		Connection connection = null;
		Biaobai2 biaobai2=DaoFactory.getBiaobai2Dao().getById(messageId);
		PreparedStatement preparedStatement= null;
		try {
			connection = DBUtil.getConnection();
			String sql = "update biaobai2 set comtimes = '" + (biaobai2.getComtimes()+1) + "' "
					+ "where id = '" + biaobai2.getId() + "'";
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
		Biaobai2 biaobai2=DaoFactory.getBiaobai2Dao().getById(messageId);
		PreparedStatement preparedStatement= null;
		try {
			connection = DBUtil.getConnection();
			String sql = "update biaobai2 set liketimes = '" + (biaobai2.getLiketimes()+1) + "' "
					+ "where id = '" + biaobai2.getId() + "'";
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
