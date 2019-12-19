package org.java.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.java.dao.DepartmentDao;
import org.java.pojo.Department;
import org.java.util.DBUtil;


public class DepartmentDaoImpl implements DepartmentDao {

	@Override
	public List<Department> getall() {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		List<Department> departments = new ArrayList<Department>(); 
		Department department = null;
		try {
			connection = DBUtil.getConnection();
			String sql = "select * from department";
			preparedStatement = connection.prepareStatement(sql);
			resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				department = new Department();
				department.setId(resultSet.getInt("id"));
				department.setDepartmentname(resultSet.getString("departmentname"));
				departments.add(department);
			}
		}catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(resultSet);
			DBUtil.close(preparedStatement);
			DBUtil.close(connection);
		}
		return departments;
	}

	@Override
	public String getDepartmentNameById(int id) {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		String depName = null;
		
		try {
			connection = DBUtil.getConnection();
			String sql = "select * from department where id = '"+id+"'";
			preparedStatement = connection.prepareStatement(sql);
			resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				depName=resultSet.getString("departmentname");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(resultSet);
			DBUtil.close(preparedStatement);
			DBUtil.close(connection);
		}
		return depName;
	}
}
