package org.java.dao.impl;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.java.dao.Biaobai4Dao;
import org.java.pojo.Biaobai4;
import org.java.util.DBUtil;

public class Biaobai4DaoImpl implements Biaobai4Dao {

	@Override
	public void addBiaobai4(Biaobai4 biaobai4) {
		// TODO Auto-generated method stub
		Connection connection = null;
		PreparedStatement preparedStatement= null;
		String sql="";
		try {
			connection = DBUtil.getConnection();
			sql = "insert into biaobai4(userId,username,gender,department,grade,issuedate,comtimes,liketimes,contact,characterInfo,preference,address,favoredType,photo) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, biaobai4.getUsername());
			preparedStatement.setString(2, biaobai4.getName());
			preparedStatement.setString(3, biaobai4.getGender());
			preparedStatement.setString(4, biaobai4.getDepartment());
			preparedStatement.setString(5, biaobai4.getGrade());
			preparedStatement.setTimestamp(6, biaobai4.getIssuedate());
			preparedStatement.setInt(7, biaobai4.getComtimes());
			preparedStatement.setInt(8, biaobai4.getLiketimes());
			preparedStatement.setString(9, biaobai4.getContact());
			preparedStatement.setString(10, biaobai4.getCharacter());
			preparedStatement.setString(11, biaobai4.getPreference());
			preparedStatement.setString(12, biaobai4.getAddress());
			preparedStatement.setString(13, biaobai4.getFavoredType());
			preparedStatement.setString(14, biaobai4.getPhoto());
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
	public void deleteBiaobai4(int id) {
		// TODO Auto-generated method stub
		Connection connection = null;
		PreparedStatement preparedStatement= null;
		try {
			connection = DBUtil.getConnection();
			String sql = "delete from biaobai4 where id = '"+ id +"'";
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
	public void updateBiaobai4(Biaobai4 biaobai4) {
		// TODO Auto-generated method stub
		Connection connection = null;
		PreparedStatement preparedStatement= null;
		try {
			connection = DBUtil.getConnection();
			String sql = "update biaobai4 set username = '" + biaobai4.getName() + "', "
					+ "gender = '" + biaobai4.getGender() + "', "
					+ "department = '" + biaobai4.getDepartment() + "' ,"
					+ "grade = '" + biaobai4.getGrade() + "' , "
					+ "liketimes = '" + biaobai4.getLiketimes() + "' , "
					+ "comtimes = '" + biaobai4.getComtimes() + "', "
					+ "contact = '" + biaobai4.getContact() + "', "
					+ "characterInfo = '" + biaobai4.getCharacter() + "', "
					+ "preference = '" + biaobai4.getPreference() + "', "
					+ "address = '" + biaobai4.getAddress() + "', "
					+ "favoredType = '" + biaobai4.getFavoredType() + "', "
					+ "photo = '" + biaobai4.getPhoto() + "' "
					+ "where id = '" + biaobai4.getId() + "'";
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
	public List<Biaobai4> getAll() {
		// TODO Auto-generated method stub
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		ArrayList<Biaobai4> list = new ArrayList<Biaobai4>(); 
		Biaobai4 biaobai4 = null;
		try {
			connection = DBUtil.getConnection();
			String sql = "select * from biaobai4 order by id desc";
			preparedStatement = connection.prepareStatement(sql);
			resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				biaobai4 = new Biaobai4();
				biaobai4.setId(resultSet.getInt("id"));
				biaobai4.setUsername(resultSet.getString("userId"));
				biaobai4.setName(resultSet.getString("username"));
				biaobai4.setGender(resultSet.getString("gender"));
				biaobai4.setDepartment(resultSet.getString("department"));
				biaobai4.setGrade(resultSet.getString("grade"));
				biaobai4.setLiketimes(resultSet.getInt("liketimes"));
				biaobai4.setComtimes(resultSet.getInt("comtimes"));
				biaobai4.setIssuedate(resultSet.getTimestamp("issuedate"));
				biaobai4.setContact(resultSet.getString("contact"));
				biaobai4.setCharacter(resultSet.getString("characterInfo"));
				biaobai4.setPreference(resultSet.getString("preference"));
				biaobai4.setAddress(resultSet.getString("address"));
				biaobai4.setFavoredType(resultSet.getString("favoredType"));
				biaobai4.setPhoto(resultSet.getString("photo"));
				list.add(biaobai4);
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
	public Biaobai4 getById(int id) {
		// TODO Auto-generated method stub
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		Biaobai4 biaobai4 = null;
		try {
			connection = DBUtil.getConnection();
			String sql = "select * from biaobai4 where id = '"+ id +"'";
			preparedStatement = connection.prepareStatement(sql);
			resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				biaobai4 = new Biaobai4();
				biaobai4.setId(resultSet.getInt("id"));
				biaobai4.setUsername(resultSet.getString("userId"));
				biaobai4.setName(resultSet.getString("username"));
				biaobai4.setGender(resultSet.getString("gender"));
				biaobai4.setDepartment(resultSet.getString("department"));
				biaobai4.setGrade(resultSet.getString("grade"));
				biaobai4.setLiketimes(resultSet.getInt("liketimes"));
				biaobai4.setComtimes(resultSet.getInt("comtimes"));
				biaobai4.setIssuedate(resultSet.getTimestamp("issuedate"));
				biaobai4.setContact(resultSet.getString("contact"));
				biaobai4.setCharacter(resultSet.getString("characterInfo"));
				biaobai4.setPreference(resultSet.getString("preference"));
				biaobai4.setAddress(resultSet.getString("address"));
				biaobai4.setFavoredType(resultSet.getString("favoredType"));
				biaobai4.setPhoto(resultSet.getString("photo"));
				biaobai4.setType(4);
			}
		}catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(resultSet);
			DBUtil.close(preparedStatement);
			DBUtil.close(connection);
		}
		return biaobai4;
	}

	@Override
	public void updateComs(int messageId) {
		Connection connection = null;
		Biaobai4 biaobai4=DaoFactory.getBiaobai4Dao().getById(messageId);
		PreparedStatement preparedStatement= null;
		try {
			connection = DBUtil.getConnection();
			String sql = "update biaobai4 set comtimes = '" + (biaobai4.getComtimes()+1) + "' "
					+ "where id = '" + biaobai4.getId() + "'";
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
		Biaobai4 biaobai4=DaoFactory.getBiaobai4Dao().getById(messageId);
		PreparedStatement preparedStatement= null;
		try {
			connection = DBUtil.getConnection();
			String sql = "update biaobai4 set liketimes = '" + (biaobai4.getLiketimes()+1) + "' "
					+ "where id = '" + biaobai4.getId() + "'";
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
