package org.java.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.java.dao.IFamousDao;
import org.java.pojo.Famous;
import org.java.util.DBUtil;

public class FamousDao implements IFamousDao{

	@Override
	public void add(String name) {
		// TODO Auto-generated method stub
		Connection connection=DBUtil.getConnection();
		String sql="select * from t_famous where hisname=?";
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		Famous famous=null;
		try {
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, name);
			resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				famous=new Famous();
				famous.setN(resultSet.getInt("times"));
				famous.setName(resultSet.getString("hisname"));
			}
			if (famous!=null) {
				sql = "update t_famous set times=? where hisname=?";
				preparedStatement = connection.prepareStatement(sql);
				preparedStatement.setInt(1, famous.getN()+1);
				preparedStatement.setString(2, famous.getName());
				preparedStatement.executeUpdate();
			}
			else {
				sql = "insert into t_famous(hisname,times) values (?,?)";
				preparedStatement = connection.prepareStatement(sql);
				preparedStatement.setString(1, name);
				preparedStatement.setInt(2, 1);
				preparedStatement.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(resultSet);
			DBUtil.close(preparedStatement);
			DBUtil.close(connection);
		}
		
	}
	@Override
	public List<Famous>load() {
		Famous famous=null;
		List<Famous> a=new ArrayList<Famous>();
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		try {
			connection = DBUtil.getConnection();
			String sql = "select * from t_famous order by times desc";
			preparedStatement = connection.prepareStatement(sql);
			resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				famous=new Famous();
				famous.setN(resultSet.getInt("times"));
				famous.setName(resultSet.getString("hisname"));
				a.add(famous);
			}
		}catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(resultSet);
			DBUtil.close(preparedStatement);
			DBUtil.close(connection);
		}
		return a;
	}
	@Override
	public void update(String name) {
		Connection connection=DBUtil.getConnection();
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		String sql="select * from t_famous where hisname=?";
		Famous famous=null;
		try {
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, name);
			resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				famous=new Famous();
				famous.setN(resultSet.getInt("times"));
				famous.setName(resultSet.getString("hisname"));
			}
			if (famous!=null) {
				sql = "update t_famous set times=? where hisname=?";
				preparedStatement = connection.prepareStatement(sql);
				preparedStatement.setInt(1, famous.getN()-1);
				preparedStatement.setString(2, famous.getName());
				preparedStatement.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(resultSet);
			DBUtil.close(preparedStatement);
			DBUtil.close(connection);
		}
	}
	
}
