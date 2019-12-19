package org.java.dao.impl;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.java.dao.Biaobai1Dao;
import org.java.pojo.Biaobai1;
import org.java.util.DBUtil;

public class Biaobai1DaoImpl implements Biaobai1Dao {

	@Override
	public void addBiaobai1(Biaobai1 biaobai1) {
		// TODO Auto-generated method stub
		Connection connection = null;
		PreparedStatement preparedStatement= null;
		String sql="";
		try {
			connection = DBUtil.getConnection();
			sql = "insert into biaobai1(userId,lovename,gender,department,grade,issuedate,comtimes,liketimes,knowtime,content,contentwithouthtml,imgUrl) values (?,?,?,?,?,?,?,?,?,?,?,?)";
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, biaobai1.getUsername());
			preparedStatement.setString(2, biaobai1.getLovename());
			preparedStatement.setString(3, biaobai1.getGender());
			preparedStatement.setString(4, biaobai1.getDepartment());
			preparedStatement.setString(5, biaobai1.getGrade());
			preparedStatement.setTimestamp(6, biaobai1.getIssuedate());
			preparedStatement.setInt(7, biaobai1.getComtimes());
			preparedStatement.setInt(8, biaobai1.getLiketimes());
			preparedStatement.setString(9, biaobai1.getKnowtime());
			preparedStatement.setString(10, biaobai1.getContent());
			preparedStatement.setString(11, biaobai1.getContentwithouthtml());
			preparedStatement.setString(12, biaobai1.getImgUrl());
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
	public void deleteBiaobai1(int id) {
		// TODO Auto-generated method stub
		Connection connection = null;
		PreparedStatement preparedStatement= null;
		try {
			connection = DBUtil.getConnection();
			String sql = "delete from biaobai1 where id = '"+ id +"'";
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
	public void updateBiaobai1(Biaobai1 biaobai1) {
		// TODO Auto-generated method stub
		Connection connection = null;
		PreparedStatement preparedStatement= null;
		try {
			connection = DBUtil.getConnection();
			String sql = "update biaobai1 set lovename = '" + biaobai1.getLovename() + "', "
					+ "gender = '" + biaobai1.getGender() + "', "
					+ "department = '" + biaobai1.getDepartment() + "' ,"
					+ "grade = '" + biaobai1.getGrade() + "' , "
					+ "knowtime = '" + biaobai1.getKnowtime() + "', "
					+ "content = '" + biaobai1.getContent() + "', "
					+ "contentwithouthtml = '" + biaobai1.getContentwithouthtml() + "', "
					+ "imgUrl = '" + biaobai1.getImgUrl() + "' "
					+ "where id = '" + biaobai1.getId() + "'";
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
	public List<Biaobai1> getAll() {
		// TODO Auto-generated method stub
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		ArrayList<Biaobai1> list = new ArrayList<Biaobai1>(); 
		Biaobai1 biaobai1 = null;
		try {
			connection = DBUtil.getConnection();
			String sql = "select * from biaobai1 order by id desc";
			preparedStatement = connection.prepareStatement(sql);
			resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {
				biaobai1 = new Biaobai1();
				biaobai1.setId(resultSet.getInt("id"));
				biaobai1.setUsername(resultSet.getString("userId"));
				biaobai1.setLovename(resultSet.getString("lovename"));
				biaobai1.setGender(resultSet.getString("gender"));
				biaobai1.setDepartment(resultSet.getString("department"));
				biaobai1.setGrade(resultSet.getString("grade"));
				biaobai1.setLiketimes(resultSet.getInt("liketimes"));
				biaobai1.setComtimes(resultSet.getInt("comtimes"));
				biaobai1.setIssuedate(resultSet.getTimestamp("issuedate"));
				biaobai1.setKnowtime(resultSet.getString("knowtime"));
				biaobai1.setContent(resultSet.getString("content"));
				biaobai1.setContentwithouthtml(resultSet.getString("contentwithouthtml"));
				biaobai1.setImgUrl(resultSet.getString("imgUrl"));
				list.add(biaobai1);
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
	public Biaobai1 getById(int id) {
		// TODO Auto-generated method stub
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		Biaobai1 biaobai1 = null;
		try {
			connection = DBUtil.getConnection();
			String sql = "select * from biaobai1 where id = '"+ id +"'";
			preparedStatement = connection.prepareStatement(sql);
			resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				biaobai1 = new Biaobai1();

				biaobai1.setId(resultSet.getInt("id"));
				biaobai1.setUsername(resultSet.getString("userId"));
				biaobai1.setLovename(resultSet.getString("lovename"));
				biaobai1.setGender(resultSet.getString("gender"));
				biaobai1.setDepartment(resultSet.getString("department"));
				biaobai1.setGrade(resultSet.getString("grade"));
				biaobai1.setLiketimes(resultSet.getInt("liketimes"));
				biaobai1.setComtimes(resultSet.getInt("comtimes"));
				biaobai1.setIssuedate(resultSet.getTimestamp("issuedate"));
				biaobai1.setKnowtime(resultSet.getString("knowtime"));
				biaobai1.setContent(resultSet.getString("content"));
				biaobai1.setContentwithouthtml(resultSet.getString("contentwithouthtml"));
				biaobai1.setImgUrl(resultSet.getString("imgUrl"));
				biaobai1.setType(1);
			}
		}catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(resultSet);
			DBUtil.close(preparedStatement);
			DBUtil.close(connection);
		}
		return biaobai1;
	}

	@Override
	public int getIdByUsername(String username) {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		int id=0;
		try {
			connection = DBUtil.getConnection();
			String sql = "select * from biaobai1 where lovename = '"+ username +"'";
			preparedStatement = connection.prepareStatement(sql);
			resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				id=resultSet.getInt("id");
			}
		}catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(resultSet);
			DBUtil.close(preparedStatement);
			DBUtil.close(connection);
		}
		return id;
	}

	@Override
	public void updateComs(int messageId) {
		Connection connection = null;
		Biaobai1 biaobai1=DaoFactory.getBiaobai1Dao().getById(messageId);
		PreparedStatement preparedStatement= null;
		try {
			connection = DBUtil.getConnection();
			String sql = "update biaobai1 set comtimes = '" + (biaobai1.getComtimes()+1) + "' "
					+ "where id = '" + biaobai1.getId() + "'";
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
		Biaobai1 biaobai1=DaoFactory.getBiaobai1Dao().getById(messageId);
		PreparedStatement preparedStatement= null;
		try {
			connection = DBUtil.getConnection();
			String sql = "update biaobai1 set liketimes = '" + (biaobai1.getLiketimes()+1) + "' "
					+ "where id = '" + biaobai1.getId() + "'";
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
