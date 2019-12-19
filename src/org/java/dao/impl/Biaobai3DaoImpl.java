package org.java.dao.impl;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.java.dao.Biaobai3Dao;
import org.java.pojo.Biaobai3;
import org.java.util.DBUtil;

public class Biaobai3DaoImpl implements Biaobai3Dao {

	@Override
	public void addBiaobai3(Biaobai3 biaobai3) {
		// TODO Auto-generated method stub
		Connection connection = null;
		PreparedStatement preparedStatement= null;
		String sql="";
		try {
			connection = DBUtil.getConnection();
			sql = "insert into biaobai3(userId,roommateName,gender,department,grade,issuedate,comtimes,liketimes,contact,content,contentwithouthtml,imgUrl) values (?,?,?,?,?,?,?,?,?,?,?,?)";
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, biaobai3.getUsername());
			preparedStatement.setString(2, biaobai3.getRoommateName());
			preparedStatement.setString(3, biaobai3.getGender());
			preparedStatement.setString(4, biaobai3.getDepartment());
			preparedStatement.setString(5, biaobai3.getGrade());
			preparedStatement.setTimestamp(6, biaobai3.getIssuedate());
			preparedStatement.setInt(7, biaobai3.getComtimes());
			preparedStatement.setInt(8, biaobai3.getLiketimes());
			preparedStatement.setString(9, biaobai3.getContact());
			preparedStatement.setString(10, biaobai3.getContent());
			preparedStatement.setString(11, biaobai3.getContentwithouthtml());
			preparedStatement.setString(12, biaobai3.getImgUrl());
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
	public void deleteBiaobai3(int id) {
		// TODO Auto-generated method stub
		Connection connection = null;
		PreparedStatement preparedStatement= null;
		try {
			connection = DBUtil.getConnection();
			String sql = "delete from biaobai3 where id = '"+ id +"'";
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
	public void updateBiaobai3(Biaobai3 biaobai3) {
		// TODO Auto-generated method stub
		Connection connection = null;
		PreparedStatement preparedStatement= null;
		try {
			connection = DBUtil.getConnection();
			String sql = "update biaobai3 set lovename = '" + biaobai3.getRoommateName() + "', "
					+ "gender = '" + biaobai3.getGender() + "', "
					+ "department = '" + biaobai3.getDepartment() + "' ,"
					+ "grade = '" + biaobai3.getGrade() + "' , "
					+ "knowtime = '" + biaobai3.getContact() + "', "
					+ "content = '" + biaobai3.getContent() + "', "
					+ "contentwithouthtml = '" + biaobai3.getContentwithouthtml() + "', "
					+ "imgUrl = '" + biaobai3.getImgUrl() + "' "
					+ "where id = '" + biaobai3.getId() + "'";
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
	public List<Biaobai3> getAll() {
		// TODO Auto-generated method stub
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		ArrayList<Biaobai3> list = new ArrayList<Biaobai3>(); 
		Biaobai3 biaobai3 = null;
		try {
			connection = DBUtil.getConnection();
			String sql = "select * from biaobai3 order by id desc";
			preparedStatement = connection.prepareStatement(sql);
			resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				biaobai3 = new Biaobai3();
				biaobai3.setId(resultSet.getInt("id"));
				biaobai3.setUsername(resultSet.getString("userId"));

				biaobai3.setRoommateName(resultSet.getString("roommateName"));
				biaobai3.setGender(resultSet.getString("gender"));
				biaobai3.setDepartment(resultSet.getString("department"));
				biaobai3.setGrade(resultSet.getString("grade"));
				biaobai3.setLiketimes(resultSet.getInt("liketimes"));
				biaobai3.setComtimes(resultSet.getInt("comtimes"));
				biaobai3.setIssuedate(resultSet.getTimestamp("issuedate"));
				biaobai3.setContact(resultSet.getString("contact"));
				biaobai3.setContent(resultSet.getString("content"));
				biaobai3.setContentwithouthtml(resultSet.getString("contentwithouthtml"));
				biaobai3.setImgUrl(resultSet.getString("imgUrl"));
				list.add(biaobai3);
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
	public Biaobai3 getById(int id) {
		// TODO Auto-generated method stub
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		Biaobai3 biaobai3 = null;
		try {
			connection = DBUtil.getConnection();
			String sql = "select * from biaobai3 where id = '"+ id +"'";
			preparedStatement = connection.prepareStatement(sql);
			resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				biaobai3 = new Biaobai3();
				biaobai3.setId(resultSet.getInt("id"));
				biaobai3.setUsername(resultSet.getString("userId"));
				biaobai3.setRoommateName(resultSet.getString("roommateName"));
				biaobai3.setGender(resultSet.getString("gender"));
				biaobai3.setDepartment(resultSet.getString("department"));
				biaobai3.setGrade(resultSet.getString("grade"));
				biaobai3.setLiketimes(resultSet.getInt("liketimes"));
				biaobai3.setComtimes(resultSet.getInt("comtimes"));
				biaobai3.setIssuedate(resultSet.getTimestamp("issuedate"));
				biaobai3.setContact(resultSet.getString("contact"));
				biaobai3.setContent(resultSet.getString("content"));
				biaobai3.setContentwithouthtml(resultSet.getString("contentwithouthtml"));
				biaobai3.setImgUrl(resultSet.getString("imgUrl"));
				biaobai3.setType(3);
			}
		}catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(resultSet);
			DBUtil.close(preparedStatement);
			DBUtil.close(connection);
		}
		return biaobai3;
	}

	@Override
	public void updateComs(int messageId) {
		Connection connection = null;
		Biaobai3 biaobai3=DaoFactory.getBiaobai3Dao().getById(messageId);
		PreparedStatement preparedStatement= null;
		try {
			connection = DBUtil.getConnection();
			String sql = "update biaobai3 set comtimes = '" + (biaobai3.getComtimes()+1) + "' "
					+ "where id = '" + biaobai3.getId() + "'";
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
		Biaobai3 biaobai3=DaoFactory.getBiaobai3Dao().getById(messageId);
		PreparedStatement preparedStatement= null;
		try {
			connection = DBUtil.getConnection();
			String sql = "update biaobai3 set liketimes = '" + (biaobai3.getLiketimes()+1) + "' "
					+ "where id = '" + biaobai3.getId() + "'";
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
