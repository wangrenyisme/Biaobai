package org.java.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.java.dao.IUserDao;
import org.java.pojo.User;
import org.java.util.DBUtil;


public class UserDao implements IUserDao
{
	@Override
	public User login(String username, String password) 
	{
		Connection connection = DBUtil.getConnection();
		String sql = "select * from user where username = ? and password = ?";
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		User user = null;
		try {
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, username);
			preparedStatement.setString(2, password);
			resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) 
			{
				user = new User();
				user.setUsername(resultSet.getString("username"));
				user.setPassword(resultSet.getString("password"));
				user.setType(resultSet.getInt("type"));
				user.setName(resultSet.getString("name"));
				user.setSex(resultSet.getString("sex"));
				user.setHeadphoto(resultSet.getString("headphoto"));
				user.setTelephone(resultSet.getString("telephone"));
				user.setQq(resultSet.getString("qq"));
				user.setSchool(resultSet.getString("school"));
				user.setCollege(resultSet.getString("college"));
				user.setGrade(resultSet.getString("grade"));
				user.setBirthday(resultSet.getDate("birthday"));
				user.setMessage(resultSet.getInt("message"));
			}
		}
		catch (SQLException e) 
		{
			e.printStackTrace();
		} 
		finally 
		{
			DBUtil.close(resultSet);
			DBUtil.close(preparedStatement);
			DBUtil.close(connection);
		}
		return user;
	}
	@SuppressWarnings("resource")
	@Override
	public void addUser(User user) 
	{
		Connection connection = DBUtil.getConnection();
		String sql = "select count(*) from user where username=?";
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		try 
		{
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, user.getUsername());
			resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) 
			{
				if (resultSet.getInt(1) > 0) 
				{
					throw new  Exception("该用户名已存在！");
				}
			}		
			sql = "insert into user(username,password,type,name,sex,headphoto,telephone,qq,school,college,grade,birthday,message) values (?,?,?,?,?,?,?,?,?,?,?,?,?)";	
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, user.getUsername());
			preparedStatement.setString(2, user.getPassword());
			preparedStatement.setInt(3,1);
			preparedStatement.setString(4, user.getName());
			preparedStatement.setString(5, user.getSex());
			preparedStatement.setString(6, user.getHeadphoto());
			preparedStatement.setString(7, user.getTelephone());
			preparedStatement.setString(8, user.getQq());
			preparedStatement.setString(9, user.getSchool());
			preparedStatement.setString(10,user.getCollege());
			preparedStatement.setString(11,user.getGrade());
			preparedStatement.setDate(12, user.getBirthday());
			preparedStatement.setInt(13,0);
			preparedStatement.executeUpdate();
		}
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
		catch (Exception e)
		{
			e.printStackTrace();
		} 
		finally 
		{
			DBUtil.close(resultSet);
			DBUtil.close(preparedStatement);
			DBUtil.close(connection);
		}	
	}
	public void updateUser(User user)
	{
		Connection connection = DBUtil.getConnection();
		String sql = "update user set name=?, sex=?, telephone=?, qq=?, school=?, college=?,grade=?,birthday=? where username=?";
		PreparedStatement preparedStatement = null;
		try 
		{
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, user.getName());
			preparedStatement.setString(2, user.getSex());
			preparedStatement.setString(3, user.getTelephone());
			preparedStatement.setString(4, user.getQq());
			preparedStatement.setString(5, user.getSchool());
			preparedStatement.setString(6, user.getCollege());
			preparedStatement.setString(7, user.getGrade());
			preparedStatement.setDate(8, user.getBirthday());
			preparedStatement.setString(9, user.getUsername());
			preparedStatement.executeUpdate();
		}
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
		catch (Exception e)
		{
			e.printStackTrace();
		} 
		finally 
		{
			DBUtil.close(preparedStatement);
			DBUtil.close(connection);
		}	
	}
	@Override
	public User getByUserName(String username) {
		Connection connection = DBUtil.getConnection();
		String sql = "select * from user where username = ?";
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		User user = null;
		try {
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, username);
			resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) 
			{
				user = new User();
				user.setUsername(resultSet.getString("username"));
				user.setPassword(resultSet.getString("password"));
				user.setType(resultSet.getInt("type"));
				user.setName(resultSet.getString("name"));
				user.setSex(resultSet.getString("sex"));
				user.setHeadphoto(resultSet.getString("headphoto"));
				user.setTelephone(resultSet.getString("telephone"));
				user.setQq(resultSet.getString("qq"));
				user.setSchool(resultSet.getString("school"));
				user.setCollege(resultSet.getString("college"));
				user.setGrade(resultSet.getString("grade"));
				user.setBirthday(resultSet.getDate("birthday"));
				user.setMessage(resultSet.getInt("message"));
			}
		}
		catch (SQLException e) 
		{
			e.printStackTrace();
		} 
		finally 
		{
			DBUtil.close(resultSet);
			DBUtil.close(preparedStatement);
			DBUtil.close(connection);
		}
		return user;
	}
	@Override
	public void updateMessage(User user) {
		// TODO Auto-generated method stub
		Connection connection = null;
		PreparedStatement preparedStatement= null;
		try {
			connection = DBUtil.getConnection();
			String sql = "update user set message = '" + user.getMessage() + "' "
					+ "where username = '" + user.getUsername() + "'";
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
	public void updateHeadPhoto(User user) {
		// TODO Auto-generated method stub
		// TODO Auto-generated method stub
				Connection connection = null;
				PreparedStatement preparedStatement= null;
				try {
					connection = DBUtil.getConnection();
					String sql = "update user set headphoto = '" + user.getHeadphoto() + "' "
							+ "where username = '" + user.getUsername() + "'";
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
	public List<User> getByName(String name) {
		List<User> users = new ArrayList<User>();
		Connection connection = DBUtil.getConnection();
		String sql = "select * from user where name = ?";
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		User user = null;
		try {
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, name);
			resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) 
			{
				user = new User();
				user.setUsername(resultSet.getString("username"));
				user.setPassword(resultSet.getString("password"));
				user.setType(resultSet.getInt("type"));
				user.setName(resultSet.getString("name"));
				user.setSex(resultSet.getString("sex"));
				user.setHeadphoto(resultSet.getString("headphoto"));
				user.setTelephone(resultSet.getString("telephone"));
				user.setQq(resultSet.getString("qq"));
				user.setSchool(resultSet.getString("school"));
				user.setCollege(resultSet.getString("college"));
				user.setGrade(resultSet.getString("grade"));
				user.setBirthday(resultSet.getDate("birthday"));
				user.setMessage(resultSet.getInt("message"));
				
				users.add(user);
			}
		}
		catch (SQLException e) 
		{
			e.printStackTrace();
		} 
		finally 
		{
			DBUtil.close(resultSet);
			DBUtil.close(preparedStatement);
			DBUtil.close(connection);
		}
		return users;
	}
}
